//
//  DetailViewController.h
//  ProlificLibrary
//
//  Created by ANUJ DESHMUKH on 4/25/15.
//  Copyright (c) 2015 DESHMUKH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "ProlificBooksHTTPClient.h"
@interface DetailViewController : UIViewController<LibraryBookHTTPClientDetailDelegate,UIAlertViewDelegate> {
  
}

@property (strong, nonatomic) NSString *urlBookParam;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
-(void)setUrlBookParam:(NSString *)urlBookParam;
@end

