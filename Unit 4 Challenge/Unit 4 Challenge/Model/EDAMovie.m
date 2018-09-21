//
//  EDAMovie.m
//  Unit 4 Challenge
//
//  Created by Eric Andersen on 9/21/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

#import "EDAMovie.h"

@implementation EDAMovie

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _title = dictionary[@"original_title"];
        _rating = dictionary[@"vote_average"];
        _overview = dictionary[@"overview"];
    }
    
    return self;
}

@end
