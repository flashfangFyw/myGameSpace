package base.context
{


	
	import base.command.InitConfigCommand;
	import base.command.InitControlCommand;
	import base.command.InitModelCommand;
	import base.command.InitModuleCommand;
	
	import module.base.ModuleContextEvent;
	import module.base.ModuleEventDispatcher;
	
	import org.robotlegs.core.IContext;
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.display.DisplayObjectContainer;

	/**
	 * ...
	 * @author XXL
	 */
	public class MainContext extends StarlingContext implements IContext
	{

		public function MainContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}

		override public function startup():void
		{
			super.startup();
			
//			if(null == Constants.MAIN_INJECTOR)
//			{
//				Constants.MAIN_INJECTOR = injector;
//			}
			
			/**
			 * 全局模块事件中心
			 */
			var moduleDispatcher:ModuleEventDispatcher = new ModuleEventDispatcher(this);
			injector.mapValue(ModuleEventDispatcher, moduleDispatcher);
			
			mapCommand();
			dispatchEvent(new MainContextEvent(ModuleContextEvent.INIT_CONFIG));
		}
		private function mapCommand():void
		{
			commandMap.mapEvent(ModuleContextEvent.INIT_CONFIG, InitConfigCommand, 	MainContextEvent, true);
			commandMap.mapEvent(MainContextEvent.INIT_MODULE, 	InitModuleCommand, 	MainContextEvent, true);
			commandMap.mapEvent(ModuleContextEvent.INIT_MODEL, 	InitModelCommand, 	MainContextEvent, true);
			commandMap.mapEvent(MainContextEvent.INIT_CONTROL, 	InitControlCommand, MainContextEvent, true);
		}


	}

}