//
//  WWYLiveConfig.h
//  直播
//
//  Created by wengwenyu on 16/3/15.
//  Copyright © 2016年 feique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSMediaCapture.h"
#import "nMediaLiveStreamingDefs.h"
#import "NELivePlayer.h"
#import "NELivePlayerController.h"


/** 需要导入的库
 AudioToolbox.framework
 QuartzCore.framework
 AVFoundation.framwork
 CoreTelephony.framework
 CoreMedia.framework
 OpenGLES.framework
 libz.1.tbd
 libbz2.tbd
 libiconv.tbd
 libstdc++.tbd
 Foundation.framwork
 CoreAudio.framework
 CoreGraphics.framework
 VideoToolBox.framework
 UIKit.framework
 libz.tbd
 */

//推流地址
#define PUSHURL @"rtmp://p1.live.126.net/live/687d9b2095ef4f83aa7289be960b752b?wsSecret=5fbce846cfaa475137e990ab9ad46f5a&wsTime=1458005108"
//拉流地址 支持HLS HTTP RTMP iOS官方是用HLS 但是推荐RTMP 比较主流
#define PULLURL @"rtmp://v1.live.126.net/live/687d9b2095ef4f83aa7289be960b752b"








@interface WWYLiveConfig : NSObject


/**
 创建直播推流
 1流畅，2标清，3高清（可选，默认高清）
 */
+ (LSMediaCapture *)configureLive:(NSInteger)Type VideoPreview:(UIView *)view;


/**
 开始直播
 */
+ (void)start:(LSMediaCapture *)mediaCapture;
/**
 
 */
+ (void)pause:(LSMediaCapture *)mediaCapture;
/**
 结束直播
 */
+ (void)stop:(LSMediaCapture *)mediaCapture;
/**
 切换相机
 */
+ (void)switchCamera:(LSMediaCapture *)mediaCapture;
/**
 配置播放器
 */
+ (id)configurePlay:(NELivePlayerController *)liveplayer;

@end
