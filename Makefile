THEOS_PACKAGE_DIR_NAME = debs
TARGET =: clang
ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = Colendar
Colendar_FILES = Colendar.xm
Colendar_FRAMEWORKS = UIKit
Colendar_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += CLPrefs
SUBPROJECTS += colendarwriter
include $(THEOS_MAKE_PATH)/aggregate.mk

internal-after-install::
	install.exec "killall -9 backboardd"
