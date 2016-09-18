//
//  SOSNote.h
//  spd
//
//  Created by Jason Scharff on 9/18/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SOSCategory.h"

@interface SOSNote : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic) NSInteger serverID;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSArray <SOSCategory *> *categories;

+ (instancetype)createFromDictionary : (NSDictionary *)dictionary;



@end
