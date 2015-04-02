//
//  ViewController.m
//  counter
//
//  Created by Chris Ricca on 3/31/15.
//  Copyright (c) 2015 tanookilabs. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "CounterViewController.h"
#import "Counter.h"

@interface CounterViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (strong, nonatomic) Counter *count;

- (IBAction)incrementBtn:(id)sender;

- (IBAction)decrementBtn:(id)sender;

@end

@implementation CounterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _count = [[Counter alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementBtn:(id)sender {
    
    [_count incrementCount];

    _countLabel.text = [NSString stringWithFormat:@"%i",_count.count];
    
}

- (IBAction)decrementBtn:(id)sender {
    [_count decrementCount];
    
    _countLabel.text = [NSString stringWithFormat:@"%i",_count.count];
}
@end
