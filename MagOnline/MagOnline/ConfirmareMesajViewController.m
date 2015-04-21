//
//  ConfirmareMesajViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 21/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ConfirmareMesajViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
@interface ConfirmareMesajViewController ()

//@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idObiectCurent;

@property (strong , nonatomic)UILabel *jMesaj;

@end

@implementation ConfirmareMesajViewController

-(instancetype)initWithTitle:(NSString *) Titlu andIdObject:(NSString *) idObject andMessageRezult: (NSString *) rezultatMesaj{
    self = [super init];
   
    if(self)
    {
        self.title = Titlu;
        _idObiectCurent = idObject;
        _jMesaj.text = rezultatMesaj;
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    _jMesaj = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height- 20 - 44 - 49 -50)];
    _jMesaj.textColor = [UIColor whiteColor];
    [self.view addSubview:_jMesaj];
    
    UIButton *CumparaProdusBut = [[UIButton alloc] initWithFrame: CGRectMake(0, self.view.frame.size.height- 20 - 44 - 49 -50, self.view.frame.size.width, 50)];
    CumparaProdusBut.backgroundColor = [UIColor blueColor];
    [CumparaProdusBut setTitle:@"Intoarcere in Meniu"forState:UIControlStateNormal];
    [self.view addSubview: CumparaProdusBut];
    [CumparaProdusBut addTarget:self action:@selector(click) forControlEvents: UIControlEventTouchUpInside];
    
}

- (void)click {
   
}

@end