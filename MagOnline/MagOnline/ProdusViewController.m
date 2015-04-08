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

@property (nonatomic , assign)NSString *idObiectCurent;

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
        [query whereKey:@"CategoriiID" equalTo:_idObiectCurent];
        [query getObjectInBackgroundWithId:_idObiectCurent block:^(PFObject *someTxt, NSError *error) {
            if (!error) {
                _transfObjects = someTxt;
                if(_Descriere)
                {
                    _Descriere.text = _transfObjects[@"Descriere"];
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
    self.view.backgroundColor = [UIColor whiteColor];
    _Descriere = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    if(_transfObjects)
    {
        _Descriere.text = _transfObjects[@"Descriere"];
    }
    else
    {
        _Descriere.text =  @"!test text!";
    }
    
    [self.view addSubview:_Descriere];
    
    UIButton *buton1 = [[UIButton alloc] initWithFrame: CGRectMake(20, 30, 150, 50)];
    /*buton1.backgroundColor = [UIColor grayColor];
     [self.view addSubview: buton1];
     [buton1 addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];*/
    
}

@end
