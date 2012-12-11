//
//  SMAppDelegate.h
//  InspectorTabBar
//
//  Created by Stephan Michels on 30.01.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@class SMTabBar;

@interface SMAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet SMTabBar *tabBar;
@property (nonatomic, retain) IBOutlet NSTabView *tabView;

@end
