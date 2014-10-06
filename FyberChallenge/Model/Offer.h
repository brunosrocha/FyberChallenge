//
//  Offer.h
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Offer : NSObject

/*!
 * @brief offer title.
 */
@property (nonatomic, strong) NSString *title;
/*!
 * @brief offer teaser.

 */
@property (nonatomic, strong) NSString *teaser;
/*!
 * @brief offer link.
 */
@property (nonatomic, strong) NSString *link;
/*!
 * @brief offer payout.
 */
@property (nonatomic, strong) NSString *payout;
/*!
 * @brief offer thumbnail string url.
 */
@property (nonatomic, strong) NSString *thumbnail_hires;


/*!
 * @discussion Offer init method.
 * @param dictionary an NSDictionary that contains the Offer data.
 * @return a Offer object.
 */
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end