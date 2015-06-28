//
//  GKAPIManager.m
//  GKZiffyDemo
//
//  Created by Gaurav Keshre on 6/27/15.
//  Copyright (c) 2015 Gaurav Keshre. All rights reserved.
//

#import "GKAPIManager.h"
#import "GKHTTPRequester.h"
@interface GKAPIManager ()
    @property (strong, nonatomic)GKHTTPRequester *requester;
@end

@implementation GKAPIManager
-(void)dealloc{
    _requester = nil;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _requester = [GKHTTPRequester new];
    }
    return self;
}


-(void)findAllBusinessesWithQuery:(NSString*)q
                       fromOffset:(NSInteger )offset
                           cityID:(NSString *)city
                         vertical:(NSString *)v
                     withCallback:(GKSuccessCallback)success_callback
                        onFailure:(GKFailureCallback)failure_callback{
    
    
    
}

#pragma mark - Public Methods

+(void)findAllBusinessesWithQuery:(NSString*)q
                       fromOffset:(NSInteger )offset
                           cityID:(NSString *)city
                         vertical:(NSString *)v
                     withCallback:(GKSuccessCallback)success_callback
                        onFailure:(GKFailureCallback)failure_callback{
    
}

#pragma mark - Temp Methods
+ (void) getlocalDataWithCallback:(GKSuccessCallback)success_callback{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sample_data_source" ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];

    NSDictionary *jsonDataArray = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];

    success_callback (YES, jsonDataArray);
}
@end
