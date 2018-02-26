//
//  BLCollectionViewCell.m
//  CoverFlowDemo
//
//  Created by 边雷 on 2018/2/26.
//  Copyright © 2018年 Mac-b. All rights reserved.
//

#import "BLCollectionViewCell.h"

@implementation BLCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
    imageV.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:imageV];
}

@end
