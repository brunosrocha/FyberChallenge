//
//  OfferCustomTableViewCell.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import "OfferCustomTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation OfferCustomTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setOffer:(Offer *)offer
{
    _title.text = offer.title;
    _teaser.text = offer.teaser;
    _payout.layer.cornerRadius = 10.0;
    
    [_payout setTitle: offer.payout forState: UIControlStateNormal];

    [_thumbnail setImageWithURL: [NSURL URLWithString: offer.thumbnail_hires] placeholderImage: [UIImage imageNamed: @"logo-fyber"]];
    
}

@end
