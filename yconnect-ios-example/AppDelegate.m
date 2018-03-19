//
//  AppDelegate.m
//  yconnect-ios-example
//
//  Created by Hank Wang on 20/03/2018.
//  Copyright © 2018 hanksudo. All rights reserved.
//

#import "AppDelegate.h"
#import "YConnect.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    //コールバックURLに指定したURLだった場合、最初のViewControllerから結果を表示するResultViewControllerに遷移する
    if ([url.scheme isEqualToString:@"yj-xxx"]) {
        YConnectManager *yconnect = [YConnectManager sharedInstance];
        [yconnect parseAuthorizationResponse:url handler:^(NSError *error) {
            NSLog(@"authorizationCode: %@", yconnect.authorizationCode);
            
            if (error) {
                NSLog(@"%@", [NSString stringWithFormat:@"error1: %@", error.description]);
            }
            
            // アクセストークン、リフレッシュトークン、IDトークンを取得
            [yconnect fetchAccessToken:yconnect.authorizationCode handler:^(YConnectBearerToken *retAccessToken, NSError *error) {
                if (error) {
                    NSLog(@"%@", [NSString stringWithFormat:@"error2: %@", error.description]);
                } else {
                    NSString *accessToken = [yconnect accessTokenString];
                    NSLog(@"accessToken: %@", accessToken);
                }
            }];
        }];
        
        return YES;
    }
    return NO;
}

@end

