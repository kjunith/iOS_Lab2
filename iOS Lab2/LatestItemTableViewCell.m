//
//  LatestItemTableViewCell.m
//  iOS Lab2
//
//  Created by Jimmie Määttä on 2019-02-18.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "LatestItemTableViewCell.h"

@implementation LatestItemTableViewCell

-(void)configureWithTransactionItem:(TransactionItem *)transactionItem {
    NSNumberFormatter *numFormatter =[NSNumberFormatter new];
    numFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"se_SE"];
    numFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    
    self.labelTitle.text = transactionItem.title;
    self.labelAmount.text = [numFormatter stringFromNumber:transactionItem.amount];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
