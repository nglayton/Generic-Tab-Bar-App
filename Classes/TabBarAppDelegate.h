//
//  TabBarAppDelegate.h
//  TabBar
//
//  Created by Joe D'Andrea <jdandrea@gmail.com> on 5 July 2009.
//  Released into the public domain.
//

#import <UIKit/UIKit.h>

@interface TabBarAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	UIBarStyle barStyle;
	UIColor *tintColor;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, assign) UIBarStyle barStyle;
@property (nonatomic, retain) UIColor *tintColor;

@end
