//
//  Player.h
//  FallDown
//
//  Created by Spencer Symington on 2019-01-23.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : SKSpriteNode

@property (nonatomic) NSInteger numberOfLives;

-(void)loseLife;
@end

NS_ASSUME_NONNULL_END
