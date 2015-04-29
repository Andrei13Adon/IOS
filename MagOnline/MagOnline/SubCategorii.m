//
//  SubCategorii.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 31/03/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "SubCategorii.h"

@implementation SubCategorii

-(id) initWitNumeCatehorie:(NSString *)str andVithId: (NSInteger) idObj{
    self = [super init];
    if (self) {
        _numeSubcategorie = str;
        _idSubcategorie = idObj;
    }
    return self;
}

+ (SubCategorii *)sharedSingleton
{
    static SubCategorii *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[SubCategorii alloc] init];
        
        return sharedSingleton;
    }
}


@end
