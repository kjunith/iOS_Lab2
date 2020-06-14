//
//  TransactionItemTableViewCell.m
//  iOS Lab2
//
//  Created by JImmie Määttä on 2019-02-15.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "TransactionItemTableViewCell.h"

@implementation TransactionItemTableViewCell

-(void)configureWithTransactionItem:(TransactionItem *)transactionItem {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd MMM"];
    
    NSNumberFormatter *numFormatter =[NSNumberFormatter new];
    numFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"se_SE"];
    numFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    
    self.labelTitle.text = transactionItem.title;
    self.labelAmount.text = [numFormatter stringFromNumber:transactionItem.amount];
    self.labelCategory.text = transactionItem.category;
    self.labelDate.text = [[dateFormatter stringFromDate:transactionItem.date] uppercaseString];
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
