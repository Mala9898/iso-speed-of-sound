//
//  SOSHTTPSessionManager.h
//  spd
//
//  Created by Jason Scharff on 9/18/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void (^SOSHTTPBinaryCompletionLevelBlock)(NSError *error);
typedef void (^SOSHTTPResponseBlock)(NSError *error, id response);

@class SOSNote;

@interface SOSHTTPSessionManager : AFHTTPSessionManager

@property (nonatomic) SOSNote *note;


+ (instancetype)sharedManager;

- (void)loginWithUsername : (NSString *)username
                 password : (NSString *)password
               completion : (SOSHTTPBinaryCompletionLevelBlock)completion;

- (void)createAccountWithUsername : (NSString *)username
                         password : (NSString *)password
                       completion : (SOSHTTPBinaryCompletionLevelBlock) completion;

- (void)uploadImage : (UIImage *)image
         completion : (SOSHTTPResponseBlock)completion;

- (void)getNotesWithCompletion : (SOSHTTPResponseBlock)completion;

@end
