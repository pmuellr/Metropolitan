//
//  METInventoryViewController.m
//  Metropolitan
//
//  Created by Kevin Whinnery on 2/14/14.
//  Copyright (c) 2014 Kevin Whinnery. All rights reserved.
//

#import "METInventoryViewController.h"
#import "METAppDelegate.h"
#import "METItemDetailViewController.h"
#import "PKRevealController.h"

@interface METInventoryViewController ()

-(IBAction)showDetail:(id)sender;

@end

@implementation METInventoryViewController

#pragma mark actions

-(void)showDetail:(id)sender
{
    METAppDelegate *delegate = (METAppDelegate*) [[UIApplication sharedApplication] delegate];
    METItemDetailViewController *vc = [[METItemDetailViewController alloc] init];
    [delegate.front pushViewController:vc animated:YES];
    [self.revealController showViewController:delegate.front];
}

#pragma mark lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Inventory";
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
