//
//  ItemDetailsViewController.m
//  iOS Lab2
//
//  Created by Jimmie Määttä on 2019-02-20.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "ItemDetailsViewController.h"

@interface ItemDetailsViewController ()

@end

@implementation ItemDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTextFeilds];
}

-(void)setTextFeilds {
    self.labelHeader.text = self.item.title;
    self.textFieldTitle.text = self.item.title;
    self.textFieldCategory.text = self.item.category;
    self.textFieldAmount.text = [self.item.amount stringValue];
    [self.datePicker setDate: self.item.date];
}

-(void)viewWillAppear:(BOOL)animated {
    self.buttonBack.layer.cornerRadius = 6;
}

- (IBAction)onBackPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
