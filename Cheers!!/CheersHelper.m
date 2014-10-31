//
//  CheersHelper.m
//  Cheers!!
//
//  Created by Vinay Raj Dunty on 15/10/14.
//  Copyright (c) 2014 Myntra. All rights reserved.
//

#import "CheersHelper.h"

@implementation CheersHelper

+(void)displayAlertWithTitle:(NSString*)titleString
                 messageBody:(NSString*)body
              viewController:(UIViewController*)controller
              cancelBtnTitle:(NSString*)cancelBtnTitle
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titleString
                                                    message:body
                                                   delegate:controller
                                          cancelButtonTitle:cancelBtnTitle
                                          otherButtonTitles:nil];
    [alert show];
    alert = nil;
}

@end
