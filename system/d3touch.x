#include "Tweak.h"
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.yourcompany.learn.plist"
BOOL AwesomeSwitch1;

BOOL other,dooubletaptolock;
static int customAlignment;
static BOOL changedatealign;
static int customLSTAlignment;



static void loadPrefs() {
    	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];

	AwesomeSwitch1 = [prefs objectForKey:@"AwesomeSwitch1"] ? [[prefs objectForKey:@"AwesomeSwitch1"] boolValue] : YES;
	other = [prefs objectForKey:@"other"] ? [[prefs objectForKey:@"other"] boolValue] : YES;
	dooubletaptolock = [prefs objectForKey:@"dooubletaptolock"] ? [[prefs objectForKey:@"dooubletaptolock"] boolValue] : YES;
	customAlignment = (prefs && [prefs objectForKey:@"customAlignment"] ? [[prefs valueForKey:@"customAlignment"] integerValue] : 2 );

	changedatealign = [prefs objectForKey:@"changedatealign"] ? [[prefs objectForKey:@"changedatealign"] boolValue] : YES;

	customLSTAlignment = (prefs && [prefs objectForKey:@"customLSTAlignment"] ? [[prefs valueForKey:@"customLSTAlignment"] integerValue] : 2 );



}




////锁屏时间位置
%hook SBFLockScreenDateView

-(void)setAlignmentPercent:(double)arg1 {

if(changedatealign){



	if (customLSTAlignment == 2)
			%orig(-1.0);
  else if (customLSTAlignment == 3)
			%orig(1.0);

}
else 
%orig;

}

%end







 
%hook SBIconListView
  - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
   // if(customAlignment == 2){
    if(dooubletaptolock && customAlignment == 2)
    {
      if ([[touches anyObject] tapCount] == 2) [(SpringBoard *)[%c(SpringBoard) sharedApplication] _simulateLockButtonPress];
    }
    if(dooubletaptolock && customAlignment == 3)
    {
      if ([[touches anyObject] tapCount] == 3) [(SpringBoard *)[%c(SpringBoard) sharedApplication] _simulateLockButtonPress];
    }   

  }
%end


















%hook SBIconView
- (void)setApplicationShortcutItems:(NSArray *)arg1 {
  NSMutableArray *originalItems = [[NSMutableArray alloc] init];
  for (SBSApplicationShortcutItem *item in arg1) {
    [originalItems addObject:item];
  }


if(AwesomeSwitch1){
      //test
    SBSApplicationShortcutItem *testItem = 
        [%c(SBSApplicationShortcutItem) alloc];
    testItem.localizedTitle = @"test";
        testItem.type = @"com.hearse.3developer.test";
    [originalItems addObject:testItem];
}




if(other){

    //decrypt
    SBSApplicationShortcutItem *flexItem =
        [%c(SBSApplicationShortcutItem) alloc];
    flexItem.localizedTitle = @"Flexdecrypt";
    SBSApplicationShortcutSystemPrivateIcon *flexIcon =
        [[SBSApplicationShortcutSystemPrivateIcon alloc]
            initWithSystemImageName:@"chevron.left.slash.chevron.right"];
    [flexItem setIcon:flexIcon];
    flexItem.type = @"com.hearse.3developer.flex";
    [originalItems addObject:flexItem];

    //copy bundle id
    SBSApplicationShortcutItem *copyBundleItem =
        [%c(SBSApplicationShortcutItem) alloc];
    copyBundleItem.localizedTitle = @"Copy Bundle ID";
    copyBundleItem.localizedSubtitle = self.applicationBundleIdentifierForShortcuts;
    SBSApplicationShortcutSystemPrivateIcon *copyBundleIcon =
        [[SBSApplicationShortcutSystemPrivateIcon alloc]
            initWithSystemImageName:@"app.badge"];
    [copyBundleItem setIcon:copyBundleIcon];
    copyBundleItem.type = @"com.hearse.3developer.bundle";
    [originalItems addObject:copyBundleItem];
    //open bundle
    SBSApplicationShortcutItem *openBundleItem =
        [%c(SBSApplicationShortcutItem) alloc];
    openBundleItem.localizedTitle = @"Open Bundle In Filza";
    SBSApplicationShortcutSystemPrivateIcon *openBundleIcon =
        [[SBSApplicationShortcutSystemPrivateIcon alloc]
            initWithSystemImageName:@"doc.fill"];
    [openBundleItem setIcon:openBundleIcon];
    openBundleItem.type = @"com.hearse.3developer.openBundleInFilza";
    [originalItems addObject:openBundleItem];
}
  %orig(originalItems);
}

+ (void)activateShortcut:(SBSApplicationShortcutItem *)item
    withBundleIdentifier:(NSString *)bundleID
             forIconView:(SBIconView *)iconView {
  
  //////////////////////
  
  if ([[item type] isEqualToString:@"com.hearse.3developer.flex"]) {

    FBApplicationInfo *app =
        (FBApplicationInfo *)[[NSClassFromString(@"SBApplicationController")
                                  sharedInstance]
            applicationWithBundleIdentifier:bundleID]
            .info;

    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/flexdecrypt"];
    [task setArguments:@[ app.executableURL.path ]];
    NSPipe *out = [NSPipe pipe];
    [task setStandardOutput:out];

    [task setTerminationHandler:^(NSTask *task) {
      dispatch_async(dispatch_get_main_queue(), ^{
        NSFileHandle *read = [out fileHandleForReading];
        NSData *dataRead = [read readDataToEndOfFile];
        NSString *stringRead =
            [[NSString alloc] initWithData:dataRead
                                  encoding:NSUTF8StringEncoding];
        UIAlertController *alert = [UIAlertController
            alertControllerWithTitle:@"Flexdecrypt"
                             message:stringRead
                      preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *dismissAction = [UIAlertAction
            actionWithTitle:@"Dismiss"
                      style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction *action) {
                    }];
        UIAlertAction *filzaAction = [UIAlertAction
            actionWithTitle:@"Open in Filza"
                      style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction *action) {
                      NSString *decryptedPath = [[NSString alloc]
                          initWithFormat:
                              @"%@",
                              [stringRead
                                  stringByReplacingOccurrencesOfString:
                                      @"Wrote decrypted image to "
                                                            withString:@""]];

                      NSString *pathInFilza = [@"filza://view"
                               stringByAppendingString:decryptedPath];
NSString* trimmedUrlString = [pathInFilza stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                      NSURL *url = [NSURL
                          URLWithString:
                              [trimmedUrlString
                                  stringByAddingPercentEncodingWithAllowedCharacters:
                                      [NSCharacterSet
                                          URLQueryAllowedCharacterSet]]];

                      NSLog(@"NSLogify |%@|", url);
                      [[%c(SpringBoard) sharedApplication]
                          applicationOpenURL:url];
                    }];
        [alert addAction:dismissAction];
        [alert addAction:filzaAction];

        [iconView.window.rootViewController presentViewController:alert
                                                         animated:YES
                                                       completion:nil];
      });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
      [task launch];
    });

  }
  ////////////////////////
  
  else if ([[item type] isEqualToString:@"com.hearse.3developer.bundle"]) {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = bundleID;

  } 
   ////////////////////////       testtesttest

  
  else if ([[item type] isEqualToString:@"com.hearse.3developer.test"]) {

UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = bundleID;

  } 
  ///////////////
  else if ([[item type]
                 isEqualToString:@"com.hearse.3developer.openBundleInFilza"]) {

    FBApplicationInfo *app =
        (FBApplicationInfo *)[[NSClassFromString(@"SBApplicationController")
                                  sharedInstance]
            applicationWithBundleIdentifier:bundleID]
            .info;
    NSString *pathInFilza =
        [@"filza://view" stringByAppendingString:app.bundleURL.path];
    NSURL *url = [NSURL
        URLWithString:[pathInFilza
                          stringByAddingPercentEncodingWithAllowedCharacters:
                              [NSCharacterSet URLQueryAllowedCharacterSet]]];
    [[%c(SpringBoard) sharedApplication] applicationOpenURL:url];

  }
   else {
    %orig;
  }
}
%end




%ctor {
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.yourcompany.learn.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
