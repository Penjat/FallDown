//
//  Faller.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "Faller.h"

@implementation Faller

- (instancetype)initWithData:(FallerData *)data{
    self = [super initWithFontNamed:@"ArialRoundedMTBold"];
    if (self) {
        self.text = data.emoji;
        _shouldCatch = data.shouldCatch;
    }
    return self;
}


-(void)reachedTheBottom{
    NSLog(@"adding to score");
    [self.delegate addToScore:self];
}

@end
