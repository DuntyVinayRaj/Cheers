//
//  CheersHelper.h
//  Cheers!!
//
//  Created by Vinay Raj Dunty on 15/10/14.
//  Copyright (c) 2014 Myntra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheersHelper : NSObject

+(void)displayAlertWithTitle:(NSString*)titleString
                 messageBody:(NSString*)body
              viewController:(UIViewController*)controller
              cancelBtnTitle:(NSString*)cancelBtnTitle;

@end
