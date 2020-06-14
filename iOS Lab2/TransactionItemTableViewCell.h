//
//  TransactionItemTableViewCell.h
//  iOS Lab2
//
//  Created by JImmie Määttä on 2019-02-15.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransactionItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface TransactionItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelCategory;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;

-(void)configureWithTransactionItem:(TransactionItem *)transactionItem;

@end

NS_ASSUME_NONNULL_END
