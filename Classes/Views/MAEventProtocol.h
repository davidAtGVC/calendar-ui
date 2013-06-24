//
//  MAEventProtocol.h
//  EMR
//
//  Created by David Aspinall on 2013-06-24.
//  Copyright (c) 2013 Global Village. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MAEventProtocol <NSObject>

- (NSString *)eventTitle;
- (NSString *)eventNotes;

- (NSDate *)eventStart;
- (NSDate *)eventEnd;
- (NSDate *)eventDisplayDate;

- (BOOL)isEventAllDay;
- (unsigned int)eventDurationInMinutes;
- (unsigned int)eventMinutesSinceMidnight;

- (UIColor *)eventBackgroundColor;
- (UIColor *)eventTextColor;

- (NSDictionary *)eventUserInfo;

@end

