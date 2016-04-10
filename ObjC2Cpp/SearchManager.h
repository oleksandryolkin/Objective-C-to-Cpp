//
//  SearchManager.h
//  ObjC2Cpp
//
//  Created by Alexander Yolkin on 4/9/16.
//  Copyright © 2016 Alexander Yolkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchManager : NSObject

+ (SearchManager *)sharedManager;

- (void)performSearchWithTemplate:(NSString *)searchFile withPath:(NSString *)searchPath;
- (void)fileFoundObjCWithFile:(NSString *)fileName andPath:(NSString *)path;

@end
