//
//  GKHTTPRequesterClass.m
//  GKZiffyDemo
//
//  Created by Gaurav Keshre on 6/27/15.
//  Copyright (c) 2015 Gaurav Keshre. All rights reserved.
//

#import "GKHTTPRequester.h"
#import "NSDictionary+Validation.h"

@implementation GKHTTPRequester

-(void)dealloc{
    [self.dataTask cancel];
    [[self session] finishTasksAndInvalidate];
    self.dataTask = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.method = GKHTTPMethodPOST;
    }
    return self;
}

#pragma mark - Session Getter Methods
- (NSURLSession *)session{
    static NSURLSession *_session;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config];
    });
    return _session;
}

#pragma mark - NSURLSession Methods

-(void) invokeURL:(NSString *)serviceURL
               withParams:(NSDictionary *)params
                 callback:(GKSuccessCallback)callback{

    NSURL *url = [NSURL URLWithString:serviceURL];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSMutableString *strParams = [[NSMutableString alloc]init];
    for (NSString *key in [params allKeys]) {
        [strParams appendFormat:@"%@=%@", key, params[key]];
        [strParams appendString:@"&"];
    }
    [strParams deleteCharactersInRange:NSMakeRange([strParams length]-1, 1)];
    [urlRequest setHTTPMethod:@"POST"];
    
    [urlRequest setHTTPBody:[strParams dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSessionDataTask *task = [[self session] dataTaskWithRequest:urlRequest
                                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                       if(error){
                                                           callback(NO,@{@"message":[error userInfo][@"NSLocalizedDescription"]});
                                                           return;
                                                       }
                                                       
                                                       NSMutableDictionary *responsDic = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error]];
                                                    
                                                       if (responsDic.isValid && [responsDic[kSTATUS] isValid]) {
                                                           callback([responsDic[kSTATUS] boolValue], responsDic);

                                                       }else{
                                                           callback(NO, nil);
                                                       }
                                                       
                                                   }];
    [task resume];
}

-(void)cancelAllServices{
    [UIApplication sharedApplication].networkActivityIndicatorVisible =NO;
        [self.dataTask cancel];
        [[self session] finishTasksAndInvalidate];
}
@end
