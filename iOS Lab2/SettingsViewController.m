//
//  SettingsViewController.m
//  iOS Lab2
//
//  Created by Jimmie Määttä on 2019-02-16.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.username isEqualToString:@""]) {
        self.textFieldUsername.placeholder = @"Username";
    } else {
        self.textFieldUsername.text = self.username;
    }
    
    if ([self.email isEqualToString:@""]) {
        self.textFieldEmail.placeholder = @"E-mail";
    } else {
        [self.textFieldEmail.text = self.email lowercaseString];
    }
    
    if (self.picture == nil) {
        [self.profilePicture setImage:[UIImage imageNamed:@"not_working"]];
        [self.profilePicture setContentMode:UIViewContentModeScaleAspectFill];
    } else {
        [self.profilePicture setImage: self.picture];
        [self.profilePicture setContentMode:UIViewContentModeScaleAspectFill];
    }
}

- (IBAction)onSaveSettingsPressed:(id)sender {
    if ([self.textFieldUsername.text isEqualToString: @""]) {
        [self showIncorrentInputAlert];
    } else {
        [self.delegate settingsViewController:self
                                     username:self.textFieldUsername.text
                                        email:self.textFieldEmail.text
                                      picture:self.chosenPicture];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)onCancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)showIncorrentInputAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Settings Error" message:@"You need to enter your 'Username' to Save your Settings!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)onFromGalleryPressed:(id)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Device Error" message:@"Your device does not seem to have a gallery!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (IBAction)onTakePhotoPressed:(id)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Device Error" message:@"Your device does not seem to have a camera!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.chosenPicture = info[UIImagePickerControllerEditedImage];
    [self.profilePicture setImage: self.chosenPicture];
    [self.profilePicture setContentMode:UIViewContentModeScaleAspectFill];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated {
    self.profilePictureBorder.layer.cornerRadius = 64;
    self.profilePicture.layer.cornerRadius = 60;
    self.profilePicture.clipsToBounds = YES;
    
    self.buttonCancel.layer.cornerRadius = 6;
    self.buttonSaveSettings.layer.cornerRadius = 6;
}

@end
