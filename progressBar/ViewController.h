//
//  ViewController.h
//  progressBar
//
//  Created by ilyas uyanik on 9/25/12.
//  Copyright (c) 2012 university of houston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
float progressMaximumValue,progressMinimumValue,progressValue;
    int state;
}
@property (weak, nonatomic) IBOutlet UIButton *playOutlet;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic,weak)   NSString *timestamp;
@property (nonatomic,weak)   NSString *time;
@property (nonatomic,strong) NSTimer *timer;
- (IBAction)playBtn:(id)sender;
- (IBAction)stopBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *stopOutlet;

@end
