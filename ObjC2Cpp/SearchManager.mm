//
//  SearchManager.m
//  ObjC2Cpp
//
//  Created by Alexander Yolkin on 4/9/16.
//  Copyright © 2016 Alexander Yolkin. All rights reserved.
//

#import "SearchManager.h"
#include "cppsearch.hpp"

@implementation SearchManager

+ (SearchManager *)sharedManager
{
    static SearchManager * _sharedManager = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[SearchManager alloc] init];
    });
    return _sharedManager;
}

- (void)performSearchWithTemplate:(NSString *)searchFile withPath:(NSString *)searchPath
{
    const char* file = [searchFile cStringUsingEncoding:NSUTF8StringEncoding];
    const char* path = [searchPath cStringUsingEncoding:NSUTF8StringEncoding];
    
    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue1, ^{
        performCppSearch(file, path);
    });
}

void fileFound (char *file, char *path)
{
    NSString *fileStr = [NSString stringWithUTF8String:file];
    NSString *pathStr = [NSString stringWithUTF8String:path];
    [[SearchManager sharedManager] fileFoundObjCWithFile:fileStr andPath:pathStr];
}

- (void)fileFoundObjCWithFile:(NSString *)fileName andPath:(NSString *)path
{
    NSLog(@"%@", [NSString stringWithFormat:@"file found with name %@ and path %@", path, fileName]);

}

@end
