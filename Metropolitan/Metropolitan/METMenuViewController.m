//
//  METMenuViewController.m
//  Metropolitan
//
//  Created by Kevin Whinnery on 2/13/14.
//  Copyright (c) 2014 Kevin Whinnery. All rights reserved.
//

#import "METMenuViewController.h"
#import "METAppDelegate.h"
#import "METItemDetailViewController.h"
#import "PKRevealController.h"

@interface METMenuViewController () {
    IBOutlet UILabel *inventory;
}

-(IBAction)showInventory:(id)sender;

@end

@implementation METMenuViewController

#pragma mark controller actions
-(void)showInventory:(id)sender
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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
