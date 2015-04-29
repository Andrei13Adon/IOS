//
//  ConfirmareProdusNouViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 28/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ConfirmareProdusNouViewController.h"

#import <Parse/Parse.h>

@interface ConfirmareProdusNouViewController ()

@property (nonatomic , strong)NSString *idObiectCurent;

@property (strong , nonatomic)UILabel *jMesaj;

@property (strong , nonatomic)NSString *tempMesaj;

@end

@implementation ConfirmareProdusNouViewController

-(instancetype)initWithTitle:(NSString *) Titlu andIdObject:(NSString *) idObject andMessageRezult: (NSString *) rezultatMesaj{
    self = [super init];
    
    if(self)
    {
        self.title = Titlu;
        _idObiectCurent = idObject;
        _tempMesaj = rezultatMesaj;
        _jMesaj.text =_tempMesaj;
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    _jMesaj = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, self.view.frame.size.width-40, self.view.frame.size.height- 20 - 44 - 49 -50 -50)];
    _jMesaj.textColor = [UIColor whiteColor];
    [self.view addSubview:_jMesaj];
    _jMesaj.text =_tempMesaj;
    _jMesaj.numberOfLines = 0;
    [_jMesaj sizeToFit];
    
    
    UIButton *CumparaProdusBut = [[UIButton alloc] initWithFrame: CGRectMake(50, self.view.frame.size.height- 20 - 44 - 49 -50 - 50, self.view.frame.size.width - 100, 50)];
    CumparaProdusBut.backgroundColor = [UIColor blueColor];
    [CumparaProdusBut setTitle:@"Intoarcere in Adauga"forState:UIControlStateNormal];
    [self.view addSubview: CumparaProdusBut];
    [CumparaProdusBut addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];
    
}

- (void)click {
    [self.navigationController pushViewController:[[AdaugaProduseTipButoaneView alloc]init]animated:YES];
    
}

@end