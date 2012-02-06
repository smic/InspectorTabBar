//
//  FirstViewController.m
//  InspectorTabBar
//
//  Created by Stephan Michels on 06.02.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import "FirstViewController.h"
#import "SMTabBarItem.h"


@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (SMTabBarItem *)tabBarItem {
    NSImage *image = [NSImage imageNamed:@"Image1.png"];
    image.template = YES;
    SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:image tag:0];
    item.toolTip = @"Show tab 1";
    item.keyEquivalent = @"1";
    item.keyEquivalentModifierMask = NSCommandKeyMask;
    return item;
}

@end
