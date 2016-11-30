//
//  BaseViewController.h
//  MinaZzang
//
//  Created by 김민아 on 2016. 11. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibraryClass.h"
#import "HTTPClient.h"

@interface BaseViewController : UIViewController

@property (strong, nonatomic) LibraryClass *lib;
@property (strong, nonatomic) HTTPClient *httpClient;

@end
