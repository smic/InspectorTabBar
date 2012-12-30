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


@implementation SMAppDelegate

@synthesize window = _window;
@synthesize tabBar = _tabBar;
@synthesize tabView = _tabView;

#pragma mark - Application delegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application    
    
    NSMutableArray *tabBarItems = [NSMutableArray arrayWithCapacity:2];
    {
        NSImage *image = [NSImage imageNamed:@"Image1.png"];
        [image setTemplate:YES];
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:image tag:0];
        item.toolTip = NSLocalizedString(@"Tab 1", nil);
        item.keyEquivalent = @"1";
        item.keyEquivalentModifierMask = NSCommandKeyMask;
        [tabBarItems addObject:item];
    }
    {
        NSImage *image = [NSImage imageNamed:@"Image2.png"];
        [image setTemplate:YES];
        SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:image tag:1];
        item.toolTip = NSLocalizedString(@"Tab 2", nil);
        item.keyEquivalent = @"2";
        item.keyEquivalentModifierMask = NSCommandKeyMask;
        [tabBarItems addObject:item];
    }
    self.tabBar.items = tabBarItems;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
	return YES;
}

#pragma mark - Tab bar delegate

- (void)tabBar:(SMTabBar *)tabBar willSelectItem:(SMTabBarItem *)item {
    // commit edits for changing tabs
//    switch ([self.tabBar.items indexOfObject:tabBar.selectedItem]) {
//        case 0:
//            [self.graphicController commitEditing];
//            break;
//            
//        default:
//            break;
//    }
}

- (void)tabBar:(SMTabBar *)tabBar didSelectItem:(SMTabBarItem *)item {
    [self.tabView selectTabViewItemAtIndex:[self.tabBar.items indexOfObject:item]];
}

@end
