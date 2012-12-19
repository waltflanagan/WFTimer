//
//  NSTimer+WFBlocks.m
//  NSTimerBlocks
//
//  Created by Simons, Mike on 8/28/12.
//  Copyright (c) 2012 Simons, Mike. All rights reserved.
//

#import "NSTimer+WFBlocks.h"
#import <objc/runtime.h>

NSString* const kBlockStoreKey = @"kWFTimerBlockStoreKey";

@interface BlockRunner : NSObject

@property (strong, nonatomic) WFTimerBlock internalBlock;

@end

@implementation BlockRunner

-(void) executeBlock:(NSTimer*)timer
{
   self.internalBlock(timer);
}

@end

@implementation NSTimer (WFBlocks)

+(NSTimer*)timerWithTimeInterval:(NSTimeInterval)interval block:(WFTimerBlock)block repeats:(BOOL)repeats
{
   BlockRunner* theBlockRunner = [BlockRunner new];
   theBlockRunner.internalBlock = block;
   
   NSTimer* timer = [NSTimer timerWithTimeInterval:interval target:theBlockRunner selector:@selector(executeBlock:) userInfo:nil repeats:repeats];
   
   return timer;
}

+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(WFTimerBlock)block repeats:(BOOL)repeats
{
   NSTimer* timer = [self timerWithTimeInterval:interval block:block repeats:repeats];
   
   [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

   return timer;
};



@end
