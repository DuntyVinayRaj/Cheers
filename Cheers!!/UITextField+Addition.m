//
//  UITextField+Addition.m
//  Cheers!!
//
//  Created by Vinay Raj Dunty on 15/10/14.
//  Copyright (c) 2014 Myntra. All rights reserved.
//

#import "UITextField+Addition.h"

@implementation UITextField (CheersAdditons)

-(BOOL)isValid
{
    NSString *text = [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if( text != nil && text.length > 0 )
    {
        return YES;
    }
    return NO;
}

@end
