//
//  SMAppDelegate.h
//  InspectorTabBar
//
//  Created by Stephan Michels on 30.01.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@class SMTabBarContainerView;

@interface SMAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet SMTabBarContainerView *tabBarContainerView;
@property (nonatomic, retain) IBOutlet NSViewController *firstViewController;
@property (nonatomic, retain) IBOutlet NSViewController *secondViewControllers;

@end
