//
//  PlayVC.m
//  直播Demo
//
//  Created by wengwenyu on 16/3/17.
//  Copyright © 2016年 feique. All rights reserved.
//

#import "PlayVC.h"
#import "WWYLiveConfig.h"



@interface PlayVC ()
/**
 第一步
 */
@property(atomic, retain) id<NELivePlayer> liveplayer;


- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *playView;


@end

@implementation PlayVC

/**
 第二步
 */
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
  self.liveplayer =  [WWYLiveConfig configurePlay:self.liveplayer];
    
    //各种参数 同学们可以自己点进去看看  全中文注释  简单方便  复制粘贴即可
//    [self.liveplayer SetBufferStrategy:NELPLowDelay]; //直播低延时模式
//    
//    [self.liveplayer setScalingMode:NELPMovieScalingModeAspectFill]; //设置画面显示模式，默认原始大小
//    [self.liveplayer setShouldAutoplay:YES]; //设置prepareToPlay完成后是否自动播放
//    [self.liveplayer setHardwareDecoder:NO]; //设置解码模式，是否开启硬件解码
//    [self.liveplayer setPauseInBackground:NO]; //设置切入后台时的状态，暂停还是继续播放
//    [self.liveplayer prepareToPlay]; //初始化视频文件

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   /**
    创建播放器
    */
    self.liveplayer = [[NELivePlayerController alloc] initWithContentURL:[NSURL URLWithString:PULLURL]];
    
    //播放器大小
    self.liveplayer.view.frame = self.playView.frame;
    
    
    //播放器的view放哪里
    [self.view addSubview:self.liveplayer.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
