//
//  EDAMovie.h
//  Unit 4 Challenge
//
//  Created by Eric Andersen on 9/21/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDAMovie : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSNumber *rating;
@property (nonatomic, readonly, copy) NSString *overview;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
