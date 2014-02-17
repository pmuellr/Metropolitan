//
//  METCallCustomerViewController.m
//  Metropolitan
//
//  Created by Kevin Whinnery on 2/14/14.
//  Copyright (c) 2014 Kevin Whinnery. All rights reserved.
//

#import "METCallCustomerViewController.h"
#import "AFHTTPRequestOperationManager.h"

@interface METCallCustomerViewController ()

-(IBAction)hangup:(id)sender;

@end

@implementation METCallCustomerViewController

-(void)hangup:(id)sender
{
    self.onClose();
}

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
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://tranquil-ocean-7196.herokuapp.com/capability" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"text: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
