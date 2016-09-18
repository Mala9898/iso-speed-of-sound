//
//  SOSCardViewController.m
//  spd
//
//  Created by Jason Scharff on 9/18/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import "SOSCardViewController.h"

#import "AutolayoutHelper.h"

@interface SOSCardViewController ()

@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation SOSCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:19.f/255.f
                                                green:154.f/255.f
                                                 blue:218/255.f
                                                alpha:1.0];
    
    self.nextButton = [[UIButton alloc]init];
    self.previousButton = [[UIButton alloc]init];
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [self.previousButton setTitle:@"Previous" forState:UIControlStateNormal];
    
    [AutolayoutHelper configureView:self.view
                           subViews:NSDictionaryOfVariableBindings(_nextButton, _previousButton)
                        constraints:@[]];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
