//
//  ProlificBooksHTTPClient.h
//  ProlificTrialURLConnection
//
//  Created by ANUJ DESHMUKH on 4/24/15.
//  Copyright (c) 2015 DESHMUKH. All rights reserved.
//

#import "AFHTTPSessionManager.h"
@protocol ProlificBooksHTTPClientDelegate;
@protocol LibraryBookHTTPClientDetailDelegate;
@interface ProlificBooksHTTPClient : AFHTTPSessionManager
@property (nonatomic, weak) id <ProlificBooksHTTPClientDelegate> delegate;
@property (nonatomic, weak) id <LibraryBookHTTPClientDetailDelegate> bookDataDElegate;

+ (ProlificBooksHTTPClient *)sharedProlificBooksHTTPClient;
- (instancetype)initWithBaseURL:(NSURL *)url;
- (void)getBooks;
- (void)getBookWithURLParameter:(NSString*)parameter;
- (void)deleteRequest:(NSString*)parameter;
- (void)addBookData:(NSDictionary*)parameters;
@end
@protocol ProlificBooksHTTPClientDelegate <NSObject>
@optional
-(void)didReceiveBooksData:(NSArray*)books;
-(void)didFailWithError:(NSError*)err;
-(void)booksReceived:(NSArray *)books didFailWithError:(NSError*)err;
@end

@protocol LibraryBookHTTPClientDetailDelegate <NSObject>
@optional
-(void)bookReceived:(NSDictionary *)book;
-(void) didFailWithError:(NSError*)err;

@end