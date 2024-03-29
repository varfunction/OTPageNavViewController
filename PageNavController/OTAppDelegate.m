//
//  OTAppDelegate.m
//  PageNavController
//
//  Created by ocean tang on 14-7-14.
//  Copyright (c) 2014年 ocean tang. All rights reserved.
//

#import "OTAppDelegate.h"
#import "OTPageNavViewController.h"

@implementation OTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    OTPageNavViewController *vc = [[OTPageNavViewController alloc] init];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < 5; i++) {
        UIViewController *viewController = [[UIViewController alloc] init];
        switch (i) {
            case 0:
                viewController.view.backgroundColor = [UIColor redColor];
                break;
            case 1:
                viewController.view.backgroundColor = [UIColor yellowColor];
                break;
            case 2:
                viewController.view.backgroundColor = [UIColor blueColor];
                break;
            case 3:
                viewController.view.backgroundColor = [UIColor greenColor];
                break;
            case 4:
                viewController.view.backgroundColor = [UIColor cyanColor];
                break;
                
            default:
                viewController.view.backgroundColor = [UIColor blueColor];
                break;
        }
        
        [viewControllers addObject:viewController];
    }
    vc.viewControllers = [NSArray arrayWithArray:viewControllers];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
