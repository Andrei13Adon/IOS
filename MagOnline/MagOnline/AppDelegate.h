//
//  AppDelegate.h
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 17/03/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnuntViewController.h"
#import "AdaugViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

//variables global
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AnuntViewController *anuntViewController;
@property (strong, nonatomic) AdaugViewController *adaugViewController;


//variables local
@property (strong, nonatomic) UITabBarController *tabBarController;

@end

