//
//  UIApplication+NetworkActivityIndicator.m
//  NetworkActivityIndicatorFix
//
//  Created by Igor Evsukov on 5/26/11.
//  Copyright 2011 Igor Evsukov. All rights reserved.
//

#import "UIApplication+NetworkActivityIndicator.h"

@implementation UIApplication (NetworkActivityIndicator)

static int networkActivityCount = 0;
- (void)showNetworkActivityIndicator {
	//just redirect all calls to main thread
	if (![NSThread isMainThread]) {
		[self performSelectorOnMainThread:@selector(showNetworkActivityIndicator) withObject:nil waitUntilDone:NO];
	}
	
    if (!networkActivityCount)
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    networkActivityCount++;
}
- (void)hideNetworkActivityIndicator {
	//just redirect all calls to main thread
	if (![NSThread isMainThread]) {
		[self performSelectorOnMainThread:@selector(hideNetworkActivityIndicator) withObject:nil waitUntilDone:NO];
	}
	
    networkActivityCount = MAX(networkActivityCount - 1, 0);
    if (!networkActivityCount)
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
