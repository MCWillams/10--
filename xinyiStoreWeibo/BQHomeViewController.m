//
//  BQHomeViewController.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-6-28.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQHomeViewController.h"
#import "UIBarButtonItem+BQ.h"
#import "BQTitleButton.h"
@interface BQHomeViewController ()

@end

@implementation BQHomeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch" highlightedIcon:@"navigationbar_friendsearch_highlighted" target:self action:@selector(leftButtonClick)];
    //右边按钮
    self.navigationItem.rightBarButtonItem = [ UIBarButtonItem itemWithIcon:@"navigationbar_pop" highlightedIcon:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    //中间按钮
    
    //1.创建按钮
    BQTitleButton *titleButton = [BQTitleButton titleButton];
    //2.设置按钮图片
    [titleButton setImage:[UIImage imagewithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    //3.设置按钮文字
    [titleButton setTitle:@"我就是萌货" forState:UIControlStateNormal];
    //4.设置按钮尺寸
    titleButton.bounds = CGRectMake(0, 0, 100, 20);
    //5.添加到导航栏中间
    self.navigationItem.titleView = titleButton;
    titleButton.tag = -1;
    //6.监听按钮点击
    [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)titleButtonClick:(UIButton *)titleButton{
    if (titleButton.tag == -1) {
        titleButton.tag = 0;
        [titleButton setImage:[UIImage imagewithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    }
    else{
        titleButton.tag = -1;
        [titleButton setImage:[UIImage imagewithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    }
}


-(void)leftButtonClick{
    BQLog(@"leftButtonClick");
}

-(void)pop{
    BQLog(@"pop");
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];;
    
    if (cell == 0) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.textLabel.text = @"DHASHDA";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *VC = [[UIViewController alloc]init];
    VC.view.backgroundColor = [UIColor greenColor];
    [self.navigationController pushViewController:VC animated:YES];
}
@end
