//
//  KNWavesView.m
//  KNWaterRipple
//
//  Created by 刘凡 on 2017/10/25.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "KNWavesView.h"




@interface KNWavesView()

/**
 底部波浪
 */
@property(nonatomic, strong)CAShapeLayer *buttonLayer;

//顶部波浪
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

@implementation KNWavesView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setdefaultValue];
        [self buildUI];
    }
    return self;
}

//设置默认值
-(void)setdefaultValue{
    
    //这是默认值
    _topColor = [UIColor colorWithRed:247/255.0 green:198/255.0 blue:22/255.0 alpha:0.8];
    _bottomColor= [UIColor colorWithRed:247/255.0 green:198/255.0 blue:22/255.0 alpha:0.4];
    //波浪的Y值
    _WaveY = self.bounds.size.height /2;
    //振动幅度
    _waveAmplitude = 20;
    //角速度
    _wavePalstance = M_PI/self.bounds.size.width;
    //初相
    _waveX = 10;
    //x轴移动速度
    _waveMoveSpeed = _wavePalstance * 3;
    
    //以屏幕刷新速度为周期刷新曲线的位置
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWave:)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)buildUI{
    //上层
    _topLayer = [CAShapeLayer layer];
    _topLayer.fillColor = _topColor.CGColor;
    _topLayer.strokeColor = _topColor.CGColor;
    [self.layer addSublayer:_topLayer];
    
    //初始化波浪
    //底层
    _buttonLayer = [CAShapeLayer layer];
    _buttonLayer.fillColor = _bottomColor.CGColor;
    _buttonLayer.strokeColor = _bottomColor.CGColor;
    [self.layer addSublayer:_buttonLayer];

}

-(void)updateColor{
    
    
    _buttonLayer.fillColor = _bottomColor.CGColor;
    _buttonLayer.strokeColor = _bottomColor.CGColor;
    
    _topLayer.fillColor = _topColor.CGColor;
    _topLayer.strokeColor = _topColor.CGColor;
}

-(void)updateWave:(CADisplayLink *)DisplayLink{
    _waveX += _waveMoveSpeed;
    [self updateButtonLayer];
    [self updateTopLayer];
}


-(void)updateTopLayer{
    //波浪宽度
    CGFloat waterWaveWitdth = self.bounds.size.width;
    //初始化运动路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat Y = _WaveY;
    //设置起始位置
    CGPathMoveToPoint(path, nil, 0, Y);
        for(float i = 0.0f; i<waterWaveWitdth ; i++)
    {
         //正弦曲线公式为： y=Asin(ωx+φ)+k;
        Y = _waveAmplitude * cos(_wavePalstance * i + _waveX) + _WaveY;
        CGPathAddLineToPoint(path, nil, i, Y);
    }
    
    CGPathAddLineToPoint(path, nil, waterWaveWitdth, self.bounds.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
    CGPathCloseSubpath(path);
    _topLayer.path = path;
    CGPathRelease(path);
}




-(void)updateButtonLayer{
    
    //波浪宽度
    CGFloat waterWaveWitdth = self.bounds.size.width;
    //初始化运动路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat Y = _WaveY;
    //设置起始位置
    CGPathMoveToPoint(path, nil, 0, Y);
    for(float i = 0.0f; i<waterWaveWitdth ; i++)
    {
        //正弦曲线公式为： y=Asin(ωx+φ)+k;
        Y = _waveAmplitude * sin(_wavePalstance * i + _waveX) + _WaveY;
        CGPathAddLineToPoint(path, nil, i, Y);
    }
    
    CGPathAddLineToPoint(path, nil, waterWaveWitdth, self.bounds.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
    CGPathCloseSubpath(path);
    _buttonLayer.path = path;
    CGPathRelease(path);
    
}



-(void)setBottomColor:(UIColor *)bottomColor{
    _bottomColor = bottomColor;
    [self updateColor];
}

-(void)setTopColor:(UIColor *)topColor{
    _topColor = topColor;
    [self updateColor];
}

-(void)setWaveY:(CGFloat)WaveY
{
    _WaveY = WaveY;
}

-(void)setwaveAmplitude:(CGFloat)waveAmplitude{
    _waveAmplitude = waveAmplitude;
}

@end
