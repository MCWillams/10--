//
//  BQMessageViewController.m
//  xinyiStoreWeibo
//
//  Created by 严必庆 on 15-6-28.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQMessageViewController.h"

@interface BQMessageViewController ()

@end

@implementation BQMessageViewController

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"写私信" style:UIBarButtonItemStylePlain target:nil action:nil];
}
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
        cell.textLabel.text = @"SUNWUKONG";
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *VC = [[UIViewController alloc]init];
    VC.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:VC animated:NO];
}

@end
