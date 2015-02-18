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
//    NSString *_itemName;
//    NSString *_serialNumber;
//    int _valueInDollars;
//    NSDate *_dateCreated;
    
    // Testing strong vs weak references
    
//    BNRItem *_containedItem;
//    __weak BNRItem *_container;
    
    
    
}

// Using: @property

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic, unsafe_unretained) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;


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




// Accessors(Getters & Setters)

//- (void) setItemName: (NSString *) str;
//- (NSString *)itemName;
//
//- (void) setSerialNumber: (NSString *) str;
//- (NSString *)serialNumber;
//
//- (void) setValueInDollars: (int) v;
//- (int)valueInDollars;
//
//- (NSDate *)dateCreated;

//- (void)setContainedItem:(BNRItem *)item;
//- (BNRItem *)containedItem;
//
//- (void)setContainer:(BNRItem *)item;
//- (BNRItem *)container;

@end
