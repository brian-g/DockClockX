//
//  DCAppDelegate.m
//  DockClockX
//
//  Created by Brian on 4/15/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import "DCAppDelegate.h"
#import "DCClockView.h"
#import "DCBasicDigitalClockView.h"

@implementation DCAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSRect r = { { 0, 0 }, { 256, 256 } };
    
    r.size = [[NSApp dockTile] size];
    DCClockView *c = [[DCBasicDigitalClockView alloc] initWithFrame:r];
    
    [self changeClock:c];
}

- (void)windowDidClose:(NSNotification *)aNotification
{
    if ([aNotification ])

}

- (NSMenu *)applicationDockMenu:(NSApplication *)sender {
    if (self.dockMenu == NULL)
    {
        NSMenuItem* newItem;
        
        newItem = [[NSMenuItem alloc] initWithTitle:@"Clock" action:nil keyEquivalent:@""];

            
        self.dockMenu = [[NSMenu alloc] init];
        [self.dockMenu addItem:newItem];
    }
    return self.dockMenu;
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

- (void)changeClock:(DCClockView *)clock {
    
    [_currentClock stopTimer];
    
    [[NSApp dockTile] setContentView:clock];
    [[NSApp dockTile] display];
    
    [clock startTimer];
    
    _currentClock = clock;
}

@end
