//
//  SOSQuizlet.h
//  spd
//
//  Created by Stanley Malec on 18/09/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOSQuizlet : NSObject

@property (nonatomic, strong) NSString *term;
@property (nonatomic, strong) NSString *definition;

+(instancetype)createFromDictionary:(NSDictionary*)dictionary;


@end
