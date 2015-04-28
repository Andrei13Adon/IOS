//
//  ContinutComentViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 28/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ContinutComentViewController.h"
#import <Parse/Parse.h>
@interface ContinutComentViewController ()

@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idObiectCurent;

@property (strong , nonatomic)UILabel *Autor, *Descriere;

@end

@implementation ContinutComentViewController

-(instancetype)initWithTitle:(NSString *) Titlu andIdObject:(NSString *) idObject{
    self = [super init];
    
    if(self)
    {
        self.title = Titlu;
        _idObiectCurent = idObject;
        PFQuery *query = [PFQuery queryWithClassName:@"Coments"];
        //NSLog(@"%@",idObject);
        _transfObjects = nil;
        [query getObjectInBackgroundWithId:_idObiectCurent block:^(PFObject *someTxt, NSError *error) {
            if (!error) {
                _transfObjects = someTxt;
                if(_Descriere)
                {
                    _Autor.text = _transfObjects[@"Autor"];
                    _Autor.numberOfLines = 0;
                    [_Autor sizeToFit];
                    
                    _Descriere.text = _transfObjects[@"Comentariu"];
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
    _Autor = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    _Descriere = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height- 20 - 44 - 49 -20 )];
    if(_transfObjects)
    {
        _Autor.text = _transfObjects[@"Autor"];
        _Autor.numberOfLines = 0;
        [_Autor sizeToFit];
        
        _Descriere.text = _transfObjects[@"Comentariu"];
        _Descriere.numberOfLines = 0;
        [_Descriere sizeToFit];

    }
    else
    {
        _Autor.text  =  @"!test text!";
        _Descriere.text =  @"!test text!";
    }
    _Autor.textColor = [UIColor redColor];
    [self.view addSubview:_Autor];
    
    _Descriere.textColor = [UIColor whiteColor];
    [self.view addSubview:_Descriere];
    
    
}

@end
