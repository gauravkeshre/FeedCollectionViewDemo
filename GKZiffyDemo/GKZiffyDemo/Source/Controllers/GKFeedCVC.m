//
//  GKFeedCVC.m
//  GKZiffyDemo
//
//  Created by Gaurav Keshre on 6/28/15.
//  Copyright (c) 2015 Gaurav Keshre. All rights reserved.
//

#import "GKFeedCVC.h"
#import "GKAPIManager.h"
#import "GKFeedDataSource.h"
#import "GKFeedFlowLayout.h"
@interface GKFeedCVC()<UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic)NSDictionary *feedData;
@property (strong, nonatomic)GKFeedDataSource *dataSource;
@end

@implementation GKFeedCVC
#pragma mark - Lifecycle Methods

-(void)viewDidLoad{
    
    GKFeedCVC *__weak _weakSelf = self;
    _dataSource = [[GKFeedDataSource alloc]initWithCollectionView:self];
    self.collectionView.dataSource = self.dataSource;
    
    [GKAPIManager getlocalDataWithCallback:^(BOOL success, id result) {
        if (success) {
            _weakSelf.feedData =[NSDictionary dictionaryWithDictionary:result];
            
            [_weakSelf.dataSource reloadWithData:_weakSelf.feedData[@"results"]];
        }
    }];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#define maxColumns  2
#define maxWidth 300.f

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
        [self.collectionView.collectionViewLayout invalidateLayout];
}
#pragma mark - UICollectionViewDelegateFlowLayout Methods

//-(CGSize)collectionView:(UICollectionView *)collectionView
//                 layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    GKFeedFlowLayout * layout = (GKFeedFlowLayout *)self.collectionView.collectionViewLayout;
//    CGFloat cWidth = self.collectionView.frame.size.width;
//    NSUInteger columnCount = MIN(floor(cWidth/maxWidth), maxColumns);
//    CGFloat padding = ((columnCount + 1) * layout.sectionInset.left);
//    CGFloat cmaxWidth = cWidth - padding;
//    CGFloat finalWidth = floorf((cWidth - padding)/columnCount) ;
//    
//    CGFloat calcWidth = MIN(cmaxWidth,finalWidth) ;
//    
////    [layout setItemSize:CGSizeMake(calcWidth, 114390/calcWidth)];
//    
//
//    return CGSizeMake(calcWidth, 320);
//}
//
#pragma mark - collectionViewDelegate Methods



@end
