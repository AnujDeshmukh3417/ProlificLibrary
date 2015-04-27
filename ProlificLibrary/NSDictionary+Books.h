//
//  NSDictionary+Books.h
//  ProlificLibrary
//
//  Created by ANUJ DESHMUKH on 4/26/15.
//  Copyright (c) 2015 DESHMUKH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BooksData)

-(NSString*) getTitle;
-(NSString*) getAuthor;
-(NSString*) getCategories;
-(NSString*) getLastCheckOutDateTime;
-(NSString*) getLastCheckOutBy;
-(NSString*) getPublisher;
-(NSString*) getUrlParameter;

@end
