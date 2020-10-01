//
//  CEVCardController.m
//  DeckOfOneCardObjC
//
//  Created by Clarissa Vinciguerra on 9/29/20.
//

#import "CEVCardController.h"

@implementation CEVCardController

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const drawEndpoint = @"draw";


//(NSArray<CEVCard *> *)
+ (void)drawANewCardWithCompletion:(void (^)(CEVCard *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:drawEndpoint];
    NSLog(@"FINALURL!!!!!!!!@@@@@@@@@!!!!!!!!^^^%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error: %@, %@", error, error.localizedDescription);
            return completion(nil);
        }
        if (!data)
        {
            NSLog(@"There appears to be no data.");
            return completion(nil);
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        if (!topLevelDictionary)
        {
            NSLog(@"Error parsing JSON: %@", error);
            completion(nil);
            return;
        }
        
        NSArray *cardsArray = topLevelDictionary[@"cards"];
        NSMutableArray *cardsDictArray = [NSMutableArray array];
        for (NSDictionary *cardDictionary in cardsArray)
        {
            CEVCard *card = [[CEVCard alloc] initWithCardDictionary:cardDictionary];
            NSLog(@"Value %@ SUIT: %@ IMAGE %@", card.value, card.suit, card.imagePath);
            [cardsDictArray addObject:card];
        }
     CEVCard *cardToReturn = cardsDictArray.firstObject;
        completion(cardToReturn);
        
    }] resume];
}

+ (void)fetchImage:(CEVCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.imagePath];
    NSLog(@"!!!IMAGEURL!!!: %@", imageURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error fetching the image: %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"There was no data found for our image.");
            completion(nil);
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
}

@end

