package;


import openfl.Lib;
import openfl.display.Sprite;
import openfl.display.DisplayObject;
import openfl.display.StageScaleMode;
import ru.stablex.ui.widgets.Options;
import ru.stablex.ui.widgets.Checkbox;
import ru.stablex.ui.widgets.HBox;
import ru.stablex.ui.UIBuilder;

class Main extends Sprite {
	static public function main(): Void {
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		UIBuilder.setTheme('ru.stablex.ui.themes.android4');
		UIBuilder.regClass('Main');
		UIBuilder.init('defaults.xml');
		//Lib.current.addChild(UIBuilder.buildFn('MainScreen.xml')());
		UIBuilder.buildFn('MainScreen.xml')().show();
	}
	static public function onInitializePressed(): Void{
		//Banner callbacks
		Appodeal.addBannerListener("onBannerLoaded", Main.onBannerLoaded);
		Appodeal.addBannerListener("onBannerFailedToLoad", Main.onBannerFailedToLoad);
		Appodeal.addBannerListener("onBannerShown", Main.onBannerShown);
		Appodeal.addBannerListener("onBannerClicked", Main.onBannerClicked);
		
		//Interstitial callbacks
		Appodeal.addInterstitialListener("onInterstitialLoaded", Main.onInterstitialLoaded);
		Appodeal.addInterstitialListener("onInterstitialShown", Main.onInterstitialShown);
		Appodeal.addInterstitialListener("onInterstitialClicked", Main.onInterstitialClicked);
		Appodeal.addInterstitialListener("onInterstitialClosed", Main.onInterstitialClosed);
		Appodeal.addInterstitialListener("onInterstitialFailedToLoad", Main.onInterstitialFailedToLoad);
		
		//Skippable video callbacks
		Appodeal.addSkippableListener("onSkippableVideoLoaded", Main.onSkippableVideoLoaded);
		Appodeal.addSkippableListener("onSkippableVideoFailedToLoad", Main.onSkippableVideoFailedToLoad);
		Appodeal.addSkippableListener("onSkippableVideoShown", Main.onSkippableVideoShown);
		Appodeal.addSkippableListener("onSkippableVideoClosed", Main.onSkippableVideoClosed);
		Appodeal.addSkippableListener("onSkippableVideoFinished", Main.onSkippableVideoFinished);
		
		//Rewarded video callbacks
		Appodeal.addRewardedListener("onRewardedVideoLoaded", Main.onRewardedVideoLoaded);
		Appodeal.addRewardedListener("onRewardedVideoFailedToLoad", Main.onRewardedVideoFailedToLoad);
		Appodeal.addRewardedListener("onRewardedVideoShown", Main.onRewardedVideoShown);
		Appodeal.addRewardedListener("onRewardedVideoClosed", Main.onRewardedVideoClosed);
		Appodeal.addRewardedListener("onRewardedVideoFinished", Main.onRewardedVideoFinished);
		
		//Non Skippable video is just an alias for rewarded video.
		
		//User settings for better targeting
		Appodeal.setAge(25);
		Appodeal.setEmail("example@mail.com");
		Appodeal.setInterests("jogging, games");
		Appodeal.setGender(Appodeal.GENDER_MALE);
		Appodeal.setOccupation(Appodeal.OCCUPATION_WORK);
		Appodeal.setRelation(Appodeal.RELATION_SEARCHING);
		Appodeal.setAlcohol(Appodeal.ALCOHOL_NEUTRAL);
		Appodeal.setSmoking(Appodeal.SMOKING_NEGATIVE);
		Appodeal.setUserId("user_id"); //used in server callbacks (if you want to reward your user on server side).
		
		//Additional settings.
		//Appodeal.disableLocationPermissionCheck(); //if you don't want use "dangerous permissions"
		//Appodeal.disableWriteExternalStoragePermissionCheck(); // //if you don't want use "dangerous permissions"
		//Appodeal.disableNetwork("startapp"); //disable network
		//Appodeal.disableNetworkForAdType("startapp", Appodeal.BANNER); //disable network for specified type only
		
		var chk : Checkbox = UIBuilder.getAs('chk_logging', Checkbox);
		if(chk.selected)
			Appodeal.setLogLevel(Appodeal.LOG_LEVEL_VERBOSE); //enable debug output. disabled by default.
		else
			Appodeal.setLogLevel(Appodeal.LOG_LEVEL_NONE);
		chk = UIBuilder.getAs('chk_testing', Checkbox);
		if(chk.selected)
			Appodeal.setTesting(true); //enable test ads. disabled by default.
		else
			Appodeal.setTesting(false);
		
		chk = UIBuilder.getAs('chk_ban_big', Checkbox);
		Appodeal.set728x90Banners(!chk.selected); //disable big banners. enabled by default
		chk = UIBuilder.getAs('chk_ban_smart', Checkbox);
		Appodeal.setSmartBanners(!chk.selected); //disable smart banners. enabled by default
		chk = UIBuilder.getAs('chk_ban_anim', Checkbox);
		Appodeal.setBannerAnimation(!chk.selected); //disable smooth transitions for banners. enabled by default
		chk = UIBuilder.getAs('chk_ban_bck', Checkbox);
		Appodeal.setBannerBackgound(chk.selected);
		Appodeal.setOnLoadedTriggerBoth(Main.getAdType(), UIBuilder.getAs('chk_on_loaded', Checkbox).selected); //triggering onLoaded callback twice (first time for precache and second time for final ad).
		if (UIBuilder.getAs('chk_confirm', Checkbox).selected)
			Appodeal.confirm(Main.getAdType());
		
		Appodeal.setCustomBooleanRule("special_user", true); //way to specify your own rule value to define segments
		Appodeal.trackInAppPurchase("USD", 5); //you can also track in-app purchases
		
		Appodeal.setAutoCache(Main.getAdType(), !UIBuilder.getAs('chk_autocache', Checkbox).selected);
		
		var banner : Bool = false;
		var interstitial : Bool = false;
		var skippable : Bool = false;
		var nonSkippable : Bool = false;
		var rewarded : Bool = false;
		switch(Main.getAdType()){
			case Appodeal.BANNER_BOTTOM, Appodeal.BANNER_TOP:
				banner = true;
			case Appodeal.INTERSTITIAL:
				interstitial = true;
			case Appodeal.SKIPPABLE_VIDEO:
				skippable = true;
			case Appodeal.NON_SKIPPABLE_VIDEO, Appodeal.REWARDED_VIDEO:
				nonSkippable = true;
				rewarded = true;
		}
		Appodeal.initialize("fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f", banner, interstitial, skippable, nonSkippable, rewarded);
	}
	
	static public function onCachePressed(): Void{
		Appodeal.cache(Main.getAdType());
	}
	
	static public function isLoaded(): Void{
		trace(Appodeal.isLoaded(Main.getAdType()));
	}
	
	static public function isPrecache(): Void{
		trace(Appodeal.isPrecache(Main.getAdType()));
	}
	
	static public function show(): Void{
		Appodeal.show(Main.getAdType());
	}
	
	static public function hide(): Void{
		Appodeal.hide(Main.getAdType());
	}
	
	static public function getAdType(): Int{
		var adType : Int = UIBuilder.getAs('ad_type', Options).value;
		switch(adType){
			case 1:
				return Appodeal.BANNER_BOTTOM;
			case 2:
				return Appodeal.BANNER_TOP;
			case 3:
				return Appodeal.INTERSTITIAL;
			case 4:
				return Appodeal.SKIPPABLE_VIDEO;
			case 5: 
				return Appodeal.NON_SKIPPABLE_VIDEO;
			case 6:
				return Appodeal.REWARDED_VIDEO;
			case 0:
				return 0;
			default:
				return 0;
		}
	}
	
	public static function onBannerLoaded(){
		trace("Appodeal. banner loaded");
	}
	
	public static function onBannerFailedToLoad(){
		trace("Appodeal. banner failed to load");
	}
	
	public static function onBannerShown(){
		trace("Appodeal. banner shown");
	}
	
	public static function onBannerClicked(){
		trace("Appodeal. banner clicked");
	}
	
	public static function onInterstitialLoaded(){
		trace("Appodeal. interstitial loaded");
	}
	
	public static function onInterstitialFailedToLoad(){
		trace("Appodeal. interstitial failed to load");
	}
	
	public static function onInterstitialShown(){
		trace("Appodeal. interstitial shown");
	}
	
	public static function onInterstitialClicked(){
		trace("Appodeal. interstitial clicked");
	}
	
	public static function onInterstitialClosed(){
		trace("Appodeal. interstitial closed");
	}
	
	public static function onSkippableVideoLoaded(){
		trace("Appodeal. skippable video loaded");
	}
	
	public static function onSkippableVideoFailedToLoad(){
		trace("Appodeal. skippable video failed to load");
	}
	
	public static function onSkippableVideoShown(){
		trace("Appodeal. skippable video shown");
	}
	
	public static function onSkippableVideoFinished(){
		trace("Appodeal. interstitial finished");
	}
	
	public static function onSkippableVideoClosed(){
		trace("Appodeal. skippable video closed");
	}
	
	public static function onRewardedVideoLoaded(){
		trace("Appodeal. rewarded video loaded");
	}
	
	public static function onRewardedVideoFailedToLoad(){
		trace("Appodeal. rewarded video failed to load");
	}
	
	public static function onRewardedVideoShown(){
		trace("Appodeal. rewarded video shown");
	}
	
	public static function onRewardedVideoFinished(){
		trace("Appodeal. rewarded finished");
	}
	
	public static function onRewardedVideoClosed(){
		trace("Appodeal. rewarded video closed");
	}
}