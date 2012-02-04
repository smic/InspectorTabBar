//
//  SMTabBarButtonCell.m
//  InspectorTabBar
//
//  Created by Stephan Michels on 04.02.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import "SMTabBarButtonCell.h"

@implementation SMTabBarButtonCell

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView {
    [[NSGraphicsContext currentContext] saveGraphicsState];
    if (self.state == NSOnState) {
//        [[NSColor greenColor] setFill];
//        NSRectFill(frame);
        
        
        NSShadow *shadow = [[[NSShadow alloc] init] autorelease];
        shadow.shadowOffset = NSMakeSize(1.0f, 0.0f);
        shadow.shadowBlurRadius = 2.0f;
        shadow.shadowColor = [NSColor darkGrayColor];
        [shadow set];
        
        
        [[NSColor redColor] set];
        
        CGFloat radius = 50.0;
        
        NSPoint center = NSMakePoint(NSMinX(frame) - radius, NSMidY(frame));
        NSBezierPath *path = [NSBezierPath bezierPath];
        [path moveToPoint:center];
        [path appendBezierPathWithArcWithCenter:center
                                         radius:radius
                                     startAngle:-90.0f 
                                       endAngle:90.0f];
        [path closePath];
        [path fill];
        
        shadow.shadowOffset = NSMakeSize(-1.0f, 0.0f);
        [shadow set];
        
        center = NSMakePoint(NSMaxX(frame) + radius, NSMidY(frame));
        path = [NSBezierPath bezierPath];
        [path moveToPoint:center];
        [path appendBezierPathWithArcWithCenter:center
                                         radius:radius
                                     startAngle:90.0f 
                                       endAngle:270.0f];
        [path closePath];
        [path fill];
    }
    [[NSGraphicsContext currentContext] restoreGraphicsState];
}


@end
