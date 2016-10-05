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
#import "DCBlackClockView.h"

@implementation DCAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
//    NSDictionary defaults = [NSDictionary dictionaryWithObjectsAndKeys:<#(id), ...#>, nil]
    NSRect r = { { 0, 0 }, { 0, 0 } };

//    [[NSUserDefaults standardUserDefaults] registerDefaults:<#(NSDictionary *)#>
    
    r.size = [[NSApp dockTile] size];
    DCClockView *c = [[DCBlackClockView alloc] initWithFrame:r];
    
    [self changeClock:c];

    // Pause the updates while the screen is a asleep since we can't be seen. 
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self selector:@selector(screenDidSleep:) name:NSWorkspaceScreensDidSleepNotification object:nil];
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self selector:@selector(screenDidWake:) name:NSWorkspaceScreensDidWakeNotification object:nil];
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self selector:@selector(screenDidSleep:) name:NSWorkspaceSessionDidResignActiveNotification object:nil];
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self selector:@selector(screenDidWake:) name:NSWorkspaceSessionDidBecomeActiveNotification object:nil];

}

- (void)windowWillClose:(NSNotification *)aNotification
{

}

- (void)screenDidSleep:(NSNotification *)aNotification
{
    [self.currentClock stopTimer];
}

- (void)screenDidWake:(NSNotification *)aNotification
{
    [self.currentClock startTimer];
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
