//
//  EpisodeView.m
//  NavigationController
//
//  Created by 김민아 on 2016. 11. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "EpisodeView.h"

@interface EpisodeView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfLbEpName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfLbEpTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfLbEpMain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfLbEpDetail;

@end

@implementation EpisodeView

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

}

- (void)initLayout
{
    self.lbEpName.alpha = 0.0f;
    self.alcLeadingOfLbEpName.constant = -100.0f;
    
    self.lbEpTitle.alpha = 0.0f;
    self.alcLeadingOfLbEpTitle.constant = -100.0f;
    
    self.lbEpMain.alpha = 0.0f;
    self.alcLeadingOfLbEpMain.constant = -100.0f;
    
    self.lbEpDetail.alpha = 0.0f;
    self.alcLeadingOfLbEpDetail.constant = -100.0f;
}

- (void)remainLayout
{
    self.lbEpName.alpha = 1.0f;
    self.alcLeadingOfLbEpName.constant = 10.0f;
    
    self.lbEpTitle.alpha = 1.0f;
    self.alcLeadingOfLbEpTitle.constant = 10.0f;
    
    self.lbEpMain.alpha = 1.0f;
    self.alcLeadingOfLbEpMain.constant = 10.0f;
    
    self.lbEpDetail.alpha = 1.0f;
    self.alcLeadingOfLbEpDetail.constant = 10.0f;
}

- (void)startAnimation
{
    [UIView animateWithDuration:0.4f animations:^{
        
        self.alcLeadingOfLbEpName.constant = 10.0f;
        self.lbEpName.alpha = 1.0f;
        [self layoutIfNeeded];
        
    }];
    
    [UIView animateWithDuration:0.8f animations:^{
        
        self.alcLeadingOfLbEpTitle.constant = 10.0f;
        self.lbEpTitle.alpha = 1.0f;
        [self layoutIfNeeded];
        
    }];
    
    [UIView animateWithDuration:1.2f animations:^{
        
        self.alcLeadingOfLbEpMain.constant = 10.0f;
        self.lbEpMain.alpha = 1.0f;
        [self layoutIfNeeded];
        
    }];
    
    [UIView animateWithDuration:1.6f animations:^{
        
        self.alcLeadingOfLbEpDetail.constant = 10.0f;
        self.lbEpDetail.alpha = 1.0f;
        [self layoutIfNeeded];
        
    }];
    
}

- (void)startAnimationWithCompletion:(void(^)(void))completion
{
    [UIView animateWithDuration:0.4f animations:^{
        
        self.alcLeadingOfLbEpName.constant = 10.0f;
        self.lbEpName.alpha = 1.0f;
        [self layoutIfNeeded];
        
    }];
    
    [UIView animateWithDuration:0.8f animations:^{
        
        self.alcLeadingOfLbEpTitle.constant = 10.0f;
        self.lbEpTitle.alpha = 1.0f;
        [self layoutIfNeeded];
        
        if(completion)
        {
            completion();
        }
        
    }];
}



@end
