package base.command
{
	import org.robotlegs.base.ContextEvent;



	public class StartupCommand extends CommCommand
	{
		[Inject]
		public var event:ContextEvent;

		override public function execute():void
		{
			if (event.type == ContextEvent.STARTUP)
			{
				injectSingleton();
				initModel();
				initViewMap();
				initCommandMap();
				initManager();
				startup();
			}
			else
			{

			}
		}
		
		
		protected function injectSingleton():void
		{
		}
		protected function initModel():void
		{
//			var gameConfig:GameConfig= GameConfig.GetInstance();
//			injector.mapValue(GameConfig, gameConfig);
//			injector.mapSingleton(MapModel);
		}
		protected function initCommandMap():void
		{
//			commandMap.mapEvent(StartEvent.INIT_VIEW, GameViewStartCommand);
		}
		protected function initViewMap():void
		{
//			mediatorMap.mapView(MainView, MainViewMediator);
		}
		protected function initManager():void
		{
			// TODO Auto Generated method stub
			
		}
		protected function startup():void
		{
//			contextView.addChild(new MainView());
		}




	}

}