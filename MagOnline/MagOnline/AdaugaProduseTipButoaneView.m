//
//  AdaugaProduseTipButoaneView.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 28/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AdaugaProduseTipButoaneView.h"

@interface AdaugaProduseTipButoaneView ()

@property (strong,nonatomic) UIButton *but1;
@property (strong,nonatomic) UIButton *but2;
@property (strong,nonatomic) UIButton *but3;
@property (strong,nonatomic) UIButton *but4;
@property (strong,nonatomic) UIButton *but5;
@property (strong,nonatomic) UIButton *but6;

@end

@implementation AdaugaProduseTipButoaneView

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor whiteColor];
    CGFloat butH = (self.view.frame.size.height - 20 - 44 - 49 ) / 6 ;
    CGFloat butW = self.view.frame.size.width;
    _but1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, butW, butH)];
    _but1.backgroundColor = [UIColor colorWithRed:0.906 green:0.298 blue:0.235 alpha:1];
    _but1.tag = 1;
    [_but1 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but1 setTitle:@"Software"forState:UIControlStateNormal];
    
    [self.view addSubview:_but1];
    
    
    
    _but2 = [[UIButton alloc] initWithFrame:CGRectMake(0, butH, butW , butH)];
    _but2.backgroundColor = [UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1];
    _but2.tag = 2;
    [_but2 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but2 setTitle:@"Calculatoare"forState:UIControlStateNormal];
    
    [self.view addSubview:_but2];
    
    _but3 = [[UIButton alloc] initWithFrame:CGRectMake(0, butH * 2, butW , butH)];
    _but3.backgroundColor = [UIColor greenColor];
    _but3.tag = 3;
    [_but3 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but3 setTitle:@"Laptopuri"forState:UIControlStateNormal];
    
    [self.view addSubview:_but3];
    
    _but4 = [[UIButton alloc] initWithFrame:CGRectMake(0, butH * 3, butW , butH)];
    _but4.backgroundColor = [UIColor greenColor];
    _but4.tag = 4;
    [_but4 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but4 setTitle:@"Masini"forState:UIControlStateNormal];
    
    [self.view addSubview:_but4];
    
    _but5 = [[UIButton alloc] initWithFrame:CGRectMake( 0, butH * 4, butW , butH)];
    _but5.backgroundColor = [UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1];
    _but5.tag = 5;
    [_but5 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but5 setTitle:@"Electrocasnice"forState:UIControlStateNormal];
    
    [self.view addSubview:_but5];
    
    _but6 = [[UIButton alloc] initWithFrame:CGRectMake(0, butH * 5, butW , butH)];
    _but6.backgroundColor = [UIColor colorWithRed:0.906 green:0.298 blue:0.235 alpha:1];
    _but6.tag = 6;
    [_but6 addTarget:self action:@selector(butPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_but6 setTitle:@"Mobilier"forState:UIControlStateNormal];
    
    [self.view addSubview:_but6];
}

- (void)butPressed:(UIButton *)sender{
    
    UIButton *senderButton = (UIButton *)sender;
    AdaugatCategorieViewController *lista ;
    NSString *adaugare = @"Selecatre categorie produs de adugat";
    if(senderButton.tag == 1)
        lista = [[AdaugatCategorieViewController alloc] initWithTitle:adaugare andidCategorie:1 ];
    if(senderButton.tag == 2)
        lista = [[AdaugatCategorieViewController alloc] initWithTitle:adaugare andidCategorie:2 ];
    if(senderButton.tag == 3)
        lista = [[AdaugatCategorieViewController alloc] initWithTitle:adaugare andidCategorie:3 ];
    if(senderButton.tag == 4)
        lista = [[AdaugatCategorieViewController alloc] initWithTitle:adaugare andidCategorie:4 ];
    if(senderButton.tag == 5)
        lista = [[AdaugatCategorieViewController alloc] initWithTitle:adaugare andidCategorie:5 ];
    if(senderButton.tag == 6)
        lista = [[AdaugatCategorieViewController alloc] initWithTitle:adaugare andidCategorie:6 ];
    
    
    [self.navigationController pushViewController:lista animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

