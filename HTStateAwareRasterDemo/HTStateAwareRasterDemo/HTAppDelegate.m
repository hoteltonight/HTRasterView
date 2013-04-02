//
//  HTAppDelegate.m
//  HTStateAwareRasterDemo
//
//  Created by Jacob Jennings on 12/6/12.
//  Copyright (c) 2013 HotelTonight
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "HTAppDelegate.h"
#import "HTExampleTableViewController.h"
#import "HTGeneratedImagesViewController.h"
#import "HTExampleTableCell.h"
#import "HTNoRasterizationCell.h"

@interface HTAppDelegate ()

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) HTExampleTableViewController *exampleTableViewController;
@property (nonatomic, strong) HTExampleTableViewController *noRasterizationExampleTableViewController;
@property (nonatomic, strong) HTExampleTableViewController *coreAnimationRasterizedTableViewController;


@property (nonatomic, strong) HTGeneratedImagesViewController *generatedImagesViewController;

@end

@implementation HTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.exampleTableViewController = [[HTExampleTableViewController alloc] initWithCellClass:[HTExampleTableCell class]];
    self.exampleTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Smart rasterization" image:nil tag:0];

    self.noRasterizationExampleTableViewController = [[HTExampleTableViewController alloc] initWithCellClass:[HTNoRasterizationCell class]];
    self.noRasterizationExampleTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"No rasterization" image:nil tag:1];

    self.coreAnimationRasterizedTableViewController = [[HTExampleTableViewController alloc] initWithCellClass:[HTNoRasterizationCell class]];
    self.coreAnimationRasterizedTableViewController.shouldCARasterize = YES;
    self.coreAnimationRasterizedTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"CA rasterization" image:nil tag:1];
    
    self.generatedImagesViewController = [[HTGeneratedImagesViewController alloc] init];
    self.generatedImagesViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Cached rasters" image:nil tag:1];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[self.exampleTableViewController, self.generatedImagesViewController, self.noRasterizationExampleTableViewController, self.coreAnimationRasterizedTableViewController];
    self.tabBarController.view.backgroundColor = [UIColor blackColor];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
