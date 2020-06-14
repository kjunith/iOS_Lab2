//
//  ItemsTableViewController.h
//  iOS Lab2
//
//  Created by Jimmie Määttä on 2019-02-21.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailsViewController.h"

typedef enum {
    OverviewSegue,
    IncomesSegue,
    ExpensesSegue,
}SegueType;

NS_ASSUME_NONNULL_BEGIN

@interface ItemsTableViewController : UITableViewController

@property (assign) SegueType segueType;
@property (strong) NSMutableArray *visibleItems;
@property (strong) NSMutableArray *transactionItems;
@property (strong) NSMutableArray *resultsFromSearch;

@property (weak, nonatomic) IBOutlet UITextField *textFieldSearch;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItemAddNew;

- (IBAction)onTextFieldChanged:(UITextField *)sender;
- (IBAction)onEnterPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
