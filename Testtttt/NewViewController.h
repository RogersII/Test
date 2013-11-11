//
//  NewViewController.h
//  Testtttt
//
//  Created by Rogers on 2013/11/8.
//  Copyright (c) 2013年 Fontech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>


@class NewViewController; // make the function below can pass object defined by NewViewController

@protocol fontechNewViewControllerDelegate // with the @end

-(void) passItemBack:(NewViewController *)controller didFinishWithItem:(NSString *)item;

@end

@interface NewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *show;

@property(strong,nonatomic) NSString *name;
@property (weak, nonatomic) IBOutlet UIButton *buttonConfirm;

@property (weak, nonatomic) IBOutlet UIButton *buttonFacebook;

@property (strong, nonatomic) id <fontechNewViewControllerDelegate> delegate;

- (IBAction)pressButtonConfirm:(id)sender;
- (IBAction)pressButtonFacebook:(id)sender;


@end
