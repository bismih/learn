ARCHS = arm64 arm64e
TARGET = iphone:clang::13.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = learn

learn_FILES =  system/d3touch.x system/Date.x system/dndDNDMyRecording.xm system/QQAntiRecall.x system/tapflah.xm system/Tweak.xm  system/DockController.xm




learn_CFLAGS = -fobjc-arc
learn_FRAMEWORKS = UIKit
learn_PRIVATE_FRAMEWORKS = SpringBoardServices
learn_LIBRARIES = sparkcolourpicker
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += learnprefs respring
include $(THEOS_MAKE_PATH)/aggregate.mk
