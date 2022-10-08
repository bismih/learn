#import <Foundation/Foundation.h>
#import "appcrackController.h"
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <spawn.h>

@implementation appcrackController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"appcrack" target:self];
	}

	return _specifiers;
}


@end






