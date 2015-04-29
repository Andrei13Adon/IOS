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

@property (strong , nonatomic)UILabel *Descriere,*Username,*titluProdus,*NumeVanzator,*Telefon,*Mail,*Adresa;

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
        
        //***********//
        _Username = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/3, 80, 200 -20, 20)];
        

        CGFloat plecare = self.view.frame.size.height- 20 - 44 - 49 - 200;
        _NumeVanzator = [[UILabel alloc] initWithFrame:CGRectMake(20, plecare, self.view.frame.size.width-40, 20)];
        _Telefon = [[UILabel alloc] initWithFrame:CGRectMake(20, plecare +20, self.view.frame.size.width-40, 20)];
        _Mail = [[UILabel alloc] initWithFrame:CGRectMake(20, plecare+40, self.view.frame.size.width-40, 20)];
        _Adresa = [[UILabel alloc] initWithFrame:CGRectMake(20, plecare+60, self.view.frame.size.width-40, 40)];

        _NumeVanzator.textColor = [UIColor whiteColor];
        _Telefon.textColor = [UIColor whiteColor];
        _Mail.textColor = [UIColor whiteColor];
        _Adresa.textColor = [UIColor whiteColor];
        _Username.textColor = [UIColor whiteColor];
        
        [self.view addSubview:_Username];
        [self.view addSubview:_NumeVanzator];
        [self.view addSubview:_Telefon];
        [self.view addSubview:_Mail];
        [self.view addSubview:_Adresa];
        
        
        
        NSMutableString *temp;
        
        temp =[[NSMutableString alloc]initWithString:@"Username:"];
        [temp appendString:_userState.userName];
        _Username.text = temp;
        
        temp =[[NSMutableString alloc]initWithString:@"Nume:"];
        [temp appendString:_userState.nume];
        [temp appendString:@" "];
        [temp appendString:_userState.prenume];
        _NumeVanzator.text = temp;
        
        temp =[[NSMutableString alloc]initWithString:@"Telefon:"];
        [temp appendString:_userState.numarTelefon];
        _Telefon.text = temp;
        
        temp =[[NSMutableString alloc]initWithString:@"MailCreator:"];
        [temp appendString:_userState.mail];
        _Mail.text = temp;
        
        temp =[[NSMutableString alloc]initWithString:@"Adresa:"];
        [temp appendString:_userState.adresa];
        _Adresa.text = temp;
        _Adresa.numberOfLines = 0;
        [_Adresa sizeToFit];
        
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
