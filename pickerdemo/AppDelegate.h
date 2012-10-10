//
//  AppDelegate.h
//  pickerdemo
//
//  Created by Denny Kwon on 10/10/12.
//  Copyright (c) 2012 com.thegridmedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) PickerViewController *picker;

@end
