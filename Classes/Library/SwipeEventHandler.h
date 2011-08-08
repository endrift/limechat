// LimeChat is copyrighted free software by Satoshi Nakagawa <psychs AT limechat DOT net>.
// You can redistribute it and/or modify it under the terms of the GPL version 2 (see the file GPL.txt).

#import <Cocoa/Cocoa.h>


const CGFloat kSwipeLeft;
const CGFloat kSwipeRight;
const CGFloat kSwipeUp;
const CGFloat kSwipeDown;

@interface SwipeEventHandler : NSObject
{
	id target;
	NSMutableDictionary* swipeHandlerMap;
}

@property (nonatomic, assign) id target;

- (void)registerSelector:(SEL)selector deltaX:(CGFloat)x deltaY:(CGFloat)y;

- (BOOL)processSwipeEvent:(NSEvent*)e;

@end
