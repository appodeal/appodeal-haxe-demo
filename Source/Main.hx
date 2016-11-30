package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.SimpleButton;
import openfl.display.StageScaleMode;
import openfl.events.MouseEvent;
import openfl.Lib;

class Main extends Sprite {
	var interstitialState:Int = 0; //0 - not loaded; 1 - loading; 2 - loaded
	
	public function new () {
		
		super ();
		
		var sprInitialize = new Sprite();
		sprInitialize.addChild(new Bitmap (Assets.getBitmapData ("assets/btn_initialize.png")));
		
		var sprShowBanner = new Sprite();
		sprShowBanner.addChild(new Bitmap (Assets.getBitmapData ("assets/btn_show_banner.png")));
		
		var sprShowInterstitial = new Sprite();
		sprShowInterstitial.addChild(new Bitmap (Assets.getBitmapData ("assets/btn_show_interstitial.png")));
		
		var sprShowVideo = new Sprite();
		sprShowVideo.addChild(new Bitmap (Assets.getBitmapData ("assets/btn_show_video.png")));
		
		var sprHide = new Sprite();
		sprHide.addChild(new Bitmap (Assets.getBitmapData ("assets/btn_hide.png")));
		
		var sprDown = new Sprite();
		sprDown.addChild(new Bitmap (Assets.getBitmapData ("assets/btn_down.png")));
		
		var btnInitialize = new SimpleButton(sprInitialize, sprInitialize, sprDown, sprInitialize);
		var btnShowBanner = new SimpleButton(sprShowBanner, sprShowBanner, sprDown, sprShowBanner);
		var btnShowInterstitial = new SimpleButton(sprShowInterstitial, sprShowInterstitial, sprDown, sprShowInterstitial);
		var btnShowVideo = new SimpleButton(sprShowVideo, sprShowVideo, sprDown, sprShowVideo);
		var btnHideBanner = new SimpleButton(sprHide, sprHide, sprDown, sprHide);
		
		var buttons:Array<SimpleButton> = [btnInitialize, btnShowBanner, btnShowInterstitial, btnShowVideo, btnHideBanner];
		
		var i:Int;
		var center = (stage.stageWidth - btnInitialize.width) / 2;
		var paddingTop = 10;
		var currentY = paddingTop;
		for(i in 0...buttons.length){
			addChild(buttons[i]);
			buttons[i].x = center;
			buttons[i].y = currentY;
			currentY = currentY + Std.int(buttons[i].height) + paddingTop;
		}
		
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
		var baseGameWidth = 480;
		var baseGameHeight = 800;
		scaleX = (stageWidth / baseGameWidth);
		scaleY = (stageHeight / baseGameHeight);
		x = -(stageWidth - width) / 2;
		
		btnInitialize.addEventListener(MouseEvent.CLICK, this.onInitializeClicked);
		btnShowBanner.addEventListener(MouseEvent.CLICK, this.onShowBannerClicked);
		btnShowInterstitial.addEventListener(MouseEvent.CLICK, this.onShowInterstitialClicked);
		btnShowVideo.addEventListener(MouseEvent.CLICK, this.onShowVideoClicked);
		btnHideBanner.addEventListener(MouseEvent.CLICK, this.onHideBannerClicked);
	}
	
	public function onBannerLoaded(){
		trace("banner loaded");
	}
	
	public function onBannerFailedToLoad(){
		trace("banner failed to load");
	}
	
	public function onBannerShown(){
		trace("banner shown");
	}
	
	public function onBannerClicked(){
		trace("banner clicked");
	}
	
	public function onInterstitialLoaded(){
		interstitialState = 2;
		trace("interstitial loaded");
	}
	
	public function onInterstitialFailedToLoad(){
		interstitialState = 0;
		trace("interstitial failed to load");
	}
	
	public function onInterstitialShown(){
		trace("interstitial shown");
	}
	
	public function onInterstitialClicked(){
		trace("interstitial clicked");
	}
	
	public function onInterstitialClosed(){
		trace("interstitial closed");
	}
	
	public function onInterstitialFinished(){
		trace("interstitial finished");
	}
	
	public function onRewardedVideoLoaded(){
		trace("rewarded video loaded");
	}
	
	public function onRewardedVideoFailedToLoad(){
		trace("rewarded video failed to load");
	}
	
	public function onRewardedVideoShown(){
		trace("rewarded video shown");
	}
	
	public function onRewardedVideoFinished(){
		trace("rewarded finished");
	}
	
	public function onRewardedVideoClosed(){
		trace("rewarded video closed");
	}
	
	public function onInitializeClicked(e: MouseEvent):Void{
		//Remove dialog about skippable video
		Appodeal.confirm(Appodeal.INTERSTITIAL);
		
		//Banner callbacks
		Appodeal.addBannerListener("onBannerLoaded", this.onBannerLoaded);
		Appodeal.addBannerListener("onBannerFailedToLoad", this.onBannerFailedToLoad);
		Appodeal.addBannerListener("onBannerShown", this.onBannerShown);
		Appodeal.addBannerListener("onBannerClicked", this.onBannerClicked);
		
		//Interstitial callbacks
		Appodeal.addInterstitialListener("onInterstitialLoaded", this.onInterstitialLoaded);
		Appodeal.addInterstitialListener("onInterstitialShown", this.onInterstitialShown);
		Appodeal.addInterstitialListener("onInterstitialClicked", this.onInterstitialClicked);
		Appodeal.addInterstitialListener("onInterstitialClosed", this.onInterstitialClosed);
		Appodeal.addInterstitialListener("onInterstitialFailedToLoad", this.onInterstitialFailedToLoad);
		Appodeal.addInterstitialListener("onInterstitialFinished", this.onInterstitialFinished);
		
		//Rewarded video callbacks
		Appodeal.addRewardedListener("onRewardedVideoLoaded", this.onRewardedVideoLoaded);
		Appodeal.addRewardedListener("onRewardedVideoFailedToLoad", this.onRewardedVideoFailedToLoad);
		Appodeal.addRewardedListener("onRewardedVideoShown", this.onRewardedVideoShown);
		Appodeal.addRewardedListener("onRewardedVideoClosed", this.onRewardedVideoClosed);
		Appodeal.addRewardedListener("onRewardedVideoFinished", this.onRewardedVideoFinished);
		
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
		//Appodeal.set728x90Banners(false); //disable big banners. enabled by default
		//Appodeal.setSmartBanners(false); //disable smart banners. enabled by default
		//Appodeal.setBannerAnimation(false); //disable smooth transitions for banners. enabled by default
		//Appodeal.setTesting(true); //enable test ads. disabled by default.
		//Appodeal.setLogging(true); //enable debug output. disabled by default.
		//Appodeal.setOnLoadedTriggerBoth(Appodeal.INTERSTITIAL, true); //triggering onLoaded callback twice (first time for precache and second time for final ad).
		//Appodeal.setCustomBooleanRule("special_user", true); //way to specify your own rule value to define segments
		//Appodeal.trackInAppPurchase("USD", 5); //you can also track in-app purchases
		
		Appodeal.setLogLevel(Appodeal.LOG_LEVEL_VERBOSE);
		Appodeal.setAutoCache(Appodeal.INTERSTITIAL, false);
		Appodeal.initialize("fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f", true, true, false, true);
	}
	
	public function onShowBannerClicked(e: MouseEvent):Void{
		Appodeal.show(Appodeal.BANNER);
	}
	
	public function onShowInterstitialClicked(e: MouseEvent):Void{
		if(interstitialState == 0){
			interstitialState = 1;
			Appodeal.cache(Appodeal.INTERSTITIAL);
		}
		if (interstitialState == 2){
			interstitialState = 0;
			Appodeal.showWithPlacement(Appodeal.INTERSTITIAL, "main_menu");
		}
	}
	
	public function onShowVideoClicked(e: MouseEvent):Void{
		if(Appodeal.isLoaded(Appodeal.REWARDED_VIDEO))
			Appodeal.show(Appodeal.REWARDED_VIDEO);
	}
	
	public function onHideBannerClicked(e: MouseEvent):Void{
		Appodeal.hide(Appodeal.BANNER);
	}
	
}