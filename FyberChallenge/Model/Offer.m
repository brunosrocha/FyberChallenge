//
//  Offer.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import "Offer.h"

@implementation Offer

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.title = dictionary[@"title"];
        self.teaser = dictionary[@"teaser"];
        self.link = dictionary[@"link"];
        self.payout = [dictionary[@"payout"] stringValue];
        self.thumbnail_hires = dictionary[@"thumbnail"][@"hires"];
    }
    
    return self;
}

@end
