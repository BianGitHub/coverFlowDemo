//
//  BLCollectionViewCell.m
//  CoverFlowDemo
//
//  Created by 边雷 on 2018/2/26.
//  Copyright © 2018年 Mac-b. All rights reserved.
//

#import "BLCollectionViewCell.h"

@implementation BLCollectionViewCell {
    UIImageView *imageV;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    imageV = [[UIImageView alloc] initWithFrame:self.bounds];
    imageV.backgroundColor = [UIColor blackColor];
    imageV.contentMode = UIViewContentModeScaleAspectFill;
    imageV.clipsToBounds = YES;
    imageV.layer.cornerRadius = 10;
    imageV.layer.masksToBounds = YES;
    imageV.layer.borderColor = [UIColor whiteColor].CGColor;
    imageV.layer.borderWidth = 1;
    [self.contentView addSubview:imageV];
}

- (void)setImage:(UIImage *)image  {
    _image = image;
    imageV.image = image;
}

@end
