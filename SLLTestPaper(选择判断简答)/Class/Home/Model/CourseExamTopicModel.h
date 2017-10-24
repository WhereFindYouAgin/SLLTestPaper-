//
//  CourseExamTopicModel.h
//  SLLTestPaper(选择判断简答)
//
//  Created by work on 2017/10/24.
//  Copyright © 2017年 work. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseExamTopicModel : NSObject
@property (nonatomic, assign) int Id;//题目的Id
@property (nonatomic, assign) int itemNum;//选项数
@property (nonatomic,copy) NSString *itemA;
@property (nonatomic,copy) NSString *itemB;
@property (nonatomic,copy) NSString *itemC;
@property (nonatomic,copy) NSString *itemD;
@property (nonatomic,copy) NSString *itemE;
@property (nonatomic,copy) NSString *itemF;
@property (nonatomic,copy) NSString *itemG;
@property (nonatomic,copy) NSString *itemH;
@property (nonatomic,copy) NSString *itemI;
@property (nonatomic,copy) NSString *itemJ;
@property (nonatomic, assign) int score;//本题分数
@property (nonatomic,copy) NSString *answer;//正确答案
@property (nonatomic,copy) NSString *userAnswer;//用户答案

@property (nonatomic,copy) NSString *question;//问题
@property (nonatomic,copy) NSString *remark;//提示

/**
  1单选 2 多选 3判断 4问答
 */
@property (nonatomic, assign) int exerciseType;
@end
