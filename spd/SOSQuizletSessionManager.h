//
//  SOSQuizletSessionManager.h
//  spd
//
//  Created by Stanley Malec on 18/09/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void (^SOSHTTPResponseBlock)(NSError *error, id response);

@interface SOSQuizletSessionManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

@end
