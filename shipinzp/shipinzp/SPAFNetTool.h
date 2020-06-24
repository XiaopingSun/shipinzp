//
//  SPAFNetTool.h
//  shipinzp
//
//  Created by 房宇 on 2020/6/23.
//  Copyright © 2020 maita. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LQCResponseStyle) {
    LQCJSON,
    LQCXML,
    LQCDATA,
};


typedef NS_ENUM(NSUInteger, LQCRequestStyle) {
    LQCRequestJSON,
    LQCRequestString,
};


@interface SPAFNetTool : NSObject

@end

NS_ASSUME_NONNULL_END
