//
//  Helper.h
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AdSupport/AdSupport.h>

@interface Helper : NSObject

/*!
 * @discussion current time in ms
 */
+ (NSString *)currentTimeStamp;
/*!
 * @discussion current iOS Version
 */
+ (NSString *)systemVersion;
/*!
 * @discussion advertisingIdentifier
 */
+ (NSString *)device_id;

@end
