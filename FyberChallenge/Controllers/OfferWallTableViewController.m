//
//  OfferWallTableViewController.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import "OfferWallTableViewController.h"
#import "NSString+SHA1.h"
#import "APIService.h"
#import "Helper.h"
#import "OfferCustomTableViewCell.h"
#import "Offer.h"
#import "MBProgressHUD.h"
#import "WebViewController.h"

@interface OfferWallTableViewController ()<UITableViewDataSource, UITableViewDataSource, UIAlertViewDelegate>

/*!
 * @brief Form fields in a NSMutableDictionary.
 */
@property (nonatomic, strong, setter=setFields:) NSMutableDictionary *fields;
/*!
 * @brief The array that hold the offers.
 */
@property (nonatomic, strong) NSArray *content;
/*!
 * @brief The empty offers view. This view is showed when we have no offers.
 */
@property (nonatomic, weak) IBOutlet UIView *emptyOffersView;
/*!
 * @discussion method that execute the APIService ethods
 */
- (void)getOffers;

@end

static NSString *cellIdentifier = @"OfferCustomTableViewCell";

@implementation OfferWallTableViewController

#pragma mark -
#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName: cellIdentifier bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier: cellIdentifier];
    self.navigationItem.title = @"Offers";
    self.tableView.accessibilityLabel = self.tableView.accessibilityIdentifier =  @"offerTableView";
    [self getOffers];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    self.navigationItem.hidesBackButton = YES;
    [self.navigationController setNavigationBarHidden: NO animated: YES];
}

- (void)setFields:(NSMutableDictionary *)fields
{
    _fields = fields;
    [_fields  setObject: @"DE" forKey: @"locale"];
    [_fields setObject: [Helper currentTimeStamp] forKey: @"time_stamp"];
    [_fields setObject: [Helper systemVersion] forKey: @"os_version"];
    [_fields setObject: [Helper device_id] forKey: @"device_id"];
    [_fields setObject: [self hashkeyGenerator] forKey: @"hashkey"];
}

#pragma mark -
#pragma mark - Get Offers

- (void)getOffers
{
    
    APIService *service = [APIService sharedInstance];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: self.view animated: YES];
    hud.labelText = @"Loading...";
    
    [service getOffers: _fields success:^(id result) {
        self.content = [NSArray arrayWithArray: result];
        self.navigationItem.prompt = [NSString stringWithFormat: @"%d offers found", _content.count];
        
        if (_content.count)
            [self.tableView reloadData];
        else
            [self.view addSubview: _emptyOffersView];
        
        [MBProgressHUD hideAllHUDsForView: self.view animated: YES];
    } failure:^(NSError *error) {
        
        [[[UIAlertView alloc] initWithTitle: @"Error!" message: error.description delegate: self cancelButtonTitle: @"OK" otherButtonTitles: @"Check my credentials", nil] show ];
        
        [MBProgressHUD hideAllHUDsForView: self.view animated: YES];
    }];
    
}

- (NSString *)hashkeyGenerator
{
    NSString *appId = _fields[@"appId"];
    NSString *device_id = _fields[@"device_id"];
    NSString *locale = _fields[@"locale"];
    NSString *os_version = _fields[@"os_version"];
    NSString *pub0 = _fields[@"pub0"];
    NSString *timeStamp = _fields[@"time_stamp"];
    NSString *uid = _fields[@"uid"];
    NSString *appKey = _fields[@"appKey"];
    
    NSString *cString = [NSString stringWithFormat: @"appid=%@&device_id=%@&locale=%@&os_version=%@&pub0=%@&timestamp=%@&uid=%@&%@", appId, device_id,locale, os_version, pub0, timeStamp, uid, appKey];
    
    return [cString sha1];
}

#pragma mark
#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OfferCustomTableViewCell *cell = (OfferCustomTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier: cellIdentifier forIndexPath:indexPath];
    
    if (!cell)
        cell = [[[NSBundle mainBundle] loadNibNamed: cellIdentifier owner: self options: nil] firstObject];
    
    cell.accessibilityLabel = [NSString stringWithFormat:@"Offer %d", indexPath.row];
    Offer *offer = _content[indexPath.row];
    [cell setOffer: offer];
    
    return cell;
}

#pragma mark -
#pragma mark - UITableView Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 226.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    
    Offer *offer = _content[indexPath.row];
    
    [self performSegueWithIdentifier: @"pushWebView" sender: offer.link];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0 * M_PI) / 180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ - 600;

    cell.alpha = 0;
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    [UIView animateWithDuration: 0.2 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1.0;
    }];
}

#pragma mark -
#pragma mark Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString: @"pushWebView"] && sender != nil) {
        WebViewController *webViewController = (WebViewController *)segue.destinationViewController;
        webViewController.url = sender;
    }
}

#pragma mark -
#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
        [self.navigationController popViewControllerAnimated: YES];
}

@end