# coverFlowDemo
coverFlow / 图片播放器


coverFlow有三个难点

1. 调用 - (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect 
方法, 当修改cell属性时, 系统会自动计算cell布局, 所以需要调用重新布局方法

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
}
