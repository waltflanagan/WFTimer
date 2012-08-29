//
//  NSTimer+WFBlocks.m
//  NSTimerBlocks
//
//  Created by Simons, Mike on 8/28/12.
//  Copyright (c) 2012 Simons, Mike. All rights reserved.
//

#import "NSTimer+WFBlocks.h"

@implementation NSTimer (WFBlocks)

+(NSTimer*)timerWithTimeInterval:(NSTimeInterval)interval block:(WFTimerBlock)block repeats:(BOOL)repeats
{
   NSMethodSignature* executeBlockSignature = [NSTimer instanceMethodSignatureForSelector:@selector(executeBlock:)];
   NSInvocation* timerInvocation = [NSInvocation invocationWithMethodSignature:executeBlockSignature];
   
   NSTimer* timer = [NSTimer timerWithTimeInterval:interval invocation:timerInvocation repeats:repeats];
   
   [timerInvocation setTarget:timer];
   [timerInvocation setSelector:@selector(executeBlock:)];
   
   [timerInvocation setArgument:&block atIndex:2];

   return timer;
}

+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(WFTimerBlock)block repeats:(BOOL)repeats
{
   NSTimer* timer = [self timerWithTimeInterval:interval block:block repeats:repeats];
   
   [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

   return timer;
};


-(void) executeBlock:(WFTimerBlock)block
{
   block(self);
}



@end
