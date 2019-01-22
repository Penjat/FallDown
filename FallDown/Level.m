//
//  Level.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "Level.h"

@implementation Level

-(instancetype)initWithName: (NSString*)name doCatch:(NSArray*)doCatch dontCatch:(NSArray*)dontCatch{
    self = [super init];
    if (self) {
        _name = name;
        _doCatchArray = doCatch;
        _dontCatchArray = dontCatch;
    }
    return self;
}


@end
