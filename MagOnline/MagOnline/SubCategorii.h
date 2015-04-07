//
//  SubCategorii.h
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 31/03/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubCategorii : NSObject

@property (nonatomic , assign) NSString *numeSubcategorie;
@property (nonatomic , assign) NSInteger idSubcategorie;

-(id) initWitNumeCatehorie:(NSString *)str andVithId: (NSInteger) idObj;

@end
