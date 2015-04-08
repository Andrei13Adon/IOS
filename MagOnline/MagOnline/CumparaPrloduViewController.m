//
//  CumparaPrloduViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 08/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "CumparaPrloduViewController.h"

@interface CumparaPrloduViewController ()

@property (nonatomic , strong)PFObject *transfObjects;

@property (nonatomic , strong)NSString *idObiectCurent;

@end

@implementation CumparaPrloduViewController

- (instancetype) initWintTiTle:(NSString *) Titlu andProdusID:(NSString *) IDProdus{
    self = [super init];
    NSMutableString *temp = [NSMutableString stringWithString: @"Cumpar "];
    [temp appendString:Titlu];
    self.title = temp;
    
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

@end
