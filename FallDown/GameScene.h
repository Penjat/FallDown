//
//  GameScene.h
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Faller.h"
#import "GameManager.h"

@interface GameScene : SKScene <SKPhysicsContactDelegate,FallerViewController>


@property (strong,nonatomic) SKSpriteNode *paddel;

-(void)createFallerAtPosition:(float)point;
-(float)getScreenSize;
-(void)addToScore;

@end
