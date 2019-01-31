//
//  ViewController.m
//  LinkLabel
//
//  Created by 王迪 on 2019/1/31.
//  Copyright © 2019 王迪. All rights reserved.
//

#import "ViewController.h"
#import "AttributeTapLabel.h"

@interface ViewController () <AttributeTapLabelDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AttributeTapLabel *label = [[AttributeTapLabel alloc] initWithFrame:CGRectMake(80, 188, 100, 100)];
    label.delegate = self;
    NSString *str = @"我是可以点击的 label, 你可以试试哈!";
    AttributeModel *model1 = [[AttributeModel alloc] init];
    model1.range = [str rangeOfString:@"label"];
    model1.attributeDic = @{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:16]};
    model1.string = @"label";
    
    AttributeModel *model2 = [[AttributeModel alloc] init];
    model2.range = [str rangeOfString:@"试试"];
    model2.attributeDic = @{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:16]};
    model2.string = @"试试";
    
    [label setText:str attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:16]}
               tapStringArray:@[model1, model2]];
    
    [label sizeToFit];
    [self.view addSubview:label];
}

- (void)attributeTapLabel:(AttributeTapLabel *)label didSelectModel:(AttributeModel *)model {
    UIAlertController *vc = [UIAlertController alertControllerWithTitle: nil message:model.string preferredStyle:UIAlertControllerStyleAlert];
    [vc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
