//
//  SettingsViewController.h
//  iOS Lab2
//
//  Created by Jimmie Määttä on 2019-02-16.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingsViewController;

@protocol SettingsViewControllerDelegate <NSObject>

- (void)settingsViewController:(SettingsViewController *)settingsViewController
                      username:(NSString *)username
                         email:(NSString *)email
                       picture:(UIImage *)picture;

@end

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, assign) id <SettingsViewControllerDelegate> delegate;

@property (strong) NSString *username;
@property (strong) NSString *email;
@property (strong) UIImage *picture;
@property (strong) UIImage *chosenPicture;

@property (weak, nonatomic) IBOutlet UIView *profilePictureBorder;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;

@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;

@property (weak, nonatomic) IBOutlet UIButton *buttonSaveSettings;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;

- (IBAction)onFromGalleryPressed:(id)sender;
- (IBAction)onTakePhotoPressed:(id)sender;

- (IBAction)onSaveSettingsPressed:(id)sender;
- (IBAction)onCancelPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
