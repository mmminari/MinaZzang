//
//  EpisodeView.h
//  NavigationController
//
//  Created by 김민아 on 2016. 11. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EpisodeView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *ivEpisode;
@property (weak, nonatomic) IBOutlet UILabel *lbEpName;
@property (weak, nonatomic) IBOutlet UILabel *lbEpTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbEpMain;
@property (weak, nonatomic) IBOutlet UILabel *lbEpDetail;
@property (weak, nonatomic) IBOutlet UIImageView *ivEpNum;


- (void)startAnimation;
- (void)remainLayout;
- (void)initLayout;
- (void)startAnimationWithCompletion:(void(^)(void))completion;


@end
