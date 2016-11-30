//
//  SUMEpisodeCell.m
//  MinaZzang
//
//  Created by 김민아 on 2016. 11. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "SUMEpisodeCell.h"


@interface SUMEpisodeCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfEpNameLabel;

@end

@implementation SUMEpisodeCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.epView = [[[NSBundle mainBundle]loadNibNamed:@"EpisodeView" owner:self options:nil]lastObject];
    
    self.epView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    [self addSubview:self.epView];

}

@end
