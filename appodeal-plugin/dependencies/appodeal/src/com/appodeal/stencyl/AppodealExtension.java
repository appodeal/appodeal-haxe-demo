package com.appodeal.stencyl;

import com.appodeal.ads.Appodeal;
import com.appodeal.ads.BannerCallbacks;
import com.appodeal.ads.InterstitialCallbacks;
import com.appodeal.ads.NonSkippableVideoCallbacks;
import com.appodeal.ads.RewardedVideoCallbacks;
import com.appodeal.ads.UserSettings;

import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

public class AppodealExtension extends Extension {
	
	private static UserSettings userSettings;
	private static HaxeObject bannerListener;
	private static HaxeObject interstitialListener;
	private static HaxeObject nonSkippableListener;
	private static HaxeObject rewardedListener;

	
	public static void initialize (String appKey, int adType) {
		Appodeal.initialize(mainActivity, appKey, adType);
	}
	
	public static boolean show(int adType) {
		return Appodeal.show(mainActivity, adType);
	}
	
	public static String getVersion() {
		return Appodeal.getVersion();
	}

	public static boolean showWithPlacement(int adType, String placement) {
		return Appodeal.show(mainActivity, adType, placement);
	}
	
	public static void hide (int adType) {
		Appodeal.hide(mainActivity, adType);
	}

	public static void confirm (int adType) {
		Appodeal.confirm(adType);
	}

	public static void setTesting (boolean test) {
		Appodeal.setTesting(test);
	}
	
	public static void setLogLevel (int level) {
		com.appodeal.ads.utils.Log.LogLevel appodealLevel;
		switch(level){
			case 0:
				appodealLevel = com.appodeal.ads.utils.Log.LogLevel.debug;
				break;
			case 1:
				appodealLevel = com.appodeal.ads.utils.Log.LogLevel.verbose;
				break;
			case 2:
			default:
				appodealLevel = com.appodeal.ads.utils.Log.LogLevel.none;
				break;
		}
		Appodeal.setLogLevel(appodealLevel);
	}

	public static boolean isLoaded(int adType) {
		return Appodeal.isLoaded(adType);
	}
	
	public static boolean isPrecache(int adType) {
		return Appodeal.isPrecache(adType);
	}
	
	public static void cache(int adType){
		Appodeal.cache(mainActivity, adType);
	}
	

	//CALLBACKS REGION

	public static void setInterstitialCallbacks (HaxeObject haxeCallback) {
		interstitialListener = haxeCallback;
		Appodeal.setInterstitialCallbacks(new InterstitialCallbacks() {
			
			@Override
			public void onInterstitialLoaded(boolean isPrecache)
			{
			   	AppodealExtension.callHaxeInterstitial("onInterstitialLoaded", new Object[] {});
			}

			@Override
			public void onInterstitialFailedToLoad()
			{
			  	AppodealExtension.callHaxeInterstitial("onInterstitialFailedToLoad", new Object[] {});
			}

			@Override
			public void onInterstitialShown()
			{
				AppodealExtension.callHaxeInterstitial("onInterstitialShown", new Object[] {});
			}

			@Override
			public void onInterstitialClicked()
			{
			  	AppodealExtension.callHaxeInterstitial("onInterstitialClicked", new Object[] {});
			}

			@Override
			public void onInterstitialClosed()
			{
			   	AppodealExtension.callHaxeInterstitial("onInterstitialClosed", new Object[] {});
			}
			
			@Override
			public void onInterstitialFinished()
			{
				AppodealExtension.callHaxeInterstitial("onInterstitialFinished", new Object[] {});
			}

		});
	}
	
	public static void setBannerCallbacks (HaxeObject haxeCallback) {
		bannerListener = haxeCallback;
		Appodeal.setBannerCallbacks(new BannerCallbacks() {

			@Override
			public void onBannerLoaded(int height, boolean isPrecache) {
				AppodealExtension.callHaxeBanner("onBannerLoaded", new Object[] {}); 
			}

			@Override
			public void onBannerFailedToLoad() {
				AppodealExtension.callHaxeBanner("onBannerFailedToLoad", new Object[] {}); 
			}

			@Override
			public void onBannerShown() {
				AppodealExtension.callHaxeBanner("onBannerShown", new Object[] {}); 
			}

			@Override
			public void onBannerClicked() {
				AppodealExtension.callHaxeBanner("onBannerClicked", new Object[] {}); 
			}
			
		 });
	}

	public static void setNonSkippableVideoCallbacks (HaxeObject haxeCallback) {
		nonSkippableListener = haxeCallback;
		Appodeal.setNonSkippableVideoCallbacks(new NonSkippableVideoCallbacks() {

			@Override
			public void onNonSkippableVideoLoaded() {
				AppodealExtension.callHaxeNonSkippableVideo("onNonSkippableVideoLoaded", new Object[] {});
			}

			@Override
			public void onNonSkippableVideoFailedToLoad() {
				AppodealExtension.callHaxeNonSkippableVideo("onNonSkippableVideoFailedToLoad", new Object[] {});
			}

			@Override
			public void onNonSkippableVideoShown() {
				AppodealExtension.callHaxeNonSkippableVideo("onNonSkippableVideoShown", new Object[] {});
			}

			@Override
			public void onNonSkippableVideoFinished() {
				AppodealExtension.callHaxeNonSkippableVideo("onNonSkippableVideoFinished", new Object[] {});
			}

			@Override
			public void onNonSkippableVideoClosed(boolean finished) {
				AppodealExtension.callHaxeNonSkippableVideo("onNonSkippableVideoClosed", new Object[] {});
			}

		});
	}
	
	
	public static void setRewardedVideoCallbacks (HaxeObject haxeCallback) {
		rewardedListener = haxeCallback;
		Appodeal.setRewardedVideoCallbacks(new RewardedVideoCallbacks() {
			
			@Override
			public void onRewardedVideoLoaded() {
				AppodealExtension.callHaxeRewardedVideo("onRewardedVideoLoaded", new Object[] {});
			}

			@Override
			public void onRewardedVideoFailedToLoad() {
				AppodealExtension.callHaxeRewardedVideo("onRewardedVideoFailedToLoad", new Object[] {});
			}

			@Override
			public void onRewardedVideoShown() {
				AppodealExtension.callHaxeRewardedVideo("onRewardedVideoShown", new Object[] {});
			}

			@Override
			public void onRewardedVideoFinished(int amount, String name) {
				AppodealExtension.callHaxeRewardedVideo("onRewardedVideoFinished", new Object[] {});
			}

			@Override
			public void onRewardedVideoClosed(boolean finished) {
				AppodealExtension.callHaxeRewardedVideo("onRewardedVideoClosed", new Object[] {});
			}	
			
		  });
	}

	//INTERNAL CALLBACKS FUNCTIONS REGION
	
	private static void callHaxeInterstitial (final String name, final Object[] args) {
		if(interstitialListener == null) {
			return;
		}
		callbackHandler.post(new Runnable() {
			public void run() {
				interstitialListener.call(name, args);
			}
		});
	}

	private static void callHaxeBanner (final String name, final Object[] args) {
		if(bannerListener == null) {
			return;
		}
		callbackHandler.post(new Runnable() {
			public void run() {
				bannerListener.call(name, args);
			}
		});
	}

	private static void callHaxeNonSkippableVideo (final String name, final Object[] args) {
		if(nonSkippableListener == null) {
			return;
		}
		callbackHandler.post(new Runnable() {
			public void run() {
				nonSkippableListener.call(name, args);
			}
		});
	}

	private static void callHaxeRewardedVideo (final String name, final Object[] args) {
		if(rewardedListener == null) {
			return;
		}
		callbackHandler.post(new Runnable() {
			public void run() {
				rewardedListener.call(name, args);
			}
		});
	}


	//ADDITIONAL SETTINGS REGION

	public static void setAutoCache (int adType, boolean setCache) {
		Appodeal.setAutoCache(adType, setCache);
	}

	public static void setOnLoadedTriggerBoth (int adType, boolean setOnLoad) {
		Appodeal.setTriggerOnLoadedOnPrecache(adType, setOnLoad);
	}

	public static void disableNetwork (String network) {
		Appodeal.disableNetwork(mainActivity, (String)network);
	}

	public static void disableNetwork (String network, int adType) {
		Appodeal.disableNetwork(mainActivity, (String)network, adType);
	}

	public static void disableLocationPermissionCheck () {
		Appodeal.disableLocationPermissionCheck();
	}

	public static void disableWriteExternalStoragePermissionCheck () {
		Appodeal.disableWriteExternalStoragePermissionCheck();
	}

	public static void trackInAppPurchase (String currencyCode, int amount) {
		Appodeal.trackInAppPurchase(mainActivity, amount, currencyCode);
	}

	public static void setSmartBanners (boolean set) {
		Appodeal.setSmartBanners(set);
	}

	public static void set728x90Banners (boolean set) {
		Appodeal.set728x90Banners(set);
	}

	public static void setBannerBackground (boolean set) {
		//Appodeal.setBannerBackground(set);
	}

	public static void setBannerAnimation (boolean set) {
		Appodeal.setBannerAnimation(set);
	}


	//CUSTOM SEGMENTS REGION

	public static void setCustomBooleanRule (String name, boolean value) {
		Appodeal.setCustomRule(name, value);
	}

	public static void setCustomIntegerRule (String name, int value) {
		Appodeal.setCustomRule(name, value);
	}

	public static void setCustomDoubleRule (String name, double value) {
		Appodeal.setCustomRule(name, value);
	}

	public static void setCustomStringRule (String name, String value) {
		Appodeal.setCustomRule(name, value);
	}


	/// USER SETTINGS REGION

	private static UserSettings getUserSettings () {
		if(userSettings == null) {
			userSettings = Appodeal.getUserSettings(mainActivity);
		}
		return userSettings;
	}

	public static void setUserId (String userid) {
		getUserSettings().setUserId(userid);
	}
	
	public static void setAge (int age) {
		getUserSettings().setAge(age);
	}
	
	public static void setBirthday (String date) {
		getUserSettings().setBirthday(date);
	}
	
	public static void setEmail (String email) {
		getUserSettings().setEmail(email);
	}
	
	public static void setGender (int gender) {
		switch (gender)  {
			case 0:
				getUserSettings().setGender(UserSettings.Gender.FEMALE);
				break;
			case 1:
				getUserSettings().setGender(UserSettings.Gender.MALE);
				break;	
			case 2:
				getUserSettings().setGender(UserSettings.Gender.OTHER);
				break;
		}
	}
	
	public static void setInterests (String interest) {
		getUserSettings().setInterests(interest);
	}
	
	public static void setOccupation (int occupation) {
		switch (occupation) {
			case 0:
				getUserSettings().setOccupation(UserSettings.Occupation.WORK);
				break;
			case 1:
				getUserSettings().setOccupation(UserSettings.Occupation.UNIVERSITY);
				break;	
			case 2:
				getUserSettings().setOccupation(UserSettings.Occupation.SCHOOL);
				break;
			case 3:
				getUserSettings().setOccupation(UserSettings.Occupation.OTHER);
				break;
		}
	}
	
	public static void setRelation (int relation) {
		switch (relation)  {
			case 0:
				getUserSettings().setRelation(UserSettings.Relation.DATING);
				break;
			case 1:
				getUserSettings().setRelation(UserSettings.Relation.ENGAGED);
				break;	
			case 2:
				getUserSettings().setRelation(UserSettings.Relation.MARRIED);
				break;
			case 3:
				getUserSettings().setRelation(UserSettings.Relation.SEARCHING);
				break;
			case 4:
				getUserSettings().setRelation(UserSettings.Relation.SINGLE);
				break;	
			case 5:
				getUserSettings().setRelation(UserSettings.Relation.OTHER);
				break;	
		}
	}
	
	public static void setAlcohol (int alcohol) {
		switch (alcohol)  {
			case 0:
				getUserSettings().setAlcohol(UserSettings.Alcohol.NEGATIVE);
				break;
			case 1:
				getUserSettings().setAlcohol(UserSettings.Alcohol.NEUTRAL);
				break;	
			case 2:
				getUserSettings().setAlcohol(UserSettings.Alcohol.POSITIVE);
				break;
		}
	}
	
	public static void setSmoking (int smoking) {
		switch (smoking)  {
			case 0:
				getUserSettings().setSmoking(UserSettings.Smoking.NEGATIVE);
				break;
			case 1:
				getUserSettings().setSmoking(UserSettings.Smoking.NEUTRAL);
				break;	
			case 2:
				getUserSettings().setSmoking(UserSettings.Smoking.POSITIVE);
				break;
		}
	}
	
}