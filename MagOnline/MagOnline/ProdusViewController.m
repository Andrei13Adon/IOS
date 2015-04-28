//
//  ProdusViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 07/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ProdusViewController.h"
#import <Parse/Parse.h>
@interface ProdusViewController ()

@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idObiectCurent;

@property (strong , nonatomic)UILabel *Descriere,*Pret,*titluProdus,*NumeVanzator,*Telefon,*Mail,*Adresa;

@property (strong , nonatomic)UIImageView *imageView;

@end

@implementation ProdusViewController

-(instancetype)initWithTitle:(NSString *) Titlu andIdObject:(NSString *) idObject{
    self = [super init];
    
    if(self)
    {
        self.title = Titlu;
        _idObiectCurent = idObject;
        PFQuery *query = [PFQuery queryWithClassName:@"Produse"];
        //NSLog(@"%@",idObject);
        _transfObjects = nil;
        [query getObjectInBackgroundWithId:_idObiectCurent block:^(PFObject *someTxt, NSError *error) {
            if (!error) {
                _transfObjects = someTxt;
                if(_Descriere)
                {
                    NSMutableString *temp;
                    _titluProdus.text = Titlu;
                    
                    
                    
                    temp =[[NSMutableString alloc]initWithString:@"Pret:"];
                    [temp appendString:_transfObjects[@"Pret"]];
                    _Pret.text = temp;
                    
                    _Descriere.text = _transfObjects[@"Descriere"];
                    _Descriere.numberOfLines = 0;
                    [_Descriere sizeToFit];
                    
                    temp =[[NSMutableString alloc]initWithString:@"Nume Vanzator:"];
                    [temp appendString:_transfObjects[@"NumeCreator"]];
                    [temp appendString:@" "];
                    [temp appendString:_transfObjects[@"PrenumeCreator"]];
                    _NumeVanzator.text = temp;
                    
                    temp =[[NSMutableString alloc]initWithString:@"Telefon Vanzator:"];
                    [temp appendString:_transfObjects[@"NumarTelefonCreator"]];
                    _Telefon.text = temp;
                    
                    temp =[[NSMutableString alloc]initWithString:@"MailCreator Vanzator:"];
                    [temp appendString:_transfObjects[@"NumeCreator"]];
                    _Mail.text = temp;
                    
                    temp =[[NSMutableString alloc]initWithString:@"Adresa Vanzator:"];
                    [temp appendString:_transfObjects[@"AdresaCreator"]];
                    _Adresa.text = temp;
                    _Adresa.numberOfLines = 0;
                    [_Adresa sizeToFit];
                    
                    temp =[[NSMutableString alloc]initWithString:@"Descriere:\n"];
                    [temp appendString:_transfObjects[@"Descriere"] ];
                    
                    _Descriere.text = temp;
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
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    //imagine de afisat
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder.jpg"]];
    _imageView.frame  = CGRectMake(20, 0, self.view.frame.size.width - 200, self.view.frame.size.width -200);
    
    _titluProdus = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 200 + 20, 0, 200 - 20, 20)];
    _Pret = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 200 + 20, 20, 200 -20, 20)];
    
    _Descriere = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-20, self.view.frame.size.height- 20 - 44 - 49 -50 - 50 - 200 - 100)];
    
    CGFloat plecare = self.view.frame.size.height- 20 - 44 - 49 - 200;
    _NumeVanzator = [[UILabel alloc] initWithFrame:CGRectMake(20, plecare, self.view.frame.size.width-40, 20)];
    _Telefon = [[UILabel alloc] initWithFrame:CGRectMake(20, plecare +20, self.view.frame.size.width-40, 20)];
    _Mail = [[UILabel alloc] initWithFrame:CGRectMake(20, plecare+40, self.view.frame.size.width-40, 20)];
    _Adresa = [[UILabel alloc] initWithFrame:CGRectMake(20, plecare+60, self.view.frame.size.width-40, 40)];
    
    if(_transfObjects)
    {
        
    }
    else
    {
        _Descriere.text =  @"!test text!";
    }
    _titluProdus.textColor = [UIColor whiteColor];
    _NumeVanzator.textColor = [UIColor whiteColor];
    _Telefon.textColor = [UIColor whiteColor];
    _Mail.textColor = [UIColor whiteColor];
    _Adresa.textColor = [UIColor whiteColor];
    _Descriere.textColor = [UIColor whiteColor];
    _Pret.textColor = [UIColor whiteColor];
    [self.view addSubview:_titluProdus];
    [self.view addSubview:_Descriere];
    [self.view addSubview:_Pret];
    [self.view addSubview:_NumeVanzator];
    [self.view addSubview:_Telefon];
    [self.view addSubview:_Mail];
    [self.view addSubview:_Adresa];
    [self.view addSubview:_imageView];
    
    
    UIButton *burSeeComents = [[UIButton alloc] initWithFrame: CGRectMake(0, self.view.frame.size.height- 20 - 44 - 49 -50-50, self.view.frame.size.width, 50)];
    burSeeComents.backgroundColor = [UIColor greenColor];
    [burSeeComents setTitle:@"Vizualizeaza Comentariile"forState:UIControlStateNormal];
    [self.view addSubview: burSeeComents];
    [burSeeComents addTarget:self action:@selector(click2) forControlEvents: UIControlEventTouchUpInside];
    
    UIButton *CumparaProdusBut = [[UIButton alloc] initWithFrame: CGRectMake(0, self.view.frame.size.height- 20 - 44 - 49 -50, self.view.frame.size.width, 50)];
    CumparaProdusBut.backgroundColor = [UIColor blueColor];
    [CumparaProdusBut setTitle:@"Cumpara Produs"forState:UIControlStateNormal];
     [self.view addSubview: CumparaProdusBut];
     [CumparaProdusBut addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];
}

- (void)click {
     /*  // self.view.backgroundColor = [UIColor greenColor];
        if (self.view.backgroundColor == [UIColor redColor])
            self.view.backgroundColor = [UIColor greenColor];
        else
            self.view.backgroundColor = [UIColor redColor]; */
    [self.navigationController pushViewController:[[CumparaPrloduViewController alloc]initWintTiTle:self.title andProdusID:_idObiectCurent] animated:YES];
    }

- (void)click2 {
   // [self.navigationController pushViewController:[[ComentsViewController alloc] init] animated:YES];
    [self.navigationController pushViewController:[[ComentsViewController alloc]initWithTitle:self.title  andObjectId:_idObiectCurent] animated:YES];
}

@end
