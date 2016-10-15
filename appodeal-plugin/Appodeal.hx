package;

import openfl.Lib;

#if android
import openfl.utils.JNI;
#end

import openfl.utils.ByteArray;

class Appodeal  {

	public static inline var GENDER_FEMALE:Int	= 0;
	public static inline var GENDER_MALE:Int	= 1;
	public static inline var GENDER_OTHER:Int	= 2;
	
	public static inline var OCCUPATION_WORK:Int	= 0;
	public static inline var OCCUPATION_UNIVERSITY:Int	= 1;
	public static inline var OCCUPATION_SCHOOL:Int	= 2;
	public static inline var OCCUPATION_OTHER:Int	= 3;
	
	public static inline var RELATION_DATING:Int	= 0;
	public static inline var RELATION_ENGAGED:Int	= 1;
	public static inline var RELATION_MARRIED:Int	= 2;
	public static inline var RELATION_SEARCHING:Int	= 3;
	public static inline var RELATION_SINGLE:Int	= 4;
	public static inline var RELATION_OTHER:Int	= 5;
	
	public static inline var ALCOHOL_NEGATIVE:Int	= 0;
	public static inline var ALCOHOL_NEUTRAL:Int	= 1;
	public static inline var ALCOHOL_POSITIVE:Int	= 2;
	
	public static inline var SMOKING_NEGATIVE:Int	= 0;
	public static inline var SMOKING_NEUTRAL:Int	= 1;
	public static inline var SMOKING_POSITIVE:Int	= 2;
	
	public static inline var LOG_LEVEL_DEBUG:Int	= 0;
	public static inline var LOG_LEVEL_VERBOSE:Int	= 1;
	public static inline var LOG_LEVEL_NONE:Int	= 2;

    #if android
		public static inline var INTERSTITIAL:Int    	   = 1;
		public static inline var SKIPPABLE_VIDEO:Int   	   = 2;
		public static inline var BANNER:Int          	   = 4;
		public static inline var BANNER_BOTTOM:Int   	   = 8;
		public static inline var BANNER_TOP:Int     	   = 16;
		public static inline var REWARDED_VIDEO:Int        = 128;
		public static inline var NON_SKIPPABLE_VIDEO:Int   = 128;
	#end

	#if ios
		public static inline var INTERSTITIAL:Int    	   = 1;
		public static inline var SKIPPABLE_VIDEO:Int   	   = 2;
		public static inline var BANNER:Int          	   = 4;
        public static inline var BANNER_TOP:Int            = 4;
        public static inline var BANNER_BOTTOM:Int         = 5;
		public static inline var REWARDED_VIDEO:Int        = 16;
		public static inline var NON_SKIPPABLE_VIDEO:Int   = 64;
	#end

	#if ios
		private static var _appodealEventsiOS = Lib.load("appodeal", "appodeal_events" , 1);
        private static var _disableLocationPermissionCheckiOS = Lib.load("appodeal", "appodeal_disableLocationPermissionCheck", 0);
        private static var _disableNetworkForAdTypeiOS = Lib.load("appodeal", "appodeal_disableNetworkForAdType", 2);
        private static var _setAutoCacheiOS = Lib.load("appodeal", "appodeal_setAutoCache" , 2);
        private static var _isPrecacheiOS = Lib.load("appodeal", "appodeal_isPrecache", 1);
        private static var _initializeiOS = Lib.load("appodeal", "appodeal_initialize", 2);
        private static var _enableInterstitialCallbacksiOS = Lib.load("appodeal", "appodeal_enableInterstitialCallbacks", 0);
        private static var _enableBannerCallbacksiOS = Lib.load("appodeal", "appodeal_enableBannerCallbacks", 0);
        private static var _enableSkippableVideoCallbacksiOS = Lib.load("appodeal", "appodeal_enableSkippableVideoCallbacks" , 0);
        private static var _enableRewardedVideoCallbacksiOS = Lib.load("appodeal", "appodeal_enableRewardedVideoCallbacks", 0);
        private static var _enableNonSkippableVideoCallbacksiOS = Lib.load("appodeal", "appodeal_enableNonSkippableVideoCallbacks", 0);
        private static var _showiOS = Lib.load("appodeal", "appodeal_show" , 1);
        private static var _showWithPlacementiOS = Lib.load("appodeal", "appodeal_showWithPlacement", 2);
        private static var _cacheiOS = Lib.load("appodeal", "appodeal_cache", 1);
        private static var _hideiOS = Lib.load("appodeal", "appodeal_hide" , 1);
        
        private static var _setLoggingiOS = Lib.load("appodeal", "appodeal_setLogging", 1);
        private static var _setTestingiOS = Lib.load("appodeal", "appodeal_setTesting", 1);
        private static var _resetUUIDiOS = Lib.load("appodeal", "appodeal_resetUUID" , 0);
        private static var _getVersioniOS = Lib.load("appodeal", "appodeal_getVersion", 0);
        private static var _isLoadediOS = Lib.load("appodeal", "appodeal_isLoaded", 1);
        
        private static var _setCustomRuleiOS = Lib.load("appodeal", "appodeal_setCustomRule" , 1);
        
        private static var _confirmiOS = Lib.load("appodeal", "appodeal_confirm", 1);
        
        private static var _setSmartBannersiOS = Lib.load("appodeal", "appodeal_setSmartBanners", 1);
        private static var _setBannerBackgoundiOS = Lib.load("appodeal", "appodeal_setBannerBackgound" , 1);
        private static var _setBannerAnimationiOS = Lib.load("appodeal", "appodeal_setBannerAnimation" , 1);
        
        private static var _setUserIdiOS = Lib.load("appodeal", "appodeal_setUserId", 1);
        private static var _setEmailiOS = Lib.load("appodeal", "appodeal_setEmail", 1);
        private static var _setBirthdayiOS = Lib.load("appodeal", "appodeal_setBirthday" , 1);
        private static var _setAgeiOS = Lib.load("appodeal", "appodeal_setAge", 1);
        private static var _setGenderiOS = Lib.load("appodeal", "appodeal_setGender", 1);
        private static var _setOccupationiOS = Lib.load("appodeal", "appodeal_setOccupation" , 1);
        private static var _setRelationiOS = Lib.load("appodeal", "appodeal_setRelation", 1);
        private static var _setSmokingiOS = Lib.load("appodeal", "appodeal_setSmoking", 1);
        private static var _setAlcoholiOS = Lib.load("appodeal", "appodeal_setAlcohol" , 1);
        private static var _setInterestsiOS = Lib.load("appodeal", "appodeal_setInterests" , 1);
	#end

	private static var appodealJava:String = "com.appodeal.stencyl.AppodealExtension";

    #if android
        private static var _getVersion:Dynamic;
        private static var _initialize:Dynamic;
        private static var _show:Dynamic;
        private static var _showWithPlacement:Dynamic;
        private static var _hide:Dynamic;
        private static var _confirm:Dynamic;
        private static var _isPrecache:Dynamic;
        private static var _cache:Dynamic;
        private static var _setAutoCache:Dynamic;
        private static var _setOnLoadedTriggerBoth:Dynamic;
        private static var _disableNetwork:Dynamic;
        private static var _disableNetworkForAdType:Dynamic;
        private static var _disableLocationPermissionCheck:Dynamic;
        private static var _disableWriteExternalStoragePermissionCheck:Dynamic;

        private static var _setTesting:Dynamic;
        private static var _setLogLevel:Dynamic;
        private static var _isLoaded:Dynamic;
        private static var _trackInAppPurchase:Dynamic;
        private static var _setSmartBanners:Dynamic;
        private static var _set728x90Banners:Dynamic;
        private static var _setBannerBackgound:Dynamic;
        private static var _setBannerAnimation:Dynamic;

        private static var _setCustomBooleanRule:Dynamic;
        private static var _setCustomIntegerRule:Dynamic;
        private static var _setCustomDoubleRule:Dynamic;
        private static var _setCustomStringRule:Dynamic;

        private static var _setUserId:Dynamic;
        private static var _setAge:Dynamic;
        private static var _setBirthday:Dynamic;
        private static var _setEmail:Dynamic;
        private static var _setGender:Dynamic;
        private static var _setInterests:Dynamic;
        private static var _setOccupation:Dynamic;
        private static var _setRelation:Dynamic;
        private static var _setAlcohol:Dynamic;
        private static var _setSmoking:Dynamic;

        private static var _setBannerCallbacks:Dynamic;
        private static var _setInterstitialCallbacks:Dynamic;
        private static var _setSkippableVideoCallbacks:Dynamic;
        private static var _setNonSkippableVideoCallbacks:Dynamic;
        private static var _setRewardedVideoCallbacks:Dynamic;
    #end

    public static var onBannerLoadedCall:Void->Void;
    public static var onBannerFailedToLoadCall:Void->Void;
    public static var onBannerShownCall:Void->Void;
    public static var onBannerClickedCall:Void->Void;
    public static var onBannerRefreshedCall:Void->Void;

    public static var onInterstitialLoadedCall:Void->Void;
    public static var onInterstitialShownCall:Void->Void;
    public static var onInterstitialClickedCall:Void->Void;
    public static var onInterstitialClosedCall:Void->Void;
    public static var onInterstitialFailedToLoadCall:Void->Void;

    public static var onSkippableVideoLoadedCall:Void->Void;
    public static var onSkippableVideoFailedToLoadCall:Void->Void;
    public static var onSkippableVideoShownCall:Void->Void;
    public static var onSkippableVideoClosedCall:Void->Void;
    public static var onSkippableVideoFinishedCall:Void->Void;

    public static var onNonSkippableVideoLoadedCall:Void->Void;
    public static var onNonSkippableVideoFailedToLoadCall:Void->Void;
    public static var onNonSkippableVideoShownCall:Void->Void;
    public static var onNonSkippableVideoClosedCall:Void->Void;
    public static var onNonSkippableVideoFinishedCall:Void->Void;

    public static var onRewardedVideoLoadedCall:Void->Void;
    public static var onRewardedVideoFailedToLoadCall:Void->Void;
    public static var onRewardedVideoShownCall:Void->Void;
    public static var onRewardedVideoClosedCall:Void->Void;
    public static var onRewardedVideoFinishedCall:Void->Void;

    private static var InterstitialCallbacksEnabled:Bool=false;
    private static var SkippableCallbacksEnabled:Bool=false;
    private static var NonSkippableCallbacksEnabled:Bool=false;
    private static var RewardedCallbacksEnabled:Bool=false;
    private static var BannerCallbacksEnabled:Bool=false;

	public static function initialize(appKey:String, banner:Bool, interstitial:Bool, skippable:Bool, nonSkippable:Bool, rewarded:Bool):Void {
		var adType:Int = 0;
		if(banner) {
			adType = adType | Appodeal.BANNER;
		}
		if(interstitial) {
			adType = adType | Appodeal.INTERSTITIAL;
		}
		if(skippable) {
			adType = adType | Appodeal.SKIPPABLE_VIDEO;
		}
		if(nonSkippable) {
			adType = adType | Appodeal.NON_SKIPPABLE_VIDEO;
		}
		if(rewarded) {
			adType = adType | Appodeal.REWARDED_VIDEO;
		}

		#if android
			if(_initialize == null) {
				_initialize = JNI.createStaticMethod(appodealJava, "initialize", "(Ljava/lang/String;I)V");
			}
			_initialize(appKey, adType);
		#end

		#if ios
            _appodealEventsiOS(setEventListeners);
            _initializeiOS(appKey, adType);
		#end
	}

    public static function setEventListeners(inEvent:Dynamic)
    {
        #if ios
            var type:String = Std.string(Reflect.field(inEvent, "type"));

            if (type == 'onBannerLoaded' && onBannerLoadedCall != null)
            {
                Reflect.callMethod(null, onBannerLoadedCall, []);
            }
            if (type == 'onBannerFailedToLoad' && onBannerFailedToLoadCall != null)
            {
                Reflect.callMethod(null, onBannerFailedToLoadCall, []);
            }
            if (type == 'onBannerShown' && onBannerShownCall != null)
            {
                Reflect.callMethod(null, onBannerShownCall, []);
            }
            if (type == 'onBannerClicked' && onBannerClickedCall != null)
            {
                Reflect.callMethod(null, onBannerClickedCall, []);
            }

            if (type == 'onInterstitialLoaded' && onInterstitialLoadedCall != null)
            {
                Reflect.callMethod(null, onInterstitialLoadedCall, []);
            }
            if (type == 'onInterstitialShown' && onInterstitialShownCall != null)
            {
                Reflect.callMethod(null, onInterstitialShownCall, []);
            }
            if (type == 'onInterstitialClicked' && onInterstitialClickedCall != null)
            {
                Reflect.callMethod(null, onInterstitialClickedCall, []);
            }
            if (type == 'onInterstitialClosed' && onInterstitialClosedCall != null)
            {
                Reflect.callMethod(null, onInterstitialClosedCall, []);
            }
            if (type == 'onInterstitialFailedToLoad' && onInterstitialFailedToLoadCall != null)
            {
                Reflect.callMethod(null, onInterstitialFailedToLoadCall, []);
            }

            if (type == 'onSkippableVideoLoaded' && onSkippableVideoLoadedCall != null)
            {
                Reflect.callMethod(null, onSkippableVideoLoadedCall, []);
            }
            if (type == 'onSkippableVideoFailedToLoad' && onSkippableVideoFailedToLoadCall != null)
            {
                Reflect.callMethod(null, onSkippableVideoFailedToLoadCall, []);
            }
            if (type == 'onSkippableVideoShown' && onSkippableVideoShownCall != null)
            {
                Reflect.callMethod(null, onSkippableVideoShownCall, []);
            }
            if (type == 'onSkippableVideoClosed' && onSkippableVideoClosedCall != null)
            {
                Reflect.callMethod(null, onSkippableVideoClosedCall, []);
            }
            if (type == 'onSkippableVideoFinished' && onSkippableVideoFinishedCall != null)
            {
                Reflect.callMethod(null, onSkippableVideoFinishedCall, []);
            }

            if (type == 'onNonSkippableVideoLoaded' && onNonSkippableVideoLoadedCall != null)
            {
                Reflect.callMethod(null, onNonSkippableVideoLoadedCall, []);
            }
            if (type == 'onNonSkippableVideoFailedToLoad' && onNonSkippableVideoFailedToLoadCall != null)
            {
                Reflect.callMethod(null, onNonSkippableVideoFailedToLoadCall, []);
            }
            if (type == 'onNonSkippableVideoShown' && onNonSkippableVideoShownCall != null)
            {
                Reflect.callMethod(null, onNonSkippableVideoShownCall, []);
            }
            if (type == 'onNonSkippableVideoClosed' && onNonSkippableVideoClosedCall != null)
            {
                Reflect.callMethod(null, onNonSkippableVideoClosedCall, []);
            }
            if (type == 'onNonSkippableVideoFinished' && onNonSkippableVideoFinishedCall != null)
            {
                Reflect.callMethod(null, onNonSkippableVideoFinishedCall, []);
            }
            
            if (type == 'onRewardedVideoLoaded' && onRewardedVideoLoadedCall != null)
            {
                Reflect.callMethod(null, onRewardedVideoLoadedCall, []);
            }
            if (type == 'onRewardedVideoFailedToLoad' && onRewardedVideoFailedToLoadCall != null)
            {
                Reflect.callMethod(null, onRewardedVideoFailedToLoadCall, []);
            }
            if (type == 'onRewardedVideoShown' && onRewardedVideoShownCall != null)
            {
                Reflect.callMethod(null, onRewardedVideoShownCall, []);
            }
            if (type == 'onRewardedVideoClosed' && onRewardedVideoClosedCall != null)
            {
                Reflect.callMethod(null, onRewardedVideoClosedCall, []);
            }
            if (type == 'onRewardedVideoFinished' && onRewardedVideoFinishedCall != null)
            {
                Reflect.callMethod(null, onRewardedVideoFinishedCall, []);
            }

        #end
    }

    public static function enableInterstitialCallbacks():Void {
        #if android
            if(_setInterstitialCallbacks == null) {
                _setInterstitialCallbacks = JNI.createStaticMethod(appodealJava, "setInterstitialCallbacks", "(Lorg/haxe/lime/HaxeObject;)V");
                _setInterstitialCallbacks(new InterstitialCallbacks());
            }
        #end
        #if ios
            if(!InterstitialCallbacksEnabled) {
                _enableInterstitialCallbacksiOS();
                InterstitialCallbacksEnabled != true;
            }
        #end
    }

    public static function enableBannerCallbacks():Void {
        #if android
			if(_setBannerCallbacks == null) {
				_setBannerCallbacks = JNI.createStaticMethod(appodealJava, "setBannerCallbacks", "(Lorg/haxe/lime/HaxeObject;)V");
				_setBannerCallbacks(new BannerCallbacks());
			}
		#end
        #if ios
            if(!BannerCallbacksEnabled) {
                _enableBannerCallbacksiOS();
                BannerCallbacksEnabled = true;
            }
        #end
    }

    public static function enableSkippableVideoCallbacks():Void {
        #if android
            if(_setSkippableVideoCallbacks == null) {
                _setSkippableVideoCallbacks = JNI.createStaticMethod(appodealJava, "setSkippableVideoCallbacks", "(Lorg/haxe/lime/HaxeObject;)V");
                _setSkippableVideoCallbacks(new SkippableVideoCallbacks());
            }
        #end
        #if ios
            if(!SkippableCallbacksEnabled) {
                _enableSkippableVideoCallbacksiOS();
                SkippableCallbacksEnabled = true;
            }
        #end
    }

    public static function enableRewardedVideoCallbacks():Void {
        #if android
            if(_setRewardedVideoCallbacks == null) {
                _setRewardedVideoCallbacks = JNI.createStaticMethod(appodealJava, "setRewardedVideoCallbacks", "(Lorg/haxe/lime/HaxeObject;)V");
                _setRewardedVideoCallbacks(new RewardedVideoCallbacks());
            }
        #end
        #if ios
            if(!RewardedCallbacksEnabled) {
                _enableRewardedVideoCallbacksiOS();
                RewardedCallbacksEnabled = true;
            }
        #end
    }

    public static function enableNonSkippableVideoCallbacks():Void {
        #if android
            if(_setNonSkippableVideoCallbacks == null) {
                _setNonSkippableVideoCallbacks = JNI.createStaticMethod(appodealJava, "setNonSkippableVideoCallbacks", "(Lorg/haxe/lime/HaxeObject;)V");
                _setNonSkippableVideoCallbacks(new NonSkippableVideoCallbacks());
            }
        #end
        #if ios
            if(!NonSkippableCallbacksEnabled) {
                _enableNonSkippableVideoCallbacksiOS();
                NonSkippableCallbacksEnabled = true;
            }
        #end
    }

	public static function show(adType:Int):Bool {
		#if android
			if(_show == null) {
				_show = JNI.createStaticMethod(appodealJava, "show", "(I)Z");
			}
			return _show(adType);
		#end

		#if ios
            var showTypeIos:Int    	   = 0;
            if(adType == Appodeal.INTERSTITIAL)
                showTypeIos = 1;

            if(adType == Appodeal.SKIPPABLE_VIDEO)
                showTypeIos = 2;

            if(adType == (Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO))
                showTypeIos = 3;

            if(adType == Appodeal.BANNER_TOP)
                showTypeIos = 4;

            if(adType == Appodeal.BANNER_BOTTOM)
                showTypeIos = 5;

            if(adType == Appodeal.REWARDED_VIDEO)
                showTypeIos = 6;

            if(adType == Appodeal.NON_SKIPPABLE_VIDEO)
                showTypeIos = 7;

            return _showiOS(showTypeIos);
		#end
    }

    public static function showWithPlacement(adType:Int, placement:String):Bool {
		#if android
			if(_showWithPlacement == null) {
				_showWithPlacement = JNI.createStaticMethod(appodealJava, "showWithPlacement", "(ILjava/lang/String;)Z");
			}
			return _showWithPlacement(adType, placement);
		#end

		#if ios
            var showTypeIos1:Int    	   = 0;
            if(adType == Appodeal.INTERSTITIAL)
                showTypeIos1 = 1;

            if(adType == Appodeal.SKIPPABLE_VIDEO)
                showTypeIos1 = 2;

            if(adType == (Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO))
                showTypeIos1 = 3;

            if(adType == Appodeal.BANNER_TOP)
                showTypeIos1 = 4;

            if(adType == Appodeal.BANNER_BOTTOM)
                showTypeIos1 = 5;

            if(adType == Appodeal.REWARDED_VIDEO)
                showTypeIos1 = 6;

            if(adType == Appodeal.NON_SKIPPABLE_VIDEO)
                showTypeIos1 = 7;

            return _showWithPlacementiOS(showTypeIos1, placement);
		#end
    }

	public static function hide(adType:Int):Void {
    	#if android
			if(_hide == null) {
				_hide = JNI.createStaticMethod(appodealJava, "hide", "(I)V");
			}
			_hide(adType);
		#end
        #if ios
            _hideiOS(adType);
        #end
	}

	public static function confirm(adType:Int):Void {
    	#if android
			if(_confirm == null) {
				_confirm = JNI.createStaticMethod(appodealJava, "confirm", "(I)V");
			}
			_confirm(adType);
		#end
        #if ios
            _confirmiOS(adType);
        #end
	}

	public static function setSmartBanners(set:Bool):Void {	
    	#if android
			if(_setSmartBanners == null) {
				_setSmartBanners = JNI.createStaticMethod(appodealJava, "setSmartBanners", "(Z)V");
			}
			_setSmartBanners(set);
		#end
        #if ios
            _setSmartBannersiOS(set);
        #end
	}

	public static function set728x90Banners(set:Bool):Void {	
    	#if android
			if(_set728x90Banners == null) {
				_set728x90Banners = JNI.createStaticMethod(appodealJava, "set728x90Banners", "(Z)V");
			}
			_set728x90Banners(set);
		#end
	}

	public static function setBannerBackgound(set:Bool):Void {	
        #if ios
            _setBannerBackgoundiOS(set);
        #end
	}

	public static function setBannerAnimation(set:Bool):Void {	
    	#if android
			if(_setBannerAnimation == null) {
				_setBannerAnimation = JNI.createStaticMethod(appodealJava, "setBannerAnimation", "(Z)V");
			}
			_setBannerAnimation(set);
		#end
        #if ios
            _setBannerAnimationiOS(set);
        #end
	}

	public static function setTesting(test:Bool):Void {
    	#if android
			if(_setTesting == null) {
				_setTesting = JNI.createStaticMethod(appodealJava, "setTesting", "(Z)V");
			}
			_setTesting(test);
		#end
        #if ios
            _setTestingiOS(test);
        #end
	}
	
	public static function setLogLevel(level:Int):Void {		
    	#if android
			if(_setLogLevel == null) {
				_setLogLevel = JNI.createStaticMethod(appodealJava, "setLogLevel", "(I)V");
			}
			_setLogLevel(level);
		#end
        #if ios
			var log:Bool = level != LOG_LEVEL_NONE;
            _setLoggingiOS(log);
        #end
	}

    public static function resetUUID():Void {
        #if ios
            _resetUUIDiOS();
        #end
    }

    public static function getVersion():String {
        #if ios
            return _getVersioniOS();
        #end
		#if android
            return _getVersion();
        #end
    }

	public static function isLoaded(adType:Int):Bool {
		#if android
			if(_isLoaded == null) {
				_isLoaded = JNI.createStaticMethod(appodealJava, "isLoaded", "(I)Z");
			}
			return _isLoaded(adType);
		#end
		#if ios
            var showTypeIos2:Int    	   = 0;
            if(adType == Appodeal.INTERSTITIAL)
                showTypeIos2 = 1;

            if(adType == Appodeal.SKIPPABLE_VIDEO)
                showTypeIos2 = 2;

            if(adType == (Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO))
                showTypeIos2 = 3;

            if(adType == Appodeal.BANNER_TOP)
                showTypeIos2 = 4;

            if(adType == Appodeal.BANNER_BOTTOM)
                showTypeIos2 = 5;

            if(adType == Appodeal.REWARDED_VIDEO)
                showTypeIos2 = 6;

            if(adType == Appodeal.NON_SKIPPABLE_VIDEO)
                showTypeIos2 = 7;

            return _isLoadediOS(showTypeIos2);
		#end
	}

	public static function isPrecache(adType:Int):Bool {
		#if android
			if(_isPrecache == null) {
				_isPrecache = JNI.createStaticMethod(appodealJava, "isPrecache", "(I)Z");
			}
			return _isPrecache(adType);
		#end
		#if ios 
            return _isPrecacheiOS(adType);
		#end
	}
	
	public static function cache(adType:Int):Void {
		#if android
			if(_cache == null) {
				_cache = JNI.createStaticMethod(appodealJava, "cache", "(I)V");
			}
			_cache(adType);
		#end
        #if ios
            _cacheiOS(adType);
        #end
	}
	
	public static function setAutoCache(adType:Int, set:Bool):Void {
		#if android
			if(_setAutoCache == null) {
				_setAutoCache = JNI.createStaticMethod(appodealJava, "setAutoCache", "(IZ)V");
			}
			_setAutoCache(adType, set);
		#end
        #if ios
            _setAutoCacheiOS(adType, set);
        #end
	}

	public static function setOnLoadedTriggerBoth(adType:Int, set:Bool):Void {
		#if android
			if(_setOnLoadedTriggerBoth == null) {
				_setOnLoadedTriggerBoth = JNI.createStaticMethod(appodealJava, "setOnLoadedTriggerBoth", "(IZ)V");	
			}
			_setOnLoadedTriggerBoth(adType, set);
		#end
	}

	public static function disableNetworkForAdType(network:String, adType:Int):Void {
		#if android
			if(_disableNetworkForAdType == null) {
				_disableNetworkForAdType = JNI.createStaticMethod(appodealJava, "disableNetworkForAdType", "(Ljava/lang/String;I)V");
			}
			_disableNetworkForAdType(network, adType);
		#end
        #if ios
            _disableNetworkForAdTypeiOS(network, adType);
        #end
	}

	public static function disableNetwork(network:String):Void
	{
		#if android
			if(_disableNetwork == null) {
				_disableNetwork = JNI.createStaticMethod(appodealJava, "disableNetwork", "(Ljava/lang/String;)V");
			}
			_disableNetwork(network);
		#end
	}

	public static function disableLocationPermissionCheck():Void {
		#if android
			if(_disableLocationPermissionCheck == null) {
				_disableLocationPermissionCheck = JNI.createStaticMethod(appodealJava, "disableLocationPermissionCheck", "()V");
			}
			_disableLocationPermissionCheck();
		#end
        #if ios
            _disableLocationPermissionCheckiOS();
        #end
	}

	public static function disableWriteExternalStoragePermissionCheck():Void
	{
		#if android
			if(_disableWriteExternalStoragePermissionCheck == null) {
				_disableWriteExternalStoragePermissionCheck = JNI.createStaticMethod(appodealJava, "disableWriteExternalStoragePermissionCheck", "()V");
			}
			_disableWriteExternalStoragePermissionCheck();
		#end
	}

    public static function setCustomBooleanRule(name:String, set:Bool):Void {
		#if android
			if(_setCustomBooleanRule == null) {
				_setCustomBooleanRule = JNI.createStaticMethod(appodealJava, "setCustomBooleanRule", "(Ljava/lang/String;Z)V");
			}
			_setCustomBooleanRule(name, set);
		#end
        #if ios
            _setCustomRuleiOS(name + ", " + set);
        #end
	}

	public static function setCustomIntegerRule(name:String, set:Int):Void {
		#if android
			if(_setCustomIntegerRule == null) {
				_setCustomBooleanRule = JNI.createStaticMethod(appodealJava, "setCustomBooleanRule", "(Ljava/lang/String;I)V");
			}
			_setCustomBooleanRule(name, set);
		#end
        #if ios
            _setCustomRuleiOS(name + ", " + set);
        #end
	}

	public static function setCustomDoubleRule(name:String, set:Float):Void {
		#if android
			if(_setCustomDoubleRule == null) {
				_setCustomDoubleRule = JNI.createStaticMethod(appodealJava, "setCustomBooleanRule", "(Ljava/lang/String;D)V");
			}
			_setCustomDoubleRule(name, set);
		#end
        #if ios
            _setCustomRuleiOS(name + ", " + set);
        #end
	}

	public static function setCustomStringRule(name:String, set:String):Void {
		#if android
			if(_setCustomStringRule == null) {
				_setCustomStringRule = JNI.createStaticMethod(appodealJava, "setCustomBooleanRule", "(Ljava/lang/String;Ljava/lang/String;)V");
			}
			_setCustomStringRule(name, set);
		#end
        #if ios
            _setCustomRuleiOS(name + ", " + set);
        #end
	}

	public static function trackInAppPurchase(currencyCode:String, amount:Int):Void {
		#if android
			if(_trackInAppPurchase == null) {
				_trackInAppPurchase = JNI.createStaticMethod(appodealJava, "trackInAppPurchase", "(Ljava/lang/String;I)V");
			}
			_trackInAppPurchase(currencyCode, amount);
		#end
	}
	
	public static function setAge(age:Int):Void {
		#if android
			if(_setAge == null) {
				_setAge = JNI.createStaticMethod(appodealJava, "setAge", "(I)V");
			}
			_setAge(age);
		#end
        #if ios
            _setAgeiOS(age);
        #end
	}

    public static function setUserId(userid:String):Void {
        #if android
			if( _setUserId == null) {
				 _setUserId = JNI.createStaticMethod(appodealJava, "setUserId", "(Ljava/lang/String;)V");
			}
			 _setUserId(userid);
		#end
        #if ios
            _setUserIdiOS(userid);
        #end
    }

	public static function setBirthday(date:String):Void {
		#if android
			if(_setBirthday == null) {
				_setBirthday = JNI.createStaticMethod(appodealJava, "setBirthday", "(Ljava/lang/String;)V");
			}
			_setBirthday(date);
		#end
        #if ios
            _setBirthdayiOS(date);
        #end
	}
	
	public static function setEmail(email:String):Void
	{
		#if android
			if(_setEmail == null) {
				_setEmail = JNI.createStaticMethod(appodealJava, "setEmail", "(Ljava/lang/String;)V");
			}
			_setEmail(email);
		#end
        #if ios
            _setEmailiOS(email);
        #end
	}
	
	public static function setGender(gender:Int):Void {
		#if android
			if(_setGender == null) {
				_setGender = JNI.createStaticMethod(appodealJava, "setGender", "(I)V");
			}
			_setGender(gender);
		#end
        #if ios
            _setGenderiOS(gender);
        #end
	}
	
	public static function setInterests(interest:String):Void {
		#if android
			if(_setInterests == null) {
				_setInterests = JNI.createStaticMethod(appodealJava, "setInterests", "(Ljava/lang/String;)V");
			}
			_setInterests(interest);
		#end
        #if ios
            _setInterestsiOS(interest);
        #end
	}
	
	public static function setOccupation(occupation:Int):Void {
		#if android
			if(_setOccupation == null) {
				_setOccupation = JNI.createStaticMethod(appodealJava, "setOccupation", "(I)V");
			}
			_setOccupation(occupation);
		#end
        #if ios
            _setOccupationiOS(occupation);
        #end
	}
	
	public static function setRelation(relation:Int):Void {
		#if android
			if(_setRelation == null) {
				_setRelation = JNI.createStaticMethod(appodealJava, "setRelation", "(I)V");
			}
			_setRelation(relation);
		#end
        #if ios
            _setRelationiOS(relation);
        #end
	}
	
	public static function setAlcohol(alcohol:Int):Void {
		#if android
			if(_setAlcohol == null) {
				_setAlcohol = JNI.createStaticMethod(appodealJava, "setAlcohol", "(I)V");
			}
			_setAlcohol(alcohol);
		#end
        #if ios
            _setAlcoholiOS(alcohol);
        #end
	}
	
	public static function setSmoking(smoking:Int):Void {
		#if android
			if(_setSmoking == null) {
				_setSmoking = JNI.createStaticMethod(appodealJava, "setSmoking", "(I)V");
			}
			_setSmoking(smoking);
		#end
        #if ios
            _setSmokingiOS(smoking);
        #end
	}

	public static function addBannerListener(type:String, callbackFn:Void->Void):Void {
		#if (android || ios)
            enableBannerCallbacks();
            if (type == "onBannerLoaded")
                onBannerLoadedCall = callbackFn;

            if (type == 'onBannerLoaded')
                onBannerLoadedCall = callbackFn;

            if (type == 'onBannerFailedToLoad')
                onBannerFailedToLoadCall = callbackFn;

            if (type == 'onBannerShown')
                onBannerShownCall = callbackFn;

            if (type == 'onBannerClicked')
                onBannerClickedCall = callbackFn;

		#end
	}

    public static function removeBannerListener(type:String):Void {
		#if (android || ios)
            if (type == "onBannerLoaded")
                onBannerLoadedCall = null;

            if (type == 'onBannerLoaded')
                onBannerLoadedCall = null;

            if (type == 'onBannerFailedToLoad')
                onBannerFailedToLoadCall = null;

            if (type == 'onBannerShown')
                onBannerShownCall = null;

            if (type == 'onBannerClicked')
                onBannerClickedCall = null;
		#end
	}


    public static function addInterstitialListener(type:String, callbackFn:Void->Void):Void {
        #if (android || ios)
            enableInterstitialCallbacks();
            if (type == 'onInterstitialLoaded')
                onInterstitialLoadedCall = callbackFn;

            if (type == 'onInterstitialShown')
                onInterstitialShownCall = callbackFn;

            if (type == 'onInterstitialClicked')
                onInterstitialClickedCall = callbackFn;

            if (type == 'onInterstitialClosed')
                onInterstitialClosedCall = callbackFn;

            if (type == 'onInterstitialFailedToLoad')
                onInterstitialFailedToLoadCall = callbackFn;
        #end
    }

    public static function removeInterstitialListener(type:String):Void {
        #if (android || ios)
           if (type == 'onInterstitialLoaded')
                onInterstitialLoadedCall = null;

            if (type == 'onInterstitialShown')
                onInterstitialShownCall = null;

            if (type == 'onInterstitialClicked')
                onInterstitialClickedCall = null;

            if (type == 'onInterstitialClosed')
                onInterstitialClosedCall = null;

            if (type == 'onInterstitialFailedToLoad')
                onInterstitialFailedToLoadCall = null;
        #end
    }

    public static function addSkippableListener(type:String, callbackFn:Void->Void):Void {
        #if (android || ios)
            enableSkippableVideoCallbacks();
            if (type == 'onSkippableVideoLoaded')
                onSkippableVideoLoadedCall = callbackFn;

            if (type == 'onSkippableVideoFailedToLoad')
                onSkippableVideoFailedToLoadCall = callbackFn;

            if (type == 'onSkippableVideoShown')
                onSkippableVideoShownCall = callbackFn;

            if (type == 'onSkippableVideoClosed')
                onSkippableVideoClosedCall = callbackFn;

            if (type == 'onSkippableVideoFinished')
                onSkippableVideoFinishedCall = callbackFn;
        #end
    }

    public static function removeSkippableListener(type:String):Void {
        #if (android || ios)
            if (type == 'onSkippableVideoLoaded')
                onSkippableVideoLoadedCall = null;

            if (type == 'onSkippableVideoFailedToLoad')
                onSkippableVideoFailedToLoadCall = null;

            if (type == 'onSkippableVideoShown')
                onSkippableVideoShownCall = null;

            if (type == 'onSkippableVideoClosed')
                onSkippableVideoClosedCall = null;

            if (type == 'onSkippableVideoFinished')
                onSkippableVideoFinishedCall = null;
        #end
    }

    public static function addNonSkippableListener(type:String, callbackFn:Void->Void):Void {
        #if (android || ios)
            enableNonSkippableVideoCallbacks();
            if (type == 'onNonSkippableVideoLoaded')
                onNonSkippableVideoLoadedCall = callbackFn;

            if (type == 'onNonSkippableVideoFailedToLoad')
                onNonSkippableVideoFailedToLoadCall = callbackFn;

            if (type == 'onNonSkippableVideoShown')
                onNonSkippableVideoShownCall = callbackFn;

            if (type == 'onNonSkippableVideoClosed')
                onNonSkippableVideoClosedCall = callbackFn;

            if (type == 'onNonSkippableVideoFinished')
                onNonSkippableVideoFinishedCall = callbackFn;
        #end
    }

    public static function removeNonSkippableListener(type:String):Void {
        #if (android || ios)
            if (type == 'onNonSkippableVideoLoaded')
                onNonSkippableVideoLoadedCall = null;

            if (type == 'onNonSkippableVideoFailedToLoad')
                onNonSkippableVideoFailedToLoadCall = null;

            if (type == 'onNonSkippableVideoShown')
                onNonSkippableVideoShownCall = null;

            if (type == 'onNonSkippableVideoClosed')
                onNonSkippableVideoClosedCall = null;

            if (type == 'onNonSkippableVideoFinished')
                onNonSkippableVideoFinishedCall = null;
        #end
    }

    public static function addRewardedListener(type:String, callbackFn:Void->Void):Void {
        #if (android || ios)
            enableRewardedVideoCallbacks();
            if (type == 'onRewardedVideoLoaded')
                onRewardedVideoLoadedCall = callbackFn;

            if (type == 'onRewardedVideoFailedToLoad')
                onRewardedVideoFailedToLoadCall = callbackFn;

            if (type == 'onRewardedVideoShown')
                onRewardedVideoShownCall = callbackFn;

            if (type == 'onRewardedVideoClosed')
                onRewardedVideoClosedCall = callbackFn;

            if (type == 'onRewardedVideoFinished')
                onRewardedVideoFinishedCall = callbackFn;
        #end
    }

    public static function removeRewardedListener(type:String):Void {
        #if (android || ios)
            if (type == 'onRewardedVideoLoaded')
                onRewardedVideoLoadedCall = null;

            if (type == 'onRewardedVideoFailedToLoad')
                onRewardedVideoFailedToLoadCall = null;

            if (type == 'onRewardedVideoShown')
                onRewardedVideoShownCall = null;

            if (type == 'onRewardedVideoClosed')
                onRewardedVideoClosedCall = null;

            if (type == 'onRewardedVideoFinished')
                onRewardedVideoFinishedCall = null;
        #end
    }

}


class BannerCallbacks {

    public function new() { }

    public function onBannerLoaded():Void {
        #if android
            if (Appodeal.onBannerLoadedCall != null) {
                Appodeal.onBannerLoadedCall();
            }
        #end
    }

    public function onBannerFailedToLoad():Void {
        #if android
            if (Appodeal.onBannerFailedToLoadCall != null) {
                Appodeal.onBannerFailedToLoadCall();
            }
        #end
    }

    public function onBannerShown():Void {
        #if android
            if (Appodeal.onBannerShownCall != null) {
                Appodeal.onBannerShownCall();
            }
        #end
    }

    public function onBannerClicked():Void {
        #if android
            if (Appodeal.onBannerClickedCall != null) {
                Appodeal.onBannerClickedCall();
            }
        #end
    }
}

class InterstitialCallbacks  {
    public function new() { }

    public function onInterstitialLoaded(isPrecache:Bool):Void {
        #if android
            if (Appodeal.onInterstitialLoadedCall != null) {
                Appodeal.onInterstitialLoadedCall();
            }
        #end
    }

    public function onInterstitialFailedToLoad():Void {
        #if android
            if (Appodeal.onInterstitialFailedToLoadCall != null) {
                Appodeal.onInterstitialFailedToLoadCall();
            }
        #end
    }

    public function onInterstitialShown():Void {
        #if android
            if (Appodeal.onInterstitialShownCall != null) {
                Appodeal.onInterstitialShownCall();
            }
        #end
    }

    public function onInterstitialClicked():Void {
        #if android
            if (Appodeal.onInterstitialClickedCall != null) {
                Appodeal.onInterstitialClickedCall();
            }
        #end
    }

    public function onInterstitialClosed():Void {
        #if android
            if (Appodeal.onInterstitialClosedCall != null) {
                Appodeal.onInterstitialClosedCall();
            }
        #end
    }
}

class SkippableVideoCallbacks {

    public function new()  { }

    public function onSkippableVideoLoaded():Void {
        #if android
            if (Appodeal.onSkippableVideoLoadedCall != null) {
                Appodeal.onSkippableVideoLoadedCall();
            }
        #end
    }

    public function onSkippableVideoFailedToLoad():Void {
        #if android
            if (Appodeal.onSkippableVideoFailedToLoadCall != null) {
                Appodeal.onSkippableVideoFailedToLoadCall();
            }
        #end
    }

    public function onSkippableVideoShown():Void {
        #if android
            if (Appodeal.onSkippableVideoShownCall != null) {
                Appodeal.onSkippableVideoShownCall();
            }
        #end
    }

    public function onSkippableVideoFinished():Void {
        #if android
            if (Appodeal.onSkippableVideoFinishedCall != null) {
                Appodeal.onSkippableVideoFinishedCall();
            }
        #end
    }

    public function onSkippableVideoClosed():Void {
        #if android
            if (Appodeal.onSkippableVideoClosedCall != null) {
                Appodeal.onSkippableVideoClosedCall();
            }
        #end
    }
}

class NonSkippableVideoCallbacks {

    public function new() { }

    public function onNonSkippableVideoLoaded():Void {
        #if android
            if (Appodeal.onNonSkippableVideoLoadedCall != null) {
                Appodeal.onNonSkippableVideoLoadedCall();
            }
        #end
    }

    public function onNonSkippableVideoFailedToLoad():Void {
        #if android
            if (Appodeal.onNonSkippableVideoFailedToLoadCall != null) {
                Appodeal.onNonSkippableVideoFailedToLoadCall();
            }
        #end
    }

    public function onNonSkippableVideoShown():Void {
        #if android
            if (Appodeal.onNonSkippableVideoShownCall != null) {
                Appodeal.onNonSkippableVideoShownCall();
            }
        #end
    }

    public function onNonSkippableVideoFinished():Void {
        #if android
            if (Appodeal.onNonSkippableVideoFinishedCall != null) {
                Appodeal.onNonSkippableVideoFinishedCall();
            }
        #end
    }

    public function onNonSkippableVideoClosed():Void {
        #if android
            if (Appodeal.onNonSkippableVideoClosedCall != null) {
                Appodeal.onNonSkippableVideoClosedCall();
            }
        #end
    }
}

class RewardedVideoCallbacks {

    public function new() { }

    public function onRewardedVideoLoaded():Void {
        #if android
            if (Appodeal.onRewardedVideoLoadedCall != null) {
                Appodeal.onRewardedVideoLoadedCall();
            }
        #end
    }

    public function onRewardedVideoFailedToLoad():Void {
        #if android
            if (Appodeal.onRewardedVideoFailedToLoadCall != null) {
                Appodeal.onRewardedVideoFailedToLoadCall();
            }
        #end
    }

    public function onRewardedVideoShown():Void {
        #if android
            if (Appodeal.onRewardedVideoShownCall != null) {
                Appodeal.onRewardedVideoShownCall();
            }
        #end
    }

    public function onRewardedVideoFinished():Void {
        #if android
            if (Appodeal.onRewardedVideoFinishedCall != null) {
                Appodeal.onRewardedVideoFinishedCall();
            }
        #end
    }

    public function onRewardedVideoClosed():Void {
        #if android
            if (Appodeal.onRewardedVideoClosedCall != null) {
                Appodeal.onRewardedVideoClosedCall();
            }
        #end
    }
}