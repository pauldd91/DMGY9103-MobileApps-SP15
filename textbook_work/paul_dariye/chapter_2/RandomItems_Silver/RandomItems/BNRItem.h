//
//  BNRItem.h
//  RandomItems
//
//  Created by paul d on 2/11/15.
//  Copyright (c) 2015 Pearl Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

/* ===================================
            Class Methods
 =================================== */

+ (instancetype)randomItem;




/* ===================================
         Instance Methods
 =================================== */

// Initializers

// Designated Initializers for BNR
- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

/* =================================================================
     Silver Challenge: Another Initializer
     Goal: Create initializer(notdesignate) method for BNR item
           class
           -> takes 
              - an instance of NSString that identifies itemName
              - an instance of NSString that indentifies serialNumber
 
   ================================================================= */
// Another Initializer Definition

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;


// Accessors(Getters & Setters)

- (void) setItemName: (NSString *) str;
- (NSString *)itemName;

- (void) setSerialNumber: (NSString *) str;
- (NSString *)serialNumber;

- (void) setValueInDollars: (int) v;
- (int)valueInDollars;

- (NSDate *)dateCreated;

@end
