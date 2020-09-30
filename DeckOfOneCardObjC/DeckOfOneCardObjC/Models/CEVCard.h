//
//  CEVCard.h
//  DeckOfOneCardObjC
//
//  Created by Clarissa Vinciguerra on 9/29/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CEVCard : NSObject

@property (nonatomic, copy, readonly) NSArray *cards;

@property (nonatomic, copy, readonly) NSString *value;
@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *imagePath;

- (instancetype)initWithValue:(NSString *)value
                         suit:(NSString *)suit
                    imagePath:(NSString *)imagePath;

@end

@interface CEVCard (JSONConvertable)

- (CEVCard *)initWithDictionary:(NSDictionary<NSString *, id>*)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
