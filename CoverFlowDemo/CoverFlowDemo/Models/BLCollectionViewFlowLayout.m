//
//  BLCollectionViewFlowLayout.m
//  CoverFlowDemo
//
//  Created by 边雷 on 2018/2/26.
//  Copyright © 2018年 Mac-b. All rights reserved.
//

#import "BLCollectionViewFlowLayout.h"

@implementation BLCollectionViewFlowLayout

// 准备布局
- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat itemH = self.collectionView.bounds.size.height * 0.8;
    CGFloat itemW = itemH;
    self.itemSize = CGSizeMake(itemW, itemH);
    
    // 间距
    self.minimumLineSpacing = 0;
}

#pragma mark - 只要显示的区域发生变化,就重新计算布局!
// Invalidate 失效! 返回YES! 只要显示的区域发生改变,就让布局失效!
// 重新计算布局!
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
}

// cell对应的属性修改方法
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    // 获取之前布局好的attr
    NSArray<UICollectionViewLayoutAttributes *> *oldAttr = [super layoutAttributesForElementsInRect:rect];
    
    // 创建新的集合
    NSMutableArray *newAttr = [NSMutableArray array];
    
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
    
    return newAttr;
}

@end
