//
//  PasswordHandler.h
//  Cheers!!
//
//  Created by Vinay Raj Dunty on 15/10/14.
//  Copyright (c) 2014 Myntra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordHandler : NSObject

+ (PasswordHandler*) sharedInstance;
-(NSString*)getTheContentsOfPasswordFile;
-(void)createAPasswordFile;

@end
