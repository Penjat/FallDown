//
//  FallerData.h
//  FallDown
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FallerData : NSObject

@property (strong,nonatomic)NSString *emoji;
@property (nonatomic)BOOL shouldCatch;

- (instancetype)initWithEmoji:(NSString *)emoji andShouldCatch:(BOOL)shouldCatch;

@end

NS_ASSUME_NONNULL_END
