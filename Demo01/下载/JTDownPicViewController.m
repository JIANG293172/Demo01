//
//  JTDownPicViewController.m
//  Demo01
//
//  Created by TaoJiang on 2020/9/24.
//  Copyright © 2020 TaoJiang. All rights reserved.
//

#import "JTDownPicViewController.h"
#import "JTDefines.h"

@interface JTDownPicViewController ()
@property (nonatomic, strong) UIImageView *downImageView;

@end

@implementation JTDownPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpView];
}

- (void)setUpView {
    _downImageView = [[UIImageView alloc] init];
    [self.view addSubview:_downImageView];
    NSURL *url = [NSURL URLWithString:@"http://imge.kugou.com/kugouicon/165/20190315/20190315161236671457.jpg"];
    [_downImageView sd_setImageWithURL:url];
    [_downImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset = 100;
        make.centerX.centerY.offset = 0;
    }];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
