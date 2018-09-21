//
//  EDAMovieClient.m
//  Unit 4 Challenge
//
//  Created by Eric Andersen on 9/21/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

#import "EDAMovieClient.h"
#import "Unit_4_Challenge-Swift.h"

@implementation EDAMovieClient

+ (NSURL *)baseURL
{
    return [[NSURL alloc] initWithString:@"https://api.themoviedb.org/3/search/movie"];
}

+ (void)fetchPostsWithSearchTerm:(NSString *)searchTerm withCompletion:(void (^_Nullable)(NSArray<EDAMovie *> *_Nullable movies, NSError *error))completion
{
    NSURL *url = [[self class] movieEndpoint:searchTerm];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            return completion(nil, error);
        }
        
        if (!data) {
            NSLog(@"No Data Available");
            return completion(nil, error);
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *movieDicts = jsonDictionary[@"results"];
        NSMutableArray *movieArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *movieDict in movieDicts) {
            EDAMovie *movie = [[EDAMovie alloc] initWithDictionary:movieDict];
            [movieArray addObject:movie];
        }
        
        completion(movieArray, nil);
        
    }]resume];
}

+ (NSURL *)movieEndpoint:(NSString *)searchTerm
{
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:[EDAMovieClient baseURL] resolvingAgainstBaseURL:YES];
    NSURLQueryItem *queryItem1 = [[NSURLQueryItem alloc] initWithName:@"api_key" value:@"074d7884d100516519344f4f61c8bf90"];
    NSURLQueryItem *queryItem2 = [[NSURLQueryItem alloc] initWithName:@"query" value:searchTerm];
    urlComponents.queryItems = [[NSArray alloc] initWithObjects:queryItem1, queryItem2, nil];
    
    NSLog(@"%@", urlComponents.URL);
    
    return urlComponents.URL;
}

@end
