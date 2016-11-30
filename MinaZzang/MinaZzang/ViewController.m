//
//  ViewController.m
//  MinaZzang
//
//  Created by 김민아 on 2016. 11. 23..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ViewController.h"
#import "SUMEpisodeCell.h"

#import "EpEpisodeModels.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *cvEpisode;

@property (strong, nonatomic) NSArray *epList;
@property (strong, nonatomic) NSMutableArray *animatedCells;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.cvEpisode registerNib:[UINib nibWithNibName:@"SUMEpisodeCell" bundle:nil] forCellWithReuseIdentifier:@"EpisodeCell"];
    
    self.animatedCells = [NSMutableArray array];

    [self reqEpisodeList];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger result = self.epList.count;
    
    return result;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    SUMEpisodeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EpisodeCell" forIndexPath:indexPath];
    
    
    EpList *episode = self.epList[indexPath.item];

    LogGreen(@"urlString : %@", episode.eNumbering);
    
    cell.epView.ivEpNum.image = [self getEpisodeIconFromEpisodeNo:episode.eNumbering];
    cell.epView.lbEpName.text = episode.eTitle;
    cell.epView.lbEpMain.text = episode.eSubTitle;
    cell.epView.lbEpDetail.text = episode.eInfoMain;
    LogGreen(@"animaedCells : %@ index.item : %zd", self.animatedCells, indexPath.item);
    
    
    if(![self.animatedCells containsObject:@(indexPath.item)])
    {
        [cell.epView initLayout];
    }
    else
    {
        [cell.epView remainLayout];
    }
    
    __block NSMutableArray *temp = self.animatedCells;
    
    [self.lib setImageView:cell.epView.ivEpisode urlString:episode.eMainImgUrl placeholderImage:nil animation:YES completed:^(BOOL complete) {
        
        
        if(indexPath.item == 0)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [cell.epView startAnimation];
            });
            
            [temp addObject:@(0)];
            
        }
    }];

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat width = DEVICE_WIDTH;
    CGFloat height = DEVICE_HEIGHT;
    
    return CGSizeMake(width, height);
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    CGFloat contentOffset = self.cvEpisode.contentOffset.x;
    
    NSInteger index = contentOffset / DEVICE_WIDTH;
    
    if(![self.animatedCells containsObject:@(index)])
    {
        SUMEpisodeCell *cell = (SUMEpisodeCell *)[self.cvEpisode cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [cell.epView startAnimation];
        });
        [self.animatedCells addObject:@(index)];

    }

}

#pragma mark - Request
-(void)reqEpisodeList
{
    [self.httpClient GETWithUrlString:@"/api/v1/episode/list" parameters:nil success:^(id results) {
        [self successCompletionOfReqEpisodeListWithResults:results];
        
    } failure:^(NSError *error) {
        LogRed(@"error");
    }];
}

#pragma mark - Process
- (void)successCompletionOfReqEpisodeListWithResults:(id)results
{
    EpEpisodeModel *result = [[EpEpisodeModel alloc]initWithDictionary:results];
    
    if([result.code isEqualToString:@"200"])
    {
        LogGreen(@"success");
        
        self.epList = result.list;
        
        [self.cvEpisode reloadData];
        
    }
    
}

#pragma mark - Private Method
// Get episode icon image by episode number
- (UIImage *)getEpisodeIconFromEpisodeNo:(NSString *)epNo
{
    UIImage *result = nil;
    
    NSString *fileName = [NSString stringWithFormat:@"icon_episode_%@",epNo];
    
    result = [UIImage imageNamed:fileName];
    
    return result;
}

@end
