//
//  TestPaperViewController.h
//  SLLTestPaper(选择判断简答)
//
//  Created by work on 2017/10/23.
//  Copyright © 2017年 work. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestPaperViewController : UIViewController

@property (nonatomic, assign) NSInteger CourseExamId;

@property (nonatomic, assign) NSInteger defautIndex;

@property (nonatomic, assign) NSInteger type;//0:未做   1、做过了

@property (nonatomic,strong) NSMutableArray *dataSource;

@end
