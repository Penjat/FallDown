//
//  Faller.h
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "FallerData.h"
@class Faller;

NS_ASSUME_NONNULL_BEGIN

@protocol FallerViewController


-(void)addToScore:(Faller*)faller;
@end

@interface Faller : SKLabelNode

@property (weak,nonatomic) id <FallerViewController>delegate;
@property (nonatomic)BOOL shouldCatch;
-(instancetype)initWithData:(FallerData*)data;
-(void)reachedTheBottom;


@end

NS_ASSUME_NONNULL_END
