//
//  CumparaPrloduViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 08/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AdaugViewController.h"
#import <Parse/Parse.h>

@interface AdaugViewController ()<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idObiectCurent;

@property (strong , nonatomic)UILabel *lNume,*lPrenume,*lAdresa,*lMail,*lTelefon,*lDescriere,*lCategorie,*lTitlu;

@property (nonatomic, strong)UITextField *tfNume,*tfPrenume,*tfAdresa,*tfMail,*tfTelefon,*tfDescriere,*tfCategorie,*tfTitlu;

@property(nonatomic, strong)  UIPickerView *myPickerView;
@property(nonatomic, strong) NSArray *pickerArray;


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
    
    _lPrenume = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 2, textW, 20)];
    _lPrenume.textColor = [UIColor whiteColor];
    _lPrenume.text = @"Introduceti prenume:";
    [self.view addSubview:_lPrenume];
    
    _tfPrenume = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 3, textW, 20)];
    _tfPrenume.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfPrenume];
    _tfPrenume.delegate =self;
    
    _lTelefon = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 4, textW, 20)];
    _lTelefon.textColor = [UIColor whiteColor];
    _lTelefon.text = @"Introduceti telefonul:";
    [self.view addSubview:_lTelefon];
    
    _tfTelefon = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 5, textW, 20)];
    _tfTelefon.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfTelefon];
    _tfTelefon.delegate =self;
    
    _lMail = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 6, textW, 20)];
    _lMail.textColor = [UIColor whiteColor];
    _lMail.text = @"Introduceti mailul:";
    [self.view addSubview:_lMail];
    
    _tfMail = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 7, textW, 20)];
    _tfMail.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfMail];
    _tfMail.delegate =self;
    
    _lAdresa = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 8, textW, 20)];
    _lAdresa.textColor = [UIColor whiteColor];
    _lAdresa.text = @"Introduceti adresa:";
    [self.view addSubview:_lAdresa];
    
    _tfAdresa = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 9, textW, 20)];
    _tfAdresa.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfAdresa];
    _tfAdresa.delegate =self;
    
    _lTitlu = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 10, textW, 20)];
    _lTitlu.textColor = [UIColor whiteColor];
    _lTitlu.text = @"Introduceti titlul produsului:";
    [self.view addSubview:_lTitlu];
    
    _tfTitlu = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 11, textW, 20)];
    _tfTitlu.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfTitlu];
    _tfTitlu.delegate =self;

    
    _lDescriere = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 14, textW, 20)];
    _lDescriere.textColor = [UIColor whiteColor];
    _lDescriere.text = @"Introduceti descriere produs:";
    [self.view addSubview:_lDescriere];
    
    _tfDescriere = [[UITextField alloc] initWithFrame:CGRectMake(0, startingPoint+20 * 15, textW, 20)];
    _tfDescriere.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfDescriere];
    _tfDescriere.delegate =self;
    
    
    _lCategorie = [[UILabel alloc] initWithFrame:CGRectMake(0, startingPoint + 20 * 12, textW, 20)];
    _lCategorie.textColor = [UIColor whiteColor];
    _lCategorie.text = @"Selectati categorie produs:";
    [self.view addSubview:_lCategorie];
    
    //*************************
    
    _tfCategorie =[[UITextField alloc] initWithFrame: CGRectMake(0, startingPoint + 20 * 13, self.view.frame.size.width, 20)];
    _tfCategorie.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfCategorie];
    _tfCategorie.delegate =self;
    [self addPickerView];

     //*************************
    
    UIButton *ConfirmaCumparareaBut = [[UIButton alloc] initWithFrame: CGRectMake(0, self.view.frame.size.height- 20 - 44 - 49 -50, self.view.frame.size.width, 50)];
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
    /*  // self.view.backgroundColor = [UIColor greenColor];
     if (self.view.backgroundColor == [UIColor redColor])
     self.view.backgroundColor = [UIColor greenColor];
     else
     self.view.backgroundColor = [UIColor redColor]; */
    PFObject *newRow = [PFObject objectWithClassName:@"Produse"];
    newRow[@"NumeCreator"] = _tfNume.text;
    newRow[@"PrenumeCreator"] = _tfPrenume.text;
    newRow[@"NumarTelefonCreator"] = _tfTelefon.text;
    newRow[@"MailCreator"] = _tfMail.text;
    newRow[@"AdresaCreator"] = _tfAdresa.text;
    newRow[@"Titlu"] = _tfTitlu.text;
    newRow[@"CategoriiID"] = @"FShZlLwd1V"; //trebuie modificat implicit linux
    newRow[@"Disponibil"] = @YES;
    ///****descriere
    ///newRow[@"Descriere"] = _tfDescriere.text;
   //**de modificat sus
    NSLog(@"test %@", _tfDescriere.text);
    NSString *Tipul = _tfDescriere.text;
    NSLog(@"test %@", _tfDescriere.text);
    PFQuery *query = [PFQuery queryWithClassName:@"Categorii"];
    [query whereKey:@"Titlu" equalTo:Tipul];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"%@", objects);
        if (!error) {
            //????
            NSMutableArray *transfObjects = [NSMutableArray arrayWithArray:objects];
            NSString *objectId = [[transfObjects objectAtIndex:0] objectId];
            NSLog(@"%@", objects);
            NSLog(@"%@", objectId);
            /* // The find succeeded.
             NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
             // Do something with the found objects
             for (PFObject *object in objects) {
             NSLog(@"%@", object.objectId);
             NSLog(@"%@" , object[@"Titlu"]);
             }*/
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    /*
    ///***
    [newRow saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self.navigationController pushViewController:[[ConfirmareMesajViewController alloc]initWithTitle:_tfTitlu.text andIdObject:@"ceva"  andMessageRezult:  @"Produsul a fost adugat cu succes"] animated:YES];
        } else {
            [self.navigationController pushViewController:[[ConfirmareMesajViewController alloc]initWithTitle:_tfTitlu.text andIdObject:@"ceva"  andMessageRezult:  @"Produsul  nu a putut fi adugat"] animated:YES];
        }
    }];*/
    
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

-(void)addPickerView{
    _pickerArray = [[NSArray alloc]initWithObjects:@"Chess",@"Linux",
                   @"Cricket",@"Football",@"Tennis",@"Volleyball", nil];
    _myPickerView = [[UIPickerView alloc]init];
    _myPickerView.dataSource = self;
    _myPickerView.delegate = self;
    _myPickerView.showsSelectionIndicator = YES;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(done)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-50, 320, 50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];
    _tfCategorie.inputView = _myPickerView;
    _tfCategorie.inputAccessoryView = toolBar;
    
}

#pragma mark - Text field delegates

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:@""]) {
        //[self dateChanged:nil];
    }
}
#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [_pickerArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    [_tfCategorie setText:[_pickerArray objectAtIndex:row]];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    return [_pickerArray objectAtIndex:row];
}

-(void) done{
    [_myPickerView removeFromSuperview];
    [self reloadInputViews];
}
@end
