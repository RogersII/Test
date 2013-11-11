//
//  ViewController.m
//  Testtttt
//
//  Created by Rogers on 2013/11/6.
//  Copyright (c) 2013年 Fontech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end



@implementation ViewController

@synthesize buttonSave = _buttonSave, buttonAlert = _buttonAlert,buttonBack = _buttonBack,name = _name,email = _email,phone = _phone,textName = _textName,textEmail = _textEmail,textPhone = _textPhone,textview = _textview,labelTry = _labelTry, check = _check;


#pragma view life cycles

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.textName.delegate = self;
    self.textPhone.delegate = self;
    self.textEmail.delegate = self;
    
    if(self.check != nil){
        
        self.textview.text = self.check;
        
	}
}
- (void)didReceiveMemoryWarning // Right now nothing special
{
    [super didReceiveMemoryWarning];
   
}

#pragma button actions

- (IBAction)pressButtonSave:(id)sender {
    
    NewViewController *new = [self.storyboard instantiateViewControllerWithIdentifier:@"NewViewController"];
    
    new.name = [NSString stringWithFormat:@"Hello My name is %@ and below is my phone and email:%@, %@", self.textName.text, self.textPhone.text,self.textEmail.text];
    
    
    new.delegate = self; // important!!!
    
    [self presentViewController:new animated:YES completion:Nil];
    
}


- (IBAction)pressButtonAlert:(id)sender{
    
    UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"Sure you wanna save?" message:@"haha" delegate:nil cancelButtonTitle:@"Sure" otherButtonTitles:nil, nil];
        
        [alertView show];
}



- (IBAction)pressButtonBack:(id)sender
{
    NSLog(@"hihihi");
    [self.textName resignFirstResponder];
    [self.textEmail resignFirstResponder];
    [self.textPhone resignFirstResponder];
}

#pragma other functions

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"I'm Sure"])
    {
        if(![self validateEmail:self.textEmail.text])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Enter a valid email address." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
        self.textview.text = [NSString stringWithFormat:@"Hello My name is %@ and below is my phone and email:%@, %@", self.textName.text, self.textPhone.text,self.textEmail.text];
    }
    else if([title isEqualToString:@"Cancel"]) {
        self.labelTry.text = @"Then try again Bitch!!";
    }
}


- (BOOL) validateEmail: (NSString *) candidate {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

-(void) passItemBack:(NewViewController *)controller didFinishWithItem:(NSString *)item;
{
    self.textview.text = item;
}




@end
