//
//  AppDelegate.h
//  SLLTestPaper(选择判断简答)
//
//  Created by work on 2017/10/23.
//  Copyright © 2017年 work. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

