//
//  LLNetWorkCache.m
//  LLNetWorkTool
//
//  Created by leiliao lai on 16/8/31.
//  Copyright © 2016年 Hailang. All rights reserved.
//

#import "LLNetworkCache.h"

#import "YYCache.h"

@implementation LLNetworkCache
static NSString *const NetworkResponseCache = @"NetworkResponseCache";
static YYCache *_dataCache;


+ (void)initialize
{
    _dataCache = [YYCache cacheWithName:NetworkResponseCache];
}

+ (void)saveHttpCache:(id)httpCache forKey:(NSString *)key
{
    //异步缓存,不会阻塞主线程
    [_dataCache setObject:httpCache forKey:key withBlock:nil];
}

+ (id)getHttpCacheForKey:(NSString *)key
{
    return [_dataCache objectForKey:key];
}

+ (NSInteger)getAllHttpCacheSize
{
    return [_dataCache.diskCache totalCost];
}

+ (void)removeAllHttpCache
{
    [_dataCache.diskCache removeAllObjects];
}


@end
