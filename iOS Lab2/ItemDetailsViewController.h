//
//  ItemDetailsViewController.h
//  iOS Lab2
//
//  Created by Jimmie Määttä on 2019-02-20.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransactionItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemDetailsViewController : UIViewController

@property (strong) TransactionItem *item;

@property (weak, nonatomic) IBOutlet UILabel *labelHeader;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCategory;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAmount;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *buttonBack;

- (IBAction)onBackPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
