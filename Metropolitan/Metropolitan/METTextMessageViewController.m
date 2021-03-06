//
//  METTextMessageViewController.m
//  Metropolitan
//
//  Created by Kevin Whinnery on 2/14/14.
//  Copyright (c) 2014 Kevin Whinnery. All rights reserved.
//

#import "METTextMessageViewController.h"
#import "AFHTTPRequestOperationManager.h"

@interface METTextMessageViewController () {
    IBOutlet UITextView *text;
    IBOutlet UIButton *button;
    IBOutlet UIActivityIndicatorView *ind;
}

-(IBAction)cancel:(id)sender;
-(IBAction)sendText:(id)sender;

@end

@implementation METTextMessageViewController

#pragma mark actions

- (void)cancel:(id)sender
{
    self.onClose();
}

- (void)sendText:(id)sender
{
    button.hidden = YES;
    ind.hidden = NO;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"to": @"+16512080532",
                                 @"body":text.text};
    
    [manager POST:@"http://salesassociate.ng.bluemix.net/sms"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Your text has been sent!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        NSLog(@"JSON: %@", responseObject);
        self.onClose();
              
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"There was an error sending the text."
                                                       delegate:self
                                              cancelButtonTitle:@"Bummer!" otherButtonTitles:nil];
        [alert show];
        NSLog(@"Error: %@", error);
        self.onClose();
              
    }];
}

#pragma mark lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [text becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
