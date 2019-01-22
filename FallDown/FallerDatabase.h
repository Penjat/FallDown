//
//  FallerDatabase.h
//  FallDown
//
//  Created by Spencer Symington on 2019-01-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FallerData.h"

NS_ASSUME_NONNULL_BEGIN

@interface FallerDatabase : NSObject
@property (strong,nonatomic) NSArray<FallerData*> *objectDatabase;
@end
 
NS_ASSUME_NONNULL_END
