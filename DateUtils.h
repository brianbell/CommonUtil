//
//  DateUtils.h
//  AA3
//
//  Created by Brian Bell on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateUtils : NSObject


+ (NSDate *)date1970;

+ (NSDate *)dateFromDotNetTicks:(long long)ticks;

+ (NSString *) formattedDateRelativeToNow:(NSDate *)date;

+ (NSString *) formattedDateRelativeToNowShort:(NSDate *)date;

@end
