//
//  SOSHTTPSessionManager.m
//  spd
//
//  Created by Jason Scharff on 9/18/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import "SOSHTTPSessionManager.h"

#import <JNKeychain/JNKeychain.h>

#import "SOSNote.h"

static NSString * const kSOSAuthTokenKey = @"com.sos.authtoken.key";

@implementation SOSHTTPSessionManager

+ (instancetype)sharedManager {
    static dispatch_once_t once;
    static SOSHTTPSessionManager *_sharedInstance;
    dispatch_once(&once, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (instancetype)init {
    NSURL *baseURL = [NSURL URLWithString:@"http://sos.joseb.me/api/"];
    self = [super initWithBaseURL:baseURL];
    if(self) {
        AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self setRequestSerializer:serializer];
        [self setAuthorizationHeader];
    }
    return self;
}


- (void)setAuthorizationHeader {
    NSString *authToken = [JNKeychain loadValueForKey:kSOSAuthTokenKey];
    if (authToken && authToken.length > 0) {
        [self.requestSerializer setValue:authToken forHTTPHeaderField:@"X-SOS-Authentication"];
    }
}

- (void)loginWithUsername : (NSString *)username
                 password : (NSString *)password
               completion : (SOSHTTPBinaryCompletionLevelBlock)completion {
    
    NSDictionary *parameters = @{@"username" : username,
                                 @"password" : password};
    
    
    [self POST:@"user/login" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //Intentionally left blank.
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *token = responseObject[@"token"];
        [JNKeychain saveValue:token forKey:kSOSAuthTokenKey];
        [self setAuthorizationHeader];
        completion(nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(error);
    }];
}

- (void)createAccountWithUsername : (NSString *)username
                         password : (NSString *)password
                       completion : (SOSHTTPBinaryCompletionLevelBlock) completion {
    
    NSDictionary *parameters = @{@"username" : username,
                                 @"password" : password};
    
    [self POST:@"user/create" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //Intentionally left blank
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *token = responseObject[@"token"];
        [JNKeychain saveValue:token forKey:kSOSAuthTokenKey];
        [self setAuthorizationHeader];
        completion(nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(error);
    }];
}

- (void)uploadImage : (UIImage *)image
         completion : (SOSHTTPResponseBlock)completion {
    [self POST:@"files/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSString *mimeType = @"image/jpeg";
        NSString *filename = [NSString stringWithFormat:@"%@.jpg", [NSUUID UUID].UUIDString];
        
        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.9)
                                    name:@"file"
                                fileName:filename
                                mimeType:mimeType];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //We may want to do something here for UI reasons.
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SOSNote *note = [SOSNote createFromDictionary:responseObject];
        completion(nil, note);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(error, nil);
    }];
}

- (void)getNotesWithCompletion : (SOSHTTPResponseBlock)completion {
    [self GET:@"notes" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //Left empty on purpose.
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *notes = [NSMutableArray array];
        for (NSDictionary *dictionary in responseObject) {
            SOSNote *note = [SOSNote createFromDictionary:dictionary];
            [notes addObject:note];
        }
        completion(nil, notes);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(error, nil);
    }];
}

@end
