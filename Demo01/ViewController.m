//
//  ViewController.m
//  Demo01
//
//  Created by TaoJiang on 2020/9/24.
//  Copyright © 2020 TaoJiang. All rights reserved.
//

#import "ViewController.h"
#import "JTDefines.h"
#import "JTDownPicViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"   ";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:ScreenBounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    _datas = @[@""];
    
    
    
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = _datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self jumpTo0];
    }
}


- (void)jumpTo0 {
    JTDownPicViewController *controller = [[JTDownPicViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}






@end
