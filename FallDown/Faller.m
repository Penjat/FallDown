//
//  Faller.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "Faller.h"

@implementation Faller

- (instancetype)initWithString:(NSString *)emoji shouldCatch:(BOOL)shouldCatch
{
    self = [super initWithFontNamed:@"ArialRoundedMTBold"];
    if (self) {
        self.text = emoji;
        _shouldCatch = shouldCatch;
    }
    return self;
}


-(void)reachedTheBottom{
    NSLog(@"adding to score");
    [self.delegate addToScore:self];
}

@end
