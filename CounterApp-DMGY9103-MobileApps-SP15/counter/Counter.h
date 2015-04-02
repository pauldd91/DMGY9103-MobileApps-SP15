//
//  Counter.h
//  counter
//
//  Created by Paul Dariye on 4/1/15.
//  Copyright (c) 2015 tanookilabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Counter : NSObject

@property (nonatomic) int count;
@property (nonatomic) NSString *counterName;

- (void)incrementCount;
- (void)decrementCount;

@end
