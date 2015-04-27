//
//  Book.h
//  Weather
//
//  Created by ANUJ DESHMUKH on 4/24/15.
//  Copyright (c) 2015 Scott Sherwood. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 {
 "author": "Ash Maurya",
 "categories": "process",
 "lastCheckedOut": null,
 "lastCheckedOutBy": null,
 "publisher": "O'REILLY",
 "title": "Running Lean",
 "url": "/books/1"
 }
 */
@interface Book : NSObject {
    NSString *author;
    NSString *categories;
    NSString *lastCheckedOut;
    NSString *lastCheckedOutBy;
    NSString *publisher;
    NSString *title;
    NSString *urlParameter;
}

@property (nonatomic, retain) NSString *author;
@property (nonatomic, retain) NSString *categories;
@property (nonatomic, retain) NSString *lastCheckedOut;
@property (nonatomic, retain) NSString *lastCheckedOutBy;
@property (nonatomic, retain) NSString *publisher;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *urlParameter;
+(Book*)initWithBookDictionary :(NSDictionary*) book;

@end
