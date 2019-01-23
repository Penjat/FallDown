//
//  GameManagerDataModel.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "GameManager.h"
#import "FallerDatabase.h"
#import "LevelManager.h"
#import "Level.h"


@interface GameManager (){
    
}
@property (strong,nonatomic)LevelManager *levelManager;
@property (weak,nonatomic)id<SpriteCreator>delegate;
@property (strong,nonatomic)FallerDatabase *fallerDatabase;
@property float playableArea;

@property (strong,nonatomic)Level *curLevel;

@property (strong,nonatomic)NSArray <FallerData*> *posibleFallers;

@end

@implementation GameManager

-(instancetype)initWithDelegate:(id<SpriteCreator>)delegate{
    self = [super init];
    if (self) {
        
        _delegate = delegate;
        _fallerDatabase = [[FallerDatabase alloc]init];
        _levelManager = [[LevelManager alloc]init];
        
        self.playableArea = [self.delegate getScreenSize];
    }
    return self;
}
-(NSString*)prepareLevel{
    //tells the game manager to get a level
    //returns the current level name
    //could return the whole level in futre if needed
    self.curLevel = [self.levelManager getLevel];
    return self.curLevel.name;
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
    //randomly choose a should catch or shouldn't catch
    //can be better about choosing the ratio of these
    BOOL shouldCatch = arc4random_uniform(2);
    if(shouldCatch){
        NSLog(@"should catch");
        
        float randomPosition = arc4random_uniform(self.playableArea) - (self.playableArea/2);
        int randomFallerIndex = arc4random_uniform(self.curLevel.doCatchArray.count);
        FallerData *fallerData = [[FallerData alloc]initWithEmoji: self.curLevel.doCatchArray [randomFallerIndex]];
        [self.delegate createFaller:fallerData AtPosition:randomPosition ];
        //TODO set bool
    }else{
        NSLog(@"should catch");
        
        float randomPosition = arc4random_uniform(self.playableArea) - (self.playableArea/2);
        int randomFallerIndex = arc4random_uniform(self.curLevel.dontCatchArray.count);
        
        FallerData *fallerData = [[FallerData alloc]initWithEmoji: self.curLevel.dontCatchArray [randomFallerIndex]];
        [self.delegate createFaller:fallerData AtPosition:randomPosition ];
        //TODO set bool
    }
    
    
    
}

@end
