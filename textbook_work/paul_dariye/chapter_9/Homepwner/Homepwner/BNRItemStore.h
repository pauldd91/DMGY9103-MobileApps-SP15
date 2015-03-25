//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Paul Dariye on 2/24/15.
//  Copyright (c) 2015 Pearl-Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@class BNRItem;

@interface BNRItemStore : NSObject


@property (nonatomic, readonly) NSArray *allItems;


+ (instancetype)sharedStore;

- (BNRItem *)createItem;

- (void)removeItem:(BNRItem *)item;

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;


@end
