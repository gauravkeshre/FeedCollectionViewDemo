//
//  GKFeedDataSource.h
//  GKZiffyDemo
//
//  Created by Gaurav Keshre on 6/28/15.
//  Copyright (c) 2015 Gaurav Keshre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GKFeedDataSource : NSObject <UICollectionViewDataSource>
-(instancetype)initWithCollectionView:(UICollectionViewController *)cvc;

-(void)reloadWithData:(NSArray *)arr;
@end
