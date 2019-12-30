//
//  AppDelegate.m
//  Bob
//
//  Created by ripper on 2019/11/20.
//  Copyright © 2019 ripperhe. All rights reserved.
//

#import "AppDelegate.h"
#import "StatusItem.h"
#import "Shortcut.h"
#import "MMCrash.h"
#import "PreferenceManager.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    MMLogInfo(@"程序启动");
    [MMCrash registerHandler];
    [StatusItem.shared setup];
    [Shortcut setup];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // https://forums.developer.apple.com/thread/126418
    MMLogInfo(@"程序即将关闭");
    [StatusItem.shared remove];
    [PreferenceManager.shared updateLoginItemWithLaunchAtStartup:PreferenceManager.shared.launchAtStartup];
}

@end
