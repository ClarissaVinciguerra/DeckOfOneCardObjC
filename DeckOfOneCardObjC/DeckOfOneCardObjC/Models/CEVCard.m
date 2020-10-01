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
// call the following for each card that comes back in the JSON's cardsArray
- (CEVCard *)initWithCardDictionary:(NSDictionary<NSString *,id> *)cardDictionary
{
    
    NSString *value = cardDictionary[@"value"];
    NSString *suit = cardDictionary[@"suit"];
    NSString *imagePath = cardDictionary[@"image"];
    
    return [self initWithValue:value suit:suit imagePath:imagePath];
}
@end
