//
//  Book.m
//  Weather
//
//  Created by ANUJ DESHMUKH on 4/24/15.
//  Copyright (c) 2015 Scott Sherwood. All rights reserved.
//

#import "Book.h"

@implementation Book
@synthesize author;
@synthesize categories;
@synthesize lastCheckedOut;
@synthesize lastCheckedOutBy;
@synthesize publisher;
@synthesize title;
@synthesize urlParameter;

+(Book*)initWithBookDictionary :(NSDictionary*) bookDict; {
    Book *book = [[Book alloc]init];
    NSLog(@"%@",bookDict);
    book.author = @"--";
    book.categories = @"--";
    book.lastCheckedOut = @"--";
    book.lastCheckedOutBy = @"--";
    book.publisher = @"--";
    book.title = @"--";
    book.urlParameter = @"--";
    if ([bookDict allKeys]>0) {
        if ([bookDict valueForKey:@"author"]) {
            book.author = [NSString stringWithString:[bookDict valueForKey:@"author"]];
        }
        if ([bookDict valueForKey:@"categories"]) {
            book.categories = [NSString stringWithString:[bookDict valueForKey:@"categories"]];
        }
        if ([bookDict valueForKey:@"lastCheckedOut"]) {
            //book.lastCheckedOut = [NSString stringWithString:[bookDict valueForKey:@"lastCheckedOut"]];
        }
        if ([bookDict valueForKey:@"lastCheckedOutBy"] != NULL) {
            //book.lastCheckedOutBy = [NSString stringWithString:[bookDict valueForKey:@"lastCheckedOutBy"]];
        }
        if ([bookDict valueForKey:@"title"]) {
            book.title = [NSString stringWithString:[bookDict valueForKey:@"title"]];
        }
        
    }
    return book;
}




@end
