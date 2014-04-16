//
//  DCAppDelegate.m
//  DockClockX
//
//  Created by Brian on 4/15/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import "DCAppDelegate.h"

@implementation DCAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)showAboutBox:(id)sender {
    
    if (self.aboutBox == NULL) {
        [[NSBundle mainBundle] loadNibNamed:@"AboutBox" owner:self topLevelObjects:NULL];
    }
    [self.aboutBox makeKeyAndOrderFront:self];
}

- (IBAction)showPreference:(id)sender {
    if (self.prefPane == NULL) {
        [[NSBundle mainBundle] loadNibNamed:@"Preferences" owner:self topLevelObjects:NULL];
    }
    [self.prefPane makeKeyAndOrderFront:self];
}

@end
