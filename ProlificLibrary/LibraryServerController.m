//
//  LibraryServerController.m
//  ProlificLibrary
//
//  Created by ANUJ DESHMUKH on 4/25/15.
//  Copyright (c) 2015 DESHMUKH. All rights reserved.
//

#import "LibraryServerController.h"
#import "Book.h"
#import "NSDictionary+Books.h"

@implementation LibraryServerController

-(void)getBooks {
    ProlificBooksHTTPClient *client = [ProlificBooksHTTPClient sharedProlificBooksHTTPClient];
    client.delegate = self;
    [client getBooks];
}

-(void) getBook:(NSString*)urlParameter {
    
}

-(void)booksReceived:(NSArray *)books didFailWithError:(NSError*)err {
    NSMutableArray *booksArr = [[NSMutableArray alloc]init];
    for (NSDictionary *book in books) {
        NSLog(@" data received from model%@",[book getAuthor]);
        [booksArr addObject:[Book initWithBookDictionary:book]];
    }
    
    [self.delegate didReveiveBooksFromServer:booksArr didFailWithError:nil];
}

@end
