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
@property (nonatomic, strong) NSString *state;

#define f1 @"f1"
#define d1 @"d1"
#define n1 @"n1"
#define n2 @"n2"
#define n3 @"n3"

#define MINIMUM_SCALE 0.5
#define MAXIMUM_SCALE 6.0

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib
    [self.navigationController.navigationBar setBackgroundColor:[UIColor darkGrayColor]];
    
    // Setup default state
    self.state = f1;
    [self.f1_button setBackgroundColor:[UIColor darkGrayColor]];
    [[self.f1_button layer] setCornerRadius:8.0f];
    
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
    
    // Create method for displaying animation at different speeds
    [self.highest_contour stopAnimating];
    [self.highest_contour setHidden:YES];
    
    [self.middle_contour setHidden:NO];
    
    if ([self.state isEqualToString:f1]) {
        
        // Set Animation
        [self animateContourAtDuration:0.2f withImage:self.middle_contour];
        
        // Set Audio
        [self playAudioFile:@"f1.wav" withVolume:1.0f];
        
        // Set Vibration
        [self vibrateFor:3];
        
        // Set dB
        [self.dB_textField setText:@"90"];
    } else if ([self.state isEqualToString:d1]) {
        
        [self animateContourAtDuration:0.64f withImage:self.middle_contour];
        [self playAudioFile:@"d1.wav" withVolume:0.78f];
        [self vibrateFor:2];
        [self.dB_textField setText:@"72.5"];
        
    } else if ([self.state isEqualToString:n1]) {
        
        [self animateContourAtDuration:0.5f withImage:self.middle_contour];
        [self playAudioFile:@"n1.wav" withVolume:0.85f];
        [self vibrateFor:2];
        [self.dB_textField setText:@"77.8"];
        
    } else if ([self.state isEqualToString:n2]) {
        
        [self animateContourAtDuration:0.35f withImage:self.middle_contour];
        [self playAudioFile:@"n2.wav" withVolume:0.93f];
        [self vibrateFor:3];
        [self.dB_textField setText:@"84.3"];
        
    } else if ([self.state isEqualToString:n3]) {
        
        [self animateContourAtDuration:0.48f withImage:self.middle_contour];
        [self playAudioFile:@"n3.wav" withVolume:0.86f];
        [self vibrateFor:2];
        [self.dB_textField setText:@"78.8"];
        
    }
}

- (IBAction)highest_height_pressed:(id)sender {
    
    // Create method to set up map overlay imgs
    [self.middle_height_button setImage:[UIImage imageNamed:@"shapes.png"] forState:UIControlStateNormal];
    [self.highest_height_button setImage:[UIImage imageNamed:@"transport.png"] forState:UIControlStateNormal];
    
    [self.middle_contour stopAnimating];
    [self.middle_contour setHidden:YES];
    
    [self.highest_contour setHidden:NO];
    
    if ([self.state isEqualToString:f1]) {
        [self animateContourAtDuration:1.56f withImage:self.highest_contour];
        [self playAudioFile:@"f1.wav" withVolume:0.38f];
        [self vibrateFor:1];
        [self.dB_textField setText:@"35.66"];
    } else if ([self.state isEqualToString:d1]) {

        [self animateContourAtDuration:2.0f withImage:self.highest_contour];
        [self playAudioFile:@"d1.wav" withVolume:0.1f];
        [self vibrateFor:0];
        [self.dB_textField setText:@"18"];

    } else if ([self.state isEqualToString:n1]) {
        
        [self animateContourAtDuration:1.86f withImage:self.highest_contour];
        [self playAudioFile:@"n1.wav" withVolume:0.27f];
        [self vibrateFor:1];
        [self.dB_textField setText:@"23.5"];
        
    } else if ([self.state isEqualToString:n2]) {
        
        [self animateContourAtDuration:1.7f withImage:self.highest_contour];
        [self playAudioFile:@"n2.wav" withVolume:0.33f];
        [self vibrateFor:1];
        [self.dB_textField setText:@"30"];
        
    } else if ([self.state isEqualToString:n3]) {
        
        [self animateContourAtDuration:1.84f withImage:self.highest_contour];
        [self playAudioFile:@"n3.wav" withVolume:0.28f];
        [self vibrateFor:1];
        [self.dB_textField setText:@"24.5"];
        
    }
}

-(void)vibe:(id)sender {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}

- (IBAction)f1_pressed:(id)sender {
    
    // Set up page
    [self setupPageForeSound:f1 withGraph:@"f1_graph.jpeg"];
    
    // Highlight Button
    // De-Highlight Other Buttons
    [self.f1_button setBackgroundColor:[UIColor darkGrayColor]];
    [[self.f1_button layer] setCornerRadius:8.0f];
    
    [self.d1_button setBackgroundColor:[UIColor clearColor]];
    [self.n1_button setBackgroundColor:[UIColor clearColor]];
    [self.n2_button setBackgroundColor:[UIColor clearColor]];
    [self.n3_button setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)d1_pressed:(id)sender {
    
    // Set up page
    [self setupPageForeSound:d1 withGraph:@"d1_graph.jpeg"];
    
    // Highlight Button
    // De-Highlight Other Buttons
    [self.d1_button setBackgroundColor:[UIColor darkGrayColor]];
    [[self.d1_button layer] setCornerRadius:8.0f];
    
    [self.f1_button setBackgroundColor:[UIColor clearColor]];
    [self.n1_button setBackgroundColor:[UIColor clearColor]];
    [self.n2_button setBackgroundColor:[UIColor clearColor]];
    [self.n3_button setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)n1_pressed:(id)sender {
    
    // Set up page
    [self setupPageForeSound:n1 withGraph:@"n1_graph.jpeg"];
    
    // Highlight Button
    // De-Highlight Other Buttons
    [self.n1_button setBackgroundColor:[UIColor darkGrayColor]];
    [[self.n1_button layer] setCornerRadius:8.0f];
    
    [self.d1_button setBackgroundColor:[UIColor clearColor]];
    [self.f1_button setBackgroundColor:[UIColor clearColor]];
    [self.n2_button setBackgroundColor:[UIColor clearColor]];
    [self.n3_button setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)n2_pressed:(id)sender {
    
    // Set up page
    [self setupPageForeSound:n2 withGraph:@"n2_graph.jpg"];
    
    // Highlight Button
    // De-Highlight Other Buttons
    [self.n2_button setBackgroundColor:[UIColor darkGrayColor]];
    [[self.n2_button layer] setCornerRadius:8.0f];
    
    [self.d1_button setBackgroundColor:[UIColor clearColor]];
    [self.n1_button setBackgroundColor:[UIColor clearColor]];
    [self.f1_button setBackgroundColor:[UIColor clearColor]];
    [self.n3_button setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)n3_pressed:(id)sender {
    
    // Set up page
    [self setupPageForeSound:n3 withGraph:@"n3_graph.jpg"];
    
    // Highlight Button
    // De-Highlight Other Buttons
    [self.n3_button setBackgroundColor:[UIColor darkGrayColor]];
    [[self.n3_button layer] setCornerRadius:8.0f];
    
    [self.d1_button setBackgroundColor:[UIColor clearColor]];
    [self.n1_button setBackgroundColor:[UIColor clearColor]];
    [self.n2_button setBackgroundColor:[UIColor clearColor]];
    [self.f1_button setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)holo_pressed:(id)sender {
//    UIAlertController * alert=   [UIAlertController
//                                  alertControllerWithTitle:@"Super Cool Holo"
//                                  message:@"Coming Soon!"
//                                  preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* ok = [UIAlertAction
//                         actionWithTitle:@"OK"
//                         style:UIAlertActionStyleDefault
//                         handler:^(UIAlertAction * action)
//                         {
//                             //Do some thing here
//                             [alert dismissViewControllerAnimated:YES completion:nil];
//                             
//                         }];
//    [alert addAction:ok]; // add action to uialertcontroller
//    [self presentViewController:alert animated:YES completion:nil];
}

#pragma - mark
- (void)animateContourAtDuration:(float)duration withImage:(UIImageView *) imageView {
    imageView.animationImages = [NSArray arrayWithObjects:
                                           [UIImage imageNamed:@"frame_0.gif"],
                                           [UIImage imageNamed:@"frame_1.gif"],
                                           [UIImage imageNamed:@"frame_2.gif"],
                                           [UIImage imageNamed:@"frame_3.gif"],
                                           [UIImage imageNamed:@"frame_4.gif"],
                                           [UIImage imageNamed:@"frame_5.gif"],
                                           [UIImage imageNamed:@"frame_6.gif"],
                                           [UIImage imageNamed:@"frame_7.gif"],
                                           [UIImage imageNamed:@"frame_8.gif"],
                                           [UIImage imageNamed:@"frame_9.gif"],
                                           [UIImage imageNamed:@"frame_10.gif"],
                                           [UIImage imageNamed:@"frame_11.gif"],
                                           [UIImage imageNamed:@"frame_12.gif"],
                                           [UIImage imageNamed:@"frame_13.gif"],
                                           [UIImage imageNamed:@"frame_14.gif"],nil];
    imageView.animationDuration = duration;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
}

- (void)playAudioFile:(NSString *)file withVolume:(float)volume {
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/%@",
                               [[NSBundle mainBundle] resourcePath], file];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                         error:nil];
    self.player.delegate = self;
    self.player.numberOfLoops = 0; //Once
    [self.player setVolume:volume];
    
    self.volumeSlider.value = volume;
    self.volView.hidden = NO;
    [self refreshVolumeView];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    [self.player play];
}

- (void)vibrateFor:(float)vibrations{
    if (vibrations == 1) {
        //Vibrate
        for (int i = 1; i < 2; i++) {
            [self performSelector:@selector(vibe:) withObject:self afterDelay:i *0.0f];
        }
    } else if (vibrations == 2) {
        //Vibrate
        for (int i = 1; i < 5; i++) {
            [self performSelector:@selector(vibe:) withObject:self afterDelay:i *0.1f];
        }
    } else if (vibrations == 3) {
        //Vibrate
        for (int i = 1; i < 10; i++) {
            [self performSelector:@selector(vibe:) withObject:self afterDelay:i *0.1f];
        }
    }
}

- (void)setupPageForeSound:(NSString *)sound withGraph:(NSString *)graphFile {
    
//    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(180, 300, 30, 30)];
//    [activity setBackgroundColor:[UIColor lightGrayColor]];
//    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    [self.view addSubview:activity];
    UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc]     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color = [UIColor darkGrayColor];
    activityView.center=self.view.center;
    
    [activityView startAnimating];
    
    [self.view addSubview:activityView];
    
    float randomNum = ((float)rand() / RAND_MAX) * 2.0;
    
    [activityView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:randomNum];
    
    // Set State
    self.state = sound;
    
    [self.timeGraphImg setImage:[UIImage imageNamed:graphFile]];
    
    // Create method to set up map overlay imgs/gifs
    [self.middle_height_button setImage:[UIImage imageNamed:@"shapes.png"] forState:UIControlStateNormal];
    [self.highest_height_button setImage:[UIImage imageNamed:@"shapes.png"] forState:UIControlStateNormal];
    
    [self.highest_contour stopAnimating];
    [self.highest_contour setHidden:YES];
    [self.middle_contour stopAnimating];
    [self.middle_contour setHidden:YES];
    [self.dB_textField setText:@"- dB"];
    
//    wait(1);
//    [activity stopAnimating];
}

- (void)pinch:(UIPinchGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded
        || gesture.state == UIGestureRecognizerStateChanged) {
        NSLog(@"gesture.scale = %f", gesture.scale);
        
        CGFloat currentScale = self.timeGraphImg.frame.size.width / self.timeGraphImg.bounds.size.width;
        CGFloat newScale = currentScale * gesture.scale;
        
        if (newScale < MINIMUM_SCALE) {
            newScale = MINIMUM_SCALE;
        }
        if (newScale > MAXIMUM_SCALE) {
            newScale = MAXIMUM_SCALE;
        }
        
        CGAffineTransform transform = CGAffineTransformMakeScale(newScale, newScale);
        self.timeGraphImg.transform = transform;
        gesture.scale = 1;
    }
}

@end
