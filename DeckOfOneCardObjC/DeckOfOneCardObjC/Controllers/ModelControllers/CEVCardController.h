//
//  CEVCardController.h
//  DeckOfOneCardObjC
//
//  Created by Clarissa Vinciguerra on 9/29/20.
//

#import "CEVCard.h"
#import <UIKit/UIKit.h>

//NS_ASSUME_NONNULL_BEGIN

@interface CEVCardController : NSObject
//NSArray<CEVCard *>* cards)
+ (void)drawANewCardWithCompletion:(void(^) (CEVCard *card)) completion;

+ (void)fetchImage:(CEVCard *)card completion: (void (^) (UIImage *)) completion;

@end

//NS_ASSUME_NONNULL_END
