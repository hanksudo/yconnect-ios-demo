//
//  ViewController.m
//  yconnect-ios-example
//
//  Created by Hank Wang on 20/03/2018.
//  Copyright © 2018 hanksudo. All rights reserved.
//

#import "YConnect.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(UIButton *)sender {
    YConnectManager *yconnect = [YConnectManager sharedInstance];
    
    // state, nonceの取得（クライアントサイドで作成したstate,nonceを使用してください）
    YConnectStringUtil *util = [[YConnectStringUtil alloc] init];
    NSString *state = [util generateState];
    NSString *nonce = [util generateNonce];
    
    [yconnect requestAuthorizationWithState:state prompt:nil nonce:nonce];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
