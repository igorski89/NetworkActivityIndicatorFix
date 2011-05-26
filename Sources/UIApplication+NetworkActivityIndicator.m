//
//  UIApplication+NetworkActivityIndicator.m
//  NetworkActivityIndicatorFix
//
//  Created by Igor Evsukov on 5/26/11.
//  Copyright 2011 Igor Evsukov. All rights reserved.
//

#import "UIApplication+NetworkActivityIndicator.h"
#include <objc/runtime.h>

@implementation UIApplication (NetworkActivityIndicator)

+ (void)load {
	Log(@"exchange methods implementations");
    Method originalMethod = class_getInstanceMethod([self class], @selector(setNetworkActivityIndicatorVisible:));
    Method fixedMethod = class_getInstanceMethod([self class], @selector(fixedSetActivityIndicatorVisible:));
    method_exchangeImplementations(originalMethod, fixedMethod);
}

- (void)fixedSetActivityIndicatorVisible:(BOOL)visible {
	Log(@"visible=%d",visible);
	static NSInteger networkActivityCount = 0;
	@synchronized(self) {
		if (visible) {
			if (!networkActivityCount) {
				[[UIApplication sharedApplication] fixedSetActivityIndicatorVisible:YES];
			}
			
			networkActivityCount++;
		}
		else {
			networkActivityCount = MAX(networkActivityCount - 1, 0);
			
			if (!networkActivityCount) {
				[[UIApplication sharedApplication] fixedSetActivityIndicatorVisible:NO];
			}
		}
	}
}

@end
