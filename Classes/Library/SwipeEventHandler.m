// LimeChat is copyrighted free software by Satoshi Nakagawa <psychs AT limechat DOT net>.
// You can redistribute it and/or modify it under the terms of the GPL version 2 (see the file GPL.txt).

#import "SwipeEventHandler.h"

const CGFloat kSwipeLeft = 1.0;
const CGFloat kSwipeRight = -1.0;
const CGFloat kSwipeUp = 1.0;
const CGFloat kSwipeDown = -1.0;

@implementation SwipeEventHandler

@synthesize target;

- (id)init
{
	self = [super init];
	if (self) {
		swipeHandlerMap = [NSMutableDictionary new];
	}
	return self;
}

- (void)dealloc
{
	[swipeHandlerMap release];
	[super dealloc];
}

- (void)registerSelector:(SEL)selector deltaX:(CGFloat)x deltaY:(CGFloat)y
{
	NSPoint delta = CGPointMake(x, y);

	[swipeHandlerMap setObject:NSStringFromSelector(selector) forKey:NSStringFromPoint(delta)];
}

- (BOOL)processSwipeEvent:(NSEvent *)e
{
	NSPoint delta = CGPointMake([e deltaX], [e deltaY]);

	NSString* selectorName = [swipeHandlerMap objectForKey:NSStringFromPoint(delta)];
	if (selectorName) {
		[target performSelector:NSSelectorFromString(selectorName) withObject:e];
		return YES;
	}

	return NO;
}
@end
