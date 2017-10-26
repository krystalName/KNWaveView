//
//  ViewController.m
//  KNWaterRipple
//
//  Created by 刘凡 on 2017/10/23.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "ViewController.h"
#import "KNWavesView.h"

@interface ViewController ()

@property(nonatomic, strong)KNWavesView *WavesView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat waveWidth = self.view.bounds.size.width * 0.8f;
    
    _WavesView = [[KNWavesView alloc]initWithFrame:CGRectMake(0, 0, waveWidth, waveWidth)];
    _WavesView.center = CGPointMake(self.view.bounds.size.width/2.0f, self.view.bounds.size.width/2.0f);
    _WavesView.backgroundColor = [UIColor grayColor];

    
    [self.view addSubview:_WavesView];
}


@end

