//
//  WWYLiveConfig.m
//  直播
//
//  Created by wengwenyu on 16/3/15.
//  Copyright © 2016年 feique. All rights reserved.
//

#import "WWYLiveConfig.h"

@implementation WWYLiveConfig

+ (void)pause:(LSMediaCapture *)mediaCapture{

    [mediaCapture pauseLiveStream];

}

+ (void)stop:(LSMediaCapture *)mediaCapture{

    [mediaCapture stopLiveStream];

}


+ (void)start:(LSMediaCapture *)mediaCapture{

    //开始直播 开始直播前先设置 如果直播不成功 return
    NSError* error =nil;
    
    [mediaCapture startLiveStreamWithError:&error];
    
    if (error) {
        
        return;
    }

}



+ (void)switchCamera:(LSMediaCapture *)mediaCapture{

    [mediaCapture switchCamera];

}

+ (LSMediaCapture *)configureLive:(NSInteger)Type VideoPreview:(UIView *)preview{

     LSVideoParaCtx sLSCtx;
     LSVideoParaCtx _sVideoParaCtx;//推流视频参数设置

    switch (Type) {
        case 1:
        {
            sLSCtx.bitrate = 150000;
            sLSCtx.fps = 15;
            sLSCtx.videoStreamingQuality = LS_VIDEO_QUALITY_LOW;
        
        }
            break;
            
            
        case 2:
        {
            sLSCtx.bitrate = 300000;
            sLSCtx.fps = 15;
            sLSCtx.videoStreamingQuality = LS_VIDEO_QUALITY_MEDIUM;
        }
            break;
            
        case 3:
        {
            sLSCtx.bitrate = 500000;
            sLSCtx.fps = 15;
            sLSCtx.videoStreamingQuality = LS_VIDEO_QUALITY_HIGH;
        }
            break;
            
        default:
            break;
    }
    sLSCtx.interfaceOrientation =LS_CAMERA_ORIENTATION_PORTRAIT;//此字段用来设置LSMe
    
    memcpy(&_sVideoParaCtx, &sLSCtx, sizeof(LSVideoParaCtx));
    
    
    
    
    //初始化直播参数，并创建音视频直播
   // NSError* error = nil;
    
    LSLiveStreamingParaCtx paraCtx;
    paraCtx.eHaraWareEncType =LS_HRD_NO;
    paraCtx.eOutFormatType = LS_OUT_FMT_RTMP;
    paraCtx.eOutStreamType = LS_HAVE_AV;
    memcpy(&paraCtx.sLSVideoParaCtx, &_sVideoParaCtx, sizeof(LSVideoParaCtx));
    paraCtx.sLSAudioParaCtx.bitrate = 64000;
    paraCtx.sLSAudioParaCtx.codec = LS_AUDIO_CODEC_AAC;
    paraCtx.sLSAudioParaCtx.frameSize = 2048;
    paraCtx.sLSAudioParaCtx.numOfChannels = 1;
    paraCtx.sLSAudioParaCtx.samplerate = 44100;
    
    LSMediaCapture *mediaCapture = [[LSMediaCapture alloc]initLiveStream:PUSHURL withLivestreamParaCtx:paraCtx];
    
   
    
    [mediaCapture startVideoPreview:preview];
    
    
    
    
    //输出统计信息
    
    [mediaCapture setStatisticTimeInterval:1];
    
    
    
    LSStatistics* _pStatistics;//统计参数
    
    NSString* fps = [[NSString alloc]initWithFormat:@"帧率:%d", _pStatistics->videoSendFrameRate];
    NSString* bitrate = [[NSString alloc]initWithFormat:@"码率:%d", _pStatistics->videoSendBitRate];
    NSString* videoQuality = nil;
    
    switch (_sVideoParaCtx.videoStreamingQuality) {
        case LS_VIDEO_QUALITY_HIGH:
            videoQuality = [[NSString alloc] initWithFormat:@"高清"];
            break;
        case LS_VIDEO_QUALITY_MEDIUM:
            videoQuality = [[NSString alloc] initWithFormat:@"标清"];
            break;
        case LS_VIDEO_QUALITY_LOW:
            videoQuality = [[NSString alloc] initWithFormat:@"流畅"];
            break;
        default:
            break;
    }
    
    NSString* statInfo = [[NSString alloc] initWithFormat:@"%@\n %@\n %@\n", videoQuality, fps, bitrate];
    
    NSLog(@"输出信息 %@",statInfo);
    
    
    NSString* sdkVersion = [mediaCapture getSDKVersionID];
    NSLog(@"sdk version:%@",sdkVersion);
    
   
    
    
    
    return mediaCapture;
    
    
    
    
    

}

+ (id)configurePlay:(NELivePlayerController *)liveplayer{

    [liveplayer SetBufferStrategy:NELPLowDelay]; //直播低延时模式
    
    [liveplayer setScalingMode:NELPMovieScalingModeAspectFill]; //设置画面显示模式，默认原始大小
    [liveplayer setShouldAutoplay:YES]; //设置prepareToPlay完成后是否自动播放
    [liveplayer setHardwareDecoder:NO]; //设置解码模式，是否开启硬件解码
    [liveplayer setPauseInBackground:NO]; //设置切入后台时的状态，暂停还是继续播放
    [liveplayer prepareToPlay]; //初始化视频文件

    
    
    return liveplayer;
}
@end
