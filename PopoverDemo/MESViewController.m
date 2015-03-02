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

#pragma mark - Actions

- (IBAction)didTouchUpInsideShowPopoverButton:(UIButton *)sender {

    // 1. Get your navigation controller, setting the delegate. This will drive the popover resizing.
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"content"];
    navigationController.delegate = self;

    // 2. Put the navigation controller inside of a UIViewController
    UIViewController *container = [[UIViewController alloc] init];
    container.modalPresentationStyle = UIModalPresentationPopover;
    self.containerVC = container;

    [container addChildViewController:navigationController];
    [container.view addSubview:navigationController.view];
    [navigationController didMoveToParentViewController:container];
    navigationController.view.translatesAutoresizingMaskIntoConstraints = NO;

    // 3. Show the popover as you normally do.
    UIPopoverPresentationController *popover = container.popoverPresentationController;
    popover.sourceView = sender;
    popover.sourceRect = sender.bounds;

    [self presentViewController:container animated:YES completion:nil];

}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSAssert(self.containerVC, @"Storyboard link should be present.");

    // 4. Explicitly update preferredContentSize of the container.
    CGSize size = viewController.preferredContentSize;

    NSLog(@"Setting container view controller's preferred content size to %@", NSStringFromCGSize(size));
    
    self.containerVC.preferredContentSize = size;
}

@end