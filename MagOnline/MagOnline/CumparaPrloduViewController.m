//
//  CumparaPrloduViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 08/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "CumparaPrloduViewController.h"
#import <Parse/Parse.h>
#import "SubCategorii.h"

@interface CumparaPrloduViewController ()<UITextFieldDelegate>

@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idObiectCurent;

@property (strong , nonatomic)UILabel *lNume,*lPrenume,*lAdresa,*lMail,*lTelefon;

@property (nonatomic, strong)UITextField *tfNume,*tfPrenume,*tfAdresa,*tfMail,*tfTelefon;

@property (strong,nonatomic) SubCategorii *userState;


@end

@implementation CumparaPrloduViewController

- (instancetype) initWintTiTle:(NSString *) Titlu andProdusID:(NSString *) IDProdus{
    self = [super init];
    NSMutableString *temp = [NSMutableString stringWithString: @"Cumpar "];
    [temp appendString:Titlu];
    self.title = temp;
    _idObiectCurent = IDProdus;
    PFQuery *query = [PFQuery queryWithClassName:@"Produse"];
    _transfObjects = nil;
    [query getObjectInBackgroundWithId:_idObiectCurent block:^(PFObject *someTxt, NSError *error) {
        if (!error) {
            _transfObjects = someTxt;
         /*   if(_Descriere)
            {
                _Descriere.text = _transfObjects[@"Descriere"];
                _Descriere.numberOfLines = 0;
                [_Descriere sizeToFit];
            }
            //????
            //   _transfObjects = [NSMutableArray arrayWithArray:objects];
            //    [_mainTableView reloadData];
            /* // The find succeeded.
             NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
             // Do something with the found objects
             for (PFObject *object in objects) {
             NSLog(@"%@", object.objectId);
             NSLog(@"%@" , object[@"Titlu"]);
             }*/
            //NSLog(@"%@", _transfObjects[@"Titlu"]);
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _userState = [SubCategorii sharedSingleton];
    self.view.backgroundColor = [UIColor grayColor];
  //  CGFloat TextH = self.view.frame.size.height - 20 - 44 - 49  -50 ;
    CGFloat textW = self.view.frame.size.width - 40;
    ///??????
    int startingPoint = 0;
    _lNume = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint, textW, 20)];
    _lNume.textColor = [UIColor whiteColor];
    _lNume.text = @"Introduceti numele:";
    [self.view addSubview:_lNume];
    
    _tfNume = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20, textW, 20)];
    _tfNume.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfNume];
    _tfNume.delegate =self;
    
    _lPrenume = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 3, textW, 20)];
    _lPrenume.textColor = [UIColor whiteColor];
    _lPrenume.text = @"Introduceti prenume:";
    [self.view addSubview:_lPrenume];
    
    _tfPrenume = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 4, textW, 20)];
    _tfPrenume.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfPrenume];
    _tfPrenume.delegate =self;
    
    _lTelefon = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 6, textW, 20)];
    _lTelefon.textColor = [UIColor whiteColor];
    _lTelefon.text = @"Introduceti telefonul:";
    [self.view addSubview:_lTelefon];
    
    _tfTelefon = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 7, textW, 20)];
    _tfTelefon.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfTelefon];
    _tfTelefon.delegate =self;
    
    _lMail = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 9, textW, 20)];
    _lMail.textColor = [UIColor whiteColor];
    _lMail.text = @"Introduceti mailul:";
    [self.view addSubview:_lMail];
    
    _tfMail = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 10, textW, 20)];
    _tfMail.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfMail];
    _tfMail.delegate =self;
    
    _lAdresa = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 12, textW, 20)];
    _lAdresa.textColor = [UIColor whiteColor];
    _lAdresa.text = @"Introduceti adresa:";
    [self.view addSubview:_lAdresa];
    
    _tfAdresa = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 13, textW, 20)];
    _tfAdresa.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfAdresa];
    _tfAdresa.delegate =self;
    
    if(_userState.Satre == YES){
        _tfNume.text = _userState.nume;
        _tfPrenume.text = _userState.prenume;
        _tfTelefon.text = _userState.numarTelefon;
        _tfAdresa.text = _userState.adresa;
        _tfMail.text = _userState.mail;
    }
    
    UIButton *ConfirmaCumparareaBut = [[UIButton alloc] initWithFrame: CGRectMake(50, self.view.frame.size.height- 20 - 44 - 49 -50 - 50, self.view.frame.size.width -100, 50)];
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
     self.view.backgroundColor = [UIColor redColor]; */
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
   }];
  
}

@end
