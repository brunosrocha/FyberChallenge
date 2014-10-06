//
//  OfferWallTableViewController.h
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfferWallTableViewController : UITableViewController

/*!
 * @discussion Custom fields setter
 * @param fields an NSMutableDictionary with the request params
 */
- (void)setFields:(NSMutableDictionary *)fields;

@end
