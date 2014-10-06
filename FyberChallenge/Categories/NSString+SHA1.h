//
//  NSString+SHA1.h
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (SHA1)
/*!
 * @discussion Method that encrypts a NSString using SHA1
 */
- (NSString *)sha1;

@end
