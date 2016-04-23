//
//  ViewController.h
//  BOOM
//
//  Created by Maathusan Rajendram on 2016-04-22.
//  Copyright © 2016 Maathusan Rajendram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, AVAudioPlayerDelegate>


#pragma - Images
@property (weak, nonatomic) IBOutlet UIImageView *soundWaveImg;
@property (weak, nonatomic) IBOutlet UIImageView *timeGraphImg;

#pragma - Buttons
@property (weak, nonatomic) IBOutlet UIButton *lowest_height_button;
@property (weak, nonatomic) IBOutlet UIButton *middle_height_button;
@property (weak, nonatomic) IBOutlet UIButton *highest_height_button;

@property (weak, nonatomic) IBOutlet UIButton *f1_button;
@property (weak, nonatomic) IBOutlet UIButton *d1_button;
@property (weak, nonatomic) IBOutlet UIButton *n1_button;
@property (weak, nonatomic) IBOutlet UIButton *n2_button;
@property (weak, nonatomic) IBOutlet UIButton *n3_button;

@property (weak, nonatomic) IBOutlet UIButton *holo_button;

#pragma - Text Field
@property (weak, nonatomic) IBOutlet UITextField *dB_textField;


@end

