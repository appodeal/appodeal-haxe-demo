#ifndef IPHONE
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>
#include "AppodealExt.h"
#include <stdio.h>

using namespace appodealext;

AutoGCRoot* appodealEventHandle = 0;

#ifdef IPHONE
void appodeal_events(value onEvent)
{
	appodealEventHandle = new AutoGCRoot(onEvent);
}
DEFINE_PRIM(appodeal_events, 1);

void appodeal_disableLocationPermissionCheck()
{
    disableLocationPermissionCheck();
}
DEFINE_PRIM(appodeal_disableLocationPermissionCheck, 0);

void appodeal_disableNetworkForAdType(value adType, value name)
{
    disabledisableNetworkForAdType(val_int(adType), val_string(name));
}
DEFINE_PRIM(appodeal_disableNetworkForAdType, 2);

void appodeal_setAutoCache(value adType, value val)
{
    setAutoCache(val_int(adType), val_bool(val));
}
DEFINE_PRIM(appodeal_setAutoCache, 2);

void appodeal_isPrecache(value val)
{
    isPrecache(val_int(val));
}
DEFINE_PRIM(appodeal_isPrecache, 1);

void appodeal_initialize(value key, value adType)
{
    initialize(val_string(key), val_int(adType));
}
DEFINE_PRIM(appodeal_initialize, 2);

static value appodeal_isInitalized()
{
    return (isInitalized() ? val_true : val_false);
}
DEFINE_PRIM(appodeal_isInitalized, 0);

void appodeal_enableInterstitialCallbacks()
{
    enableInterstitialCallbacks();
}
DEFINE_PRIM(appodeal_enableInterstitialCallbacks, 0);

void appodeal_enableBannerCallbacks()
{
    enableBannerCallbacks();
}
DEFINE_PRIM(appodeal_enableBannerCallbacks, 0);

void appodeal_enableSkippableVideoCallbacks()
{
    enableSkippableVideoCallbacks();
}
DEFINE_PRIM(appodeal_enableSkippableVideoCallbacks, 0);

void appodeal_enableRewardedVideoCallbacks()
{
    enableRewardedVideoCallbacks();
}
DEFINE_PRIM(appodeal_enableRewardedVideoCallbacks, 0);

void appodeal_enableNonSkippableVideoCallbacks()
{
    enableNonSkippableVideoCallbacks();
}
DEFINE_PRIM(appodeal_enableNonSkippableVideoCallbacks, 0);

static value appodeal_show(value val)
{
    return (show(val_int(val)) ? val_true : val_false);
}
DEFINE_PRIM(appodeal_show, 1);

static value appodeal_showWithPlacement(value adType, value placement)
{
    return (showWithPlacement(val_int(adType), val_string(placement)) ? val_true : val_false);
}
DEFINE_PRIM(appodeal_showWithPlacement, 2);

void appodeal_cache(value adType)
{
    cache(val_int(adType));
}
DEFINE_PRIM(appodeal_cache, 1);

void appodeal_hide(value adType)
{
    hide(val_int(adType));
}
DEFINE_PRIM(appodeal_hide, 1);

void appodeal_setLogging(value val)
{
    setLogging(val_bool(val));
}
DEFINE_PRIM(appodeal_setLogging, 1);

void appodeal_setTesting(value val)
{
    setTesting(val_bool(val));
}
DEFINE_PRIM(appodeal_setTesting, 1);

void appodeal_resetUUID()
{
    resetUUID();
}
DEFINE_PRIM(appodeal_resetUUID, 0);

char* appodeal_getVersion()
{
    return (getVersion());
}
DEFINE_PRIM(appodeal_getVersion, 0);

static value appodeal_isLoaded(value val)
{
    return (isLoaded(val_int(val)) ? val_true : val_false);
}
DEFINE_PRIM(appodeal_isLoaded, 1);

void appodeal_setCustomRule(value rule)
{
    setCustomRule(val_string(rule));
}
DEFINE_PRIM(appodeal_setCustomRule, 1);

void appodeal_confirm(value val)
{
    confirm(val_int(val));
}
DEFINE_PRIM(appodeal_confirm, 1);

void appodeal_setSmartBanners(value val)
{
    setSmartBanners(val_bool(val));
}
DEFINE_PRIM(appodeal_setSmartBanners, 1);

void appodeal_setBannerBackgound(value val)
{
    setBannerBackgound(val_bool(val));
}
DEFINE_PRIM(appodeal_setBannerBackgound, 1);

void appodeal_setBannerAnimation(value val)
{
    setBannerAnimation(val_bool(val));
}
DEFINE_PRIM(appodeal_setBannerAnimation, 1);

void appodeal_setUserId(value id)
{
    setUserId(val_string(id));
}
DEFINE_PRIM(appodeal_setUserId, 1);

void appodeal_setEmail(value email)
{
    setEmail(val_string(email));
}
DEFINE_PRIM(appodeal_setEmail, 1);

void appodeal_setBirthday(value birthday)
{
    setBirthday(val_string(birthday));
}
DEFINE_PRIM(appodeal_setBirthday, 1);

void appodeal_setAge(value age)
{
    setAge(val_int(age));
}
DEFINE_PRIM(appodeal_setAge, 1);

void appodeal_setGender(value gender)
{
    setGender(val_int(gender));
}
DEFINE_PRIM(appodeal_setGender, 1);

void appodeal_setOccupation(value occupation)
{
    setOccupation(val_int(occupation));
}
DEFINE_PRIM(appodeal_setOccupation, 1);

void appodeal_setRelation(value relation)
{
    setRelation(val_int(relation));
}
DEFINE_PRIM(appodeal_setRelation, 1);

void appodeal_setSmoking(value smoking)
{
    setSmoking(val_int(smoking));
}
DEFINE_PRIM(appodeal_setSmoking, 1);

void appodeal_setAlcohol(value alcohol)
{
    setAlcohol(val_int(alcohol));
}
DEFINE_PRIM(appodeal_setAlcohol, 1);

void appodeal_setInterests(value interests)
{
    setInterests(val_string(interests));
}
DEFINE_PRIM(appodeal_setInterests, 1);

#endif

extern "C" void appodeal_main() 
{

}
DEFINE_ENTRY_POINT(appodeal_main);

extern "C" int appodeal_register_prims() 
{ 
    return 0; 
}

extern "C" void sendAppodealEvent(const char* type) 
{
    value v = alloc_empty_object();
    alloc_field(v, val_id("type"), alloc_string(type));
    val_call1(appodealEventHandle->get(), v);
}