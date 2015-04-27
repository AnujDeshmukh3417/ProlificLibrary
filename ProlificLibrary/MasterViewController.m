//
//  MasterViewController.m
//  ProlificLibrary
//
//  Created by ANUJ DESHMUKH on 4/25/15.
//  Copyright (c) 2015 DESHMUKH. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NSDictionary+Books.h"
#import "Book.h"

@interface MasterViewController ()

@property NSMutableArray *tblViewSourceArr;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tblViewSourceArr = [[NSMutableArray alloc] init];

    ProlificBooksHTTPClient *client = [ProlificBooksHTTPClient sharedProlificBooksHTTPClient];
    client.delegate = self;
   [client getBooks];
}

-(void)viewDidAppear:(BOOL)animated {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.tblViewSourceArr) {
        self.tblViewSourceArr = [[NSMutableArray alloc] init];
    }
    [self.tblViewSourceArr insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)booksReceived:(NSArray *)books didFailWithError:(NSError*)err {
    if ([self.tblViewSourceArr count] >0 ) {
        [self.tblViewSourceArr removeAllObjects];
    }
    [self.tblViewSourceArr addObjectsFromArray:books];
    [self.tableView reloadData];
}
-(void)didReveiveBooksFromServer:(NSArray *)books didFailWithError:(NSError*)err {
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = self.tblViewSourceArr[indexPath.row];
        [[segue destinationViewController] setUrlBookParam:[object getUrlParameter]];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tblViewSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *book = self.tblViewSourceArr[indexPath.row];
    cell.textLabel.text = [book getTitle];
    cell.detailTextLabel.text = [book getAuthor];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tblViewSourceArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (IBAction)addBooksAction:(id)sender {
    if (!self.tblViewSourceArr) {
        self.tblViewSourceArr = [[NSMutableArray alloc] init];
    }
    [self.tblViewSourceArr insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
