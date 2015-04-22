//
//  CumparaPrloduViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 08/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AdaugViewController.h"
#import <Parse/Parse.h>

@interface AdaugViewController ()<UITextFieldDelegate>

@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idObiectCurent;

@property (strong , nonatomic)UILabel *lNume,*lPrenume,*lAdresa,*lMail,*lTelefon,*lDescriere,*lCategorie;

@property (nonatomic, strong)UITextField *tfNume,*tfPrenume,*tfAdresa,*tfMail,*tfTelefon,*tfDescriere;

@property (nonatomic, strong)UIButton *butCategorie;

@end

@implementation AdaugViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    //  CGFloat TextH = self.view.frame.size.height - 20 - 44 - 49  -50 ;
    CGFloat textW = self.view.frame.size.width;
    ///??????
    int startingPoint = 0;
    _lNume = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint, textW, 20)];
    _lNume.textColor = [UIColor whiteColor];
    _lNume.text = @"Introduceti numele:";
    [self.view addSubview:_lNume];
    
    _tfNume = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20, textW, 20)];
    _tfNume.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfNume];
    _tfNume.delegate =self;
    
    _lPrenume = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 3, textW, 20)];
    _lPrenume.textColor = [UIColor whiteColor];
    _lPrenume.text = @"Introduceti prenume:";
    [self.view addSubview:_lPrenume];
    
    _tfPrenume = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 4, textW, 20)];
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
    
    _lMail = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 9, textW, 20)];
    _lMail.textColor = [UIColor whiteColor];
    _lMail.text = @"Introduceti mailul:";
    [self.view addSubview:_lMail];
    
    _tfMail = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 10, textW, 20)];
    _tfMail.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfMail];
    _tfMail.delegate =self;
    
    _lAdresa = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 12, textW, 20)];
    _lAdresa.textColor = [UIColor whiteColor];
    _lAdresa.text = @"Introduceti adresa:";
    [self.view addSubview:_lAdresa];
    
    _tfAdresa = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 13, textW, 20)];
    _tfAdresa.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfAdresa];
    _tfAdresa.delegate =self;
    
    _lDescriere = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 15, textW, 20)];
    _lDescriere.textColor = [UIColor whiteColor];
    _lDescriere.text = @"Introduceti descriere produs:";
    [self.view addSubview:_lDescriere];
    
    _tfDescriere = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 16, textW, 20*2)];
    _tfDescriere.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfDescriere];
    _tfDescriere.delegate =self;
    
    _lCategorie = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 19, textW, 20)];
    _lCategorie.textColor = [UIColor whiteColor];
    _lCategorie.text = @"Selectati categorie produs:";
    [self.view addSubview:_lCategorie];
    
    _butCategorie =[[UIButton alloc] initWithFrame: CGRectMake(0, startingPoint + 20 * 20, self.view.frame.size.width, 50)];
   
    _butCategorie.backgroundColor = [UIColor redColor];
    [_butCategorie setTitle:@"Ar trebui sa fie categoria aici"forState:UIControlStateNormal];
    [self.view addSubview: _butCategorie];
    [_butCategorie addTarget:self action:Nil forControlEvents: UIControlEventTouchUpInside];
    

    
    
    UIButton *ConfirmaCumparareaBut = [[UIButton alloc] initWithFrame: CGRectMake(0, self.view.frame.size.height- 20 - 44 - 49 -50, self.view.frame.size.width, 50)];
    ConfirmaCumparareaBut.backgroundColor = [UIColor blueColor];
    [ConfirmaCumparareaBut setTitle:@"Confirma Cumpararea"forState:UIControlStateNormal];
    [self.view addSubview: ConfirmaCumparareaBut];
    [ConfirmaCumparareaBut addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];

    
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)click {
    /*  // self.view.backgroundColor = [UIColor greenColor];
     if (self.view.backgroundColor == [UIColor redColor])
     self.view.backgroundColor = [UIColor greenColor];
     else
     self.view.backgroundColor = [UIColor redColor]; *//*
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
