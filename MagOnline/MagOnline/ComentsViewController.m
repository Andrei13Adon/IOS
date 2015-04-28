//
//  AfisareProduseViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 01/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ComentsViewController.h"
#import <Parse/Parse.h>
@interface ComentsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)NSMutableArray *transfObjects;

@property (nonatomic , assign)NSString *idCategorieTata;

@property (strong , nonatomic)UITableView *mainTableView;

@end

@implementation ComentsViewController

- (instancetype)initWithTitle:(NSString *) Titlu andObjectId:(NSString *) idObject{
    self = [super init];
    NSMutableString *temp = [NSMutableString stringWithString: @"Comentarii din "];
    [temp appendString:Titlu];
    self.title = temp;
    _idCategorieTata = idObject;
    _transfObjects = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Coments"];
    //NSLog(@"%@",idObject);
    
    [query whereKey:@"IdProdusTata" equalTo:_idCategorieTata ];
   // [query whereKey:@"Disponibil" equalTo:@YES];
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
             NSLog(@"%@" , object[@"Autor"]);
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
    _mainTableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 20 - 44 - 49 -50) style:UITableViewStylePlain];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_mainTableView];
    
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
    UIButton *addComent = [[UIButton alloc] initWithFrame: CGRectMake(0, self.view.frame.size.height- 20 - 44 - 49 -50, self.view.frame.size.width, 50)];
    addComent.backgroundColor = [UIColor blueColor];
    [addComent setTitle:@"Adauga comentariu nou"forState:UIControlStateNormal];
    [self.view addSubview: addComent];
    [addComent addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];
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
        cell.textLabel.text = [_transfObjects[indexPath.row] objectForKey:@"Comentariu"];
        //cell.backgroundColor = [UIColor redColor];
    }
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //   NSLog(@"Am selectat celula de la indexpath %ld %@", (long)indexPath.row, [_transfObjects[indexPath.row] objectForKey:@"Titlu"]);
    ComentsViewController *lista;
    /*
     //gasirea id-ului din parse la obiectul pe care apesi
     NSString *objectId = [[_transfObjects objectAtIndex:indexPath.row] objectId];
     NSLog(@"%@", objectId);
     */
    lista = [[ContinutComentViewController alloc] initWithTitle:self.title andIdObject:[[_transfObjects objectAtIndex:indexPath.row] objectId]];
    [self.navigationController pushViewController:lista animated:YES];
    
}

-(void) click{
    
    [self.navigationController pushViewController:[[AddComentViewController alloc] initWintTiTle: self.title andProdusID:_idCategorieTata] animated:YES];
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
