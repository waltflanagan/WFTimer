NSTimer+WFBlocks
=======

Simple block support for NSTimer.

###Usage

Simply use as you would a normal timer except provide a ^(NSTimer*) block that will be executed every time that the timer fires.

The following class methods are implemented:

```
+(NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(WFTimerBlock)block repeats:(BOOL)repeats;
+(NSTimer*)timerWithTimeInterval:(NSTimeInterval)interval block:(WFTimerBlock)block repeats:(BOOL)repeats;
```

####ARC

Currently this has only been tested using arc.  It was not intentionally written to support non-arc environments, but it may work on accident.


####User Info
If you need to create an NSTimer that passes along user info, simple set the info on the timer once it is created/scheduled:

```
NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1.0
											   block:^(NSTimer* timer){…}
											 repeats:YES];
										 
timer.userInfo = someObject;
```

The NSTimer will be passed into the block you provide.