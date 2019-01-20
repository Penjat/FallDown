//
//  GameManagerDataModel.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "GameManager.h"
#import "FallerDatabase.h"


@interface GameManager (){
    
}

@property (weak,nonatomic)id<SpriteCreator>delegate;
@property (strong,nonatomic)FallerDatabase *fallerDatabase;
@property float playableArea;

@property (strong,nonatomic)NSArray <FallerData*> *posibleFallers;

@end

@implementation GameManager

-(instancetype)initWithDelegate:(id<SpriteCreator>)delegate{
    self = [super init];
    if (self) {
        
        _delegate = delegate;
        _fallerDatabase = [[FallerDatabase alloc]init];
        
        
        self.playableArea = [self.delegate getScreenSize];
    }
    return self;
}
-(void)startGame{
    NSLog(@"statring game");
    
    //TODO get based on the level
    self.posibleFallers =self.fallerDatabase.objectDatabase;
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 0.5
                                                  target: self
                                                selector:@selector(createRandomFaller)
                                                userInfo: nil repeats:YES];
    
    
}
-(void)createRandomFaller{
    
    float randomPosition = arc4random_uniform(self.playableArea) - (self.playableArea/2);
    int randomFallerIndex = arc4random_uniform(self.posibleFallers.count);
    FallerData *fallerData = self.posibleFallers[randomFallerIndex];
    [self.delegate createFaller:fallerData AtPosition:randomPosition ];
    
}

@end
