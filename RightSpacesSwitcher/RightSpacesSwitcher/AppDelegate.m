//
//  AppDelegate.m
//  RightSpacesSwitcher
//
//  Created by Eric Relson on 11/13/14.
//  Copyright (c) 2014 N/A. All rights reserved.
//

#import "AppDelegate.h"
#import <Carbon/Carbon.h>

@interface AppDelegate ()

@property (strong, nonatomic) NSStatusItem *statusItem;

@property (weak) IBOutlet NSWindow *window;
@end



@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _statusItem.image = [NSImage imageNamed:@"right.png"];
    
    [_statusItem setAction:@selector(itemClicked:)];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)itemClicked:(id)sender {
    CGEventSourceRef src = CGEventSourceCreate(kCGEventSourceStateHIDSystemState);
    
    CGEventRef rghtd = CGEventCreateKeyboardEvent(src, kVK_RightArrow, true);
    CGEventRef rghtu = CGEventCreateKeyboardEvent(src, kVK_RightArrow, false);
    
    CGEventSetFlags(rghtd, kCGEventFlagMaskControl);
    CGEventSetFlags(rghtu, kCGEventFlagMaskControl);
    
    CGEventTapLocation loc = kCGHIDEventTap; // kCGSessionEventTap also works
    CGEventPost(loc, rghtd);
    CGEventPost(loc, rghtu);
    
    CFRelease(rghtd);
    CFRelease(rghtu);
    CFRelease(src);
}

@end
