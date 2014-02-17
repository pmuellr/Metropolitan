//
//  METCallCustomerViewController.m
//  Metropolitan
//
//  Created by Kevin Whinnery on 2/14/14.
//  Copyright (c) 2014 Kevin Whinnery. All rights reserved.
//

#import "METCallCustomerViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "TwilioClient.h"

@interface METCallCustomerViewController ()
{
    TCDevice *device;
}

-(IBAction)hangup:(id)sender;

@end

@implementation METCallCustomerViewController

-(void)device:(TCDevice *)device didStopListeningForIncomingConnections:(NSError *)error
{
    NSLog(@"Error: %@", error);
}

-(void)connection:(TCConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error);
}

-(void)hangup:(id)sender
{
    [device disconnectAll];
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
        NSDictionary *dict = (NSDictionary*) responseObject;
        NSString *token = [dict valueForKey:@"token"];
        
        device = [[TCDevice alloc] initWithCapabilityToken:token delegate:self];
        
        [device connect:@{@"to":@"+16512080532"} delegate:self];
        
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
