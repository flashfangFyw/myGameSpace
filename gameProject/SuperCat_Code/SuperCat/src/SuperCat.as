package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	
	import Common.base.cfg.GameConfig;
	
	import starling.core.Starling;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	import starling.utils.formatString;
	
	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	[SWF(frameRate="60",backgroundColor="0x24211C")]
	public class SuperCat extends Sprite
	{
		// Startup image for SD screens
		[Embed(source="/startup.jpg")]
		private static var Background:Class;
		
		// Startup image for HD screens
		[Embed(source="/startupHD.jpg")]
		private static var BackgroundHD:Class;
		
		private var m_starling:Starling;
		public function SuperCat()
		{
			super();
			
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// set general properties
			
			var stageWidth:int   = GameConfig.STAGE_WIDTH;
			var stageHeight:int  = GameConfig.STAGE_HEIGHT;
			var iOS:Boolean = Capabilities.manufacturer.indexOf("iOS") != -1;
			Starling.multitouchEnabled = true;  // useful on mobile devices
			Starling.handleLostContext = !iOS;  // not necessary on iOS. Saves a lot of memory!
			
			// create a suitable viewport for the screen size
			// 
			// we develop the game in a *fixed* coordinate system of 320x480; the game might 
			// then run on a device with a different resolution; for that case, we zoom the 
			// viewPort to the optimal size for any display and load the optimal textures.
			
			var viewPort:Rectangle = RectangleUtil.fit(
				new Rectangle(0, 0, stageWidth, stageHeight), 
				new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight), 
				ScaleMode.SHOW_ALL);
			
			// create the AssetManager, which handles all required assets for this resolution
			
			var scaleFactor:int = viewPort.width < 480 ? 1 : 2; // midway between 320 and 640
			var appDir:File = File.applicationDirectory;
			var assets:AssetManager = new AssetManager(scaleFactor);
			
			assets.verbose = Capabilities.isDebugger;
			assets.enqueue(
				appDir.resolvePath("audio"),
				appDir.resolvePath(formatString("fonts/{0}x", scaleFactor)),
				appDir.resolvePath(formatString("textures/{0}x", scaleFactor))
			);
			
			// While Stage3D is initializing, the screen will be blank. To avoid any flickering, 
			// we display a startup image now and remove it below, when Starling is ready to go.
			// This is especially useful on iOS, where "Default.png" (or a variant) is displayed
			// during Startup. You can create an absolute seamless startup that way.
			// 当初始化阶段 stage3Dc初始化阶段，屏幕是空的，为避免闪屏，我们显示一张启动图片，当starling准备好运行后再移除
			// 这个对ios非常有用，当 默认图片 在启动期间显示着，就可以创建一个 无缝的启动
			
			// These are the only embedded graphics in this app. We can't load them from disk,
			// because that can only be done asynchronously (resulting in a short flicker).
			// 只能应用embedded的图片做默认图片，我们不能从硬盘加载图片否则会造成闪屏
			
			// Note that we cannot embed "Default.png" (or its siblings), because any embedded
			// files will vanish from the application package, and those are picked up by the OS!
			//注意 我们不能embed默认图片，因为任何embedded的文件将从应用包中消失，这是有系统挑选的
			
			var backgroundClass:Class = scaleFactor == 1 ? Background : BackgroundHD;
			var background:Bitmap = new backgroundClass();
			Background = BackgroundHD = null; // no longer needed!
			
			background.x = viewPort.x;
			background.y = viewPort.y;
			background.width  = viewPort.width;
			background.height = viewPort.height;
			background.smoothing = true;
			addChild(background);
			
			
			// launch Starling
			
			m_starling = new Starling(GameRoot, stage, viewPort);
			m_starling.stage.stageWidth  = stageWidth;  // <- same size on all devices!
			m_starling.stage.stageHeight = stageHeight; // <- same size on all devices!
			m_starling.simulateMultitouch  = false;
			m_starling.enableErrorChecking = Capabilities.isDebugger;
			
			m_starling.addEventListener(starling.events.Event.ROOT_CREATED, 
				function(event:Object, app:GameRoot):void
				{
					m_starling.removeEventListener(starling.events.Event.ROOT_CREATED, arguments.callee);
					removeChild(background);
					background = null;
					
					var bgTexture:Texture = Texture.fromEmbeddedAsset(
						backgroundClass, false, false, scaleFactor);
					
					app.start(bgTexture, assets);
					m_starling.start();
				});
			
			//			GameRoot.stageWidth = stage.stageWidth;
			//			GameRoot.stageHeight = stage.stageHeight;
			//			
			//			stage.align = StageAlign.TOP_LEFT;
			//			stage.scaleMode = StageScaleMode.NO_SCALE;
			//			
			//			m_starling=new Starling(GameRoot,stage);
			//			m_starling.start();
			
			m_starling.showStats = true;
			m_starling.showStatsAt("left", "bottom");
		}
	}
}