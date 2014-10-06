//
//  OfferWallFunctionalTestCase.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/5/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <KIF/KIF.h>

@interface OfferWallFunctionalTestCase : KIFTestCase

@end

@implementation OfferWallFunctionalTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIfOffersHasLoaded
{
    [tester waitForCellAtIndexPath: [NSIndexPath indexPathForRow: 0 inSection: 0] inTableViewWithAccessibilityIdentifier: @"offerTableView"];
}


@end
