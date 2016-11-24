//
//  LibraryClass.h
//  MinaZzang
//
//  Created by 김민아 on 2016. 11. 24..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LibraryClass : NSObject

+ (LibraryClass *)sharedInstance;

-(void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani;

-(void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani completed:(void (^)(BOOL complete))completed;

@end
