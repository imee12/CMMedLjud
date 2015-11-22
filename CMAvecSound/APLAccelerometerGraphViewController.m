//
//  ViewController.m
//  CMAvecSound
//
//  Created by Imee Cuison on 11/21/15.
//  Copyright © 2015 Imee Cuison. All rights reserved.
//

#import "APLAccelerometerGraphViewController.h"
#import "APLAppDelegate.h"
#import "APLGraphView.h"

//static const NSTimeInterval accelerometerMin = 0.01;

@interface APLAccelerometerGraphViewController ()

@property (nonatomic, weak) IBOutlet APLGraphView *graphView;

@end


@implementation APLAccelerometerGraphViewController

- (void)startUpdatesWithSliderValue:(int)sliderValue
{
    // NSTimeInterval delta = 0.005;
    //  NSTimeInterval updateInterval = accelerometerMin + delta * sliderValue;
    NSTimeInterval updateInterval = 0.30;
    
    
    CMMotionManager *mManager = [(APLAppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    
    //  APLAccelerometerGraphViewController * __weak weakSelf = self;
    if ([mManager isAccelerometerAvailable] == YES) {
        [mManager setAccelerometerUpdateInterval:updateInterval];
        [mManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            //   [weakSelf.graphView addX:accelerometerData.acceleration.x y:accelerometerData.acceleration.y z:accelerometerData.acceleration.z];
            // [weakSelf setLabelValueX:accelerometerData.acceleration.x y:accelerometerData.acceleration.y z:accelerometerData.acceleration.z];
            if (accelerometerData.acceleration.z < -0.80) {
                printf("it's z");
                
                NSString *music = [[NSBundle mainBundle]pathForResource:@"one" ofType:@"mp3"];
                audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
                audioPlayer.delegate = self;
                audioPlayer.numberOfLoops = -1;
                [audioPlayer play];
                //    [audioPlayer pause];
                [self delay];

                
            }
            
            
        }];
        
    }
    

    //  self.updateIntervalLabel.text = [NSString stringWithFormat:@"%f", updateInterval];
    
}

-(void)delay
{
    [self performSelector:@selector(onePlayed)
               withObject:(nil)
               afterDelay:(2.0)];
}
    
-(void)onePlayed
{
    
    //   if (motion != UIEventSubtypeMotionShake) {
    [audioPlayer pause];
}




- (void)stopUpdates
{
    CMMotionManager *mManager = [(APLAppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    
    if ([mManager isAccelerometerActive] == YES) {
        [mManager stopAccelerometerUpdates];
    }
}

@end
