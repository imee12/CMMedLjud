//
//  ViewController.h
//  CMAvecSound
//
//  Created by Imee Cuison on 11/21/15.
//  Copyright © 2015 Imee Cuison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface APLGraphViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *updateIntervalLabel;

- (void)setLabelValueX:(double)x y:(double)y z:(double)z;
- (void)setLabelValueRoll:(double)roll pitch:(double)pitch yaw:(double)yaw;
- (void)startUpdatesWithSliderValue:(int)sliderValue;

@end


