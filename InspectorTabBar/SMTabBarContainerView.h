//
//  SMTabBarContainerView.h
//  InspectorTabBar
//
//  Created by Stephan Michels on 05.02.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@class SMTabBarItem;

@interface SMTabBarContainerView : NSView

@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, assign) NSUInteger selectedViewControllerIndex;

@end


@interface NSViewController (SMTabBarContainerView)

@property (readonly) SMTabBarItem *tabBarItem;

@end