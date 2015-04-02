//
//  CountersListViewController.h
//  counter
//
//  Created by Paul Dariye on 4/1/15.
//  Copyright (c) 2015 tanookilabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CounterViewController.h"

@interface CountersListViewController : UITableViewController

@property NSMutableArray *counters;

- (void) addNewItem;

@end
