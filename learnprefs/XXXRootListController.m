#import <Foundation/Foundation.h>
#import "XXXRootListController.h"

@implementation XXXRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}



-(void)loadView {
	[super loadView];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(respring:)];
}

- (void)respring:(id)sender {
		pid_t pid;
		const char* args[] = {"sbreload", NULL, NULL};
		posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, (char* const*)args, NULL);
}


@end
