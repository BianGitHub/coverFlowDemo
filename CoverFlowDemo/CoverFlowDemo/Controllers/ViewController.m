//
//  ViewController.m
//  CoverFlowDemo
//
//  Created by 边雷 on 2018/2/26.
//  Copyright © 2018年 Mac-b. All rights reserved.
//

#import "ViewController.h"
#import "BLCollectionViewCell.h"
#import "BLCollectionViewFlowLayout.h"

static NSString *cellID = @"cellID";
@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController {
    NSArray<UIImage *> *imageArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imageArr = @[
                 [UIImage imageNamed:@"01"],
                 [UIImage imageNamed:@"02"],
                 [UIImage imageNamed:@"03"]
                 ];
    BLCollectionViewFlowLayout *flowlayout = [[BLCollectionViewFlowLayout alloc] init];
    
    UICollectionView *cv = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200) collectionViewLayout:flowlayout];
    cv.backgroundColor = [UIColor lightGrayColor];
    cv.dataSource = self;
    [self.view addSubview:cv];
    [cv registerClass:[BLCollectionViewCell class] forCellWithReuseIdentifier:cellID];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.image = imageArr[indexPath.row % 3];
    return cell;
}

@end
