//
//  AddComentViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 28/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AddComentViewController.h"
#import <Parse/Parse.h>
#import "SubCategorii.h"

@interface AddComentViewController ()<UITextFieldDelegate>

@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idObiectCurent;

@property (strong , nonatomic)UILabel *lNume,*lComentariu;

@property (nonatomic, strong)UITextField *tfNume,*tfComentariu;

@property (strong,nonatomic) SubCategorii *userState;


@end

@implementation AddComentViewController

- (instancetype) initWintTiTle:(NSString *) Titlu andProdusID:(NSString *) IDProdus{
    self = [super init];
    NSMutableString *temp = [NSMutableString stringWithString: @"Adaug Comentariu la "];
    [temp appendString:Titlu];
    self.title = temp;
    _idObiectCurent = IDProdus;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _userState = [SubCategorii sharedSingleton];
    self.view.backgroundColor = [UIColor grayColor];
    CGFloat TextH = self.view.frame.size.height - 20 - 44 - 49;
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
    if(_userState.Satre == YES)
        _tfNume.text = _userState.userName;
    
    _lComentariu = [[UILabel alloc] initWithFrame:CGRectMake(20, startingPoint + 20 * 3, textW, 20)];
    _lComentariu.textColor = [UIColor whiteColor];
    _lComentariu.text = @"Introduceti Cometariul:";
    [self.view addSubview:_lComentariu];
    
    _tfComentariu = [[UITextField alloc] initWithFrame:CGRectMake(20, startingPoint+20 * 4, textW, 40)];
    _tfComentariu.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tfComentariu];
    _tfComentariu.delegate =self;
    
    UIButton *ConfirmaCumparareaBut = [[UIButton alloc] initWithFrame: CGRectMake(50, self.view.frame.size.height- 20 - 44 - 49 -50 - 50, self.view.frame.size.width -100, 50)];
    ConfirmaCumparareaBut.backgroundColor = [UIColor blueColor];
    [ConfirmaCumparareaBut setTitle:@"Adauga Comentariul"forState:UIControlStateNormal];
    [self.view addSubview: ConfirmaCumparareaBut];
    [ConfirmaCumparareaBut addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];
    
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)click {
    PFObject *confirmare = [PFObject objectWithClassName:@"Coments"];
    confirmare[@"Autor"] = _tfNume.text;
    if( [_tfComentariu.text  isEqual: @""]) confirmare[@"Comentariu"] = @"<Fara comentariu>";
    else confirmare[@"Comentariu"] = _tfComentariu.text;
    confirmare[@"IdProdusTata"] = _idObiectCurent;
    [confirmare saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self.navigationController pushViewController:[[ConfirmareMesajViewController alloc]initWithTitle:self.title andIdObject:@"ceva"  andMessageRezult:  @"Comentariul a fost adaugat cu succes!"] animated:YES];
            
        }else{
            [self.navigationController pushViewController:[[ConfirmareMesajViewController alloc]initWithTitle:self.title andIdObject:@"ceva"  andMessageRezult:  @"Ne cerem scuze comentariul nu a putut fi adaugat."] animated:YES]; 
        }
    }];
    
}

@end

