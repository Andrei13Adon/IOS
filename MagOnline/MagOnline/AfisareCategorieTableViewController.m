//
//  AfisareCategorieTableViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 18/03/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AfisareCategorieTableViewController.h"
#import <Parse/Parse.h>
#import "SubCategorii.h"
@interface AfisareCategorieTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong , nonatomic)UITableView *mainTableView;

@property (nonatomic , assign)NSInteger idCategorie;

//@property (strong , nonatomic)SubCategorii *subCategorie1;

@property (nonatomic , strong)NSMutableArray *transfObjects;

@end

@implementation AfisareCategorieTableViewController

- (instancetype) initWithTitle:(NSString *)Titlu andidCategorie:(NSInteger) IdCategorie{
    self = [super init];
    /*** test cu sucees
    SubCategorii *asd=[SubCategorii sharedSingleton]; //;=[[SubCategorii alloc] init];
    NSLog(@"%@",asd.numeSubcategorie);
     */
    if(self){
        self.title = Titlu;
        _idCategorie = IdCategorie;
        _transfObjects = [[NSMutableArray alloc] init];
        
        /*//test
        _subCategorie1 = [[SubCategorii alloc]initWitNumeCatehorie:@"Test1" andVithId:10 ];*/
  //      _transfObjects = [[NSArray alloc] init];
        //return parse
        PFQuery *query = [PFQuery queryWithClassName:@"Categorii"];
        [query whereKey:@"Tip" equalTo:[NSNumber numberWithInteger:_idCategorie]];//aici a fost modifiact
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
        
    }
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
    cell.textLabel.text = [_transfObjects[indexPath.row] objectForKey:@"Titlu"];
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
    lista = [[AfisareProduseViewController alloc]initWithTitle:[_transfObjects[indexPath.row] objectForKey:@"Titlu"] andObjectId: [[_transfObjects objectAtIndex:indexPath.row] objectId] ];
    [self.navigationController pushViewController:lista animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
