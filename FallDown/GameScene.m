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
@implementation GameScene {
    
}


- (void)didMoveToView:(SKView *)view {
    self.physicsWorld.contactDelegate = self;
    
    
    self.paddel = [SKSpriteNode spriteNodeWithColor:UIColor.redColor size:CGSizeMake(100.0, 15.0)] ;
    self.paddel.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100.0, 100.0)];
    [self addChild:self.paddel];
    
    
    self.paddel.physicsBody.collisionBitMask = 2;
    self.paddel.physicsBody.contactTestBitMask = 1;
    self.paddel.physicsBody.categoryBitMask = 1;
    self.paddel.physicsBody.dynamic = YES;
    
    
    
    
    SKSpriteNode *testBlock = [SKSpriteNode spriteNodeWithColor:UIColor.blueColor size:CGSizeMake(100.0, 100.0)];
    testBlock.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100.0, 100.0)];
    testBlock.position = CGPointMake(300, 0);
    testBlock.physicsBody.collisionBitMask = 1;
    testBlock.physicsBody.contactTestBitMask = 1;
    testBlock.physicsBody.categoryBitMask = 2;
    testBlock.physicsBody.dynamic = YES;
    
    
    SKAction *fallDown = [SKAction moveTo:CGPointMake(300, 300) duration:2.0];
    SKAction *testAction = [SKAction performSelector:@selector(testCall) onTarget:self];
    
    [testBlock runAction:testAction];
    
    
    [self addChild:testBlock];
    
}
-(void)testCall{
    
    NSLog(@"test call");
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
    
    self.paddel.position = CGPointMake(touchPoint.x, 0.0);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    
    
    CGPoint touchPoint = [touch locationInNode:self];
    
    self.paddel.position = CGPointMake(touchPoint.x, 0.0);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
