//
//  ViewController.m
//  SLLTestPaper(选择判断简答)
//
//  Created by work on 2017/10/23.
//  Copyright © 2017年 work. All rights reserved.
//

#import "ViewController.h"
#import "TestPaperViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    [btn setTitle:@"开始做题" forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    [btn addTarget:self action:@selector(beginTest:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)beginTest:(UIButton *)btn {
    
    TestPaperViewController *testPaperVc = [[TestPaperViewController alloc] init];
    testPaperVc.type = 0;
    [self.navigationController pushViewController:testPaperVc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
