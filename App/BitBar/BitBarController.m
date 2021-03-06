//
//  BitBarController.m
//  BitBar
//
//  Created by Mat Ryer on 11/13/13.
//  Copyright (c) 2013 Bit Bar. All rights reserved.
//

#import "BitBarController.h"
#import "PluginManager.h"
#import "Settings.h"
#import "LaunchAtLoginController.h"

@implementation BitBarController

- (void) startApp {
  
  if ([Settings isFirstTimeAppRun]) {
    LaunchAtLoginController *launcher = [[LaunchAtLoginController alloc] init];
    if (!launcher.launchAtLogin) {
      [launcher setLaunchAtLogin:YES];
    }
  }
  
  // make a plugin manager
  self.pluginManager = [[PluginManager alloc] initWithPluginPath:[Settings pluginsDirectory]];
  
  [self.pluginManager setupAllPlugins];
  
}

@end
