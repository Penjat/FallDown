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
    self.paddel = [Player spriteNodeWithColor:UIColor.redColor size:CGSizeMake(100.0, 15.0)] ;
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
    NSString *levelName = [self.gameManager prepareLevel];
    [self startIntroWithName:levelName];
    
}
-(void)startIntroWithName:(NSString*)levelName{
    NSLog(@"starting intro");
    SKLabelNode *levelIntro = [[SKLabelNode alloc]initWithFontNamed:@"ArialRoundedMTBold"];
    [self addChild:levelIntro];
    
    levelIntro.text = levelName;
    levelIntro.position = CGPointMake(0, -300.0);
    levelIntro.alpha = 0.0;
    levelIntro.fontSize = 45.0;
    
    
    //1
    SKAction *moveToCenter = [SKAction moveTo:CGPointMake(0.0, 0.0) duration:1.5];
    SKAction *fadeIn = [SKAction fadeInWithDuration:2.5];
    
    SKAction *fadeInAndMove = [SKAction group:@[moveToCenter,fadeIn]];
    
    //2
    SKAction *wait = [SKAction waitForDuration:1.4];
    
    //3
    SKAction *moveAway = [SKAction moveTo:CGPointMake(0.0, 300.0) duration:1.2];
    SKAction *fadeOut = [SKAction fadeOutWithDuration:0.5];
    
    SKAction *fadeOutAndMove = [SKAction group:@[moveAway,fadeOut]];
    
    //4
    SKAction *startGame = [SKAction performSelector:@selector(startLevel) onTarget:self];
    
    //5
    SKAction *removeSelf = [SKAction removeFromParent];
    
    SKAction *introSequence = [SKAction sequence:@[fadeInAndMove,wait,fadeOutAndMove,startGame,removeSelf]];
    
    [levelIntro runAction:introSequence];
    
    
    
}
-(void)startLevel{
    [self.gameManager startGame];
}

-(void)createFaller:(FallerData*)fallerData AtPosition:(float)xPosition{
    NSLog(@"creating the faller");
    //create the size of the sprite
    CGSize fallerSize = CGSizeMake(100.0, 100.0);
    
    //create sprite and physics body
    //Faller *faller = [Faller spriteNodeWithColor:UIColor.blueColor size:fallerSize];
    //Faller *faller = [[Faller alloc]initWithFontNamed:@"ArialRoundedMTBold"];
    Faller *faller = [[Faller alloc]initWithData:fallerData];
    
    //TODO pass the fallerData into Faller
    //faller.text = fallerData.emoji;
    faller.fontSize = 180.0;
    [self adjustLabelFontSizeToFitRect:faller rect:fallerSize];
    
    
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

-(void)adjustLabelFontSizeToFitRect:(Faller*)labelNode rect:(CGSize)size {
    
    // Determine the font scaling factor that should let the label text fit in the given rectangle.
    double scalingFactor = MIN(size.width / labelNode.frame.size.width, size.height / labelNode.frame.size.height);
    
    // Change the fontSize.
    labelNode.fontSize *= scalingFactor;
    
    // Optionally move the SKLabelNode to the center of the rectangle.
    
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    
    NSLog(@"contact has started.");
    [self checkContact:contact.bodyA];
    [self checkContact:contact.bodyB];
}
-(void)checkContact:(SKPhysicsBody*)body{
    if(body.categoryBitMask & FALLER ){
        //NSLog(@"bodyA is a faller");
        Faller *faller = body.node;
        if(faller.shouldCatch == NO){
            self.paddel.loseLife;
            NSLog(@"shouldn't catch!!!!");
        }else{
            NSLog(@"should add to score");
        }
        [body.node removeFromParent];
    }
}
-(void)didEndContact:(SKPhysicsContact *)contact{
    //NSLog(@"contact has ended.");
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
