//
//  SMTabBar.h
//  InspectorTabBar
//
//  Created by Stephan Michels on 30.01.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@class SMTabBarItem;
@protocol SMTabBarDelegate;

@interface SMTabBar : NSView

@property (nonatomic, retain) NSArray *items;
@property (nonatomic, assign) SMTabBarItem *selectedItem;
@property (nonatomic, assign) id<SMTabBarDelegate> delegate;

@end


@protocol SMTabBarDelegate <NSObject>

- (void)tabBar:(SMTabBar *)tabBar didSelectItem:(SMTabBarItem *)item;

@end