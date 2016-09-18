//
//  SOSNote.m
//  spd
//
//  Created by Jason Scharff on 9/18/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

#import "SOSNote.h"

@implementation SOSNote

+ (instancetype)createFromDictionary : (NSDictionary *)dictionary {
    SOSNote *note = [[SOSNote alloc]init];
    NSNumber *serverID = dictionary[@"id"];
    if(serverID) {
        note.serverID = serverID.integerValue;
    }
    NSString *title = dictionary[@"title"];
    if(title) {
        note.title = title;
    }
    NSString *imageURL = dictionary[@"image_url"];
    if(imageURL) {
        note.imageURL = [NSURL URLWithString:imageURL];
    }
    NSString *summary = dictionary[@"summary"];
    if(summary) {
        note.summary = summary;
    }
    NSArray *categories = dictionary[@"categories"];
    NSMutableArray *categoryObjects = [[NSMutableArray alloc]initWithCapacity:categories.count];
    for (NSDictionary *dictionary in categories) {
        SOSCategory *category = [SOSCategory createFromDictionary:dictionary];
        [categoryObjects addObject:category];
    }
    note.categories = [NSArray arrayWithArray:categoryObjects];
    
    return note;
}

@end
