//
//  GKFeedCell.m
//  GKZiffyDemo
//
//  Created by Gaurav Keshre on 6/28/15.
//  Copyright (c) 2015 Gaurav Keshre. All rights reserved.
//

#import "GKFeedCell.h"
#import "DYRateView.h"
static NSInteger TEMP;
@interface GKFeedCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgPreview;

@property (weak, nonatomic) IBOutlet UITextView *txtAddress;

@property (weak, nonatomic) IBOutlet UILabel *lblPriceSummary;
@property (weak, nonatomic) IBOutlet UILabel *lblDistance;

@property (weak, nonatomic) IBOutlet DYRateView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *lblBusinessName;

- (IBAction)handleBookNowAction:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *lblBusinessType; //type

@end

@implementation GKFeedCell

-(void)awakeFromNib{
    [super awakeFromNib];
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowRadius = 22.f;
    self.layer.cornerRadius = 4.f;
    
}

- (void) setData:(id)data{
    
    NSString *str = [NSString stringWithFormat:@"img0%li", (TEMP%4)+1];
    
    [self.imgPreview setImage:[UIImage imageNamed:str]];
    //[self.contentView sendSubviewToBack:self.imgPreview];
    /*
     * Type
     */
    
    [self.lblBusinessType setText:data[@"type"]];
    
    /*
     * TextView
     */
    [self.txtAddress setText:data[@"address"]];
    
    CGRect fr = self.txtAddress.frame;
    CGSize size = [self.txtAddress sizeThatFits:CGSizeMake(fr.size.width, FLT_MAX)];
    if (size.height > fr.size.height) {
        fr.size.width += 30.f;
        self.txtAddress.frame = fr;
    }

    /*
     * Rating
     */
    CGFloat rate = [data[@"rating"] floatValue];
    [self.ratingView setRate:rate];
    
    TEMP++;
}
- (IBAction)handleBookNowAction:(id)sender {
}
@end
