//
//  FormViewController.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import "FormViewController.h"
#import "IQUIView+IQKeyboardToolbar.h"
#import "OfferWallTableViewController.h"

@interface FormViewController ()
/*!
 * @brief IBOutletCollection that holds the form fields
 */
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFields;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
/*!
 * @brief An NSMutableDictionary that contains the form fields
 */
@property (strong) NSMutableDictionary *fields;
/*!
 * @discussion Method that checks if all fields are filled
 * @return YES if all fields are filled and NO if not.
 *
 */
- (BOOL)canSendRequest;

@end

@implementation FormViewController

#pragma mark - 
#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *buttonLayer = _continueButton.layer;
    buttonLayer.cornerRadius = 5.0;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self.navigationController setNavigationBarHidden: YES animated: YES];
}

#pragma mark - 
#pragma mark - Segue Methods

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (![self canSendRequest]) {
        [[[UIAlertView alloc] initWithTitle: @"Ops!" message: @"All inputs are required!" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil, nil] show];
        return NO;
    }

    [self.view endEditing: YES];

    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"offerWallTableViewController"]) {
     
        OfferWallTableViewController *offerWallTableViewController = (OfferWallTableViewController *)segue.destinationViewController;
        [offerWallTableViewController setFields: _fields];
      
    }
}

#pragma mark -
#pragma mark - Field Validation Methods

- (BOOL)canSendRequest
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
 
    for (UITextField *tField in _textFields) {
        if ([tField.text isEqualToString: @""])
            return NO;
        [dictionary setObject: tField.text forKey: tField.restorationIdentifier];
        
    }
    
    self.fields = dictionary;
    return YES;
}

@end
