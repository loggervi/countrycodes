//
//  PickerViewController.m
//  pickerdemo
//
//  Created by Denny Kwon on 10/10/12.
//  Copyright (c) 2012 com.thegridmedia. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

#define kRowHeight 30.0f

@implementation PickerViewController
@synthesize picker;
@synthesize countries;
@synthesize leftCodesLabel;
@synthesize rightCodesLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        countries = [[NSMutableArray alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"plist"];
        NSArray *plist = [[NSArray alloc] initWithContentsOfFile:path];
        
        NSLog(@"%@", [plist description]);
        
        for (int i=0; i<[plist count]; i++){
            NSString *countryInfo = [plist objectAtIndex:i];
            if (countryInfo){
                NSArray *parts = [countryInfo componentsSeparatedByString:@":"];
                Country *country = [[Country alloc] init];
                country.name = [parts objectAtIndex:0];
                country.code = [parts lastObject];
                [countries addObject:country];
                [country release];
            }
        }
    }
    return self;
}

- (void)dealloc
{
    [picker release];
    [countries release];
    [leftCodesLabel release];
    [super dealloc];
}

- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    view.backgroundColor = [UIColor greenColor];
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    CGFloat h = picker.frame.size.height;
    picker.frame = CGRectMake(0, frame.size.height-h, frame.size.width, h);

    picker.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self;
    picker.delegate = self;
    [view addSubview:picker];
    
    h = 30.0f;
    leftCodesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, picker.frame.origin.y-h, 0.5*frame.size.width, h)];
    leftCodesLabel.backgroundColor = [UIColor clearColor];
    leftCodesLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:leftCodesLabel];

    frame = leftCodesLabel.frame;
    rightCodesLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width, frame.origin.y, frame.size.width, frame.size.height)];
    rightCodesLabel.backgroundColor = [UIColor clearColor];
    rightCodesLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:rightCodesLabel];

    Country *country = (Country *)[countries objectAtIndex:0];
    leftCodesLabel.text = country.code;
    rightCodesLabel.text = country.code;

    
    self.view = view;
    [view release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [countries count];
}

//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    return [NSString stringWithFormat:@"row = %d", row];
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *rowView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0.5*self.view.frame.size.width, kRowHeight)];
    
    Country *country = (Country *)[countries objectAtIndex:row];
    rowView.text = country.name;
    rowView.textAlignment = NSTextAlignmentCenter;
    rowView.backgroundColor = [UIColor clearColor];
    rowView.textColor = [UIColor darkGrayColor];
    return [rowView autorelease];

}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return kRowHeight;
    
}

 - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //component = column
    Country *country = (Country *)[countries objectAtIndex:row];
    if (!country)
        return;
    
    NSLog(@"pickerView didSelectRow: %@, %@", country.name, country.code);
    if (component==0){
        leftCodesLabel.text = country.code;
    }
    else{
        rightCodesLabel.text = country.code;
    }
    
}


/*
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component;

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0); // attributed title is favored if both methods are implemented
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;
 - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
*/
 




- (void)viewDidUnload
{
    self.picker = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
