//
//  ViewController.m
//  TableViewTech
//
//  Created by 黃國楷 on 2021/9/25.
//  Copyright © 2021 黃國楷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
//宣告tableView屬性
@property (nonatomic, strong) UITableView *tableView;
//給tableView顯示資料用的數組
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //設置tableView
    [self setupTableView];
    //設置資料數組
    [self setupDataSource];
}

- (void)setupDataSource{
    //初始化數組並賦值，這邊直接將兩個字串放進數組
    self.dataSource = @[@"cell1",@"cell2"];
}

- (void)setupTableView{
    //初始化tableView，設定顯示大小、style為一般
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //設定tableView不要有分隔線
    self.tableView.separatorStyle = NO;
    //重點！記得將delegate設定給當前控制器
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //這點也是容易遺漏掉的動作：記得將tableView加在當前控制器的View上，這樣才會顯示喔！
    [self.view addSubview:_tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //初始化一個UITableViewCell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    //設定每一個cell的文字簽標籤要顯示的文字
    //cell.textLabel.text = _dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"cell%ld", indexPath.row+1];
    //設定cell想顯示的背景色
    cell.backgroundColor = [UIColor cyanColor];
    //想要點擊cell時不會顯示底色灰色
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //要有幾個段落
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //每個段落內要有幾個row
    //return _dataSource.count;
    return 14;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //每個row要顯示的高度
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //點擊放開後，選中cell的底色灰色消失
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
