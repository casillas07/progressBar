//
//  ViewController.m
//  progressBar
//
//  Created by ilyas uyanik on 9/25/12.
//  Copyright (c) 2012 university of houston. All rights reserved.
//

#import "ViewController.h"
#import "CoreGraphics/CoreGraphics.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize stopOutlet;
@synthesize playOutlet;
@synthesize progressBar;
@synthesize label;
@synthesize time;
@synthesize timestamp;
@synthesize timer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    time=[NSString stringWithFormat:@"%0.0f",[[NSDate date]timeIntervalSince1970]];
    float tempMax=[time floatValue];
    progressMaximumValue=tempMax-1200;
    progressMinimumValue=tempMax-8400;
    progressValue=progressMinimumValue;
    progressBar.progress=0;
    state=0;
}

- (void)viewDidUnload
{
    [self setPlayOutlet:nil];
    [self setProgressBar:nil];
    [self setLabel:nil];
    [self setStopOutlet:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)playBtn:(id)sender {
    
    switch (state) {
        case 0:
        {
            UIImage *stopImage=[UIImage imageNamed:@"stop.png"];
            [playOutlet setImage:stopImage forState:UIControlStateNormal];
            [self.view addSubview:playOutlet];
            state=1;
            [self process];
            break;
        }
            
        case 1:
        {  
            UIImage *playImage=[UIImage imageNamed:@"play.png"];
            [playOutlet setImage:playImage forState:UIControlStateNormal];
            [self.view addSubview:playOutlet];
            state=0;
            break;
        }
    }
    
}

-(void)process{
            [self timeFormatter];
            if(progressValue>=progressMinimumValue&&progressValue<progressMaximumValue)
            {
                if(state==1)
                {
                progressValue=progressValue+900;
                progressBar.progress+=(900)/(progressMaximumValue-progressMinimumValue);
                }
                
            }
            else{
                [progressBar setProgress:0];
                progressValue=progressMinimumValue;
                
            }
            timestamp=[NSString stringWithFormat:@"%1.f",progressValue];
   
    if(state==1)
    [self performSelector:@selector(process) withObject:nil afterDelay:2.0];
            
}

-(void)timeFormatter
    {
        NSDate *past=[NSDate dateWithTimeIntervalSince1970:progressValue];
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
        [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        NSString *str=[dateFormatter stringFromDate:past];
        label.text=str;
}


@end
