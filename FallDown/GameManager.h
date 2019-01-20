//
//  GameManagerDataModel.h
//  FallDown
//
//  Created by Spencer Symington on 2019-01-19.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SpriteCreator

-(void)createFallerAtPosition:(float)xPosition;
-(float)getScreenSize;

@end

@interface GameManager : NSObject

@property (weak,nonatomic)id<SpriteCreator>delegate;
@property float playableArea;

-(instancetype)initWithDelegate:(id<SpriteCreator>)delegate;
-(void)startGame;

@end

NS_ASSUME_NONNULL_END
