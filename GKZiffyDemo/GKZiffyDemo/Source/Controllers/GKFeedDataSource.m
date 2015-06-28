//
//  GKFeedDataSource.m
//  GKZiffyDemo
//
//  Created by Gaurav Keshre on 6/28/15.
//  Copyright (c) 2015 Gaurav Keshre. All rights reserved.
//

#import "GKFeedDataSource.h"
#import "GKFeedCell.h"
@interface GKFeedDataSource()
    @property (weak, nonatomic)NSArray *feedArray;
    @property (weak, nonatomic)UICollectionViewController
*controller;
@end
@implementation GKFeedDataSource

-(instancetype)initWithCollectionView:(UICollectionViewController *)cvc{
    self = [super init];
    if (self) {
        self.controller = cvc;
    }
    return self;
}

#pragma mark -  Methods
-(void)reloadWithData:(NSArray *)arr{
    self.feedArray = arr;
    [self.controller.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource Methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.feedArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GKFeedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GKFeedCell" forIndexPath:indexPath];
    [cell setData:self.feedArray[indexPath.row]];
    return cell;
}

@end
