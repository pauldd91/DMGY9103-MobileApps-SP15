//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Paul Dariye on 2/16/15.
//  Copyright (c) 2015 Pearl-Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRHypnosisView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create first frame
//    CGRect firstFrame = CGRectMake(160, 240, 100, 150);
    
    // Make firstFrame to match bounds of superview
//    CGRect firstFrame = self.window.bounds;
    
//    BNRHypnosisView *firstView = [[BNRHypnosisView alloc]initWithFrame:firstFrame];
    
    
    
//    firstView.backgroundColor = [UIColor redColor];
//    [self.window addSubview:firstView];
    
    // Create CGRects for frames
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
//    bigRect.size.height *= 2.0;
    
    // Create a screen-sized scroll view and add it to the window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    // Turn on paging for scroll view
    scrollView.pagingEnabled = YES;
    
    [self.window addSubview:scrollView];
    
    // Create a super-sized hypnosis view and add it to the scroll view
//    BNRHypnosisView *hypnosisView = [[BNRHypnosisView alloc] initWithFrame:bigRect];
    
    //Create a screen-sized hynosis view and add it to the scroll view
    BNRHypnosisView *hypnosisView = [[BNRHypnosisView alloc]initWithFrame:screenRect];
    
    [scrollView addSubview:hypnosisView];
    
    // Add a second screen-sized hypnosis view just off screen to the right
    screenRect.origin.x += screenRect.size.width;
    BNRHypnosisView *anotherView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    
    [scrollView addSubview:anotherView];
    
    // Tell the scroll view how big the content area is
    scrollView.contentSize = bigRect.size;
    
    // Create second frame
//    
//    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
//    
//    BNRHypnosisView *secondView = [[BNRHypnosisView alloc] initWithFrame:secondFrame];
//    
//    secondView.backgroundColor = [UIColor blueColor];
    
    // Make secondView a subview of it's superview–UIWindow
//    [seld.window addSubview:secondView];
    // Make secondView a subview of firstView
//    [firstView addSubview:secondView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
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
