//
//  MESViewController.m
//  PopoverDemo
//
//  Created by Hok Shun Poon on 06/03/2014.
//  Copyright (c) 2014 MakeEatSee. All rights reserved.
//

#import "MESViewController.h"

@interface MESViewController () <UINavigationControllerDelegate>
@property(nonatomic, strong) UIViewController *containerVC;
@end

@implementation MESViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. Get your navigation controller, setting the delegate. This will drive the popover resizing.
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"content"];
    navigationController.delegate = self;
    
    // 2. Put the navigation controller inside of a UIViewController
    self.containerVC = [[UIViewController alloc] init];
    [self.containerVC addChildViewController:navigationController];
    [self.containerVC.view addSubview:navigationController.view];
    [navigationController didMoveToParentViewController:self.containerVC];
    
    navigationController.view.translatesAutoresizingMaskIntoConstraints = NO;

    // 3. Show the popover as per usual.
    self.popover = [[UIPopoverController alloc] initWithContentViewController:self.containerVC];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSAssert(self.containerVC, @"Storyboard link should be present.");

    // 4. Explicitly update preferredContentSize of the container.
    CGSize size = viewController.preferredContentSize;

    NSLog(@"Setting container view controller's preferred content size to %@", NSStringFromCGSize(size));
    
    self.containerVC.preferredContentSize = size;
}


#pragma mark - Actions

- (IBAction)didTouchUpInsideShowPopoverButton:(UIButton *)sender {
    UIButton *tappedButton = (UIButton *) sender;

    // Present the popover normally, as you would.
    [self.popover presentPopoverFromRect:tappedButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

@end