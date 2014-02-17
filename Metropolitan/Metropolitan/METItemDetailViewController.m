//
//  METItemDetailViewController.m
//  Metropolitan
//
//  Created by Kevin Whinnery on 2/14/14.
//  Copyright (c) 2014 Kevin Whinnery. All rights reserved.
//

#import "METItemDetailViewController.h"
#import "METAppDelegate.h"
#import "METInventoryViewController.h"
#import "METCallCustomerViewController.h"
#import "METTextMessageViewController.h"
#import "PKRevealController.h"

@interface METItemDetailViewController ()

-(IBAction)sendText:(id)sender;
-(IBAction)makeCall:(id)sender;

@end

@implementation METItemDetailViewController

#pragma mark actions

-(void)sendText:(id)sender
{
    METTextMessageViewController *vc = [[METTextMessageViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFormSheet;
    vc.onClose = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)makeCall:(id)sender
{
    METCallCustomerViewController *vc = [[METCallCustomerViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFormSheet;
    vc.onClose = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Item Details";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
