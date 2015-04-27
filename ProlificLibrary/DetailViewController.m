//
//  DetailViewController.m
//  ProlificLibrary
//
//  Created by ANUJ DESHMUKH on 4/25/15.
//  Copyright (c) 2015 DESHMUKH. All rights reserved.
//

#import "DetailViewController.h"
#import "ProlificBooksHTTPClient.h"
#import "NSDictionary+Books.h"
#import <Social/Social.h>
@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *titleTxtView;
@property (weak, nonatomic) IBOutlet UILabel *publisherLbl;
@property (weak, nonatomic) IBOutlet UILabel *tagsLbl;
@property (weak, nonatomic) IBOutlet UILabel *LastCheckOutHdrLbl;
@property (weak, nonatomic) IBOutlet UILabel *LastCheckOutLbl;
- (IBAction)checkoutBtnAction:(id)sender;
@property (nonatomic,retain) NSDictionary *bookData;
@property (strong,nonatomic)  UITextField *alertText;
@property (weak, nonatomic) IBOutlet UILabel *authorLbl;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {

}

- (void)configureView {
    
}

-(void)setUrlBookParam:(NSString *)urlBookParameter {
    if (urlBookParameter!=nil || urlBookParameter.length >0) {
        ProlificBooksHTTPClient *client = [ProlificBooksHTTPClient sharedProlificBooksHTTPClient];
        client.bookDataDElegate = self;
        [client getBookWithURLParameter:urlBookParameter];
        
    }
}

-(void)bookReceived:(NSDictionary *)book {
    NSLog(@"%@",book);
    self.bookData = book;
    self.titleTxtView.text = [book getTitle];
    self.authorLbl.text = [book getAuthor];
    self.tagsLbl.text = [book getCategories];
    self.publisherLbl.text = [book getPublisher];
    self.LastCheckOutHdrLbl.text = @"Last Checked Out:";
    //self.LastCheckOutLbl.text =[book getLastCheckOutDateTime];
}

-(void) didFailWithError:(NSError*)err {
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage* image3 = [UIImage imageNamed:@"shareIcon.png"];
    CGRect frameimg = CGRectMake(0, 0, image3.size.width, image3.size.height);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
    [someButton addTarget:self action:@selector(shareTwitter)
         forControlEvents:UIControlEventTouchUpInside];
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=mailbutton;
    
}
-(void)shareTwitter {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        NSString *strTweet = [NSString stringWithFormat:@"Check out an awesome book!! %@ by %@",[self.bookData getTitle],[self.bookData getAuthor]];
        [tweetSheet setInitialText:strTweet];
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkoutBtnAction:(id)sender {

    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Please enter your name" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alrt.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[alrt textFieldAtIndex:0] setPlaceholder:@"Enter postal Code"];
    _alertText = [alrt textFieldAtIndex:0];
    _alertText.keyboardType = UIKeyboardTypeAlphabet;
    alrt.tag=100;
    [alrt show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"OK"])
    {
        UITextField *username = [alertView textFieldAtIndex:0];
        //NSString *str = username.text;
        
        
    }
}
@end
