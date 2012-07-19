ifeq ($(BOARD_USES_GPSSHIM),true)

$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libloc_intermediates)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libloc_intermediates/export_includes)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := gps.$(TARGET_BOOTLOADER_BOARD_NAME)

LOCAL_SHARED_LIBRARIES:= \
	liblog \
    $(BOARD_GPS_LIBRARIES) \

LOCAL_SRC_FILES += \
    gps.c

LOCAL_CFLAGS += \
    -fno-short-enums

ifneq ($(BOARD_GPS_BAD_AGPS),)
LOCAL_CFLAGS += \
    -DNO_AGPS
endif

#ifneq ($(BOARD_GPS_NEEDS_XTRA),)
LOCAL_CFLAGS += \
    -DNEEDS_INITIAL_XTRA
#endif

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

include $(BUILD_SHARED_LIBRARY)

endif # BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE
