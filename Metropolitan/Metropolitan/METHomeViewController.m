//
//  METHomeViewController.m
//  Metropolitan
//
//  Created by Kevin Whinnery on 2/14/14.
//  Copyright (c) 2014 Kevin Whinnery. All rights reserved.
//

#import "METHomeViewController.h"
#import "METAppDelegate.h"
#import "METItemDetailViewController.h"
#import "PKRevealController.h"

@interface METHomeViewController ()

-(IBAction)showInventory:(id)sender;

@end

@implementation METHomeViewController

#pragma mark Interface actions

-(void)showInventory:(id)sender
{
    METAppDelegate *delegate = (METAppDelegate*) [[UIApplication sharedApplication] delegate];
    METItemDetailViewController *vc = [[METItemDetailViewController alloc] init];
    [delegate.front pushViewController:vc animated:YES];
    [self.revealController showViewController:delegate.front];
}

-(void)showMenu:(id)sender
{
    METAppDelegate *delegate = (METAppDelegate*) [[UIApplication sharedApplication] delegate];
    [self.revealController showViewController:delegate.menu];
}

#pragma mark Lifecycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"HOMESTEAD CO.";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Hamburger"]
                                                                      style:UIBarButtonItemStyleBordered
                                                                     target:self
                                                                     action:@selector(showMenu:)];
    //menuBarButton.tintColor = [UIColor darkGrayColor];
    [[self navigationItem] setLeftBarButtonItem:menuBarButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
