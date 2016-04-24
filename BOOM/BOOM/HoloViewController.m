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
//    NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"test" withExtension:@"mp4"];
    
    NSURL *videoURL = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    
    // create an AVPlayer
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    
    // create a player view controller
    AVPlayerViewController *controller = [[AVPlayerViewController alloc]init];
    controller.view.frame = self.view.frame;
    controller.player = player;
    [player play];
    
    // show the view controller
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
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
