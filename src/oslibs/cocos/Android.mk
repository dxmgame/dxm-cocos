LOCAL_PATH := $(call my-dir)

################## Build ProtoBuf ################
include $(CLEAR_VARS)

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../cocos2d-x/cocos/2d \
                    $(LOCAL_PATH)/../../cocos2d-x/cocos/3d \
                    $(LOCAL_PATH)/../../cocos2d-x/cocos/network \
                    $(LOCAL_PATH)/../../cocos2d-x/cocos/editor-support/cocosbuilder \
                    $(LOCAL_PATH)/../../cocos2d-x/cocos/editor-support/cocostudio \
                    $(LOCAL_PATH)/../../cocos2d-x/cocos/editor-support/cocostudio/ActionTimeline \
                    $(LOCAL_PATH)/../../cocos2d-x/cocos/editor-support/spine \
                    $(LOCAL_PATH)/../../cocos2d-x/cocos/ui \
                    $(LOCAL_PATH)/../../cocos2d-x/cocos \

$(call import-module,cocos)