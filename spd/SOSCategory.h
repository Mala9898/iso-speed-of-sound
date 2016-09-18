//
//  SOSCategory.h
//  spd
//
//  Created by Jason Scharff on 9/18/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOSCategory : NSObject

+ (instancetype)createFromDictionary : (NSDictionary *)dictionary;

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger quizletID;
@property (nonatomic) NSInteger serverID;

@end
