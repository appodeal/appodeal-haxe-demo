#include <Appodeal.h>
#import <AppodealExt.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

extern "C" void sendAppodealEvent(const char* type);

using namespace appodealext;

@interface AppodealExtension : NSObject <AppodealBannerDelegate, AppodealInterstitialDelegate, AppodealBannerDelegate, AppodealRewardedVideoDelegate, AppodealNonSkippableVideoDelegate, AppodealSkippableVideoDelegate>
{
}
@end

@implementation AppodealExtension

-(void) bannerDidLoadAdIsPrecache:(BOOL)precache
{
    if(precache)
        sendAppodealEvent("onBannerDidLoadAdisPrecacheTrue");
    else
        sendAppodealEvent("onBannerDidLoadAdisPrecacheFalse");
}

-(void) bannerDidShow
{
    sendAppodealEvent("onBannerShown");
}

-(void) bannerDidClick
{
    sendAppodealEvent("onBannerClicked");
}

-(void) bannerDidFailToLoadAd
{
    sendAppodealEvent("onBannerFailedToLoad");
}

- (void)bannerDidLoadAd
{
    sendAppodealEvent("onBannerLoaded");
}

- (void)bannerDidRefresh
{
    sendAppodealEvent("onBannerRefreshed");
}

// interstitial
- (void)interstitialDidLoadAd
{
    sendAppodealEvent("onInterstitialLoaded");
}

- (void)interstitialDidLoadAdisPrecache:(BOOL)precache
{
    if(precache)
        sendAppodealEvent("onInterstitialLoadedAdisPrecacheTrue");
    else
        sendAppodealEvent("onInterstitialLoadedAdisPrecacheFalse");
}

- (void)interstitialDidFailToLoadAd
{
    sendAppodealEvent("onInterstitialFailedToLoad");
}

- (void)interstitialWillPresent
{
    sendAppodealEvent("onInterstitialShown");
}

- (void)interstitialDidDismiss
{
    sendAppodealEvent("onInterstitialClosed");
}

- (void)interstitialDidClick
{
    sendAppodealEvent("onInterstitialClicked");
}

// rewarded video
- (void)rewardedVideoDidLoadAd
{
    sendAppodealEvent("onRewardedVideoLoaded");
}

- (void)rewardedVideoDidFailToLoadAd
{
    sendAppodealEvent("onRewardedVideoFailedToLoad");
}

- (void)rewardedVideoDidPresent
{
    sendAppodealEvent("onRewardedVideoShown");
}

- (void)rewardedVideoWillDismiss
{
    sendAppodealEvent("onRewardedVideoClosed");
}

- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName
{
    //sendAppodealEvent("onRewardedVideoFinished", rewardAmount, rewardName);
    sendAppodealEvent("onRewardedVideoFinished");
}

- (void)rewardedVideoDidClick
{
    sendAppodealEvent("onRewardedVideoClicked");
}

// non skippable video
- (void)nonSkippableVideoDidLoadAd
{
    sendAppodealEvent("onNonSkippableVideoLoaded");
}

- (void)nonSkippableVideoDidFailToLoadAd
{
    sendAppodealEvent("onNonSkippableVideoFailedToLoad");
}

- (void)nonSkippableVideoDidPresent
{
    sendAppodealEvent("onNonSkippableVideoShown");
}

- (void)nonSkippableVideoWillDismiss
{
    sendAppodealEvent("onNonSkippableVideoClosed");
}

- (void)nonSkippableVideoDidFinish
{
    sendAppodealEvent("onNonSkippableVideoFinished");
}

- (void)nonSkippableVideoDidClick
{
    sendAppodealEvent("onNonSkippableVideoClicked");
}

// skippable video
- (void)skippableVideoDidLoadAd
{
    sendAppodealEvent("onSkippableVideoLoaded");
}

- (void)skippableVideoDidFailToLoadAd
{
    sendAppodealEvent("onSkippableVideoFailedToLoad");
}

- (void)skippableVideoDidPresent
{
    sendAppodealEvent("onSkippableVideoShown");
}

- (void)skippableVideoWillDismiss
{
    sendAppodealEvent("onSkippableVideoClosed");
}

- (void)skippableVideoDidFinish
{
    sendAppodealEvent("onSkippableVideoFinished");
}

- (void)skippableVideoDidClick
{
    sendAppodealEvent("onSkippableVideoClicked");
}

@end

namespace appodealext
{
    static AppodealExtension *appodealExtension;

    void disableLocationPermissionCheck()
    {
        [Appodeal disableLocationPermissionCheck];
    }

    void disabledisableNetworkForAdType(int adType, const char* name1)
    {
        NSString *Str = [NSString stringWithCString:name1 encoding:NSUTF8StringEncoding];
        [Appodeal disableNetworkForAdType:adType name:Str];
    }
    
    void setAutoCache(int adType, bool val)
    {
        [Appodeal setAutocache:val types:adType];
    }

    bool isPrecache(int val)
    {
        return ([Appodeal isAutocacheEnabled:val]);
    }
    
    void initialize(const char* key, int adType)
    {
        if (appodealExtension == nil)
            appodealExtension = [[AppodealExtension alloc] init];

        NSString *Str = [NSString stringWithCString:key encoding:NSUTF8StringEncoding];
        [Appodeal initializeWithApiKey:Str types:adType];
        [Appodeal setBannerDelegate:appodealExtension];
    }

    bool isInitalized()
    {
        return ([Appodeal isInitalized]);
    }

    void enableInterstitialCallbacks()
    {
        if (appodealExtension == nil)
            appodealExtension = [[AppodealExtension alloc] init];
        [Appodeal setInterstitialDelegate:appodealExtension];
    }
    
    void enableBannerCallbacks()
    {
        if (appodealExtension == nil)
            appodealExtension = [[AppodealExtension alloc] init];
        [Appodeal setBannerDelegate:appodealExtension];
    }
    
    void enableSkippableVideoCallbacks()
    {
        if (appodealExtension == nil)
            appodealExtension = [[AppodealExtension alloc] init];
        [Appodeal setSkippableVideoDelegate:appodealExtension];
    }
    
    void enableRewardedVideoCallbacks()
    {
        if (appodealExtension == nil)
            appodealExtension = [[AppodealExtension alloc] init];
        [Appodeal setRewardedVideoDelegate:appodealExtension];
    }
    
    void enableNonSkippableVideoCallbacks()
    {
        if (appodealExtension == nil)
            appodealExtension = [[AppodealExtension alloc] init];
        [Appodeal setNonSkippableVideoDelegate:appodealExtension];
    }

    bool show(int val)
    {
        return ([Appodeal showAd:val rootViewController:[[UIApplication sharedApplication] keyWindow].rootViewController]);
    }

    bool showWithPlacement(int adType, const char* placement)
    {
        NSString *Str = [NSString stringWithCString:placement encoding:NSUTF8StringEncoding];
        return ([Appodeal showAd:adType forPlacement:Str rootViewController:[[UIApplication sharedApplication] keyWindow].rootViewController]);
    }

    void cache(int adType)
    {
        [Appodeal cacheAd:adType];
    }
    
    void hide(int adType)
    {
        [Appodeal hideBanner];
    }
    
    void setLogging(bool val)
    {
        [Appodeal setDebugEnabled:val];
    }
    
    void setTesting(bool val)
    {
        [Appodeal setTestingEnabled:val];
    }
    
    void resetUUID()
    {
        [Appodeal resetUUID];
    }
    
    char* getVersion()
    {
        return ((char*)[[Appodeal getVersion] UTF8String]);
    }
    
    bool isLoaded(int val)
    {
        return ([Appodeal isReadyForShowWithStyle:val]);
    }

    void setCustomRule(const char* rule)
    {
        //@"{\"valueNumber\":0,\"valueText\":\"text\"}"
        NSString *Str = [NSString stringWithCString:rule encoding:NSUTF8StringEncoding];
        NSString *jsonString = Str;
        NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [Appodeal setCustomRule:json];
    }

    void confirm(int val)
    {
        [Appodeal confirmUsage:val];
    }

    void setSmartBanners(bool val)
    {
        [Appodeal setSmartBannersEnabled:val];
    }
    
    void setBannerBackgound(bool val)
    {
        [Appodeal setBannerBackgroundVisible:val];
    }
    
    void setBannerAnimation(bool val)
    {
        [Appodeal setBannerAnimationEnabled:val];
    }
    
    void setUserId(const char* ids)
    {
        NSString *Str = [NSString stringWithCString:ids encoding:NSUTF8StringEncoding];
        [Appodeal setUserId:Str];
    }
    
    void setEmail(const char* email)
    {
        NSString *Str = [NSString stringWithCString:email encoding:NSUTF8StringEncoding];
        [Appodeal setUserEmail:Str];
    }
    
    void setBirthday(const char* birthday)
    {
        NSString *Str = [NSString stringWithCString:birthday encoding:NSUTF8StringEncoding];
        NSString *dateString = Str;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSDate *dateFromString = [[NSDate alloc] init];
        dateFromString = [dateFormatter dateFromString:dateString];
        
        [Appodeal setUserBirthday:dateFromString];
    }

    void setAge(int age)
    {
        [Appodeal setUserAge:age];
    }
    
    void setGender(int gender)
    {
        if(gender == 2)
            [Appodeal setUserGender:AppodealUserGenderOther];
        if(gender == 1)
            [Appodeal setUserGender:AppodealUserGenderMale];
        if(gender == 0)
            [Appodeal setUserGender:AppodealUserGenderFemale];
    }
    
    void setOccupation(int occupation)
    {
        if(occupation == 3)
            [Appodeal setUserOccupation:AppodealUserOccupationOther];
        if(occupation == 0)
            [Appodeal setUserOccupation:AppodealUserOccupationWork];
        if(occupation == 2)
            [Appodeal setUserOccupation:AppodealUserOccupationSchool];
        if(occupation == 1)
            [Appodeal setUserOccupation:AppodealUserOccupationUniversity];
    }
    
    void setRelation(int relation)
    {
        if(relation == 5)
            [Appodeal setUserRelationship:AppodealUserRelationshipOther];
        if(relation == 4)
            [Appodeal setUserRelationship:AppodealUserRelationshipSingle];
        if(relation == 0)
            [Appodeal setUserRelationship:AppodealUserRelationshipDating];
        if(relation == 1)
            [Appodeal setUserRelationship:AppodealUserRelationshipEngaged];
        if(relation == 2)
            [Appodeal setUserRelationship:AppodealUserRelationshipMarried];
        if(relation == 3)
            [Appodeal setUserRelationship:AppodealUserRelationshipSearching];
    }
    
    void setSmoking(int smoking)
    {
        if(smoking == 0)
            [Appodeal setUserSmokingAttitude:AppodealUserSmokingAttitudeNegative];
        if(smoking == 1)
            [Appodeal setUserSmokingAttitude:AppodealUserSmokingAttitudeNeutral];
        if(smoking == 2)
            [Appodeal setUserSmokingAttitude:AppodealUserSmokingAttitudePositive];

    }
    
    void setAlcohol(int alcohol)
    {
        if(alcohol == 0)
            [Appodeal setUserAlcoholAttitude:AppodealUserAlcoholAttitudeNegative];
        if(alcohol == 1)
            [Appodeal setUserAlcoholAttitude:AppodealUserAlcoholAttitudeNeutral];
        if(alcohol == 2)
            [Appodeal setUserAlcoholAttitude:AppodealUserAlcoholAttitudePositive];
    }
    
    void setInterests(const char* interests)
    {
        NSString *Str = [NSString stringWithCString:interests encoding:NSUTF8StringEncoding];
        [Appodeal setUserInterests:Str];
    }
    
}