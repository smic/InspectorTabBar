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
@synthesize label = _label;

- (void)dealloc {
    self.tabBar = nil;
    self.label = nil;
    
    [super dealloc];
}

#pragma mark - Application delegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSMutableArray *newItems = [NSMutableArray arrayWithCapacity:5];
    {
        NSImage *image = [NSImage imageNamed:@"Image1.png"];
        image.template = YES;
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:image tag:0];
        item.toolTip = @"Show tab 1";
        item.keyEquivalent = @"1";
        item.keyEquivalentModifierMask = NSCommandKeyMask;
        [newItems addObject:item];
    }
    {
        NSImage *image = [NSImage imageNamed:@"Image2.png"];
        image.template = YES;
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:image tag:1];
        item.toolTip = @"Show tab 2";
        item.keyEquivalent = @"2";
        item.keyEquivalentModifierMask = NSCommandKeyMask;
        [newItems addObject:item];
    }
    {
        NSImage *image = [NSImage imageNamed:@"Image3.png"];
        image.template = YES;
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:image tag:2];
        item.toolTip = @"Show tab 3";
        item.keyEquivalent = @"3";
        item.keyEquivalentModifierMask = NSCommandKeyMask;
        [newItems addObject:item];
    }
    {
        NSImage *image = [NSImage imageNamed:@"Image4.png"];
        image.template = YES;
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:image tag:3];
        item.toolTip = @"Show tab 4";
        item.keyEquivalent = @"4";
        item.keyEquivalentModifierMask = NSCommandKeyMask;
        [newItems addObject:item];
    }
    {
        NSImage *image = [NSImage imageNamed:@"Image5.png"];
        image.template = YES;
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:image tag:4];
        item.toolTip = @"Show tab 5";
        item.keyEquivalent = @"5";
        item.keyEquivalentModifierMask = NSCommandKeyMask;
        [newItems addObject:item];
    }
    self.tabBar.items = newItems;
    self.tabBar.delegate = self;
    
    self.label.stringValue = [NSString stringWithFormat:@"Selected tab item: %i",  self.tabBar.selectedItem.tag + 1];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
	return YES;
}

#pragma mark - Tab bar delegate

- (void)tabBar:(SMTabBar *)tabBar didSelectItem:(SMTabBarItem *)item {
    self.label.stringValue = [NSString stringWithFormat:@"Selected tab item: %i", item.tag + 1];
}

@end
