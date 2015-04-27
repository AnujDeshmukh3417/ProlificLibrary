//
//  LibraryServerController.h
//  ProlificLibrary
//
//  Created by ANUJ DESHMUKH on 4/25/15.
//  Copyright (c) 2015 DESHMUKH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProlificBooksHTTPClient.h"
@protocol libraryServerControllerDelegate;

@interface LibraryServerController : NSObject <ProlificBooksHTTPClientDelegate> {
    ProlificBooksHTTPClient *httpClient;
}
@property (nonatomic, weak) id <libraryServerControllerDelegate> delegate;
-(void)getBooks;
-(void) getBook:(NSString*)urlParameter;


@end
@protocol libraryServerControllerDelegate <NSObject>
@optional
-(void)didReveiveBooksFromServer:(NSArray *)books didFailWithError:(NSError*)err;
@end