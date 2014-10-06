//
//  FormControllerFunctionalTestCase.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/5/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <KIF/KIF.h>

@interface FormControllerFunctionalTestCase : KIFTestCase

@end

@implementation FormControllerFunctionalTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInputForm
{
    [tester enterText: @"spiderman" intoViewWithAccessibilityLabel: @"uid"];
    [tester enterText: @"1c915e3b5d42d05136185030892fbb846c278927" intoViewWithAccessibilityLabel: @"appKey"];
    [tester enterText: @"2070" intoViewWithAccessibilityLabel: @"appId"];
    [tester enterText: @"campaign2" intoViewWithAccessibilityLabel: @"pub0"];
    
    [tester tapViewWithAccessibilityLabel: @"Send Data"];
}

- (void)testSuccessfulParams
{
    [tester waitForTappableViewWithAccessibilityLabel: @"offerTableView"];
}


@end
