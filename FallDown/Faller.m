//
//  Faller.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "Faller.h"

@implementation Faller




-(void)reachedTheBottom{
    NSLog(@"adding to score");
    [self.delegate addToScore:self];
}

@end
