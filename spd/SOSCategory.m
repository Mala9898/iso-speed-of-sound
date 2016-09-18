//
//  SOSCategory.m
//  spd
//
//  Created by Jason Scharff on 9/18/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import "SOSCategory.h"

@implementation SOSCategory

+ (instancetype)createFromDictionary : (NSDictionary *)dictionary {
    SOSCategory *category = [[SOSCategory alloc]init];
    NSNumber *serverID = dictionary[@"id"];
    if(serverID) {
        category.serverID = serverID.integerValue;
    }
    NSNumber *quizletID = dictionary[@"quizlet_id"];
    if(quizletID) {
        category.quizletID = quizletID.integerValue;
    }
    NSString *name = dictionary[@"name"];
    if(name) {
        category.name = name;
    }
    
    return category;
}

@end
