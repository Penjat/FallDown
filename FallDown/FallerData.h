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
-(instancetype)initWithEmoji:(NSString*)emoji;

@property (strong,nonatomic)NSString *emoji;

@end

NS_ASSUME_NONNULL_END
