//
//  AfisareProduseViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 01/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AfisareProduseViewController.h"
#import <Parse/Parse.h>
@interface AfisareProduseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)NSMutableArray *transfObjects;

@property (nonatomic , assign)NSString *idCategorieTata;

@property (strong , nonatomic)UITableView *mainTableView;

@end

@implementation AfisareProduseViewController

- (instancetype)initWithTitle:(NSString *) Titlu andObjectId:(NSString *) idObject{
    self = [super init];
    
    self.title = Titlu;
    _idCategorieTata = idObject;
    _transfObjects = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Produse"];
    //NSLog(@"%@",idObject);
    
    [query whereKey:@"CategoriiID" equalTo:_idCategorieTata ];
    [query whereKey:@"Disponibil" equalTo:@YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //????
            _transfObjects = [NSMutableArray arrayWithArray:objects];
            [_mainTableView reloadData];
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
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _mainTableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_mainTableView];
    
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _transfObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if(_transfObjects.count > 0)
    {
        NSMutableString *temp = [NSMutableString stringWithString:[_transfObjects[indexPath.row] objectForKey:@"Titlu"]];
        [temp appendString:@" Pret:"];
        [temp appendString:[_transfObjects[indexPath.row] objectForKey:@"Pret"]];
        self.title = temp;
        cell.textLabel.text = temp;
        //cell.backgroundColor = [UIColor redColor];
    }
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //   NSLog(@"Am selectat celula de la indexpath %ld %@", (long)indexPath.row, [_transfObjects[indexPath.row] objectForKey:@"Titlu"]);
    AfisareProduseViewController *lista;
    /*
     //gasirea id-ului din parse la obiectul pe care apesi
     NSString *objectId = [[_transfObjects objectAtIndex:indexPath.row] objectId];
     NSLog(@"%@", objectId);
     */
    lista = [[ProdusViewController alloc] initWithTitle:[_transfObjects[indexPath.row] objectForKey:@"Titlu"] andIdObject:[[_transfObjects objectAtIndex:indexPath.row] objectId]];
    [self.navigationController pushViewController:lista animated:YES];
    
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
