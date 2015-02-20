//
//  ViewController.m
//  SeriesTime
//
//  Created by Jessica Cavazos on 10/21/14.
//  Copyright (c) 2014 JessicaCavazos. All rights reserved.
//

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    //Parse Quick Start
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    //End Parse

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//Facebook Button
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [FBLoginView class];
    //Facebook Quick Start
    FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.center = self.view.center;
    [self performSegueWithIdentifier: @"Login" sender: self];
    [self.view addSubview:loginView];
    //End Facebook
    

    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Login:(id)sender {
    //Parse Login
    [PFUser logInWithUsernameInBackground:_txtUsername.text password:_txtPsw.text
        block:^(PFUser *user, NSError *error) {
        if (user) {
            //Send to MainView
            [self performSegueWithIdentifier: @"Login" sender: self];
        } else {
            //Send Alert if Login Fails
            UIAlertView *alert = [[UIAlertView alloc]
                initWithTitle:@"Login Failed"
                message:@"Check username & password"
                delegate:nil
                cancelButtonTitle:@"OK"
                otherButtonTitles:nil];
            [alert show];
        }
        }];
    //End Parse
}

- (IBAction)Register:(id)sender {
    //Send to Register View
    [self performSegueWithIdentifier: @"Register" sender: self];
}
@end
