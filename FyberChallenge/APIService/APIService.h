//
//  APIService.h
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * @brief A block that handles success
 */
typedef void(^APIRequestSuccessCompletion)(id result);
/*!
 * @brief A block that handles failure
 */
typedef void(^APIRequestFailureCompletion)(NSError *error);


@interface APIService : NSObject

/*!
 * @discussion APIService singleton method
 * @return a unique instace of APIService.
 */
+ (instancetype)sharedInstance;

/*!
 * @discussion Method that retrieve Offers from Fyber API.
 * @param params an NSMutableDictionary that containes the params that will be used to perform the request.
 * @param success the APIRequestSuccessCompletion block
 * @param failure the APIRequestFailureCompletion block
 * 
 * @code [[APIService sharedInstance] getOffers: _fields success:^(id result) {
        //NSArray object
        NSLog(@"%@", result);
    } failure:^(NSError *error) {
        NSLog(@"%@", error.description);
 }];
 *
 */
- (void)getOffers:(NSMutableDictionary *)params success:(APIRequestSuccessCompletion)success
          failure:(APIRequestFailureCompletion)failure;


@end
