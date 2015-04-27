//
//  NSDictionary+Books.m
//  ProlificLibrary
//
//  Created by ANUJ DESHMUKH on 4/26/15.
//  Copyright (c) 2015 DESHMUKH. All rights reserved.
//

#import "NSDictionary+Books.h"

@implementation NSDictionary (BooksData)

-(NSString*) getTitle {
    return [self objectForKey:@"title"];
}
-(NSString*) getAuthor {
    return [self objectForKey:@"author"];
}
-(NSString*) getCategories {
    return [self objectForKey:@"categories"];
}
-(NSString*) getLastCheckOutDateTime {
    return [self objectForKey:@"lastCheckedOut"];
}
-(NSString*) getLastCheckOutBy {
    return [self objectForKey:@"lastCheckedOutBy"];
}
-(NSString*) getPublisher {
    return [self objectForKey:@"publisher"];
}
-(NSString*) getUrlParameter {
    return [self objectForKey:@"url"];
}

@end
