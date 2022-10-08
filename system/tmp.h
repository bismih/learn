#import "SparkColourPickerUtils.h"

%hook HOOKHERE

-(UIColor*) FUNCTIONTOHOOK
{
    NSString* colourString = NULL;
    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/com.your.identifier.plist"];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey: @"YourCustomColour"];
    }

    UIColor* selectedColour = [SparkColourPickerUtils colourWithString: colourString withFallback: @"#ffffff"];

    return selectedColour;
}

%end