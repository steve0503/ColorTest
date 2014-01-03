//
//  ViewController.m
//  ColorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIView *colorView;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actvityIndicator;

- (IBAction)onColorSliderChanged:(id)sender;


@end

@implementation ViewController

@synthesize redSlider;

@synthesize greenSlider;
@synthesize blueSlider;

@synthesize colorView;

@synthesize actvityIndicator;

- (IBAction)onColorSliderChanged:(id)sender {
    
    if ([actvityIndicator isAnimating]) {
        [actvityIndicator stopAnimating];
    }
    
    colorView.backgroundColor = [UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0];
    
}



- (IBAction)PowerOnOff:(id)sender {
    
    BOOL isOn = ((UISwitch*)sender).on;
    
    redSlider.enabled = isOn;
    greenSlider.enabled = isOn;
    blueSlider.enabled = isOn;
    
    if (isOn) {
        [actvityIndicator startAnimating];
        
        [self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0];
    }
    else
    {
        colorView.backgroundColor = [UIColor grayColor];
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self onColorSliderChanged:nil];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
