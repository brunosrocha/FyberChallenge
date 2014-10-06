//
//  OfferCustomTableViewCell.h
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Offer.h"

@interface OfferCustomTableViewCell : UITableViewCell
/*!
 * @brief thumnail image
 */
@property (nonatomic, weak) IBOutlet UIImageView *thumbnail;
/*!
 * @brief offer title
 */
@property (nonatomic, weak) IBOutlet UILabel *title;
/*!
 * @brief offer teaser
 */
@property (nonatomic, weak) IBOutlet UILabel *teaser;
/*!
 * @brief offer payout
 */
@property (nonatomic, weak) IBOutlet UIButton *payout;


/*!
 * @discussion Method that sets the Offer object
 */
- (void)setOffer:(Offer *)offer;

@end
