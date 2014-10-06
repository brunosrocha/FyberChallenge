//
//  Helper.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (NSString *)currentTimeStamp
{
    return [NSString stringWithFormat: @"%.0f", [[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)systemVersion
{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)device_id
{
   return [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
}

@end
