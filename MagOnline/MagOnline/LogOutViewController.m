//
//  LogOutViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 29/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "LogOutViewController.h"
#import "SubCategorii.h"
#import "LogIn.h"

@interface LogOutViewController ()

@property(strong,nonatomic)SubCategorii *userState;
@property(strong, nonatomic)UIButton *bLogOut;

@end

@implementation LogOutViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor grayColor];
    [super viewDidLoad];
    self.title = @"Log Out";
    _userState = [SubCategorii sharedSingleton];
    if(_userState.Satre == NO) [self.navigationController pushViewController:[[LogIn alloc]init] animated:YES];
    else{
        _bLogOut = [[UIButton alloc] initWithFrame: CGRectMake(50, self.view.frame.size.height/2 - 50, self.view.frame.size.width-100, 50)];
        _bLogOut.backgroundColor = [UIColor blueColor];
        [_bLogOut setTitle:@"Log Out"forState:UIControlStateNormal];
        [self.view addSubview: _bLogOut];
        [_bLogOut addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];
        //_userState.Satre = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)click {
    if(_userState.Satre == NO) [self.navigationController pushViewController:[[LogIn alloc]init] animated:YES];
    else{
        _userState.Satre = NO;
        [self.navigationController pushViewController:[[LogIn alloc]init] animated:YES]; //va trebui modifacat
    }
}

@end
