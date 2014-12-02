package
{
	
	import flash.system.System;
	
	import base.context.MainContext;
	
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.ScreenNavigator;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	
	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 * /** The Root class is the topmost display object in your game. It loads all the assets
	 *  and displays a progress bar while this is happening. Later, it is responsible for
	 *  switching between game and menu. For this, it listens to "START_GAME" and "GAME_OVER"
	 *  events fired by the Menu and Game classes. Keep this class rather lightweight: it 
	 *  controls the high level behaviour of your game. 
	 *******************************************************/
	public class GameRoot extends Sprite
	{ 
		private static var sAssets:AssetManager;
		
		public static var stageWidth:Number;
		public static var stageHeight:Number;
		
		
		
		public function GameRoot()
		{
			super();
			initData();
			initContext();
			
			//			addEventListener(Menu.START_GAME, onStartGame);
			//			addEventListener(Game.GAME_OVER,  onGameOver);
			// not more to do here -- Startup will call "start" immediately.
		}
		public function start(background:Texture, assets:AssetManager):void
		{
			// the asset manager is saved as a static variable; this allows us to easily access
			// all the assets from everywhere by simply calling "Root.assets"
			sAssets = assets;
			
			// The background is passed into this method for two reasons:
			// 
			// 1) we need it right away, otherwise we have an empty frame
			// 2) the Startup class can decide on the right image, depending on the device.
			
			addChild(new Image(background));
			
			// The AssetManager contains all the raw asset data, but has not created the textures
			// yet. This takes some time (the assets might be loaded from disk or even via the
			// network), during which we display a progress indicator. 
			
			var m_ProgressBar:ProgressBar = new ProgressBar();//175, 20);
			m_ProgressBar.direction = ProgressBar.DIRECTION_HORIZONTAL;
			m_ProgressBar.minimum = 0;
			m_ProgressBar.maximum = 100;
			m_ProgressBar.value = 0;
			
			m_ProgressBar.x = (background.width  - m_ProgressBar.width)  / 2;
			m_ProgressBar.y = (background.height - m_ProgressBar.height) / 2;
			m_ProgressBar.y = background.height * 0.85;
			
			addChild(m_ProgressBar);
			m_ProgressBar.validate();
			
//			var m_Label:Label;
//			m_Label = new Label();	
//			Callout.show(m_Label, m_ProgressBar);
//			m_Label.text = "Loading. " + m_CrtValue + "/100.";
			
			assets.loadQueue(function onProgress(ratio:Number):void
			{
//				m_ProgressBar.ratio = ratio;
				var degree:int=int(ratio*100);
				// a progress bar should always show the 100% for a while,
				// so we show the main menu only after a short delay. 
				
				if (degree >= 1)
					Starling.juggler.delayCall(function():void
					{
						m_ProgressBar.removeFromParent(true);
						//						showScene(Menu);
						
						// now would be a good time for a clean-up 
						System.pauseForGCIfCollectionImminent(0);
						System.gc();
					}, 0.15);
			});
		}
		private var mActiveScene:Sprite;
		private function showScene(screen:Class):void
		{
			if (mActiveScene) mActiveScene.removeFromParent(true);
			mActiveScene = new screen();
			addChild(mActiveScene);
		}
		
		private function initData():void
		{
			//			if(!mainDrawer) mainDrawer = new Drawers();
			//			mainDrawer.autoSizeMode=Drawers.AUTO_SIZE_MODE_STAGE;
			//			this.addChild(mainDrawer);
			//			if(!mainScreenNavigator) mainScreenNavigator=new ScreenNavigator();
			//			mainDrawer.content=mainScreenNavigator;
			//			initScreen();
		}
		
		//		public function initScreen():void
		//		{
		//			mainScreenNavigator.addScreen(GameScreenEnum.WELCOM,new ScreenNavigatorItem(WelcomeScene));
		//			mainScreenNavigator.addScreen(GameScreenEnum.MENU,new ScreenNavigatorItem(MenuView));
		//			mainScreenNavigator.addScreen(GameScreenEnum.GAME,new ScreenNavigatorItem(GameScreen));
		//			mainScreenNavigator.addScreen(GameScreenEnum.SETTLEMENT,new ScreenNavigatorItem(SettlementScene));
		//			
		//			mainScreenNavigator.showScreen(GameScreenEnum.WELCOM);
		//		}
		private var m_MainContext:MainContext;
		private function initContext():void
		{
			m_MainContext=new MainContext(this);
		}
		
		
		
		
		
		private var _mainScreenNavigator:ScreenNavigator;
		
		public function get mainScreenNavigator():ScreenNavigator
		{
			return _mainScreenNavigator;
		}
		
		public function set mainScreenNavigator(value:ScreenNavigator):void
		{
			_mainScreenNavigator = value;
		}
		
		
	}
}