//
//  DateUtils.m
//  AA3
//
//  Created by Brian Bell on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DateUtils.h"

@implementation DateUtils



+ (NSDate *)date1970
{
    NSDate *d = [[NSDate alloc] init];
    
    @try
    {
        // The ref date for dotnet is 0001-01-01
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"dd MM yyyy";
        d = [dateFormatter dateFromString:@"01 01 1970" ];        
    }
    @catch (NSException *e)
    {
        d = nil;
    }
    
    return d;
}

+ (NSDate *)dateFromDotNetTicks:(long long)ticks
{
    NSDate *d = [[NSDate alloc] init];

    @try
    {
        // The ref date for dotnet is 0001-01-01
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"dd MM yyyy";
        NSDate *refDate = [dateFormatter dateFromString:@"01 01 0001" ];        
        
        long long timeInt = ticks / (1000 * 10000);        
        d = [NSDate dateWithTimeInterval:timeInt sinceDate:refDate];
        
    }
    @catch (NSException *e)
    {
        d = nil;
    }

    return d;
}

+ (NSString *) formattedDateRelativeToNow:(NSDate *)date
{

    NSInteger dayDiff = (int)[date timeIntervalSinceNow] / (60*60*24);
    NSInteger hourDiff = (int)[date timeIntervalSinceNow] / (60*60);
    NSInteger minuteDiff = (int)[date timeIntervalSinceNow] / (60);
        
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; 

    if(dayDiff == 0)
    {
        if (hourDiff == 0)
        {
            if (minuteDiff == 0)
            {
                [dateFormatter setDateFormat:@"ss 'seconds ago'"];
            }
            else
            {
                [dateFormatter setDateFormat:@"mm 'minutes ago'"];
            }
        }
        else
        {
            [dateFormatter setDateFormat:@"h:mm aaa"];
        }
    }
    else if(dayDiff == -1)
        [dateFormatter setDateFormat:@"'Yesterday, 'h':'mm aaa"];
    else if(dayDiff == -2)
        [dateFormatter setDateFormat:@"MMMM d', two days ago'"];
    else if(dayDiff > -7 && dayDiff <= -2)
        [dateFormatter setDateFormat:@"MMMM d', this week'"];
    else if(dayDiff > -14 && dayDiff <= -7)
        [dateFormatter setDateFormat:@"MMMM d'; last week'"];
    else if(dayDiff >= -60 && dayDiff <= -30)
        [dateFormatter setDateFormat:@"MMMM d'; last month'"];
    else if(dayDiff >= -90 && dayDiff <= -60)
        [dateFormatter setDateFormat:@"MMMM d'; within last three months'"];
    else if(dayDiff >= -180 && dayDiff <= -90)
        [dateFormatter setDateFormat:@"MMMM d'; within last six months'"];
    else if(dayDiff >= -365 && dayDiff <= -180)
        [dateFormatter setDateFormat:@"MMMM d, YYYY'; within this year'"];
    else if(dayDiff < -365)
        [dateFormatter setDateFormat:@"MMMM d, YYYY'; a long time ago'"];

    return [dateFormatter stringFromDate:date];
}




+ (NSString *) formattedDateRelativeToNowShort:(NSDate *)date
{
    
    NSInteger dayDiff = (int)[date timeIntervalSinceNow] / (60*60*24);
    NSInteger hourDiff = (int)[date timeIntervalSinceNow] / (60*60);
    NSInteger minuteDiff = (int)[date timeIntervalSinceNow] / (60);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; 
    
    if(dayDiff == 0)
    {
        if (hourDiff == 0)
        {
            if (minuteDiff == 0)
            {
                [dateFormatter setDateFormat:@"ss 'sec ago'"];
            }
            else
            {
                [dateFormatter setDateFormat:@"mm 'min ago'"];
            }
        }
        else
        {
            [dateFormatter setDateFormat:@"h:mm aaa"];
        }
    }
    else
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd"];
    return [dateFormatter stringFromDate:date];
} 

@end
