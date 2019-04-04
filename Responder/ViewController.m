//
//  ViewController.m
//  Responder
//
//  Created by xiekunpeng on 2019/4/4.
//  Copyright © 2019 xboker. All rights reserved.
//

#import "ViewController.h"
#import "TapButton.h"
@interface ViewController ()
///这个按钮重写了相应方法
@property (weak, nonatomic) IBOutlet TapButton *redBtn;
///没有重写相应方法
@property (weak, nonatomic) IBOutlet UIButton *greenBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redBtn.layer.cornerRadius = 100;
    self.greenBtn.layer.cornerRadius = 100;
    // Do any additional setup after loading the view.
}

- (IBAction)redTapAction:(TapButton *)sender {
    NSLog(@"Red:只有点击红色区域才会响应点击事件");
}

- (IBAction)greenTapAction:(UIButton *)sender {
    NSLog(@"Green:点击灰色区域和绿色区域都会响应事件");
}





@end

