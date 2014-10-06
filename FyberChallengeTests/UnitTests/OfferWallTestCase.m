//
//  OfferWallTestCase.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/5/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "OfferWallTableViewController.h"

@interface OfferWallTestCase : XCTestCase

@property (nonatomic,strong) OfferWallTableViewController *offerWall;

@end

@implementation OfferWallTestCase

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.offerWall = [storyboard instantiateViewControllerWithIdentifier:@"offerWallTableViewController"];
    [self.offerWall performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.offerWall = nil;
    [super tearDown];
}

- (void)testInitNotNil
{
    XCTAssertNotNil(self.offerWall, @" offerWall object instantiated");
}

-(void)testThatViewLoads
{
    XCTAssertNotNil(self.offerWall.view, @"View not initiated properly");
}

-(void)testThatTableViewLoads
{
    XCTAssertNotNil(self.offerWall.tableView, @"TableView not initiated");
}

- (void)testThatViewConformsToUITableViewDataSource
{
    XCTAssertTrue([self.offerWall conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

- (void)testThatTableViewHasDataSource
{
    XCTAssertNotNil(self.offerWall.tableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testThatViewConformsToUITableViewDelegate
{
    XCTAssertTrue([self.offerWall conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testTableViewIsConnectedToDelegate
{
    XCTAssertNotNil(self.offerWall.tableView.delegate, @"Table delegate cannot be nil");
}


- (void)testTableViewHeightForRowAtIndexPath
{
    CGFloat expectedHeight = 226.0;
    CGFloat actualHeight = self.offerWall.tableView.rowHeight;
    XCTAssertEqual(expectedHeight, actualHeight, @"Cell should have %f height, but they have %f", expectedHeight, actualHeight);
}

@end
