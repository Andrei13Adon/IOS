//
//  SubCategorii.h
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 31/03/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubCategorii : NSObject

@property (nonatomic , strong) NSString *userId,*userName,*nume,*prenume,*numarTelefon,*adresa,*mail;
@property (nonatomic , assign) NSInteger idSubcategorie;
@property (nonatomic , assign) BOOL Satre;


+ (SubCategorii *)sharedSingleton;

@end
