//
//  Country.m
//  pickerdemo
//
//  Created by Denny Kwon on 10/10/12.
//  Copyright (c) 2012 com.thegridmedia. All rights reserved.
//

#import "Country.h"

@implementation Country
@synthesize name;
@synthesize code;

- (void)dealloc
{
    [name release];
    [code release];
    [super dealloc];
}

@end
