//
//  CheersGlobals.h
//  Cheers!!
//
//  Created by Vinay Raj Dunty on 15/10/14.
//  Copyright (c) 2014 Myntra. All rights reserved.
//

#ifndef Cheers___CheersGlobals_h
#define Cheers___CheersGlobals_h


// Comment the below line to get non-verbose logs

#define VERBOSE_LOGS

#ifdef DEBUG
#ifdef VERBOSE_LOGS
#	define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...) NSLog(__VA_ARGS__)
#endif
#else
#	define DLog(...)
#endif

#define KeyBoardSize 200

// Additions
#import "UITextField+Addition.h"

// Handlers and Helpers

#import "PasswordHandler.h"
#import "CheersHelper.h"

#define PsHndl [PasswordHandler sharedInstance]

#endif
