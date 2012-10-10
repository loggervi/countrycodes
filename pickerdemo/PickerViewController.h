//
//  PickerViewController.h
//  pickerdemo
//
//  Created by Denny Kwon on 10/10/12.
//  Copyright (c) 2012 com.thegridmedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

@interface PickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (retain, nonatomic) UIPickerView *picker;
@property (retain, nonatomic) NSMutableArray *countries;
@property (retain, nonatomic) UILabel *leftCodesLabel;
@property (retain, nonatomic) UILabel *rightCodesLabel;
@end
