//
//  EDAMovieClient.h
//  Unit 4 Challenge
//
//  Created by Eric Andersen on 9/21/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDAMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface EDAMovieClient : NSObject

+ (void)fetchPostsWithSearchTerm:(NSString *)searchTerm
                  withCompletion:(void (^_Nullable)(NSArray<EDAMovie *> *_Nullable movies, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
