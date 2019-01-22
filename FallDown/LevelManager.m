//
//  LevelManager.m
//  FallDown
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "LevelManager.h"

@implementation LevelManager
-(Level*)getLevel{
    //TODO get randomly within bounds
    
    Level *level = [[Level alloc]initWithName:@"bigger that a house" doCatch:@[@"☽",@"🌎",@"⭐️",@"🌪"] dontCatch:@[@"🐢",@"🕷",@"🦋",@"🎾"]];
    
    return level;
}

@end
