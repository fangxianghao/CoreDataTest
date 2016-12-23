//
//  ViewController.m
//  CoreDataTest
//
//  Created by uwitec on 16/12/20.
//  Copyright © 2016年 FangXH. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button_Insert = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
    [button_Insert addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button_Insert.tag = 1;
    [button_Insert setTitle:@"插入" forState:UIControlStateNormal];
    button_Insert.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button_Insert];
    
    UIButton *button_Select = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 60)];
    [button_Select addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button_Select.tag = 2;
    [button_Select setTitle:@"查询" forState:UIControlStateNormal];
    button_Select.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button_Select];
    
    UIButton *button_Update = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 60)];
    [button_Update addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button_Update.tag = 3;
    [button_Update setTitle:@"更新" forState:UIControlStateNormal];
    button_Update.backgroundColor = [UIColor brownColor];
    [self.view addSubview:button_Update];
    
    UIButton *button_Delete = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 60)];
    [button_Delete addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button_Delete.tag = 4;
    [button_Delete setTitle:@"删除" forState:UIControlStateNormal];
    button_Delete.backgroundColor = [UIColor redColor];
    [self.view addSubview:button_Delete];
    
    UIButton *button5 = [[UIButton alloc] initWithFrame:CGRectMake(200, 600, 60, 60)];
    [button5 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button5.tag = 5;
    [button5 setTitle:@"插入" forState:UIControlStateNormal];
    [self.view addSubview:button5];
    
    
    
    
}

-(void)buttonClick:(UIButton *)button{
    
      AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    
    switch (button.tag) {
        case 1:
            [delegate insert];
            break;
            
        case 2:
            [delegate selectAll];
            break;
            
        case 3:
            [delegate update];
            break;
            
        case 4:
            [delegate deleteAll];
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
