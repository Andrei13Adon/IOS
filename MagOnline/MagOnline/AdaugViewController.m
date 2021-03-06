//
//  CumparaPrloduViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 08/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AdaugViewController.h"
#import <Parse/Parse.h>
#import "SubCategorii.h"

@interface AdaugViewController ()<UITextFieldDelegate>

@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idCategorieObiectCurent;

@property (strong , nonatomic)UILabel *lNume,*lPrenume,*lAdresa,*lMail,*lTelefon,*lDescriere,*lTitlu,*lPret;

@property (nonatomic, strong)UITextField *tfNume,*tfPrenume,*tfAdresa,*tfMail,*tfTelefon,*tfDescriere,*tfTitlu,*tfPret;

@property (strong,nonatomic) SubCategorii *userState;

@end

@implementation AdaugViewController

- (instancetype)initWithTitle:(NSString *) Titlu andObjectId:(NSString *) idObject{

    self = [super init];
    if(self){
        self = [super init];
        NSMutableString *temp = [NSMutableString stringWithString: @"Produsul in categoria "];
        [temp appendString:Titlu];
        [self setTitle:temp];
        _idCategorieObiectCurent = idObject;
    }
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
    
    _lPrenume = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 2, textW, 20)];
    _lPrenume.textColor = [UIColor whiteColor];
    _lPrenume.text = @"Introduceti prenume:";
    [self.view addSubview:_lPrenume];
    
    _tfPrenume = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 3, textW, 20)];
    _tfPrenume.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfPrenume];
    _tfPrenume.delegate =self;
    
    _lTelefon = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 4, textW, 20)];
    _lTelefon.textColor = [UIColor whiteColor];
    _lTelefon.text = @"Introduceti telefonul:";
    [self.view addSubview:_lTelefon];
    
    _tfTelefon = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 5, textW, 20)];
    _tfTelefon.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfTelefon];
    _tfTelefon.delegate =self;
    
    _lMail = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 6, textW, 20)];
    _lMail.textColor = [UIColor whiteColor];
    _lMail.text = @"Introduceti mailul:";
    [self.view addSubview:_lMail];
    
    _tfMail = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 7, textW, 20)];
    _tfMail.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfMail];
    _tfMail.delegate =self;
    
    _lAdresa = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 8, textW, 20)];
    _lAdresa.textColor = [UIColor whiteColor];
    _lAdresa.text = @"Introduceti adresa:";
    [self.view addSubview:_lAdresa];
    
    _tfAdresa = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 9, textW, 20)];
    _tfAdresa.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfAdresa];
    _tfAdresa.delegate =self;
    
    _lTitlu = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 10, textW, 20)];
    _lTitlu.textColor = [UIColor whiteColor];
    _lTitlu.text = @"Introduceti titlul produsului:";
    [self.view addSubview:_lTitlu];
    
    _tfTitlu = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 11, textW, 20)];
    _tfTitlu.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfTitlu];
    _tfTitlu.delegate =self;

    
    _lDescriere = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 12, textW, 20)];
    _lDescriere.textColor = [UIColor whiteColor];
    _lDescriere.text = @"Introduceti descriere produs:";
    [self.view addSubview:_lDescriere];
    
    _tfDescriere = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 13, textW, 40)];
    _tfDescriere.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfDescriere];
    _tfDescriere.delegate =self;
    
    _lPret = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 15, textW, 20)];
    _lPret.textColor = [UIColor whiteColor];
    _lPret.text = @"Introduceti pret produs:";
    [self.view addSubview:_lPret];
    
    _tfPret = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 16, textW, 20)];
    _tfPret.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfPret];
    _tfPret.delegate =self;
    
    if(_userState.Satre == YES){
        _tfNume.text = _userState.nume;
        _tfPrenume.text = _userState.prenume;
        _tfTelefon.text = _userState.numarTelefon;
        _tfAdresa.text = _userState.adresa;
        _tfMail.text = _userState.mail;
    }
    
    UIButton *ConfirmaCumparareaBut = [[UIButton alloc] initWithFrame: CGRectMake(50, self.view.frame.size.height- 20 - 44 - 49 -50 -50, self.view.frame.size.width -100, 50)];
    ConfirmaCumparareaBut.backgroundColor = [UIColor blueColor];
    [ConfirmaCumparareaBut setTitle:@"Adauga produs nou"forState:UIControlStateNormal];
    [self.view addSubview: ConfirmaCumparareaBut];
    [ConfirmaCumparareaBut addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];

    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)click {
    PFObject *newRow = [PFObject objectWithClassName:@"Produse"];
    newRow[@"NumeCreator"] = _tfNume.text;
    newRow[@"PrenumeCreator"] = _tfPrenume.text;
    newRow[@"NumarTelefonCreator"] = _tfTelefon.text;
    newRow[@"MailCreator"] = _tfMail.text;
    newRow[@"AdresaCreator"] = _tfAdresa.text;
    if([_tfTitlu.text  isEqual: @""]) newRow[@"Titlu"] = @"Fara titlu";
    else newRow[@"Titlu"] = _tfTitlu.text;
    newRow[@"CategoriiID"] = _idCategorieObiectCurent;
    newRow[@"Disponibil"] = @YES;
    newRow[@"Descriere"] = _tfDescriere.text;
    if([_tfPret.text  isEqual: @""]) newRow[@"Pret"] = @"0";
    else newRow[@"Pret"] = _tfPret.text;
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
