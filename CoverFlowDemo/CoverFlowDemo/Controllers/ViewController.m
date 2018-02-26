//
//  ViewController.m
//  CoverFlowDemo
//
//  Created by 边雷 on 2018/2/26.
//  Copyright © 2018年 Mac-b. All rights reserved.
//

#import "ViewController.h"
#import "BLcoverFlowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BLcoverFlowView *coverflowV = [[BLcoverFlowView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
    [self.view addSubview:coverflowV];
    
}

@end
