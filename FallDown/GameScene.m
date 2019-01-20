//
//  GameScene.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "GameScene.h"



enum categgoryMask {
    PADDEL = 1,
    FALLER = 1<<1
    
    
};

@interface GameScene (){
    
    
}

@property (strong,nonatomic) GameManager *gameManager;
@property float playerYPos;

@end

@implementation GameScene
    


-(float)getScreenSize{
    
    return self.size.width;
}

-(void)addToScore:(Faller*)faller{
    [faller removeFromParent];
}
- (void)didMoveToView:(SKView *)view {
    
    
    
    
    self.gameManager = [[GameManager alloc]initWithDelegate:self];
    
    
    self.physicsWorld.contactDelegate = self;
    
    //--------------- Create the Player--------------------------------
    self.paddel = [SKSpriteNode spriteNodeWithColor:UIColor.redColor size:CGSizeMake(100.0, 15.0)] ;
    self.paddel.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100.0, 15.0)];
    [self addChild:self.paddel];
    
    self.playerYPos = (-self.size.height /2.0)+80.0;
    self.paddel.position = CGPointMake(0, self.playerYPos);
    
    
    self.paddel.physicsBody.collisionBitMask = 2;
    self.paddel.physicsBody.contactTestBitMask = 1;
    self.paddel.physicsBody.categoryBitMask = 1;
    self.paddel.physicsBody.dynamic = NO;
    //-----------------------------------------------------------------
    
    //[self.gameManager startGame];
    //TODO set up level intro
    [self startIntro];
    
}
-(void)startIntro{
    NSLog(@"starting intro");
    SKLabelNode *levelIntro = [[SKLabelNode alloc]initWithFontNamed:@"ArialRoundedMTBold"];
    
    
}
-(void)endIntro{
    
}

-(void)createFaller:(FallerData*)fallerData AtPosition:(float)xPosition{
    
    //create the size of the sprite
    CGSize fallerSize = CGSizeMake(100.0, 100.0);
    
    //create sprite and physics body
    //Faller *faller = [Faller spriteNodeWithColor:UIColor.blueColor size:fallerSize];
    Faller *faller = [[Faller alloc]initWithFontNamed:@"ArialRoundedMTBold"];
    
    //TODO pass the fallerData into Faller
    faller.text = fallerData.emoji;
    faller.fontSize = 180.0;
    
    faller.delegate = self;
    faller.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:fallerSize];
    
    //set the position
    faller.position = CGPointMake(xPosition, self.size.height);
    
    //set up masks
    faller.physicsBody.collisionBitMask = 1;
    faller.physicsBody.contactTestBitMask = 1;
    faller.physicsBody.categoryBitMask = 2;
    faller.physicsBody.dynamic = YES;
    
    //set it in motion and the add to score
    SKAction *fallDown = [SKAction moveTo:CGPointMake(xPosition, -self.size.height/2) duration:5.0];
    SKAction *addToScore = [SKAction performSelector:@selector(reachedTheBottom) onTarget:faller];
    
    
    
    
    [faller runAction:fallDown];
    [faller runAction:[SKAction sequence:@[fallDown,addToScore] ]];
    
    //add it to scene
    [self addChild:faller];
    
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    NSLog(@"contact has started.");
    if(contact.bodyA.categoryBitMask & FALLER ){
        NSLog(@"bodyA is a faller");
        [contact.bodyA.node removeFromParent];
    }
    if(contact.bodyB.categoryBitMask & FALLER ){
        NSLog(@"bodyB is a faller");
        [contact.bodyB.node removeFromParent];
    }
    
}
-(void)didEndContact:(SKPhysicsContact *)contact{
    NSLog(@"contact has ended.");
}

- (void)touchDownAtPoint:(CGPoint)pos {
    
}

- (void)touchMovedToPoint:(CGPoint)pos {
    
}

- (void)touchUpAtPoint:(CGPoint)pos {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    
    
    CGPoint touchPoint = [touch locationInNode:self];
    
    self.paddel.position = CGPointMake(touchPoint.x, self.playerYPos);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    
    
    CGPoint touchPoint = [touch locationInNode:self];
    
    self.paddel.position = CGPointMake(touchPoint.x, self.playerYPos);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}



@end
