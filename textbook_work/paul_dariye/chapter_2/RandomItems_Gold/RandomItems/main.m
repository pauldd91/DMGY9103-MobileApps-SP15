//
//  main.m
//  RandomItems
//
//  Created by paul d on 2/11/15.
//  Copyright (c) 2015 Pearl Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // Create mutable array object
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        // Send the message addObject: to the NSMutableArray pointer to by the variable items, passing a string at a time
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        
//        // Send another message, insertObject:atIndex, to that same array object
//        [items insertObject:@"Zero" atIndex:0];
//        
//        // Print to console every item in items array
//        for (NSString *item in items) {
//            NSLog(@"%@", item);
//        }
        
        
        // create an instance of BNR item
//        BNRItem *item = [[BNRItem alloc] init];
//        
//        
//        item.itemName=@"Red Sofa";
//        item.serialNumber=@"A1B2C";
//        item.valueInDollars=100;
        
//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Red Sofa" valueInDollars:100 serialNumber:@"A1B2C3"];
//        
//        BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue Sofa"];
//        
//        BNRItem *itemWithNoName = [[BNRItem alloc] init];
        
        
        // Console out
//        NSLog(@"%@ %@ %@ %d", [item itemName], [item dateCreated], [item serialNumber], [item valueInDollars]);
        
        // %@ token replaced with the result of sending the description message to corresponding argument
//        NSLog(@"%@", item);
//        
//        NSLog(@"%@", itemWithName);
//        
//        NSLog(@"%@", itemWithNoName);
        
        
        
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
//        id lastObj = [items lastObject];
//        [lastObj count];
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        
        //Destroy the mutable array object
        items = nil;
    }
    return 0;
}
