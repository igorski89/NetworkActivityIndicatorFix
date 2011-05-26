//
//  AppDelegate.h
//  NetworkActivityIndicatorFix
//
//  Created by Igor Evsukov on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void)startNetworkTask1;
- (void)networkTask1;

- (void)startNetworkTask2;
- (void)networkTask2;

@end

