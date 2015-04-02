//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Paul Dariye on 3/25/15.
//  Copyright (c) 2015 Pearl-Labs. All rights reserved.
//
#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

#import "BNRDetailViewController.h"
#import "BNRItem.h"


@interface BNRImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;


@end
