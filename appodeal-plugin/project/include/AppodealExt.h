#ifndef AppodealExt
#define AppodealExt

namespace appodealext
{
     void   disableLocationPermissionCheck();
     void   disabledisableNetworkForAdType(int adType, const char* name);
     void   setAutoCache(int adType, bool val);
     bool   isPrecache(int val);
     void   initialize(const char* key, int adType);
     bool   isInitalized();
     void   enableInterstitialCallbacks();
     void   enableBannerCallbacks();
     void   enableSkippableVideoCallbacks();
     void   enableRewardedVideoCallbacks();
     void   enableNonSkippableVideoCallbacks();
     bool   show(int val);
     bool   showWithPlacement(int adType, const char* placement);
     void   cache(int adType);
     void   hide(int adType);
     void   setLogging(bool val);
     void   setTesting(bool val);
     void   resetUUID();
     char*  getVersion();
     bool   isLoaded(int title);
     void   setCustomRule(const char* rule);
     void   confirm(int val);
     void   setSmartBanners(bool val);
     void   setBannerBackgound(bool val);
     void   setBannerAnimation(bool val);
     void   setUserId(const char* ids);
     void   setEmail(const char* email);
     void   setBirthday(const char* birthday);
     void   setAge(int age);
     void   setGender(int gender);
     void   setOccupation(int occupation);
     void   setRelation(int relation);
     void   setSmoking(int smoking);
     void   setAlcohol(int alcohol);
     void   setInterests(const char* interests);
}

#endif
