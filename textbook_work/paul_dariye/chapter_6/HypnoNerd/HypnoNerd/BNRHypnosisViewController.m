//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Paul Dariye on 2/17/15.
//  Copyright (c) 2015 Pearl-Labs. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"


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
    
    // Set it as the view of this controller
    self.view = backgroundView;
}

@end
