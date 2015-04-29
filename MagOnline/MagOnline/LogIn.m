//
//  LogIn.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 29/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "LogIn.h"
#import "SubCategorii.h"
#import "LogOutViewController.h"
#import "SingUpViewController.h"
#import <Parse/Parse.h>

@interface LogIn ()<UITextFieldDelegate>

@property (strong,nonatomic) UILabel *lUsername, *lPassword;
@property (strong,nonatomic) UITextField *tfUsername, *tfPassword;
@property (strong,nonatomic) UIButton *bLogIn, *bSingIn;
@property (strong,nonatomic) SubCategorii *userState;

@end

@implementation LogIn

- (void)viewDidLoad {
    [super viewDidLoad];
    _userState =[SubCategorii sharedSingleton];
    if(_userState.Satre == YES) [self.navigationController pushViewController:[[LogOutViewController alloc]init] animated:YES];
    else{
    CGFloat startingPoint = (self.view.frame.size.height/8) - 40;
    
    CGFloat textW = self.view.frame.size.width - 40;
    
    self.view.backgroundColor = [UIColor grayColor];
        
    _lUsername = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint, textW, 20)];
    _lUsername.textColor = [UIColor whiteColor];
    _lUsername.text = @"Introduceti numele:";
    [self.view addSubview:_lUsername];
    
    _tfUsername = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20, textW, 20)];
    _tfUsername.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfUsername];
    _tfUsername.delegate =self;
    
    _lPassword = [[UILabel alloc] initWithFrame:CGRectMake(20, 3 *startingPoint, textW, 20)];
    _lPassword.textColor = [UIColor whiteColor];
    _lPassword.text = @"Introduceti numele:";
    [self.view addSubview:_lPassword];
    
    _tfPassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 3 * startingPoint+20, textW, 20)];
    _tfPassword.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfPassword];
    _tfPassword.delegate =self;
    
    _bLogIn = [[UIButton alloc] initWithFrame: CGRectMake(50, self.view.frame.size.height- 20 - 44 - 49 -50  - 150, self.view.frame.size.width - 100, 50)];
    _bLogIn.backgroundColor = [UIColor blueColor];
    [_bLogIn setTitle:@"Log In "forState:UIControlStateNormal];
    [self.view addSubview: _bLogIn];
    [_bLogIn addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];
    
    _bSingIn = [[UIButton alloc] initWithFrame: CGRectMake(50, self.view.frame.size.height- 20 - 44 - 49 -50 - 50, self.view.frame.size.width - 100, 50)];
    _bSingIn.backgroundColor = [UIColor greenColor];
    [_bSingIn setTitle:@"Sing Up"forState:UIControlStateNormal];
    [self.view addSubview: _bSingIn];
    [_bSingIn addTarget:self action:@selector(click2) forControlEvents: UIControlEventTouchUpInside];
    
}

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)click {
    if(_userState.Satre == YES) [self.navigationController pushViewController:[[LogOutViewController alloc]init] animated:YES];
    else{
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"Username" equalTo:_tfUsername.text];
    [query whereKey:@"Password" equalTo:_tfPassword.text];
  //  _transfObjects = nil;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error && objects.count == 1) {
            //NSLog(@"%@", @"Yap");
            NSMutableArray *transfObjects;
            transfObjects = [NSMutableArray arrayWithArray:objects];
             // The find succeeded.
            //NSLog(@"%@",[transfObjects objectAtIndex:0][@"Username"]);
            //informati user
            _userState.Satre = YES;
            _userState.userId = [[transfObjects objectAtIndex:0] objectId];
            _userState.userName = [transfObjects objectAtIndex:0][@"Username"];
            _userState.nume = [transfObjects objectAtIndex:0][@"Nume"];
            _userState.prenume = [transfObjects objectAtIndex:0][@"Prenume"];
            _userState.numarTelefon = [transfObjects objectAtIndex:0][@"numarTelefon"];
            _userState.adresa = [transfObjects objectAtIndex:0][@"Adresa"];
            _userState.mail = [transfObjects objectAtIndex:0][@"Mail"];
            [self.navigationController pushViewController:[[LogOutViewController alloc]init] animated:YES];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    }
}

- (void)click2 {
    if(_userState.Satre == YES) [self.navigationController pushViewController:[[LogOutViewController alloc]init] animated:YES];
    else{
        [self.navigationController pushViewController:[[SingUpViewController alloc]init] animated:YES]; //va trebui modifacat
    }
}
@end
