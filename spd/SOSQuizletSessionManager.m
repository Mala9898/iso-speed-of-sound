//
//  SOSQuizletSessionManager.m
//  spd
//
//  Created by Stanley Malec on 18/09/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import "SOSQuizletSessionManager.h"
#import "SOSQuizlet.h"

@implementation SOSQuizletSessionManager

+ (instancetype)sharedManager {
    static dispatch_once_t once;
    static SOSQuizletSessionManager *_sharedInstance;
    dispatch_once(&once, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (instancetype)init {
    NSURL *baseURL = [NSURL URLWithString:@"https://api.quizlet.com/2.0/sets/"];
    self = [super initWithBaseURL:baseURL];
    if(self) {
        AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self setRequestSerializer:serializer];
    }
    return self;
}

- (void)getQuizletByID: (NSString *)quizletID completion: (SOSHTTPResponseBlock)completion{
    
    NSString *path = [ NSString stringWithFormat:@"%@client_id=y82YhBend&whitespace=1", quizletID];
    
    
    [self GET:path parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray * array = responseObject[@"terms"];
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSDictionary *dictionary in array) {
            SOSQuizlet *quizlet = [SOSQuizlet createFromDictionary:dictionary];
            [mutableArray addObject:quizlet];
        }
        completion(nil, mutableArray);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(error, nil);
    }];
    
}


@end
