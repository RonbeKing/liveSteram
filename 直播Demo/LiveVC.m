//
//  LiveVC.m
//  直播Demo
//
//  Created by wengwenyu on 16/3/16.
//  Copyright © 2016年 feique. All rights reserved.
//

#import "LiveVC.h"

#import "WWYLiveConfig.h"



@interface LiveVC ()
@property (weak, nonatomic) IBOutlet UIView *liveView;
- (IBAction)startAction:(id)sender;
- (IBAction)stopAction:(id)sender;
- (IBAction)backAction:(id)sender;


@end

@implementation LiveVC
{
    LSMediaCapture * ls;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //第一步 创建直播预览的view
    
  ls =  [WWYLiveConfig configureLive:1 VideoPreview:self.liveView];
    
    
    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)startAction:(id)sender {
    [WWYLiveConfig start:ls];
}

- (IBAction)stopAction:(id)sender {
    [WWYLiveConfig stop:ls];
}

- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
