//
//  BaseTestPaperTableView.h
//  SLLTestPaper(选择判断简答)
//
//  Created by work on 2017/10/24.
//  Copyright © 2017年 work. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseExamTopicModel.h"

@interface BaseTestPaperTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) NSArray *answerList;

@property(nonatomic,strong) NSArray *questionList;

// 答案字典
@property(nonatomic,copy) NSDictionary *answer;

// 默认选中的答案
@property (nonatomic,copy) NSString *tempAnswer;

//是否可编辑
@property (nonatomic, assign) BOOL canEdit;

// 回答的题目是否正确
@property (nonatomic, assign) BOOL isRight;


@property (nonatomic,strong) CourseExamTopicModel *model;


/**
 
 
 */

/**
 通用设置  子类实现必须调用super
 
 @param model      数据模型
 @param hasFooter 有无尾视图
 @param index     第几题
 */
- (void)config:(CourseExamTopicModel *)model  hasFooter:(BOOL)hasFooter index:(NSInteger)index;

- (void)showFootView;

@end
