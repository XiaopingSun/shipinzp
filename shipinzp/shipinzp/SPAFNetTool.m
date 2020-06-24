//
//  SPAFNetTool.m
//  shipinzp
//
//  Created by 房宇 on 2020/6/23.
//  Copyright © 2020 maita. All rights reserved.
//

#import "SPAFNetTool.h"
#import "AFNetworking.h"

@implementation SPAFNetTool


+ (void)getNetWithURL:(NSString *)URL
                 body:(id)body
             headFile:(NSDictionary *)headFile
        responseStyle:(LQCResponseStyle)reponseStyle
              success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    
    // 1. 创建网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2. 请求头的添加
    if (headFile) {
        for (NSString *key in headFile.allKeys) {
            [manager.requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
        }
    }
    
    // 3. 返回数据的类型
    switch (reponseStyle) {
        case LQCJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case LQCXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
            
        case LQCDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    
    // 4.  响应 返回数据类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/x-javascript",@"image/jpeg", nil]];
    
    // 5. 转码
    URL = [URL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    
    [manager POST:URL parameters:body headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
    // 6. 发送请求
//    [manager GET:URL parameters:body success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//
//
//
//
//        NSString *path = [NSString stringWithFormat:@"%ld.plist", [URL hash]];
////         存储的沙盒路径
//        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//        // 归档
//        [NSKeyedArchiver archiveRootObject:responseObject toFile:[path_doc stringByAppendingPathComponent:path]];
//
//
//        if (responseObject) {
//            success(task, responseObject);
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//
//        // 缓存的文件夹
//        NSString *path = [NSString stringWithFormat:@"%ld.plist", [URL hash]];
//        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//        // 反归档
//        id result = [NSKeyedUnarchiver unarchiveObjectWithFile:[path_doc stringByAppendingPathComponent:path]];
//
//        if (result) {
//            success(task, result);
//
//        } else {
//            failure(task, error);
//        }
//
//        if (error) {
//            failure(task, error);
//        }
//
//    }];
}



@end
