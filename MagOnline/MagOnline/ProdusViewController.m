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

@property (strong , nonatomic)UILabel *Descriere;

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
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    _Descriere = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height- 20 - 44 - 49 -50 - 50)];
    if(_transfObjects)
    {
        _Descriere.text = _transfObjects[@"Descriere"];
        _Descriere.numberOfLines = 0;
        [_Descriere sizeToFit];
    }
    else
    {
        _Descriere.text =  @"!test text!";
    }
    _Descriere.textColor = [UIColor whiteColor];
    [self.view addSubview:_Descriere];
    
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
