//
//  FallerDatabase.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "FallerDatabase.h"
@implementation FallerDatabase

- (instancetype)init
{
    self = [super init];
    if (self) {
        FallerData *star = [[FallerData alloc]initWithEmoji:@"☆"];
        FallerData *moon = [[FallerData alloc]initWithEmoji:@"☽"];
        _objectDatabase = [[NSArray alloc]initWithObjects:star,moon,nil];
    }
    return self;
}

@end
