HELLOMAKE = hellomake_$(CONFIGURED_ARCH).deb
$(HELLOMAKE)_SRC_PATH = $(SRC_PATH)/hellomake

SONIC_MAKE_DEBS += $(HELLOMAKE)
$(eval $(call add_derived_package,$(HELLOMAKE)))