//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Paul Dariye on 3/25/15.
//  Copyright (c) 2015 Pearl-Labs. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore()


@property (nonatomic, strong) NSMutableDictionary *dictionary;


@end

@implementation BNRImageStore

+ (instancetype)sharedStore
{
    static BNRImageStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// No one should call initi
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRImageStore sharedStore]" userInfo:nil];
    return nil;
}

// Secret designated initializer

- (instancetype)initPrivate
{
    self = [super init];
    
    if(self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
//    return [self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
    
}


@end
