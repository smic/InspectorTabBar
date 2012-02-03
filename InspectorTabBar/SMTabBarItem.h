//
//  SMTabBarItem.h
//  InspectorTabBar
//
//  Created by Stephan Michels on 03.02.12.
//  Copyright (c) 2012 Stephan Michels Softwareentwicklung und Beratung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMTabBarItem : NSObject

@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, retain) NSImage *image;
@property (nonatomic, assign) NSInteger tag;

- (id)initWithImage:(NSImage *)image tag:(NSInteger)tag;

@end
