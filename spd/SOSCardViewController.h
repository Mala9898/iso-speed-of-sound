//
//  SOSCardViewController.h
//  spd
//
//  Created by Jason Scharff on 9/18/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SOSQuizlet;

@interface SOSCardViewController : UIViewController

@property (nonatomic, strong) NSArray <SOSQuizlet *> *cards;

@end
