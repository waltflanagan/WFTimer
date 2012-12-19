//
//  NSTimer+WFBlocks.h
//  NSTimerBlocks
//
//  Created by Simons, Mike on 8/28/12.
//  Copyright (c) 2012 Simons, Mike. All rights reserved.
//

typedef void(^WFTimerBlock)(NSTimer* timer);

@interface NSTimer (WFBlocks)

+(NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(WFTimerBlock)block repeats:(BOOL)repeats;
+(NSTimer*)timerWithTimeInterval:(NSTimeInterval)interval block:(WFTimerBlock)block repeats:(BOOL)repeats;

@end
