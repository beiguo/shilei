//
//  DViewController.m
//  TourismMacao
//
//  Created by Dick on 2017/8/28.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import "DViewController.h"


#define KScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define KScreenWidth ([UIScreen mainScreen].bounds.size.width)

@interface DViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, retain)NSMutableArray *NameArr;
@end

@implementation DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArr = [NSMutableArray array];
    
    for (int i = 1; i < 7; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [_dataArr addObject:img];
    }
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 4;
    layout.minimumInteritemSpacing = 4;
    layout.itemSize = CGSizeMake(KScreenWidth/2 - 4, 100);
    layout.sectionInset = UIEdgeInsetsMake(4, 2, 0, 2);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 215) collectionViewLayout:layout];
    if (_isExpand) {
        _collectionView.frame = CGRectMake(0, 86, KScreenWidth, KScreenHeight - 44 - 306);
    }
    NSLog(@"长%f 宽%f",_collectionView.frame.size.width,_collectionView.frame.size.height);
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MessageCollectionViewCell"];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MessageCollectionViewCell" forIndexPath:indexPath];
    
    UIImageView *backImg=[[UIImageView alloc]initWithImage:_dataArr[indexPath.row]];
    backImg.contentMode=UIViewContentModeScaleToFill;
    backImg.frame=CGRectMake(0, 0, 200, 100);
    
    [cell addSubview:backImg];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MSMessageTemplateLayout *layout = [[MSMessageTemplateLayout alloc]init];
    
   layout.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ldm",indexPath.row+1]];
    layout.caption = @"新威尼斯人";
    layout.subcaption = @"点击查看详情";
    
    MSMessage *message = [[MSMessage alloc] init];
    NSURLComponents *comp = [[NSURLComponents alloc] initWithString:@"http://103.204.13.37:8009/"];
    message.URL = comp.URL;
    message.layout = layout;
    
    [self.mvc.activeConversation insertMessage:message completionHandler:^(NSError * _Nullable Handle) {
        if (Handle) {
            NSLog(@"%@",Handle);
        }
    }];
    
}
-(NSMutableArray *)NameArr
{
    if (!_NameArr) {
        _NameArr=[NSMutableArray array];
        [_NameArr addObjectsFromArray:@[@"美高梅",@"美高梅",@"威尼斯人",@"我不知道",@"美高梅",@"美高梅",@"威尼斯人"]];
    }
    return _NameArr;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
