//
//  OfferTestCase.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/5/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Offer.h"

@interface OfferTestCase : XCTestCase

@property (nonatomic, strong) Offer *offer;

@end

@implementation OfferTestCase

- (void)setUp {
    [super setUp];
    
    self.offer = [[Offer alloc] initWithDictionary: @{@"title" : @"Offer 123", @"teaser" : @"Amazing offer", @"link" : @"http://fyber.com", @"payout" : @(200), @"thumbnail" : @{@"hires" : @"http://image.com"}}];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.offer = nil;
    [super tearDown];
}

- (void)testTitleIsNotNil
{
    XCTAssertNotNil(self.offer.title, @"Offer should have a title");
}

- (void)testTeaserIsNotNil
{
    XCTAssertNotNil(self.offer.teaser, @"Offer should have a teaser");
}

- (void)testLinkIsNotNil
{
    XCTAssertNotNil(self.offer.link, @"Offer should have a link");
}

- (void)testPayoutIsNotNil
{
    XCTAssertNotNil(self.offer.payout, @"Offer should have a payout");
}

- (void)testThumbnailIsNotNil
{
    XCTAssertNotNil(self.offer.thumbnail_hires , @"Offer should have a thumbnail");
}

- (void)testPayoutClass
{
    NSDictionary *dict = @{@"payout" : @(231)};
    XCTAssertTrue([dict[@"payout"] isKindOfClass: [NSNumber class]], @"Should be NSNumber class");
    Offer *offer = [[Offer alloc] initWithDictionary: dict ];
    XCTAssertNotNil(offer.payout, @"Offer should have a payout");
}

@end
