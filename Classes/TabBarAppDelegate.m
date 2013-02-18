//
//  TabBarAppDelegate.m
//  TabBar
//
//  Created by Joe D'Andrea <jdandrea@gmail.com> on 5 July 2009.
//  Released into the public domain.
//

#import "TabBarAppDelegate.h"

@interface TabBarAppDelegate (Internal)
- (void)setBarStyle:(UIBarStyle)style andTintColor:(UIColor *)color forNavigationBar:(UINavigationBar *)bar;
@end

@implementation TabBarAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize barStyle;
@synthesize tintColor;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	// Adjust to taste. Uncomment tintColor and adjust if desired.
	barStyle = UIBarStyleBlackOpaque;
//	tintColor = [UIColor purpleColor];

	// Setting the tab bar's "More" navigation bar style and tint color is a cinch:
	[self setBarStyle:barStyle andTintColor:tintColor forNavigationBar:tabBarController.moreNavigationController.navigationBar];

	// For the "Configure" nav bar style and tint color, we must act as a delegate and respond to tabBarController:willBeginCustomizingViewControllers:
    tabBarController.delegate = self;
	
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = self.tabBarController;
    
    [self.window addSubview:self.tabBarController.view];
    [self.window makeKeyAndVisible];
    
}

// In the iPhone Simulator, this appears to work on iPhone OS 2.2 and 2.2.1, but the 3.0 documentation claims otherwise. Be cautious!
- (void)tabBarController:(UITabBarController *)controller willBeginCustomizingViewControllers:(NSArray *)viewControllers {
	
	// Warning: This is brittle, but it works on iPhone OS 3.0 (7A341)!
    UIView *editViews = [controller.view.subviews objectAtIndex:1];
    UINavigationBar *editModalNavBar = [editViews.subviews objectAtIndex:0];

	// Now we have our Edit ("Configure") modal nav bar. Go nuts ...
	[self setBarStyle:barStyle andTintColor:tintColor forNavigationBar:editModalNavBar];

	// To change the modal nav bar title, uncomment and customize to taste:
//	editModalNavBar.topItem.title = @"Configure";
}

- (void)dealloc {
	[tintColor release];
    [tabBarController release];
    [window release];
    [super dealloc];
}

#pragma mark -
#pragma mark Internal Helper Methods

- (void)setBarStyle:(UIBarStyle)style andTintColor:(UIColor *)color forNavigationBar:(UINavigationBar *)bar {
    bar.barStyle = style;
	bar.tintColor = color;	
}

@end

