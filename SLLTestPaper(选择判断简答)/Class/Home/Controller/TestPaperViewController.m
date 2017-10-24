//
//  TestPaperViewController.m
//  SLLTestPaper(选择判断简答)
//
//  Created by work on 2017/10/23.
//  Copyright © 2017年 work. All rights reserved.
//

#define kBottomH  60.0f

#import "TestPaperViewController.h"

#import "CourseExamTopicModel.h"
#import "BaseTestPaperTableView.h"
#import "SingleSelectionTableView.h"
#import "MultiSelectionTableView.h"
#import "EsayQuestionTableView.h"

#import "Definition.h"
#import "MJExtension.h"

@interface TestPaperViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation TestPaperViewController
static NSString *CollectID = @"collectID";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupData];
    [self setupCollectionView];
}

- (void)setupData{
    
    if (self.type == 0) {
        NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testData" ofType:@"plist" ]];
        self.dataSource = (NSMutableArray *)[CourseExamTopicModel objectArrayWithKeyValuesArray:dataDic[@"data"]];
//        for (NSDictionary *topicDic in dataDic[@"data"]) {
//            CourseExamTopicModel *model = [[CourseExamTopicModel alloc] init];
//            [model setValuesForKeysWithDictionary:topicDic];
//            [self.dataSource addObject:model];
//        }
    }
}

- (void)setupCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGRect itemRect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64 - kBottomH);
    flowLayout.itemSize = CGSizeMake(itemRect.size.width, itemRect.size.height);
    self.collectionView = [[UICollectionView alloc]initWithFrame:itemRect collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = YES;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CollectID];
    [self.view addSubview:self.collectionView];
}

#pragma mark -- UICollectionViewDataSource And UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectID forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    cell.backgroundColor = [UIColor orangeColor];
    CourseExamTopicModel *courseModel = self.dataSource[indexPath.item];
    BaseTestPaperTableView *tableView = nil;
    if (courseModel.exerciseType == 1) { //单选
       tableView = [[SingleSelectionTableView alloc] initWithFrame:CGRectZero];
    }else if (courseModel.exerciseType == 2) {//多选
        tableView = [[MultiSelectionTableView alloc] initWithFrame:CGRectZero];
    }else if (courseModel.exerciseType == 3) {//判断
        tableView = [[SingleSelectionTableView alloc] initWithFrame:CGRectZero];
    }else{//简答
         tableView = [[EsayQuestionTableView alloc] initWithFrame:CGRectZero];
    }
    
    tableView.frame = CGRectMake(0, 0,  self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    [cell.contentView addSubview:tableView];
    
    if (self.type == 1) {//做过了  看题目
        [tableView config:courseModel hasFooter:YES index:indexPath.item];
        tableView.tempAnswer = courseModel.userAnswer;
        
    }else{
        [tableView config:courseModel hasFooter:NO index:indexPath.item];
        tableView.tempAnswer = courseModel.userAnswer;
    }

    return cell;
}



@end
