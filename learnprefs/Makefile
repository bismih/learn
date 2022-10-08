TARGET := iphone:clang:latest:7.0
ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = learn

learn_FILES = XXXRootListController.m learntouchListController.m DockControllerRootSettings.mm homoscreenhookController.m  appcrackController.m
learn_FRAMEWORKS = UIKit
learn_PRIVATE_FRAMEWORKS = Preferences
learn_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
learn_INSTALL_PATH = /Library/PreferenceBundles
learn_CFLAGS = -fobjc-arc
learn_LIBRARIES = sparkcolourpicker
include $(THEOS_MAKE_PATH)/bundle.mk
