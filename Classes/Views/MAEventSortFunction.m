//
//  MAEventSortFunction.m
//  EMR
//
//  Created by David Aspinall on 2013-06-24.
//  Copyright (c) 2013 Global Village. All rights reserved.
//

#import "MAEventSortFunction.h"
#import "MAEventProtocol.h"

NSInteger MAEventProtocol_sortByStartTime(id ev1, id ev2, void *keyForSorting) {
	id <MAEventProtocol> event1 = (id <MAEventProtocol> )ev1;
	id <MAEventProtocol> event2 = (id <MAEventProtocol> )ev2;
	
	int v1 = [event1 eventMinutesSinceMidnight];
	int v2 = [event2 eventMinutesSinceMidnight];
	
	if (v1 < v2)
	{
		return NSOrderedAscending;
	}
	else if (v1 > v2)
	{
		return NSOrderedDescending;
	}
	else
	{
		/* Event start time is the same, compare by duration.
		 */
		int d1 = [event1 eventDurationInMinutes];
		int d2 = [event2 eventDurationInMinutes];
		
		if (d1 < d2)
		{
			/*
			 * Event with a shorter duration is after an event
			 * with a longer duration. Looks nicer when drawing the events.
			 */
			return NSOrderedDescending;
		}
		else if (d1 > d2)
		{
			return NSOrderedAscending;
		}
		else
		{
			/*
			 * The last resort: compare by title.
			 */
			return [[event1 eventTitle] compare:[event2 eventTitle]];
		}
	}
}
