//
//  CumparaPrloduViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 08/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "CumparaPrloduViewController.h"
#import <Parse/Parse.h>

@interface CumparaPrloduViewController ()

@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idObiectCurent;

@property (nonatomic, strong)UITextField *tfNume,*tfPrenume,*tfAdresa,*tfMail;

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
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat TextH = self.view.frame.size.height - 20 - 44 - 49  -50 ;
    CGFloat textW = self.view.frame.size.width;
    ///??????
    _tfNume = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, textW, 20)];
    [self.view addSubview:_tfNume];
    
}

@end
