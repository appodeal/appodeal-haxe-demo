# Appodeal OpenFL plugin

## 1. Link your Admob account
Appodeal yields optimal results in cooperation with Admob. To continue, you need to link your Admob account.

If you don't have Admob account, please sign up on Admob.com.

To link your Admob account to Appodeal, use the Chrome extension:

INSTALL EXTENSION


The extension source code is available at https://github.com/appodeal/admob-configurator.

The extension will make two changes in your Admob account. First, it will allow Appodeal to access your Admob reports over API, and second, it will create new ad units on Admob and submit them to Appodeal.

VIDEO TUTORIAL

## 2. Download SDK

You can download Appodeal plugin for OpenFL here.

Minimum OS requirements: Android API level 9 (Android OS 2.3).

Android Appodeal SDK version 1.15.5

iOS Appodeal SDK version x.x.x

## 3. AndroidManifest.xml

All required changes to AndroidManifest.xml are already included in the plugin

## 4. OpenFL Integration

### 4.1. SDK files

Download the plugin and unzip it into your project directory. Open project.xml and append the following lines:

```
<haxelib name="extension-admob" />
<include path="./appodeal-plugin" /> 
```

To install extension-admob, you can simply get the library from haxelib like this:

```
haxelib install extension-admob
```

### 4.2. Ad types

Appodeal.INTERSTITIAL

Appodeal.SKIPPABLE_VIDEO

Appodeal.BANNER

Appodeal.REWARDED_VIDEO

Appodeal.NON_SKIPPABLE_VIDEO

Ad types can be combined using "|" operator. For example Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO

Note that it is better to use NON_SKIPPABLE_VIDEO or REWARDED_VIDEO, but if you are sure you want to use SKIPPABLE_VIDEO you must confirm usage by calling Appodeal.confirm(Appodeal.SKIPPABLE_VIDEO) before SDK initialization

### 4.3. SDK initialization

To initialize SDK you need to add following code:

```
var appKey = "fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f";
var bannerRequired = true;
var interstitialRequired = true;
var skippableVideoRequired = true;
var nonSkippableVideoRequired = true;
var rewardedVideoRequired = true;
Appodeal.initialize(appKey, bannerRequired, interstitialRequired, skippableVideoRequired, nonSkippableVideoRequired, rewardedVideoRequired);
```

Note: appKey is the key you received when you created an app.

To initialize only interstitials use Appodeal.initialize(appKey, false, true, false, false, false);

To initialize only skippable videos use Appodeal.initialize(appKey, false, false, true, false, false);

To initialize interstitials and videos use Appodeal.initialize(appKey, false, true, true, false, false);

To initialize only banners use Appodeal.initialize(appKey, true, false, false, false, false);

To initialize only rewarded video use Appodeal.initialize(appKey, false, false, false, false, true);

To initialize only non-skippable video use Appodeal.initialize(appKey, false, false, false, true, false);

### 4.4. Display ad

```
Appodeal.show(adTypes);
```

show() returns a boolean value indicating whether show call was passed to appropriate SDK

To display interstitial use Appodeal.show(Appodeal.INTERSTITIAL)

To display skippable video use Appodeal.show(Appodeal.SKIPPABLE_VIDEO)

To display rewarded video use Appodeal.show(Appodeal.REWARDED_VIDEO)

To display non-skippable video use Appodeal.show(Appodeal.NON_SKIPPABLE_VIDEO)

To display interstitial or video use Appodeal.show(Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO)

To display banner at the bottom of the screen use Appodeal.Show(Appodeal.BANNER_BOTTOM)

To display banner at the top of the screen use Appodeal.show(Appodeal.BANNER_TOP)

### 4.5. Hiding banner

To hide banner you need to call the following code:

```
Appodeal.hide(Appodeal.BANNER);
```

### 4.6. Samples

Display interstitial after it was loaded

```
Appodeal.setAutoCache(Appodeal.INTERSTITIAL, false);
Appodeal.initialize(appKey, false, true, false, false, false);
Appodeal.cache(Appodeal.INTERSTITIAL);
Appodeal.addInterstitialListener("onInterstitialLoaded", onInterstitialReady);

public function onInterstitialReady(){
    Appodeal.show(Appodeal.INTERSTITIAL);
}
```

Display interstitial after app launch

```
Appodeal.initialize(appKey, false, true, false, false, false);
Appodeal.show(Appodeal.INTERSTITIAL);
```

`Note: showing fullscreen ads immediately after app launch doesn't allowed. Also, if an ad has not uploaded yet, you will see a loader, which will be disappeared after few seconds`

## 5. Advanced features
#### Enabling test mode

```
Appodeal.setTesting(true);
```

In test mode test ads will be shown and debug data will be written to logcat

#### Enabling logging

```
Appodeal.setLogging(true)
```
Enable debug logging to logcat using tag "Appodeal"

#### Checking if ad is loaded

```
Appodeal.isLoaded(adTypes);
```
To check if interstitial is loaded use Appodeal.isLoaded(Appodeal.INTERSTITIAL)

To check if skippable video is loaded use Appodeal.isLoaded(Appodeal.SKIPPABLE_VIDEO)

To check if rewarded video is loaded use Appodeal.isLoaded(Appodeal.REWARDED_VIDEO)

To check if non-skippable video is loaded use Appodeal.isLoaded(Appodeal.NON_SKIPPABLE_VIDEO)

To check if banner is loaded use Appodeal.isLoaded(Appodeal.BANNER)

#### Checking if loaded ad is precache

```
Appodeal.isPrecache(adTypes);
```

Currently supported only for interstitials, Use Appodeal.isPrecache(Appodeal.INTERSTITIAL)

#### Setting Interstitial callbacks

It's possible to add following callbacks:

```
Appodeal.addInterstitialListener("onInterstitialLoaded", your_function_name);
Appodeal.addInterstitialListener("onInterstitialShown", your_function_name);
Appodeal.addInterstitialListener("onInterstitialClicked", your_function_name);
Appodeal.addInterstitialListener("onInterstitialClosed", your_function_name);
Appodeal.addInterstitialListener("onInterstitialFailedToLoad", your_function_name);
```

#### Setting skippable video callbacks

It's possible to add following callbacks:

```
Appodeal.addSkippableListener("onSkippableVideoLoaded", your_function_name);
Appodeal.addSkippableListener("onSkippableVideoFailedToLoad", your_function_name);
Appodeal.addSkippableListener("onSkippableVideoShown", your_function_name);
Appodeal.addSkippableListener("onSkippableVideoClosed", your_function_name);
Appodeal.addSkippableListener("onSkippableVideoFinished", your_function_name);
```

#### Setting rewarded video callbacks

It's possible to add following callbacks:

```
Appodeal.addRewardedListener("onRewardedVideoLoaded", your_function_name);
Appodeal.addRewardedListener("onRewardedVideoFailedToLoad", your_function_name);
Appodeal.addRewardedListener("onRewardedVideoShown", your_function_name);
Appodeal.addRewardedListener("onRewardedVideoClosed", your_function_name);
Appodeal.addRewardedListener("onRewardedVideoFinished", your_function_name);
```

#### Setting non-skippable video callbacks

It's possible to add following callbacks:

```
Appodeal.addNonSkippableListener("onNonSkippableVideoLoaded", your_function_name);
Appodeal.addNonSkippableListener("onNonSkippableVideoFailedToLoad", your_function_name);
Appodeal.addNonSkippableListener("onNonSkippableVideoShown", your_function_name);
Appodeal.addNonSkippableListener("onNonSkippableVideoClosed", your_function_name);
Appodeal.addNonSkippableListener("onNonSkippableVideoFinished", your_function_name);
```

#### Setting banner callbacks

It's possible to add following callbacks:

```
Appodeal.addBannerListener("onBannerLoaded", your_function_name);
Appodeal.addBannerListener("onBannerFailedToLoad", your_function_name);
Appodeal.addBannerListener("onBannerShown", your_function_name);
Appodeal.addBannerListener("onBannerClicked", your_function_name);
```

#### Manual ad caching

```
Appodeal.cache(adTypes);
```

You should disable automatic caching before SDK initialization using setAutoCache(adTypes, false).

To cache interstitial use Appodeal.cache(Appodeal.INTERSTITIAL)

To cache skippable video use Appodeal.cache(Appodeal.SKIPPABLE_VIDEO)

To cache rewarded video use Appodeal.cache(Appodeal.REWARDED_VIDEO)

To cache non-skippable video use Appodeal.cache(Appodeal.NON_SKIPPABLE_VIDEO)

To cache interstitial and video use Appodeal.cache(Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO)

#### Enabling or disabling automatic caching

```
Appodeal.setAutoCache(adTypes, false);
```

Should be used before SDK initialization

To disable automatic caching for interstitials use Appodeal.setAutoCache(Appodeal.INTERSTITIAL, false)

To disable automatic caching for skippable videos use Appodeal.setAutoCache(Appodeal.SKIPPABLE_VIDEO, false)

To disable automatic caching for rewarded videos use Appodeal.setAutoCache(Appodeal.REWARDED_VIDEO, false)

To disable automatic caching for non-skippable videos use Appodeal.setAutoCache(Appodeal.NON_SKIPPABLE_VIDEO, false)

#### Triggering onLoaded callback twice

```
Appodeal.setOnLoadedTriggerBoth(adTypes, true);
```

Currently supported only for interstitials

setOnLoadedTriggerBoth(Appodeal.INTERSTITIAL, false) - onInterstitialLoaded will trigger only when normal ad was loaded (default).

setOnLoadedTriggerBoth(Appodeal.INTERSTITIAL, true) - onInterstitialLoaded will trigger twice, both when precache and normal ad were loaded.

Should be used before SDK initialization.

#### Disabling networks

```
Appodeal.disableNetwork("networkName");
```

Also, it’s possible to disable network only for specific ad types.

```
Appodeal.disableNetworkForAdType("networkName", adTypes);
```

Available parameters: "amazon_ads", "applovin", "chartboost", "mopub", "unity_ads", "mailru", "facebook", "adcolony", "vungle", "yandex", "startapp", "avocarrot", "flurry", "pubnative", "cheetah", "inner-active", "revmob".

Should be used before SDK initialization

#### Remove adapters from Project

First of all, it's required  to disable network, which you want to remove.
```
Appodeal.disableNetwork("startapp");
```

After that, you can remove unused jar files from libs folder of Appodeal plugin. Some networks are included in appodeal-1.15.5.jar file. You can open it via an archiver and remove unused dex files from assets/dex folder.

#### Disabling location permission check

To disable toast messages ACCESS_COARSE_LOCATION permission is missing use the following method:

```
Appodeal.disableLocationPermissionCheck();
```

Should be used before SDK initialization.

`Note: disabling location permission may have a negative impact on your revenue`

#### Disabling write external storage permission check

To disable toast messages WRITE_EXTERNAL_STORAGE permission is missing use the following method:

```
Appodeal.disableWriteExternalStoragePermissionCheck();
```

Should be used before SDK initialization.

`Note: some networks don't work without write external storage permission. They will be disabled in your application.`

#### Tracking in-app purchase

```
Appodeal.trackInAppPurchase(currencyCode, amount);
```

Tracks in-app purchase information and sends info to our servers for analytics. Example:

```
Appodeal.trackInAppPurchase("USD", 5);
```

### 5.1. Setting user data.
Initialization

Our SDK provides the transfer of user data for better ad targeting and higher eCPM. All parameters are optional and can be defined partially.

Set the age of the user

Positive integer value.

```
Appodeal.setAge(25);
```

Set birth date

```
Appodeal.setBirthday("17/06/1990");
```

birthday in format "DD/MM/YYYY" or "MM/YYYY" or "YYYY"

Set user email

```
Appodeal.setEmail("hi@appodeal.com");
```

Specify gender of the user

```
Appodeal.setGender(Appodeal.GENDER_MALE);
```

Possible values: Appodeal.GENDER_MALE, Appodeal.GENDER_FEMALEE,Appodeal.GENDER_OTHER.

Set interests of the user

```
Appodeal.setInterests("reading, games, movies, snowboarding");
```

Specify occupation of the user

```
Appodeal.setOccupation(Appodeal.OCCUPATION_OTHER);
```

Possible values: Appodeal.OCCUPATION_WORK, Appodeal.OCCUPATION_UNIVERSITY, Appodeal.OCCUPATION_SCHOOL, Appodeal.OCCUPATION_OTHER

Specify marital status of the user

```
Appodeal.setRelation(Appodeal.RELATION_DATING);
```

Possible values: Appodeal.RELATION_DATING, Appodeal.RELATION_ENGAGED, Appodeal.RELATION_MARRIED, Appodeal.RELATION_SEARCHING, Appodeal.RELATION_SINGLE, Appodeal.RELATION_RELATION_OTHER

Set drinking habits of the user

```
Appodeal.setAlcohol(Appodeal.ALCOHOL_POSITIVE);
```

Possible values: Appodeal.ALCOHOL_NEGATIVE, Appodeal.ALCOHOL_NEUTRAL, Appodeal.ALCOHOL_POSITIVE.

User attitude to smoking

```
Appodeal.setSmoking(Appodeal.SMOKING_NEGATIVE);
```

Possible values: Appodeal.SMOKING_NEGATIVE, Appodeal.SMOKING_POSITIVE, Appodeal.SMOKING_NEUTRAL.

## 6. Changelog

1.15.5 (12.10.2016)
* Release