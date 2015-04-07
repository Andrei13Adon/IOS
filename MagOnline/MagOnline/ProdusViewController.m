//
//  ProdusViewController.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 07/04/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ProdusViewController.h"

@interface ProdusViewController ()

@end

@implementation ProdusViewController

-(instancetype)initWithTitle:(NSString *) Titlu andIdObject:(NSString *) idObject{
    self = [super init];
    
    self.title = Titlu;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
