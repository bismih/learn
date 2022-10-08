#import <UIKit/UIKit.h>


#define prefs @"/var/mobile/Library/Preferences/com.yourcompany.learn.plist"









NSMutableDictionary *MutDiction;   
static NSString *prefsAnswer;
static NSString *prefsyys;
static BOOL changeyys,my;
//定义俩变量





void loadprefs(){

 MutDiction = [[NSMutableDictionary alloc] initWithContentsOfFile: prefs];
	changeyys = [MutDiction objectForKey:@"changeyys"] ? [[MutDiction objectForKey:@"changeyys"] boolValue] : YES;
	my = [MutDiction objectForKey:@"my"] ? [[MutDiction objectForKey:@"my"] boolValue] : YES;
//to get the user input
prefsAnswer = [MutDiction objectForKey: @ "answer"];
prefsyys = [MutDiction objectForKey: @ "yys"];
}






/////////////////////////////////
///运营商
/////////////////////////////////
%hook _UIStatusBarDataCellularEntry
- (void)setString:(id)arg1 {
    if(changeyys)
        %orig(prefsyys);
        else
  %orig;

}
%end







/////////////////////////////////
/////时间
////////////////////////////
%hook _UIStatusBarStringView
-(void)setText:(id)arg1{



//so it just changes the time and not anything else written on the status bar
 if([arg1 containsString:@":"]){

 NSDate* currentDate = [NSDate date];
 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
formatter.dateFormat = prefsAnswer;
NSString *string = [formatter stringFromDate:currentDate];

//if there isn't anything written by the user, it'll automatically choose the normal time
 if(!prefsAnswer){

  return %orig;

}

//returns custom answer
  return %orig(string);

}else{

}

	//normal code from apple
	%orig(arg1);

}
%end











%ctor{

    loadprefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadprefs, CFSTR("com.yourcompany.learn.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}