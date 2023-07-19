# Make target to specify building the moto_mm.ko from within Android build system.
LOCAL_PATH := $(call my-dir)
# Path to DLKM make scripts
DLKM_DIR := $(TOP)/device/qcom/common/dlkm

# This makefile is only for DLKM
ifneq ($(findstring opensource,$(LOCAL_PATH)),)
	DISPLAY_BLD_DIR := $(TOP)/vendor/qcom/opensource/memory-kernel
endif # opensource

include $(CLEAR_VARS)
LOCAL_MODULE := moto_mm.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
KBUILD_OPTIONS_GKI += GKI_OBJ_MODULE_DIR=gki

-include $(DLKM_DIR)/AndroidKernelModule.mk

$(info DLKM_DIR = $(DLKM_DIR))
