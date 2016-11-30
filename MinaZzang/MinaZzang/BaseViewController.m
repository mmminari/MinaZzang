//
//  BaseViewController.m
//  MinaZzang
//
//  Created by 김민아 on 2016. 11. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lib = [LibraryClass sharedInstance];
    self.httpClient = [[HTTPClient alloc]initWithSUMBaseURL];


}


@end
