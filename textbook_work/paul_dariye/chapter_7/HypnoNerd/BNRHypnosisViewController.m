//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Paul Dariye on 2/17/15.
//  Copyright (c) 2015 Pearl-Labs. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end


@implementation BNRHypnosisViewController

// Override UIViewController's designated initializer
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Set the tab bar item's title
        
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        // Put that image on the tab bar item;
        
        self.tabBarItem.image = i;
        
    }
    
    return self;
    
}

// Override loadView to creat a screen-sized instance of BNRHypnosisView
- (void)loadView
{
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
    
    
    // Create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    // Setting the border style on the text field will allow us to see it more easily
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.placeholder = @"Hypnotize me";
    
    
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    
    
    [backgroundView addSubview:textField];
    
    // Set it as the view of this controller
    self.view = backgroundView;
}

- (BOOL)textFieldShouldReturn: (UITextField *)textField
{
//    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    
    [textField resignFirstResponder];
    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20 ; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // Configure label's color and text
        
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        // This method resizes the label, which will be relative
        // to the text that it is displaying
        [messageLabel sizeToFit];
        
        // Get random x value within hypnosis view's width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        // Get random y value withing hypnosis view's height
        
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        
        int y = arc4random() % height;
        
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // Add the label to the hierarchy
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        
        motionEffect.minimumRelativeValue = @(-25);
        
        motionEffect.maximumRelativeValue = @(25);
        
        [messageLabel addMotionEffect:motionEffect];
        
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        
        [messageLabel addMotionEffect:motionEffect];
        
    }
}

@end
