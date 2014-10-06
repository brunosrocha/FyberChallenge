//
//  FormControllerTestCase.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/5/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FormViewController.h"

@interface ViewControllerTestCase : XCTestCase

@property (nonatomic, strong) FormViewController *vc;

@end

@implementation ViewControllerTestCase

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vc = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
    [super tearDown];
}

- (void)testInitNotNil
{
    XCTAssertNotNil(self.vc, @" vc object instantiated");
}

#pragma mark - View loading tests

-(void)testThatViewLoads
{
    XCTAssertNotNil(self.vc.view, @"View not initiated properly");
}




@end
