//
//  FallerData.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "FallerData.h"

@interface FallerData(){
    
    
}

@end

@implementation FallerData

- (instancetype)initWithEmoji:(NSString *)emoji{
    self = [super init];
    if (self) {
        _emoji = emoji;
    }
    return self;
}

@end
