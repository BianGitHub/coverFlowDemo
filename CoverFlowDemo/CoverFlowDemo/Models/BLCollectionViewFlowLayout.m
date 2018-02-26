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
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat itemH = self.collectionView.bounds.size.height * 0.8;
    CGFloat itemW = itemH;
    self.itemSize = CGSizeMake(itemW, itemH);
    
    // 间距
    self.minimumLineSpacing = 0;
}

@end
