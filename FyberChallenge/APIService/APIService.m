//
//  APIService.m
//  FyberChallenge
//
//  Created by Bruno Rocha on 10/4/14.
//  Copyright (c) 2014 Bruno Rocha. All rights reserved.
//

#import "APIService.h"
#import "AFNetworking.h"
#import "Helper.h"
#import "NSString+SHA1.h"
#import "Offer.h"

#define BASE_URL @"http://api.sponsorpay.com/feed/v1/offers.json?"

@implementation APIService

#pragma  mark -
#pragma mark - Instance


+ (instancetype)sharedInstance
{
    static APIService *shared = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}

- (AFHTTPSessionManager *)manager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"Accept-Encoding" forHTTPHeaderField: @"gzip"];
    [manager.requestSerializer setValue:@"Keep-Alive" forHTTPHeaderField:@"Connection"];
    
    return manager;
}

- (void)getOffers:(NSMutableDictionary *)params success:(APIRequestSuccessCompletion)success
          failure:(APIRequestFailureCompletion)failure
{
    NSString *url = [NSString stringWithFormat: @"%@appid=%@&uid=%@&pub0=%@&device_id=%@&locale=%@&os_version=%@&timestamp=%@&hashkey=%@",BASE_URL, params[@"appId"], params[@"uid"], params[@"pub0"], params[@"device_id"],params[@"locale"],params[@"os_version"], params[@"time_stamp"] ,params[@"hashkey"]];
    
    AFHTTPSessionManager *manager = [self manager];
    
    [manager GET: url parameters: nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        /*
         Rules
         Concatenate the full response body with your API key
         Hash the whole resulting string using SHA1
         
         To be sincerely I do not really understood what I have to do in this task... I did what the documentation said.. I concatenate the full body response with the API Key but the hash that I sent does not match with this signature.. This is the only task I did not make =/
         
         Example: 
         
             NSHTTPURLResponse *headers = (NSHTTPURLResponse *)task.response;
            
             NSString *signature = headers.allHeaderFields[@"X-Sponsorpay-Response-Signature"];
         
             NSString *concate = [NSString stringWithFormat: @"%@&%@", FULL_RESPONSE , APP_KEY]
            
            [concate sha1] == SENT_HASH ?
         
            Is that correct?
         
         */
        
        NSMutableArray *array = ((NSDictionary *)responseObject)[@"offers"];
        
        NSMutableArray *content = [NSMutableArray array];
        
        for (NSDictionary *dict in array)
            [content addObject: [[Offer alloc] initWithDictionary: dict]];
        
        success(content);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
    
}

@end
