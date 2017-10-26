//
//  KNDownWavesView.m
//  KNWaveView
//
//  Created by 刘凡 on 2017/10/26.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "KNDownWavesView.h"

@interface KNDownWavesView()

/**
 底部波浪
 */
@property(nonatomic, strong)CAShapeLayer *buttonLayer;

/**
 顶部波浪
 */
@property(nonatomic, strong)CAShapeLayer *topLayer;

/**
 重绘定时器
 */
@property(nonatomic, strong)CADisplayLink *displayLink;

/**
 Y 轴方向缩放
 */
@property(nonatomic, assign)CGFloat waveY;

/**
 X 轴方向的平移
 */
@property(nonatomic, assign) CGFloat waveX;

/**
 曲线角速度
 */
@property(nonatomic, assign) CGFloat wavePalstance;

/**
 曲线移动速度
 */
@property(nonatomic, assign)CGFloat waveMoveSpeed;

@end

@implementation KNDownWavesView



@end
