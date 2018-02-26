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

// cell对应的属性修改方法
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    // 获取之前布局好的attr
    NSArray<UICollectionViewLayoutAttributes *> *oldAttr = [super layoutAttributesForElementsInRect:rect];
    
    // 创建新的集合
    NSMutableArray *newAttr = [NSMutableArray array];
    
    [oldAttr enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UICollectionViewLayoutAttributes *newObj = obj.copy;
        
        // 修改属性
        
        
        [newAttr addObject:newObj];
        
    }];
    
    return newAttr;
}

@end
