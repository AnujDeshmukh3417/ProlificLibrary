//
//  ProlificBooksHTTPClient.m
//  ProlificTrialURLConnection
//
//  Created by ANUJ DESHMUKH on 4/24/15.
//  Copyright (c) 2015 DESHMUKH. All rights reserved.
//

#import "ProlificBooksHTTPClient.h"
#import "NSDictionary+Books.h"
static NSString * const prolificLibraryURL = @"http://prolific-interview.herokuapp.com/553ad4b4fab89800092dc4f4";

@implementation ProlificBooksHTTPClient
+ (ProlificBooksHTTPClient *)sharedProlificBooksHTTPClient {
    static ProlificBooksHTTPClient *_sharedProlificBooksHTTPClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedProlificBooksHTTPClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:prolificLibraryURL]];
    });
    return _sharedProlificBooksHTTPClient;
}
- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

- (void)getBooks
{
    
   
    [self GET:@"http://prolific-interview.herokuapp.com/553ad4b4fab89800092dc4f4/books/" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *arrBooks = (NSArray*) responseObject;
        [self.delegate booksReceived:arrBooks didFailWithError:nil];
        NSLog(@"response received ------- %@",arrBooks);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //NSLog(@"Error found ------- %@",error);
    }];
}

- (void)getBookWithURLParameter:(NSString*)parameter {
    [self GET:[NSString stringWithFormat:@"%@%@",prolificLibraryURL,parameter] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dictBook = (NSDictionary*) responseObject;
        [self.bookDataDElegate bookReceived:dictBook];
        NSLog(@"response received ------- %@",[dictBook getTitle]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error found ------- %@",error);
    }];
}
- (void)addBookData:(NSDictionary*)parameters {
    
    /*{
     "author": "Ash Maurya",
     "categories": "process",
     "lastCheckedOut": null,
     "lastCheckedOutBy": null,
     "publisher": "",
     "title": "Running Lean",
     "url": "/books/1"
     }*/
    
    NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc]init];
    [parameterDict setValue:@"Ash Maurya" forKey:@"author"];
    [parameterDict setValue:@"process" forKey:@"categories"];
    [parameterDict setValue:@"Running Lean" forKey:@"title"];
    [parameterDict setValue:@"O'REILLY" forKey:@"publisher"];
    
    [self POST:@"http://prolific-interview.herokuapp.com/553ad4b4fab89800092dc4f4/books/"  parameters:parameterDict constructingBodyWithBlock:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dictBook = (NSDictionary*) responseObject;
       // [self.bookDataDElegate bookReceived:dictBook];
        NSLog(@"response received ------- %@",[dictBook getTitle]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error found ------- %@",error);
    }];
    
    
}
- (void)deleteRequest:(NSString*)parameter {
   /* [self DELETE:@"http://prolific-interview.herokuapp.com/553ad4b4fab89800092dc4f4/books/7" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //[self.bookDataDElegate bookReceived:responseObject];
        NSLog(@"response received ------- %@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error found ------- %@",error);
    }];*/
    
    
}
@end
