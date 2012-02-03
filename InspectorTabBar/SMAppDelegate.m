//
//  SMAppDelegate.m
//  InspectorTabBar
//
//  Created by Stephan Michels on 30.01.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import "SMAppDelegate.h"
#import "SMTabBar.h"
#import "SMTabBarItem.h"


@interface SMAppDelegate () <SMTabBarDelegate>

@end

@implementation SMAppDelegate

@synthesize window = _window;
@synthesize tabBar = _tabBar;

- (void)dealloc {
    self.tabBar = nil;
    
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSMutableArray *newItems = [NSMutableArray arrayWithCapacity:5];
    {
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:[NSImage imageNamed:@"Image1.png"] tag:0];
        [newItems addObject:item];
    }
    {
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:[NSImage imageNamed:@"Image2.png"] tag:1];
        [newItems addObject:item];
    }
    {
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:[NSImage imageNamed:@"Image3.png"] tag:2];
        [newItems addObject:item];
    }
    {
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:[NSImage imageNamed:@"Image4.png"] tag:3];
        [newItems addObject:item];
    }
    {
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:[NSImage imageNamed:@"Image5.png"] tag:4];
        [newItems addObject:item];
    }
    self.tabBar.items = newItems;
    self.tabBar.delegate = self;
}

- (void)tabBar:(SMTabBar *)tabBar didSelectItem:(SMTabBarItem *)item {
    NSLog(@"Select tab item: %@", item);
}

@end
