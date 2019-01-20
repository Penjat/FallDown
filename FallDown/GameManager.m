//
//  GameManagerDataModel.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "GameManager.h"


@implementation GameManager

-(instancetype)initWithDelegate:(id<SpriteCreator>)delegate{
    self = [super init];
    if (self) {
        _delegate = delegate;
        
        self.playableArea = [self.delegate getScreenSize];
    }
    return self;
}
-(void)startGame{
    NSLog(@"statring game");
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 0.5
                                                  target: self
                                                selector:@selector(createRandomFaller)
                                                userInfo: nil repeats:YES];
    
    [self.delegate createFallerAtPosition:300];
}
-(void)createRandomFaller{
    
    float random = arc4random_uniform(self.playableArea) - (self.playableArea/2);
    [self.delegate createFallerAtPosition:random ];
}

@end
