//
//  AfisareProduseViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 01/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AfisareProduseViewController.h"
#import <Parse/Parse.h>
@interface AfisareProduseViewController ()

@end

@implementation AfisareProduseViewController

- (instancetype)initWithTitle:(NSString *) Titlu andObjectId:(NSString *) idObject{
    self = [super init];
    
    self.title = Titlu;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Produse"];
    //NSLog(@"%@",idObject);
    /*
    [query whereKey:@"CategoriiID" equalTo:idObject];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //????
         /*   _transfObjects = [NSMutableArray arrayWithArray:objects];
            [_mainTableView reloadData];*/
            /* // The find succeeded.
             NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
             // Do something with the found objects
             for (PFObject *object in objects) {
             NSLog(@"%@", object.objectId);
             NSLog(@"%@" , object[@"Titlu"]);
             }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];*/
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
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
