//
//  ViewController.h
//  Testtttt
//
//  Created by Rogers on 2013/11/6.
//  Copyright (c) 2013年 Fontech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate, UIActionSheetDelegate, fontechNewViewControllerDelegate>


// Button itself
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonSave;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonAlert;
@property (weak, nonatomic) IBOutlet UIButton *buttonBack;

// Data from NewViewController
@property(weak, nonatomic) NSString *check;

// Already on screen
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *phone;

// Input section
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textPhone;

//Show on screen
@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (weak, nonatomic) IBOutlet UILabel *labelTry;

// Button action
- (IBAction)pressButtonSave:(id)sender;
- (IBAction)pressButtonAlert:(id)sender;
- (IBAction)pressButtonBack:(id)sender;



@end
