//
//  ViewController.m
//  iOS Lab2
//
//  Created by JImmie Määttä on 2019-02-14.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "ViewController.h"
#import "ItemsTableViewController.h"
#import "LatestItemTableViewCell.h"
#import "TransactionItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Lab2 - iOS/Obj-C"];
    
    if ([self loadUserData]) {
        [self saveUserData];
    }
    if ([self loadItemsData]) {
        [self saveItemsData];
    }
    [self.user.transactionItems sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [[obj2 date] compare: [obj1 date]];
    }];
    [self initLatestTransactions];
}

-(void)saveUserData {
    NSDictionary *userData = [self.user dictFromUser];
    [[NSUserDefaults standardUserDefaults] setObject:userData forKey:@"userDataKey"];
    NSLog(@"Settings Saved");
}

-(BOOL)loadUserData {
    NSDictionary *savedUserData = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"userDataKey"];
    self.user = [User new];
    
    if (savedUserData) {
        self.user = [self.user initWithDict: savedUserData];
        self.labelUsername.text = self.user.username;
        NSLog(@"User Loaded");
        return NO;
    } else {
        self.user.username = @"";
        self.user.email = @"";
        self.user.picture = [NSData dataWithData:UIImagePNGRepresentation([UIImage imageNamed:@"blank_profile"])];;
        self.labelUsername.text = self.user.username;
        NSLog(@"User set to default");
        return YES;
    }
}

-(void)saveItemsData {
    NSMutableArray *itemDict = [NSMutableArray new];
    
    for (TransactionItem *item in self.user.transactionItems) {
        NSDictionary *itemData = [item dictFromTransactionItem];
        [itemDict addObject: itemData];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:itemDict forKey:@"itemsDataKey"];
    NSLog(@"Items Saved");
}

-(BOOL)loadItemsData {
    NSArray *savedItems = [[NSUserDefaults standardUserDefaults] arrayForKey:@"itemsDataKey"];
    self.user.transactionItems = [NSMutableArray new];
    
    if (savedItems) {
        for (NSDictionary *itemData in savedItems) {
            TransactionItem *item = [[TransactionItem alloc] initWithDict:itemData];
            [self.user.transactionItems addObject: item];
        }
        NSLog(@"Items Loaded");
        return NO;
    }
    else {
        [self initItems];
        NSLog(@"Items Initiated");
        return YES;
    }
}

-(void)initItems {
    if (self.user.transactionItems != nil) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.locale = [NSLocale currentLocale];
        [dateFormatter setDateFormat:@"dd MMM yyyy"];
        self.user.transactionItems = [NSMutableArray new];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"Ica"
                                                                         withCategory:@"Food"
                                                                           withAmount:@-690.45
                                                                             withDate:[dateFormatter dateFromString:@"03 Feb 2019"]]];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"Rent"
                                                                         withCategory:@"Home"
                                                                           withAmount:@-5122
                                                                             withDate:[dateFormatter dateFromString:@"28 Feb 2019"]]];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"Random Stuff"
                                                                         withCategory:@"Shpock"
                                                                           withAmount:@400
                                                                             withDate:[dateFormatter dateFromString:@"15 Feb 2019"]]];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"Gas"
                                                                         withCategory:@"Car"
                                                                           withAmount:@-500
                                                                             withDate:[dateFormatter dateFromString:@"03 Feb 2019"]]];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"TV"
                                                                         withCategory:@"Home"
                                                                           withAmount:@-6999
                                                                             withDate:[dateFormatter dateFromString:@"30 Jan 2019"]]];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"Ica"
                                                                         withCategory:@"Food"
                                                                           withAmount:@-753.60
                                                                             withDate:[dateFormatter dateFromString:@"18 Feb 2019"]]];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"SNES Classic Mini"
                                                                         withCategory:@"Entertainment"
                                                                           withAmount:@-500
                                                                             withDate:[dateFormatter dateFromString:@"24 Dec 2018"]]];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"Netflix"
                                                                         withCategory:@"Entertaintment"
                                                                           withAmount:@-109.00
                                                                             withDate:[dateFormatter dateFromString:@"28 Jan 2019"]]];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"Spotify"
                                                                         withCategory:@"Entertaintment"
                                                                           withAmount:@-99.00
                                                                             withDate:[dateFormatter dateFromString:@"28 Jan 2019"]]];
        
        [self.user.transactionItems addObject: [[TransactionItem alloc] initWithTitle:@"Work"
                                                                         withCategory:@"Salary"
                                                                           withAmount:@18279.93
                                                                             withDate:[dateFormatter dateFromString:@"25 Jan 2019"]]];
    }
}

-(void)initLatestTransactions {
    self.latestTransactions = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        [self.latestTransactions addObject: self.user.transactionItems[i]];
    }
}


#pragma DELEGATES

- (void)settingsViewController:(SettingsViewController *)settingsViewController
                      username:(NSString *)username
                         email:(NSString *)email
                       picture:(UIImage *)picture {
    self.user.username = username;
    self.user.email = email;
    self.user.picture = [NSData dataWithData:UIImagePNGRepresentation(picture)];
    self.labelUsername.text = self.user.username;
    [self saveUserData];
}

#pragma PREPARE VIEW

-(void)viewWillAppear:(BOOL)animated {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd MMM yyyy"];
    
    if (self.user.username == nil || [self.user.username isEqualToString: @""]) {
        self.labelUsername.text = @"New User";
    }
    
    self.labelDate.text = [[dateFormatter stringFromDate:[NSDate date]] uppercaseString];
    
    self.labelOverview.text = [self.labelOverview.text uppercaseString];
    self.labelIncomes.text = [self.labelIncomes.text uppercaseString];
    self.labelExpenses.text = [self.labelExpenses.text uppercaseString];
    self.labelSettings.text = [self.labelSettings.text uppercaseString];
    
    self.tableViewLatestTransactions.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableViewLatestTransactions.frame.size.width, 1)];
}


#pragma SEGUE

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"settingsSegue"]) {
        SettingsViewController *controller = (SettingsViewController *)segue.destinationViewController;
        controller.delegate = self;
        controller.username = self.user.username;
        controller.email = self.user.email;
        controller.picture = [UIImage imageWithData:self.user.picture];
        self.definesPresentationContext = YES;
        controller.view.backgroundColor = [UIColor clearColor];
        controller.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        
    } else if ([segue.identifier isEqualToString:@"overviewSegue"]) {
        ItemsTableViewController *controller = (ItemsTableViewController *)segue.destinationViewController;
        [controller setTitle:@"Overview"];
        controller.segueType = OverviewSegue;
        controller.transactionItems = self.user.transactionItems;
        
    } else if ([segue.identifier isEqualToString:@"incomesSegue"]) {
        ItemsTableViewController *controller = (ItemsTableViewController *)segue.destinationViewController;
        [controller setTitle:@"Incomes"];
        controller.segueType = IncomesSegue;
        controller.transactionItems = self.user.transactionItems;
        
    } else if ([segue.identifier isEqualToString:@"expensesSegue"]) {
        ItemsTableViewController *controller = (ItemsTableViewController *)segue.destinationViewController;
        [controller setTitle:@"Expenses"];
        controller.segueType = ExpensesSegue;
        controller.transactionItems = self.user.transactionItems;
        
    }
}


#pragma TABLEVIEW

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.latestTransactions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LatestItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"latestItemCell" forIndexPath:indexPath];
    
    TransactionItem *item = self.latestTransactions[indexPath.row];
    [cell configureWithTransactionItem:item];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
