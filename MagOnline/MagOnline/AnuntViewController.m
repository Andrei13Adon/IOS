//
//  AnuntViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 17/03/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AnuntViewController.h"

@interface AnuntViewController ()

@property (strong,nonatomic) UIButton *but1;
@property (strong,nonatomic) UIButton *but2;
@property (strong,nonatomic) UIButton *but3;
@property (strong,nonatomic) UIButton *but4;
@property (strong,nonatomic) UIButton *but5;
@property (strong,nonatomic) UIButton *but6;

@end

@implementation AnuntViewController

- (void)viewDidLoad {
   self.view.backgroundColor=[UIColor whiteColor];
    
    CGFloat butH = (self.view.frame.size.height - 20 - 44 - 49  - 120) / 3 ;
    CGFloat butW = (self.view.frame.size.width - 90) / 2;
    _but1 = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, butW, butH)];
    _but1.backgroundColor = [UIColor colorWithRed:0.906 green:0.298 blue:0.235 alpha:1];
    _but1.tag = 1;
    [_but1 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but1 setTitle:@"Software"forState:UIControlStateNormal];
    
    [self.view addSubview:_but1];
    
    
    
    _but2 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX (_but1.frame )+ 30, 30, butW , butH)];
    _but2.backgroundColor = [UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1];
    _but2.tag = 2;
    [_but2 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but2 setTitle:@"Calculatoare"forState:UIControlStateNormal];

    [self.view addSubview:_but2];
    
    _but3 = [[UIButton alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(_but1.frame ) + 30, butW , butH)];
    _but3.backgroundColor = [UIColor greenColor];
    _but3.tag = 3;
    [_but3 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but3 setTitle:@"Laptopuri"forState:UIControlStateNormal];

    [self.view addSubview:_but3];
    
    _but4 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX (_but3.frame )+ 30, CGRectGetMaxY(_but2.frame ) + 30 , butW , butH)];
    _but4.backgroundColor = [UIColor greenColor];
    _but4.tag = 4;
    [_but4 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but4 setTitle:@"Masini"forState:UIControlStateNormal];

    [self.view addSubview:_but4];
    
    _but5 = [[UIButton alloc] initWithFrame:CGRectMake( 30, CGRectGetMaxY(_but3.frame) + 30, butW , butH)];
    _but5.backgroundColor = [UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1];
    _but5.tag = 5;
    [_but5 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but5 setTitle:@"Electrocasnice"forState:UIControlStateNormal];

    [self.view addSubview:_but5];
    
    _but6 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX (_but5.frame )+ 30, CGRectGetMaxY(_but4.frame) + 30, butW , butH)];
    _but6.backgroundColor = [UIColor colorWithRed:0.906 green:0.298 blue:0.235 alpha:1];
    _but6.tag = 6;
    [_but6 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but6 setTitle:@"Mobilier"forState:UIControlStateNormal];

    [self.view addSubview:_but6];
}

- (void)butPressed:(UIButton *)sender{
    
    UIButton *senderButton = (UIButton *)sender;
    AfisareCategorieTableViewController *lista ;
    if(senderButton.tag == 1)
        lista = [[AfisareCategorieTableViewController alloc] initWithTitle:@"Software" andidCategorie:1 ];
    if(senderButton.tag == 2)
        lista = [[AfisareCategorieTableViewController alloc] initWithTitle:@"Software" andidCategorie:2 ];
    if(senderButton.tag == 3)
        lista = [[AfisareCategorieTableViewController alloc] initWithTitle:@"Software" andidCategorie:3 ];
    if(senderButton.tag == 4)
        lista = [[AfisareCategorieTableViewController alloc] initWithTitle:@"Software" andidCategorie:4 ];
    if(senderButton.tag == 5)
        lista = [[AfisareCategorieTableViewController alloc] initWithTitle:@"Software" andidCategorie:5 ];
    if(senderButton.tag == 6)
        lista = [[AfisareCategorieTableViewController alloc] initWithTitle:@"Software" andidCategorie:6 ];
    
    
    [self.navigationController pushViewController:lista animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
