//
//  WebViewController.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import "WebViewController.h"
#import "MBProgressHUD.h"

@interface WebViewController () <UIWebViewDelegate>
/*!
 * @brief webview that loads the specified url
 */
@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.accessibilityLabel = @"webView";
    [_webView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: _url]]];
}

#pragma mark - 
#pragma mark WebView Delegate Methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: self.view animated: YES];
    hud.labelText = @"Loading page...";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideAllHUDsForView: self.view animated: YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideAllHUDsForView: self.view animated: YES];
}

@end
