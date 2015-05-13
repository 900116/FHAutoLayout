//
//  ViewController.m
//  FHAutolayout
//
//  Created by YongCheHui on 15/5/13.
//  Copyright (c) 2015年 FengHuang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutoLayoutAttibute.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 创建一个autolayoutview
    UIView *redView = [[UIView alloc]initWithRootView:self.view];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc]initWithRootView:self.view];
    [greenView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:greenView];
    
    //红色宽度
    [redView setFixWidth:50];
    //绿色的宽度等于红色
    [greenView equalWidth:redView];
    //红色与父视图高度相等
    [redView setFixHeight:300];
    //绿色高度为100
    [greenView setFixHeight:100];
    
    //红色在10，20的地方
    [redView paddingParentLeft:10];
    [redView paddingParentTop:20];
    //绿色在红色右边10的位置
    [greenView toRight:redView padding:20];
    //绿色顶部与红色对齐
    [greenView alginTop:redView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
