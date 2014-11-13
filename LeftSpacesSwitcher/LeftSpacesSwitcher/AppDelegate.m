//
//  AppDelegate.m
//  LeftSpacesSwitcher
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
    _statusItem.image = [NSImage imageNamed:@"left.png"];
    
    [_statusItem setAction:@selector(itemClicked:)];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)itemClicked:(id)sender {
    CGEventSourceRef src = CGEventSourceCreate(kCGEventSourceStateHIDSystemState);
    
    CGEventRef leftd = CGEventCreateKeyboardEvent(src, kVK_LeftArrow, true);
    CGEventRef leftu = CGEventCreateKeyboardEvent(src, kVK_LeftArrow, false);
    
    CGEventSetFlags(leftd, kCGEventFlagMaskControl);
    CGEventSetFlags(leftu, kCGEventFlagMaskControl);
    
    CGEventTapLocation loc = kCGHIDEventTap; // kCGSessionEventTap also works
    CGEventPost(loc, leftd);
    CGEventPost(loc, leftu);
    
    CFRelease(leftd);
    CFRelease(leftu);
    CFRelease(src);
}

@end
