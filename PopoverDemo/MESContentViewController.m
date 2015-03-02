//
// Created by Hok Shun Poon on 06/03/2014.
// Copyright (c) 2014 MakeEatSee. All rights reserved.
//

#import "MESContentViewController.h"


@implementation MESContentViewController
- (IBAction)smallTouched:(id)sender {
    self.preferredContentSize = CGSizeMake(200,200);
}

- (IBAction)mediumTouched:(id)sender {
    self.preferredContentSize = CGSizeMake(300,300);
}

- (IBAction)largeTouched:(id)sender {
    self.preferredContentSize = CGSizeMake(400,400);
}

@end