//
//  ConfirmareMesajViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 21/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ConfirmareMesajViewController.h"

@interface ConfirmareMesajViewController ()

@end

@implementation ConfirmareMesajViewController

-(instancetype)initWithTitle:(NSString *) Titlu andIdObject:(NSString *) idObject andMessageRezult: (NSString *) rezultatMesaj{
    self = [super init];
   
    if(self)
    {
        self.title = Titlu;
      /*  _idObiectCurent = idObject;
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
                 }
                //NSLog(@"%@", _transfObjects[@"Titlu"]);
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];*/
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
