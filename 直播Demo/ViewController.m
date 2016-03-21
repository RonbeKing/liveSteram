//
//  ViewController.m
//  直播Demo
//
//  Created by wengwenyu on 16/3/16.
//  Copyright © 2016年 feique. All rights reserved.
//

#import "ViewController.h"

#import "LiveVC.h"
#import "PlayVC.h"
//#import "AllVC.h"

@interface ViewController ()

- (IBAction)startAction:(id)sender;
- (IBAction)palyAction:(id)sender;
//- (IBAction)liveAndPlayAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAction:(id)sender {
    
    LiveVC * vc = [[LiveVC alloc]initWithNibName:@"LiveVC" bundle:nil];
    
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}

- (IBAction)palyAction:(id)sender {
   
    PlayVC * vc = [[PlayVC alloc]initWithNibName:@"PlayVC" bundle:nil];
    
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}

//- (IBAction)liveAndPlayAction:(id)sender {
//    AllVC * all = [[AllVC alloc]initWithNibName:@"AllVC" bundle:nil];
//    [self presentViewController:all animated:YES completion:^{
//        
//    }];
//
//}
@end
