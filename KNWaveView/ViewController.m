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

@property(nonatomic, strong)UIImageView *headImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat waveWidth = self.view.bounds.size.width;
    
    _WavesView = [[KNWavesView alloc]initWithFrame:CGRectMake(0, 0, waveWidth, waveWidth)];
    _WavesView.backgroundColor = [UIColor grayColor];
    _WavesView.WaveY = 100;
    
    [self.view addSubview:_WavesView];
    
    
    [_WavesView addSubview:self.headImageView];
    
    self.headImageView.center = CGPointMake(_WavesView.bounds.size.width/2, 100);
}


-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        _headImageView.layer.cornerRadius = 40;
        _headImageView.backgroundColor = [UIColor redColor];
        _headImageView.layer.masksToBounds = YES;
        _headImageView.layer.borderWidth = 0.5;
        _headImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _headImageView;
}

@end

