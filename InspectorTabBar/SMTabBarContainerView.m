//
//  SMTabBarContainerView.m
//  InspectorTabBar
//
//  Created by Stephan Michels on 05.02.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import "SMTabBarContainerView.h"
#import "SMTabBar.h"
#import "NSDictionary+SMKeyValueObserving.h"

#define SMTabBarHeight 22.0f

static char SMTabBarContainerViewObservationContext;

@interface SMTabBarContainerView () <SMTabBarDelegate>

@property (nonatomic, retain) SMTabBar *tabBar;
@property (nonatomic, retain) NSBox *box;

@end

@implementation SMTabBarContainerView

@synthesize viewControllers = _viewControllers;
@synthesize selectedViewControllerIndex = _selectedViewControllerIndex;

@synthesize tabBar = _tabBar;
@synthesize box = _box;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        
        self.tabBar = [[[SMTabBar alloc] initWithFrame:NSMakeRect(NSMinX(self.bounds), 
                                                                  NSMaxY(self.bounds) - SMTabBarHeight, 
                                                                  NSWidth(self.bounds), 
                                                                  SMTabBarHeight)] autorelease];
        self.tabBar.autoresizingMask = NSViewWidthSizable | NSViewMinYMargin;
        self.tabBar.delegate = self;
        [self addSubview:self.tabBar];
        
        self.box = [[NSBox alloc] initWithFrame:NSMakeRect(NSMinX(self.bounds), 
                                                           NSMinY(self.bounds), 
                                                           NSWidth(self.bounds), 
                                                           NSHeight(self.bounds) - SMTabBarHeight)];
        self.box.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        self.box.titlePosition = NSNoTitle;
        self.box.borderType = NSNoBorder;
        [self addSubview:self.box];
        
        // add observer for properties
        [self addObserver:self forKeyPath:@"viewControllers" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:&SMTabBarContainerViewObservationContext];
        [self addObserver:self forKeyPath:@"selectedViewControllerIndex" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:&SMTabBarContainerViewObservationContext];
    }
    
    return self;
}

- (void)dealloc {
    // remove observer for properties
    [self removeObserver:self forKeyPath:@"viewControllers" context:&SMTabBarContainerViewObservationContext];
    [self removeObserver:self forKeyPath:@"selectedViewControllerIndex" context:&SMTabBarContainerViewObservationContext];
    
    
    self.viewControllers = nil;
    
    self.tabBar = nil;
    self.box = nil;
    
    [super dealloc];
}

#pragma mark - Tab bar delegate

- (void)tabBar:(SMTabBar *)tabBar didSelectItem:(SMTabBarItem *)item {
    self.selectedViewControllerIndex = [self.tabBar.items indexOfObject:item];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context != &SMTabBarContainerViewObservationContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    if (![change keyValueChanged]) {
        return;
    }
    
    if ([keyPath isEqualToString:@"viewControllers"]) {
        NSUInteger numberOfViewControllers = [self.viewControllers count];
        NSMutableArray *items = [NSMutableArray arrayWithCapacity:numberOfViewControllers];
        for (NSUInteger viewControllerIndex = 0; viewControllerIndex < numberOfViewControllers; viewControllerIndex++) {
            NSViewController *viewController = [self.viewControllers objectAtIndex:viewControllerIndex];
            
            SMTabBarItem *item = viewController.tabBarItem;
            [items addObject:item];
        }
        self.tabBar.items = items;
        
        self.tabBar.selectedItem = [items objectAtIndex:self.selectedViewControllerIndex];
    }
	
    if ([keyPath isEqualToString:@"viewControllers"] ||
        [keyPath isEqualToString:@"selectedViewControllerIndex"]) {
        
        if ([self.viewControllers count] < self.selectedViewControllerIndex) {
            [self.box setContentView:nil];
        } else {
            
            NSViewController *viewController = [self.viewControllers objectAtIndex:self.selectedViewControllerIndex];
            
            // Put the view in the box
            NSView *view = [viewController view];
            view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
            view.frame = self.box.bounds;
            self.box.contentView = view;
        }
    }
}

@end
