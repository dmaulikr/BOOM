//
//  ViewController.m
//  BOOM
//
//  Created by Maathusan Rajendram on 2016-04-22.
//  Copyright © 2016 Maathusan Rajendram. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) AVAudioPlayer *player;
@property (nonatomic, strong) UISlider *volumeSlider;
@property (nonatomic, strong) MPVolumeView *volView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
//    [self.soundWaveImg setImage:[UIImage imageNamed:@"map.png"]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor darkGrayColor]];
    
    // hide the hardware volume slider
//    UIImage *thumb = [[UIImage alloc] initWithCIImage:[UIImage imageNamed:@"volumeHider"].CIImage scale:0.0 orientation:UIImageOrientationUp];
    
//    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame: CGRectZero];
//    volumeView.showsRouteButton = NO;
//    volumeView.showsVolumeSlider = NO;
////    [volumeView setVolumeThumbImage:thumb forState:UIControlStateNormal];
////    [volumeView setMinimumVolumeSliderImage:thumb forState:UIControlStateNormal];
////    [volumeView setMaximumVolumeSliderImage:thumb forState:UIControlStateNormal];
//    [self.view addSubview:volumeView];
//    
//    __weak __typeof(self)weakSelf = self;
//    [[volumeView subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        if ([obj isKindOfClass:[UISlider class]]) {
//            __strong __typeof(weakSelf)strongSelf = weakSelf;
//            strongSelf.volumeSlider = obj;
//            *stop = YES;
//        }
//    }];
    
    self.volView = [[MPVolumeView alloc] init];
    [self.view addSubview:self.volView];
    self.volView.hidden = YES;
    
    __weak __typeof(self)weakSelf = self;
    [[self.volView subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UISlider class]]) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            strongSelf.volumeSlider = obj;
            *stop = YES;
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshVolumeView {
    [self.volView willMoveToSuperview:self.view];
    [self.volView didMoveToSuperview];
}


- (IBAction)lowest_height_pressed:(id)sender {
    // Present spinner to show loading - randomize wait time to 0.2s to 2s
    // Play volume at respective level
    
    
    
    // Vibrate at respective pattern
    // Display respective contour
    // Update respective dB value
    
}

- (IBAction)middle_height_pressed:(id)sender {
    
    // Create method to set up map overlay imgs
    [self.middle_height_button setImage:[UIImage imageNamed:@"transport.png"] forState:UIControlStateNormal];
    [self.highest_height_button setImage:[UIImage imageNamed:@"shapes.png"] forState:UIControlStateNormal];
    
    // Create method that takes file path, volumeSlider float
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/f1.wav",
                               [[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                                   error:nil];
    self.player.delegate = self;
    self.player.numberOfLoops = 0; //Once
    [self.player setVolume:1.0];
    
    self.volumeSlider.value = 1.0f;
    self.volView.hidden = NO;
    [self refreshVolumeView];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    [self.player play];
    
    //Vibrate
    // Create a method that takes a vibration number and has if else statments for below
    for (int i = 1; i < 10; i++) {
        [self performSelector:@selector(vibe:) withObject:self afterDelay:i *0.1f];
    }
    
    // Set dB
    [self.dB_textField setText:@"90"];
}

- (IBAction)highest_height_pressed:(id)sender {
    
    // Create method to set up map overlay imgs
    [self.middle_height_button setImage:[UIImage imageNamed:@"shapes.png"] forState:UIControlStateNormal];
    [self.highest_height_button setImage:[UIImage imageNamed:@"transport.png"] forState:UIControlStateNormal];
    
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/f1.wav",
                               [[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                         error:nil];
    self.player.delegate = self;
    self.player.numberOfLoops = 0; //Once
    [self.player setVolume:0.1];
    
    self.volumeSlider.value = 0.3f;
    self.volView.hidden = NO;
    [self refreshVolumeView];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    [self.player play];
    
    //Vibrate
    for (int i = 1; i < 2; i++) {
        [self performSelector:@selector(vibe:) withObject:self afterDelay:i *0.0f];
    }
    
    // Set dB
    [self.dB_textField setText:@"35.66"];
}

-(void)vibe:(id)sender {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}

- (IBAction)f1_pressed:(id)sender {
    // Display respective time graph
    // Highlight Button
    // De-Highlight Other Buttons
    
}

- (IBAction)d1_pressed:(id)sender {
}

- (IBAction)n1_pressed:(id)sender {
}

- (IBAction)n2_pressed:(id)sender {
}

- (IBAction)n3_pressed:(id)sender {
}

- (IBAction)holo_pressed:(id)sender {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Super Cool Holo"
                                  message:@"Coming Soon!"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             //Do some thing here
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok]; // add action to uialertcontroller
    [self presentViewController:alert animated:YES completion:nil];
}


@end
