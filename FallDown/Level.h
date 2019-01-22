//
//  Level.h
//  FallDown
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Level : NSObject

@property (strong,nonatomic)NSString *name;
@property (strong,nonatomic)NSArray *doCatchArray;
@property (strong,nonatomic)NSArray *dontCatchArray;

-(instancetype)initWithName: (NSString*)name doCatch:(NSArray*)doCatch dontCatch:(NSArray*)dontCatch;

@end

NS_ASSUME_NONNULL_END
