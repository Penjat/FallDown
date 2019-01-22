//
//  LevelManager.h
//  FallDown
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

NS_ASSUME_NONNULL_BEGIN

@interface LevelManager : NSObject
-(Level*)getLevel;
@end

NS_ASSUME_NONNULL_END
