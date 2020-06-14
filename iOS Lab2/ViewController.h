//
//  ViewController.h
//  iOS Lab2
//
//  Created by JImmie Määttä on 2019-02-14.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
#import "ItemDetailsViewController.h"
#import "User.h"

@interface ViewController : UIViewController <SettingsViewControllerDelegate>

@property (strong) User *user;
@property (strong) NSMutableArray *latestTransactions;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewBackground;
@property (weak, nonatomic) IBOutlet UILabel *labelUsername;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;

@property (weak, nonatomic) IBOutlet UILabel *labelOverview;
@property (weak, nonatomic) IBOutlet UILabel *labelIncomes;
@property (weak, nonatomic) IBOutlet UILabel *labelExpenses;
@property (weak, nonatomic) IBOutlet UILabel *labelSettings;

@property (weak, nonatomic) IBOutlet UILabel *labelLatestTransactions;
@property (weak, nonatomic) IBOutlet UITableView *tableViewLatestTransactions;

@end

