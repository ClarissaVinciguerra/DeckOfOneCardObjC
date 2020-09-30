//
//  CEVCard.m
//  DeckOfOneCardObjC
//
//  Created by Clarissa Vinciguerra on 9/29/20.
//

#import "CEVCard.h"

@implementation CEVCard

- (instancetype)initWithValue:(NSString *)value suit:(NSString *)suit imagePath:(NSString *)imagePath
{
    if (self = [super init]) {
        _value = value;
        _suit = suit;
        _imagePath = imagePath;
    }
    return self;
}
@end

@implementation CEVCard (JSONConvertable)
- (CEVCard *)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    
    NSString *value = topLevelDictionary[@"value"];
    NSString *suit = topLevelDictionary[@"suit"];
    NSString *imagePath = topLevelDictionary[@"image"];
    
    return [self initWithValue:value suit:suit imagePath:imagePath];
}
@end
