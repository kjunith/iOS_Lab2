//
//  ItemsTableViewController.m
//  iOS Lab2
//
//  Created by Jimmie Määttä on 2019-02-21.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "TransactionItemTableViewCell.h"
#import "ItemDetailsViewController.h"

@interface ItemsTableViewController ()

@end

@implementation ItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setVisibleItems];
    self.resultsFromSearch = [NSMutableArray new];
}

-(void)setVisibleItems {
    self.visibleItems = [NSMutableArray new];
    switch (self.segueType) {
        case OverviewSegue:
            self.visibleItems = self.transactionItems;
            break;
        case IncomesSegue:
            for (TransactionItem *item in self.transactionItems) {
                if ([item.amount intValue] > 0) {
                    [self.visibleItems addObject:item];
                }
            }
            break;
        case ExpensesSegue:
            for (TransactionItem *item in self.transactionItems) {
                if ([item.amount intValue] < 0) {
                    [self.visibleItems addObject:item];
                }
            }
            break;
        default:
            break;
    }
}

- (IBAction)onTextFieldChanged:(UITextField *)sender {
    [self.resultsFromSearch removeAllObjects];
    
    for (TransactionItem *item in self.visibleItems) {
        if ([item.title.lowercaseString containsString: sender.text.lowercaseString]) {
            [self.resultsFromSearch addObject: item];
        }
    }
    [self.tableView reloadData];
}

- (IBAction)onEnterPressed:(id)sender {
    [self resignFirstResponder];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.resultsFromSearch.count > 0) {
        return self.resultsFromSearch.count;
    }
    return self.visibleItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TransactionItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"transactionItemCell" forIndexPath:indexPath];
    
    TransactionItem *item = nil;
    if (self.resultsFromSearch.count > 0) {
        item = self.resultsFromSearch[indexPath.row];
    }
    else {
        item = self.visibleItems[indexPath.row];
    }
    
    [cell configureWithTransactionItem:item];
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ItemDetailsViewController *controller = (ItemDetailsViewController *)segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if (self.resultsFromSearch.count > 0) {
        controller.item = self.resultsFromSearch[indexPath.row];
    } else {
        controller.item = self.visibleItems[indexPath.row];
    }
}

@end
