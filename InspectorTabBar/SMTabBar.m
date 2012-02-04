//
//  SMTabBar.m
//  InspectorTabBar
//
//  Created by Stephan Michels on 30.01.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import "SMTabBar.h"
#import "SMTabBarItem.h"
#import "SMTabBarButtonCell.h"
#import "NSDictionary+SMKeyValueObserving.h"


#define SMTabBarButtonWidth 32.0f

static char SMTabBarObservationContext;

@interface SMTabBar ()

@property (nonatomic, retain) NSArray *barButtons;

- (void)adjustSubviews;

@end

@implementation SMTabBar

@synthesize items = _items;
@synthesize selectedItem = _selectedItem;
@synthesize delegate = _delegate;

@synthesize barButtons = _barButtons;

#pragma mark - Initialization / Deallocation

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // add observer for properties
        [self addObserver:self forKeyPath:@"items" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:&SMTabBarObservationContext];
        [self addObserver:self forKeyPath:@"selectedItem" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:&SMTabBarObservationContext];
    }
    return self;
}

- (void)dealloc {
    // remove observer for properties
    [self removeObserver:self forKeyPath:@"items" context:&SMTabBarObservationContext];
    [self removeObserver:self forKeyPath:@"selectedItem" context:&SMTabBarObservationContext];
    
    // unbind button
    for (NSButton *button in self.barButtons) {
        [button unbind:@"image"];
        [button unbind:@"enabled"];
    }
    
    self.items = nil;
    self.delegate = nil;
    
    self.barButtons = nil;

    [super dealloc];
}

#pragma mark - Actions

- (void)selectBarButton:(id)sender {
    // select a bar button
    NSUInteger itemIndex = [sender tag];
    self.selectedItem = [self.items objectAtIndex:itemIndex];
    [self.delegate tabBar:self didSelectItem:self.selectedItem];
}

#pragma mark - Layout subviews

- (void)resizeSubviewsWithOldSize:(NSSize)oldBoundsSize {
	[super resizeSubviewsWithOldSize:oldBoundsSize];
	[self adjustSubviews];
}

- (void)adjustSubviews {
    // layout subviews
    NSUInteger numberOfButtons = [self.barButtons count];
    CGFloat completeWidth = numberOfButtons * SMTabBarButtonWidth;
    CGFloat offset = floorf((NSWidth(self.bounds) - completeWidth) / 2.0f);
    for (NSButton *button in self.barButtons) {
        button.frame = NSMakeRect(offset, NSMinY(self.bounds), SMTabBarButtonWidth, NSHeight(self.bounds));
        offset += SMTabBarButtonWidth;
    }
}

#pragma mark - Drawing

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // Draw bar gradient
    NSColor *color1 = [NSColor colorWithCalibratedRed:0.851 green:0.851 blue:0.851 alpha:1.];
    NSColor *color2 = [NSColor colorWithCalibratedRed:0.700 green:0.700 blue:0.700 alpha:1.];
    NSGradient *gradient = [[[NSGradient alloc] initWithStartingColor:color1 
                                                          endingColor:color2] autorelease];
    [gradient drawInRect:self.bounds angle:90.0];

    // Draw drak gray bottom border
    NSColor *color3 = [NSColor colorWithCalibratedWhite:0.3f alpha:1.0f];
    [color3 setStroke];
    [NSBezierPath strokeLineFromPoint:NSMakePoint(NSMinX(self.bounds), NSMaxY(self.bounds)) 
                              toPoint:NSMakePoint(NSMaxX(self.bounds), NSMaxY(self.bounds))];
}

- (BOOL)isFlipped {
    return YES;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context != &SMTabBarObservationContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    if (![change keyValueChanged]) {
        return;
    }
	
    if ([keyPath isEqualToString:@"items"]) {
        // remove old buttons
        for (NSButton *button in self.barButtons) {
            [button removeFromSuperview];
            
            [button unbind:@"image"];
            [button unbind:@"enabled"];
        }
        self.barButtons = nil;
        
        // add new buttons
        NSMutableArray *newBarButtons = [NSMutableArray arrayWithCapacity:[self.items count]];
        NSUInteger selectedItemIndex = [self.items indexOfObject:self.selectedItem];
        NSUInteger itemIndex = 0;
        for (SMTabBarItem *item in self.items) {
            NSButton *button = [[[NSButton alloc] initWithFrame:NSMakeRect(0.0f, 0.0f, SMTabBarButtonWidth, NSHeight(self.bounds))] autorelease];
            
            // add special button cell for the selected state
            NSButtonCell *cell = [[[SMTabBarButtonCell alloc] init] autorelease];
            cell.bezelStyle = NSTexturedRoundedBezelStyle;
            button.cell = cell;
            
            // set properties of the button
            button.image = item.image;
            button.enabled = item.enabled;
            button.state = itemIndex == selectedItemIndex ? NSOnState : NSOffState;
            button.tag = itemIndex;
            button.action = @selector(selectBarButton:);
            button.target = self;            
            [self addSubview:button];
            
            // bind button properties to the item properties
            [button bind:@"image" toObject:item withKeyPath:@"image" options:nil];
            [button bind:@"enabled" toObject:item withKeyPath:@"enabled" options:nil];
            
            [newBarButtons addObject:button];

            itemIndex++;
        }
        self.barButtons = newBarButtons;

        // re-layout buttons
        [self adjustSubviews];

        // pre-select first button
        if (![self.items containsObject:self.selectedItem]) {
            self.selectedItem = [self.items count] > 0 ? [self.items objectAtIndex:0] : nil;
        }
    } else if ([keyPath isEqualToString:@"selectedItem"]) {
        // update button states if the corresponding item is selected
        NSUInteger selectedItemIndex = [self.items indexOfObject:self.selectedItem];
        if (selectedItemIndex != NSNotFound) {
            NSUInteger buttonIndex = 0;
            for (NSButton *button in self.barButtons) {
                button.state = buttonIndex == selectedItemIndex ? NSOnState : NSOffState;
                buttonIndex++;
            }
        }
    }
}

@end
