// LimeChat is copyrighted free software by Satoshi Nakagawa <psychs AT limechat DOT net>.
// You can redistribute it and/or modify it under the terms of the GPL version 2 (see the file GPL.txt).

#import "IconController.h"


@implementation IconController

- (void)setHighlight:(BOOL)aHighlight newTalk:(BOOL)aNewTalk
{
	if (highlight == aHighlight && newTalk == aNewTalk) return;
	highlight = aHighlight;
	newTalk = aNewTalk;
	
	NSDockTile* tile = [NSApp dockTile];

	if (highlight) {
		[tile setBadgeLabel:@"!"];
	}
	else if (newTalk) {
		[tile setBadgeLabel:@"?"];
	}
	else {
		[tile setBadgeLabel:nil];
	}
}
@end
