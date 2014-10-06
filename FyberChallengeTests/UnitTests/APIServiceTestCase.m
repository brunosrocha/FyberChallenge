//
//  APIServiceTestCase.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/5/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "APIService.h"
#import "Helper.h"
#import "NSString+SHA1.h"

@interface APIServiceTestCase : XCTestCase

@end

@implementation APIServiceTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - 
#pragma mark - Helper Methods

- (APIService *)createUniqueInstance {
    
    return [[APIService alloc] init];
    
}

- (APIService *)getSharedInstance {
    
    return [APIService sharedInstance];
    
}

#pragma mark -
#pragma mark - Tests

- (void)testSingletonSharedInstanceCreated {
    
    XCTAssertNotNil([self getSharedInstance]);
    
}

- (void)testSingletonUniqueInstanceCreated {
    
    XCTAssertNotNil([self createUniqueInstance]);
    
}

- (void)testSingletonReturnsSameSharedInstanceTwice {
    
    APIService *sharedInstance = [self getSharedInstance];
    XCTAssertEqual(sharedInstance, [self getSharedInstance]);
    
}

- (void)testSingletonSharedInstanceSeparateFromUniqueInstance {
    
    APIService *sharedInstance = [self getSharedInstance];
    XCTAssertNotEqual(sharedInstance, [self createUniqueInstance]);
}

- (void)testSingletonReturnsSeparateUniqueInstances {
    
    APIService *uniqueInstance = [self createUniqueInstance];
    XCTAssertNotEqual(uniqueInstance, [self createUniqueInstance]);
}

- (void)testRequest
{
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    [mDict setObject: @"2070" forKey: @"appId"];
    [mDict setObject: @"1c915e3b5d42d05136185030892fbb846c278927" forKey: @"appKey"];
    [mDict setObject: @"campaign2" forKey: @"pub0"];
    [mDict setObject: @"spiderman" forKey: @"uid"];
    [mDict setObject: @"DE" forKey: @"locale"];
    [mDict setObject: [Helper currentTimeStamp] forKey: @"time_stamp"];
    [mDict setObject: [Helper systemVersion] forKey: @"os_version"];
    [mDict setObject: [Helper device_id] forKey: @"device_id"];
    
    __block BOOL waitingForBlock = YES;
    
    NSString *cString = [NSString stringWithFormat: @"appid=%@&device_id=%@&locale=%@&os_version=%@&pub0=%@&timestamp=%@&uid=%@&%@", mDict[@"appId"], mDict[@"device_id"], mDict[@"locale"], mDict[@"os_version"], mDict[@"pub0"], mDict[@"time_stamp"], mDict[@"uid"], mDict[@"appKey"]];
    
    [mDict setObject: [cString sha1] forKey: @"hashkey"];
    
    [[self getSharedInstance] getOffers: mDict success:^(NSMutableArray *content) {
        waitingForBlock = NO;
        XCTAssertTrue(content.count, @"Contain Offers");
    } failure:^(NSError *error) {
        XCTAssertNotNil(error, "Something is probaly wrong");
    }];
    
    while(waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}


@end
