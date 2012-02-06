//
//  SecondViewController.m
//  InspectorTabBar
//
//  Created by Stephan Michels on 06.02.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import "SecondViewController.h"
#import "SMTabBarItem.h"


@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (SMTabBarItem *)tabBarItem {
    NSImage *image = [NSImage imageNamed:@"Image2.png"];
    image.template = YES;
    SMTabBarItem *item = [[SMTabBarItem alloc] initWithImage:image tag:1];
    item.toolTip = @"Show second plane";
    item.keyEquivalent = @"2";
    item.keyEquivalentModifierMask = NSCommandKeyMask;
    
    return item;
}

@end
