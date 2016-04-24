//
//  HoloViewController.m
//  BOOM
//
//  Created by Maathusan Rajendram on 2016-04-24.
//  Copyright © 2016 Maathusan Rajendram. All rights reserved.
//

#import "HoloViewController.h"

@interface HoloViewController ()

@end

@implementation HoloViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Hello World");
    
    // grab a local URL to our video
//    NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"wav" withExtension:@"mp4"];
//    NSString*thePath=[[NSBundle mainBundle] pathForResource:@"wav" ofType:@"mp4"];
//    NSURL*videoURL=[NSURL fileURLWithPath:thePath];
    
//    NSURL *videoURL = [NSURL URLWithString:@"http://matraj.github.io/video/wav.mp4"];
    
    // create an AVPlayer
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wav" ofType:@"mp4"];
    NSURL *videoURL = [[NSURL alloc] initFileURLWithPath: path];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    
    // create a player view controller
    AVPlayerViewController *controller = [[AVPlayerViewController alloc]init];
    controller.view.frame = self.view.frame;
    controller.player = player;
    controller.showsPlaybackControls = YES;
    [player play];
    
    player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[player currentItem]];

    
    // show the view controller
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    
//    NSString *fullURL = @"http://matraj.github.io/video/wav.mp4";
//    NSURL *url = [NSURL URLWithString:fullURL];
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:requestObj];
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
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

@end
