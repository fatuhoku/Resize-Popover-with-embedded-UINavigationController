//
//  MESViewController.m
//  PopoverDemo
//
//  Created by Hok Shun Poon on 06/03/2014.
//  Copyright (c) 2014 MakeEatSee. All rights reserved.
//

#import "MESViewController.h"
#import "MESContentViewController.h"

@interface MESViewController ()
@end

@implementation MESViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MESContentViewController *content = [self.storyboard instantiateViewControllerWithIdentifier:@"PopoverContentController"];
    
	// Setup the popover for use in the detail view.
	self.popover = [[UIPopoverController alloc] initWithContentViewController:content];
//	self.popover.popoverContentSize = CGSizeMake(320., 320.);
	self.popover.delegate = self;
}

- (IBAction)showPopover:(UIButton *)sender {
    // Set the sender to a UIButton.
    UIButton *tappedButton = (UIButton *)sender;

    // Present the popover from the button that was tapped in the detail view.
    [self.popover presentPopoverFromRect:tappedButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

@end