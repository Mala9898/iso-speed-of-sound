//
//  SOSQuizlet.m
//  spd
//
//  Created by Stanley Malec on 18/09/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import "SOSQuizlet.h"

@implementation SOSQuizlet

+(instancetype)createFromDictionary:(NSDictionary *)dictionary {
    SOSQuizlet *quizlet = [[SOSQuizlet alloc]init];
    NSString *term = dictionary[@"term"];
    if(term) {
        quizlet.term = term;
    }
    NSString *definition = dictionary[@"definition"];
    if(definition) {
        quizlet.definition = definition;
    }
    return quizlet;
}

@end
