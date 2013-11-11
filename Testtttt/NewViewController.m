//
//  NewViewController.m
//  Testtttt
//
//  Created by Rogers on 2013/11/8.
//  Copyright (c) 2013年 Fontech. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController


@synthesize show = _show;
@synthesize name = _name;

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.show.text= self.name;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressButtonConfirm:(id)sender {
    
    [self.delegate passItemBack:self didFinishWithItem:self.show.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)pressButtonFacebook:(id)sender{

    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook] )
    {
        SLComposeViewController *facebook = [[SLComposeViewController alloc] init];
        facebook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebook setInitialText:[NSString stringWithFormat:@"Trial"]];
        [self presentViewController:facebook animated:YES completion:nil];
        
        [facebook setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            NSString *output;
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    output = @"action cancelled";
                    break;
                case SLComposeViewControllerResultDone:
                    output = @"action succeeded";
                    break;
                default:
                    break;
            }
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil,nil];
            [alert show];
        }];
    }


}

@end
