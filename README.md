## KNWaveView

水波纹View  先上效果图

![](https://github.com/krystalName/KNWaveView/blob/master/wave.gif)

### 调用创建代码

``` objc

@property(nonatomic, strong)KNWavesView *WavesView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat waveWidth = self.view.bounds.size.width * 0.8f;
    
    _WavesView = [[KNWavesView alloc]initWithFrame:CGRectMake(0, 0, waveWidth, waveWidth)];
    _WavesView.center = CGPointMake(self.view.bounds.size.width/2.0f, self.view.bounds.size.width/2.0f);
    _WavesView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:_WavesView];
}
```
