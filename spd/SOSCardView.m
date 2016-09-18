//
//  SOSCardView.m
//  spd
//
//  Created by Jason Scharff on 9/18/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import "SOSCardView.h"

#import "AutolayoutHelper.h"

@interface SOSCardView()

@property (nonatomic) UILabel *label;

@end

@implementation SOSCardView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self commonInit];
    }
    return self;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.label = [UILabel new];
    self.label.font = [UIFont fontWithName:@"Avenir" size:24.0f];
    [AutolayoutHelper configureView:self
                           subViews:NSDictionaryOfVariableBindings(_label)
                        constraints:@[@"X:_label.centerX == superview.centerX",
                                      @"X:_label.centerY == superview.centerX"]];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
