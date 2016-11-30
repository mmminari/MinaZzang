//
//  SUMEpisodeCell.h
//  MinaZzang
//
//  Created by 김민아 on 2016. 11. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EpisodeView.h"

@interface SUMEpisodeCell : UICollectionViewCell

@property (strong, nonatomic) EpisodeView *epView;
@property (weak, nonatomic) IBOutlet UILabel *lbEpName;



@end
