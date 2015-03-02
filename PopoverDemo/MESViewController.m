//
//  MESViewController.m
//  PopoverDemo
//
//  Created by Hok Shun Poon on 06/03/2014.
//  Copyright (c) 2014 MakeEatSee. All rights reserved.
//

#import "MESViewController.h"
#import "RBStoryboardLink.h"

@interface MESViewController () <UINavigationControllerDelegate>
@property(nonatomic, strong) RBStoryboardLink *storyboardLink;
@end

@implementation MESViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    self.storyboardLink = [self.storyboard instantiateViewControllerWithIdentifier:@"link"];

    UINavigationController *navigationController = (UINavigationController *) self.storyboardLink.scene;
    navigationController.delegate = self;

    // Setup the popover for use in the detail view.
    self.popover = [[UIPopoverController alloc] initWithContentViewController:self.storyboardLink];
//	self.popover.popoverContentSize = CGSizeMake(320., 320.);
//    self.popover.delegate = self;
}

- (IBAction)didTouchUpInsideShowPopoverButton:(UIButton *)sender {
    UIButton *tappedButton = (UIButton *) sender;

    // Present the popover from the button that was tapped in the detail view.
    [self.popover presentPopoverFromRect:tappedButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

#pragma mark - Nav Del

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSAssert(self.storyboardLink, @"Storyboard link should be present.");

    CGSize size = viewController.preferredContentSize;

    NSLog(@"Setting the storyboardLink's preferred content size to %@", NSStringFromCGSize(size));

//    CGFloat navbarHeight = navigationController.navigationBar.frame.size.height;
    self.storyboardLink.preferredContentSize = size;
}

@end