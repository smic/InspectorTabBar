//
//  SMAppDelegate.m
//  InspectorTabBar
//
//  Created by Stephan Michels on 30.01.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import "SMAppDelegate.h"
#import "SMTabBarContainerView.h"


@implementation SMAppDelegate

@synthesize window = _window;
@synthesize tabBarContainerView = _tabBarContainerView;
@synthesize firstViewController = _firstViewController;
@synthesize secondViewControllers = _secondViewControllers;

- (void)dealloc {
    self.tabBarContainerView = nil;
    self.firstViewController = nil;
    self.secondViewControllers = nil;
    
    [super dealloc];
}

#pragma mark - Application delegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application    
    self.tabBarContainerView.viewControllers = [NSArray arrayWithObjects:self.firstViewController,
                                                self.secondViewControllers, nil];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
	return YES;
}

@end
