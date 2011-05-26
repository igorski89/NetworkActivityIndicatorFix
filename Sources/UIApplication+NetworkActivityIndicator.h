//
//  UIApplication+NetworkActivityIndicator.h
//  NetworkActivityIndicatorFix
//
//  Created by Igor Evsukov on 5/26/11.
//  Copyright 2011 Igor Evsukov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIApplication (NetworkActivityIndicator)

- (void)showNetworkActivityIndicator;
- (void)hideNetworkActivityIndicator;

@end
