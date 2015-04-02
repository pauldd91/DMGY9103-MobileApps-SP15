//
//  Counter.m
//  counter
//
//  Created by Paul Dariye on 4/1/15.
//  Copyright (c) 2015 tanookilabs. All rights reserved.
//

#import "Counter.h"

@implementation Counter

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _count = 0;
    }
    
    return self;
}

- (void)incrementCount
{
    _count++;
}

- (void)decrementCount
{
    _count--;
}


@end
