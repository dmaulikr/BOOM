//
//  ViewController.m
//  BOOM
//
//  Created by Maathusan Rajendram on 2016-04-22.
//  Copyright © 2016 Maathusan Rajendram. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
//    [self.soundWaveImg setImage:[UIImage imageNamed:@"map.png"]];
    [self.timeGraphImg setImage:[UIImage imageNamed:@"image.jpeg"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)lowest_height_pressed:(id)sender {
    // Present spinner to show loading - randomize wait time to 0.2s to 2s
    // Play volume at respective level
    // Vibrate at respective pattern
    // Display respective contour
    // Update respective dB value
    
}

- (IBAction)middle_height_pressed:(id)sender {
}

- (IBAction)highest_height_pressed:(id)sender {
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
