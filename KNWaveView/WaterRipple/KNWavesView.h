//
//  KNWavesView.h
//  KNWaterRipple
//
//  Created by 刘凡 on 2017/10/25.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KNWavesView : UIView

/**
 水波纹的高度
 */
@property(nonatomic, assign)CGFloat WaveY; //默认在创建view高度／2

/**
 底部水波纹的颜色
 */
@property(nonatomic, strong)UIColor  *bottomColor; //默认为黄色 0.4透明度

/**
 顶部水波纹的颜色
 */
@property(nonatomic, strong)UIColor *topColor;  //默认黄色 0.8 透明度

/**
 水波纹振动幅度
 */
@property(nonatomic, assign)CGFloat waveAmplitude;  //默认20。



@end
