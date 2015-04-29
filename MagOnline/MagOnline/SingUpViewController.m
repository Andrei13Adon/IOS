//
//  SingUpViewController.m
//  MagOnline
//
//  Created by Laborator iOS Cronian Academy on 29/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "SingUpViewController.h"
#import <Parse/Parse.h>
#import "LogIn.h"

@interface SingUpViewController ()<UITextFieldDelegate>

@property (strong , nonatomic)UILabel *lnumeUtilizator,*lNume,*lPrenume,*lAdresa,*lMail,*lTelefon,*lPassword;

@property (nonatomic, strong)UITextField *tfnumeUtilizator,*tfNume,*tfPrenume,*tfAdresa,*tfMail,*tfTelefon,*tfPassword;

@end

@implementation SingUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Sing Up";
    self.view.backgroundColor = [UIColor blackColor];
    //  CGFloat TextH = self.view.frame.size.height - 20 - 44 - 49  -50 ;
    CGFloat textW = self.view.frame.size.width;
    ///??????
    int startingPoint = 0;
    
    _lnumeUtilizator = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint, textW, 20)];
    _lnumeUtilizator.textColor = [UIColor whiteColor];
    _lnumeUtilizator.text = @"Introduceti numele de utilizator:";
    [self.view addSubview:_lnumeUtilizator];
    
    _tfnumeUtilizator = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20, textW, 20)];
    _tfnumeUtilizator.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfnumeUtilizator];
    _tfnumeUtilizator.delegate =self;
    
    _lNume = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 2, textW, 20)];
    _lNume.textColor = [UIColor whiteColor];
    _lNume.text = @"Introduceti numele:";
    [self.view addSubview:_lNume];
    
    _tfNume = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 3, textW, 20)];
    _tfNume.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfNume];
    _tfNume.delegate =self;
    
    _lPrenume = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 4, textW, 20)];
    _lPrenume.textColor = [UIColor whiteColor];
    _lPrenume.text = @"Introduceti prenume:";
    [self.view addSubview:_lPrenume];
    
    _tfPrenume = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 5, textW, 20)];
    _tfPrenume.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfPrenume];
    _tfPrenume.delegate =self;
    
    _lTelefon = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 6, textW, 20)];
    _lTelefon.textColor = [UIColor whiteColor];
    _lTelefon.text = @"Introduceti telefonul:";
    [self.view addSubview:_lTelefon];
    
    _tfTelefon = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 7, textW, 20)];
    _tfTelefon.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfTelefon];
    _tfTelefon.delegate =self;
    
    _lMail = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 8, textW, 20)];
    _lMail.textColor = [UIColor whiteColor];
    _lMail.text = @"Introduceti mailul:";
    [self.view addSubview:_lMail];
    
    _tfMail = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 9, textW, 20)];
    _tfMail.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfMail];
    _tfMail.delegate =self;
    
    _lAdresa = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 10, textW, 20)];
    _lAdresa.textColor = [UIColor whiteColor];
    _lAdresa.text = @"Introduceti adresa:";
    [self.view addSubview:_lAdresa];
    
    _tfAdresa = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 11, textW, 20)];
    _tfAdresa.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfAdresa];
    _tfAdresa.delegate =self;
    
    _lPassword = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 13, textW, 20)];
    _lPassword.textColor = [UIColor whiteColor];
    _lPassword.text = @"Introduceti Parola:";
    [self.view addSubview:_lPassword];
    
    _tfPassword = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 14, textW, 20)];
    _tfPassword.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfPassword];
    _tfPassword.delegate =self;
    
    UIButton *ConfirmaCumparareaBut = [[UIButton alloc] initWithFrame: CGRectMake(0, self.view.frame.size.height- 20 - 44 - 49 -50, self.view.frame.size.width, 50)];
    ConfirmaCumparareaBut.backgroundColor = [UIColor blueColor];
    [ConfirmaCumparareaBut setTitle:@"Sing Up"forState:UIControlStateNormal];
    [self.view addSubview: ConfirmaCumparareaBut];
    [ConfirmaCumparareaBut addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];

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
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"Username" equalTo:_tfnumeUtilizator.text];
    //  _transfObjects = nil;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error && objects.count == 0) {
            PFObject *newRow = [PFObject objectWithClassName:@"User"];
            newRow[@"Username"] = _tfnumeUtilizator.text;
            newRow[@"Password"] = _tfPassword.text;
            newRow[@"Nume"] = _tfNume.text;
            newRow[@"Prenume"] = _tfPrenume.text;
            newRow[@"numarTelefon"] = _tfTelefon.text;
            newRow[@"Adresa"] = _tfMail.text;
            newRow[@"Mail"] = _tfAdresa.text;
            [newRow saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    [self.navigationController pushViewController:[[LogIn alloc] init] animated:YES];
                } else {
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    /****
    PFObject *newRow = [PFObject objectWithClassName:@"User"];
    newRow[@"NumeCreator"] = _tfNume.text;
    newRow[@"PrenumeCreator"] = _tfPrenume.text;
    newRow[@"NumarTelefonCreator"] = _tfTelefon.text;
    newRow[@"MailCreator"] = _tfMail.text;
    newRow[@"AdresaCreator"] = _tfAdresa.text;
    [newRow saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self.navigationController pushViewController:[[ConfirmareProdusNouViewController alloc]initWithTitle:_tfTitlu.text andIdObject:@"ceva"  andMessageRezult:  @"Produsul a fost adugat cu succes"] animated:YES];
        } else {
            [self.navigationController pushViewController:[[ConfirmareProdusNouViewController alloc]initWithTitle:_tfTitlu.text andIdObject:@"ceva"  andMessageRezult:  @"Produsul  nu a putut fi adugat"] animated:YES];
        }
    }];
    
    /*
     ///*******
     PFQuery *query = [PFQuery queryWithClassName:@"Produse"];
     //[query whereKey:@"Disponibil" equalTo:@YES];
     _transfObjects = nil;
     [query getObjectInBackgroundWithId:_idObiectCurent block:^(PFObject *someTxt, NSError *error) {
     if (!error && [someTxt[@"Disponibil"] isEqual:@YES]) {
     // NSLog(@"%@",someTxt[@"Disponibil"]);
     
     // Create a pointer to an object of class
     PFObject *confirmare = [PFObject objectWithoutDataWithClassName:@"Produse" objectId:_idObiectCurent];
     
     // Set a new value on quantity
     [confirmare setObject: _tfNume.text forKey:@"NumeCumparator"];
     [confirmare setObject: _tfPrenume.text forKey:@"PrenumeCumparator"];
     [confirmare setObject: _tfTelefon.text forKey:@"NumarTelefonCumparator"];
     [confirmare setObject: _tfMail.text forKey:@"MailCumparator"];
     [confirmare setObject: _tfAdresa.text forKey:@"AdresaCumparator"];
     [confirmare setObject: @NO forKey:@"Disponibil"];
     
     // Save
     [confirmare saveInBackground];
     
     
     NSString *temp = _tfAdresa.text;
     [self.navigationController pushViewController:[[ConfirmareMesajViewController alloc]initWithTitle:self.title andIdObject:@"ceva"  andMessageRezult:  @"Produsul a fost cumpart cu succes!"] animated:YES];
     
     }else{
     [self.navigationController pushViewController:[[ConfirmareMesajViewController alloc]initWithTitle:self.title andIdObject:@"ceva"  andMessageRezult:  @"Ne cerem scuze un alt utilizator a cumpart produsul deja."] animated:YES];
     }
     }];*/
    
}


@end
