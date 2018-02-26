# coverFlowDemo
coverFlow / 图片播放器


coverFlow有三个难点

1. 调用 - (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect 
方法, 当修改cell属性时, 系统会自动计算cell布局, 所以需要调用重新布局方法 

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
}


2. 修改属性 缩放和旋转
[oldAttr enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UICollectionViewLayoutAttributes *newObj = obj.copy;
        
        // 修改属性
        // MARK: - 1.缩放
        // 1.屏幕中线的位置
        CGFloat screenCenterX = self.collectionView.bounds.size.width * 0.5 + self.collectionView.contentOffset.x;
        
        // 2.每个cell的中心的x!!
        CGFloat itemCenterX = newObj.center.x;
        
        // 3.计算距离
        CGFloat distance = screenCenterX - itemCenterX;
        
        // 4.将距离转换成缩放的比例!
        CGFloat scale = 1 - ABS(distance) / self.collectionView.bounds.size.width;
        
        // 5 旋转的角度!
        CGFloat angle = (1 - scale) * M_PI_2;
        
        // 如果距离大于0,左边 -> * 1,正的角度
        // 如果距离小于0,右边 -> * -1,负的角度!
        angle *= ((distance > 0) ? 1 : -1);
        
        CATransform3D transform = CATransform3DIdentity;
        //  增加透视效果
        transform.m34 = - 1.0 / 500;
        
        // 缩放
        transform = CATransform3DScale(transform, scale, scale, 1);
        
        // 旋转
        transform = CATransform3DRotate(transform, angle, 0, 1, 0);
        
        newObj.transform3D = transform;
        
        
        [newAttr addObject:newObj];
        
    }];
 3.计算停留的位置
 - (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    // 1.获取系统计算好的值
    CGPoint point = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    
    // 2.计算屏幕可见区域 -> CGRect!
    CGRect rect;
    rect.size = self.collectionView.bounds.size;
#warning - 预计停留的位置时,内容的偏移量!
    rect.origin = proposedContentOffset;
    
    // 3.获取可见区域内的cell!
#warning - 利用上面的方法,计算可见区域内的cell!
    NSArray<UICollectionViewLayoutAttributes *> *visibleAttrs = [self layoutAttributesForElementsInRect:rect];
    
    // 4.需要找出其中最近的cell!
    // 4.2 遍历,找出距离屏幕中线最近的cell对应的attr
    // - 屏幕中线的x
    CGFloat screenCenterX = proposedContentOffset.x + self.collectionView.bounds.size.width * 0.5;
    
    // - 定义一个最小的间距
    __block CGFloat minMargin = CGFLOAT_MAX;
    // - 定义一个索引,用来记录最近那个attr的在数组中!索引!
    __block NSInteger index = -1;
    
    [visibleAttrs enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat distance = screenCenterX - obj.center.x;
        
        if (ABS(distance) < minMargin) {
            minMargin = ABS(distance);
            index = idx;
        }
        
    }];
    
    // 5.计算需要偏移的距离!
    CGFloat offsetX = screenCenterX - visibleAttrs[index].center.x;
    
    
    // 2.返回点坐标
    return CGPointMake(point.x - offsetX, point.y);
}
