//
//  BLcoverFlowView.m
//  CoverFlowDemo
//
//  Created by 边雷 on 2018/2/26.
//  Copyright © 2018年 Mac-b. All rights reserved.
//

#import "BLcoverFlowView.h"
#import "BLCollectionViewCell.h"
#import "BLCollectionViewFlowLayout.h"

static NSString *cellID = @"cellID";
@interface BLcoverFlowView () <UICollectionViewDataSource>

@end

@implementation BLcoverFlowView {
    NSArray<UIImage *> *imageArr;
    UICollectionView *cv;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        imageArr = @[
                     [UIImage imageNamed:@"01"],
                     [UIImage imageNamed:@"02"],
                     [UIImage imageNamed:@"03"]
                     ];
        BLCollectionViewFlowLayout *flowlayout = [[BLCollectionViewFlowLayout alloc] init];
        
        cv = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowlayout];
        cv.backgroundColor = [UIColor lightGrayColor];
        cv.dataSource = self;
        [self addSubview:cv];
        [cv registerClass:[BLCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.image = imageArr[indexPath.row % imageArr.count];
    return cell;
}
@end
