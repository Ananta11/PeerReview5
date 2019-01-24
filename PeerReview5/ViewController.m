//
//  ViewController.m
//  PeerReview5
//
//  Created by Ananta Shahane on 5/30/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *FacebookTextView;
@property (weak, nonatomic) IBOutlet UITextView *TweetTextView;
@property (weak, nonatomic) IBOutlet UITextView *MoreTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *FacebookPostButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *TweetButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *ShareButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *NullButton;

- (void) showAlertMessage:(NSString *) myMessage;

- (void) configureFacebookTextView;
- (void) configureTwitterTextView;
- (void) configureMoreTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureFacebookTextView];
    [self configureTwitterTextView];
    [self configureMoreTextView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showAlertMessage:(NSString *) myMessage{
    UIAlertController *alertController;
    alertController = [UIAlertController alertControllerWithTitle:@"PeerReview5" message:myMessage preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)ShareNothing:(id)sender {
    if([self.FacebookTextView isFirstResponder])
    {
        [self.FacebookTextView resignFirstResponder];
    }
    if([self.TweetTextView isFirstResponder])
    {
        [self.TweetTextView resignFirstResponder];
    }
    if([self.MoreTextView isFirstResponder])
    {
        [self.MoreTextView resignFirstResponder];
    }
    NSString *message = @"This button does nothing.";
    [self showAlertMessage:message];
}

- (IBAction)shareMore:(id)sender {
    self.FacebookTextView.layer.borderColor = self.FacebookTextView.layer.backgroundColor;
    if([self.FacebookTextView isFirstResponder])
    {
        [self.FacebookTextView resignFirstResponder];
    }
    if([self.TweetTextView isFirstResponder])
    {
        [self.TweetTextView resignFirstResponder];
    }
    if([self.MoreTextView isFirstResponder])
    {
        [self.MoreTextView resignFirstResponder];
    }
    
    UIActivityViewController *moreVC = [[UIActivityViewController alloc] initWithActivityItems:@[self.MoreTextView.text] applicationActivities:nil];
    
    [self presentViewController:moreVC animated:YES completion:nil];
}


- (IBAction)shareTweet:(id)sender {
    if([self.FacebookTextView isFirstResponder])
    {
        [self.FacebookTextView resignFirstResponder];
    }
    if([self.TweetTextView isFirstResponder])
    {
        [self.TweetTextView resignFirstResponder];
    }
    if([self.MoreTextView isFirstResponder])
    {
        [self.MoreTextView resignFirstResponder];
    }
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        if([self.TweetTextView.text length] <= 140)
        {
            [twitterVC setInitialText:self.TweetTextView.text];
        }
        else
        {
            [twitterVC setInitialText:[self.TweetTextView.text substringFromIndex:140]];
        }
        [self presentViewController:twitterVC animated:YES completion:nil];
    }
    else
    {
        [self showAlertMessage:@"Please sign your device in to twitter \nHint\nGo to: Settings>Twitter."];
    }
}

- (IBAction)shareFacebook:(id)sender {
    if([self.FacebookTextView isFirstResponder])
    {
        [self.FacebookTextView resignFirstResponder];
    }
    if([self.TweetTextView isFirstResponder])
    {
        [self.TweetTextView resignFirstResponder];
    }
    if([self.MoreTextView isFirstResponder])
    {
        [self.MoreTextView resignFirstResponder];
    }
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookVC setInitialText:self.FacebookTextView.text];
        [self presentViewController:facebookVC animated:YES completion:nil];
    }
    else
    {
        [self showAlertMessage:@"Please sign your device in to Facebook \nHint\nGo to: Settings>Facebook."];
    }
}

- (void) configureFacebookTextView{
    self.FacebookTextView.layer.backgroundColor = [UIColor colorWithRed:0.23 green:0.34 blue:0.59 alpha:1].CGColor;
    self.FacebookTextView.layer.cornerRadius=15.0;
    self.FacebookTextView.layer.borderWidth = 2.0;
    self.FacebookTextView.layer.borderColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
}

- (void) configureTwitterTextView{
    self.TweetTextView.layer.backgroundColor = [UIColor colorWithRed:0.22 green:0.63 blue:0.94 alpha:1].CGColor;
    self.TweetTextView.layer.cornerRadius = 15.0;
    self.TweetTextView.layer.borderColor= [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
    self.TweetTextView.layer.borderWidth = 2.0;
}

-(void) configureMoreTextView{
    self.MoreTextView.layer.backgroundColor = [UIColor colorWithRed:0.35 green:0.25 blue:0.50 alpha:1].CGColor;
    self.MoreTextView.layer.cornerRadius = 15.0;
    self.MoreTextView.layer.borderColor= [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
    self.MoreTextView.layer.borderWidth = 2.0;
}

@end
