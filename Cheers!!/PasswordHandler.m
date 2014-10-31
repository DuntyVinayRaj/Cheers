//
//  PasswordHandler.m
//  Cheers!!
//
//  Created by Vinay Raj Dunty on 15/10/14.
//  Copyright (c) 2014 Myntra. All rights reserved.
//

#import "PasswordHandler.h"

@implementation PasswordHandler

+ (PasswordHandler*) sharedInstance {
    static PasswordHandler *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self alloc] init];
    });
    return sharedClient;
}

-(void)createAPasswordFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, @"password.txt"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) { // if file is not exist, create it.
        NSString *helloStr = @"9556";
        NSError *error;
        [helloStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }
}

-(NSString*)getTheContentsOfPasswordFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, @"password.txt"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) { // if file is not exist, create it.
        return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    }
    
    return nil;
}

@end
