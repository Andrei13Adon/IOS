//
//  AppDelegate.m
//  MagOnline
//
//  Created by LaboratoriOS Cronian Academy on 17/03/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "SubCategorii.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"57Qk9v8jwoiNIA5by8OgddD2G63ZJuXMvlC5kkyO"
                  clientKey:@"axg42v24f3aZM4wNY1JHWNdgEWT6UHRai9Mt1yrf"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    //************?????????????**************
    
    [SubCategorii sharedSingleton]; // init and aloc global 
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self initializeTabBarController];
    
    [_window setRootViewController:_tabBarController];
    [_window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

- (void) initializeTabBarController{
    _tabBarController = [[UITabBarController alloc] init];
    [_tabBarController setViewControllers:[self configTabBarMeniu]];
    [_tabBarController.tabBar setTranslucent:NO];
    [[UINavigationBar appearance] setTranslucent:NO];
}

- (NSArray *) configTabBarMeniu{
    
    //aici declari Controalele din ce vor fi pelate de pe TabBar
    //1
    _anuntViewController = [[AnuntViewController alloc] init];
    _anuntViewController.title = @"Anunturi";
    //2
    _logInViewController = [[LogIn alloc] init];
    _logInViewController.title = @"Log In";
    //3
    _adaugViewController = [[AdaugaProduseTipButoaneView alloc] init];
    _adaugViewController.title = @"Adaugari";
    
    //aici redeclari cintrorele dar de tip nacigationBar
    //1
    UINavigationController *anuntViewNavigation  = [[UINavigationController alloc] initWithRootViewController:_anuntViewController];
    //2
    UINavigationController *logInViewNavigation  = [[UINavigationController alloc] initWithRootViewController: _logInViewController];
    //3
    UINavigationController *adaugViewNavigation  = [[UINavigationController alloc] initWithRootViewController:_adaugViewController];
    
    return @[anuntViewNavigation , logInViewNavigation, adaugViewNavigation ];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
