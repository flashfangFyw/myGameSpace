package core.manager
{
	import module.base.ModuleInfo;
	import module.interfaces.IModule;
	
	import org.robotlegs.mvcs.Actor;
	
	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class ModuleManager extends Actor
	{
		/*
		** 1.装载 成功后通知MainContext(这种方式，可以让MainContext调用getModule来对module进行操作，也可以直接用回调，这里用的是回调)
		** 2.卸载 成功后释放IModule
		** 3.强制GC 释放资源
		** 4.有可能在帧循环中Update每一个IModule
		*/
		
		//类名后缀
		private static const CLASS_NAME_SUFFIX:String = "Module";
//		private static const MODULE_PATH:String = GameConfig.ROOT_PATH+ "module/";
		private static const MODULE_PATH:String = "module/";
		private static const MODULE_FILE_NAME_SUFFIX:String = "Module.swf";
		
		
		private var m_ModuleList:Object = {};
		
		public function ModuleManager()
		{
			super();
		}
		public function createModule(info:ModuleInfo,callBack:Function = null,order:int = 1):void
		{
			if(null == info) return;
			var moduleType:String = info.getName();
			var module:IModule = getModule(moduleType);
			if(module)
			{
				//这里注意，第一次进入的参数会被之后的覆盖掉（如果第一次参数需要缓存固定值的话，会有问题）
				//				if(null != info.getData()) module.setParam(info.getData());
				module.setParam(info.getData());
				module.recover();
			}
			else
			{
				//				trace("开启模块：" + moduleType);
				var className:String = moduleType + CLASS_NAME_SUFFIX;
				className = className + "."  + className;
				//以后要转为Log日志中，Debug模块
				var url:String = MODULE_PATH + moduleType + MODULE_FILE_NAME_SUFFIX;
				var progress:Boolean = true;
				if(1 != order) progress = false;
//				var loader:ILoader = LoaderManager.GetInstance().createLoader(url,LoaderTypeEnum.LOADER_TYPE_MODULE,progress,order);
//				loader.addEventListener(LoaderEvent.LOAD_COMPLETE,onLoadComplete);
//				loader.addEventListener(LoaderEvent.LOAD_FAIL,onLoadFail);
//				if(loader.getLoadState() == LoadStateEnum.LOAD_WAIT)
//				{
//					loadModuleCount ++;
//					dispatch(new ModuleEvent(ModuleEventEnum.SCENE_LOAD_STOP));
//				}
//				
//				loader.loadStart();
//				//这里可以不用回调 做个模块加载队列
//				function onLoadFail(evt:LoaderEvent):void
//				{
//					loader.removeEventListener(LoaderEvent.LOAD_COMPLETE,onLoadComplete);
//					loader.removeEventListener(LoaderEvent.LOAD_FAIL,onLoadFail);
//					loadModuleCount--;
//					if(loadModuleCount <= 0) 
//					{
//						loadModuleCount = 0;
//						dispatch(new ModuleEvent(ModuleEventEnum.SCENE_LOAD_START));
//					}
//				}
//				
//				function onLoadComplete(evt:LoaderEvent):void
//				{
//					loader.removeEventListener(LoaderEvent.LOAD_COMPLETE,onLoadComplete);
//					loader.removeEventListener(LoaderEvent.LOAD_FAIL,onLoadFail);
//					if(m_ModuleList[moduleType]) 
//					{
//						//避免多次相同模块的同时加载
//						trace("重复模块加载：" + moduleType);
//						return;
//					}
//					loadModuleCount--;
//					if(loadModuleCount <= 0) 
//					{
//						loadModuleCount = 0;
//						dispatch(new ModuleEvent(ModuleEventEnum.SCENE_LOAD_START));
//					}
//					linkModule(info,className,loader);
//					module = getModule(moduleType);
//					if(module)
//					{
//						if(callBack != null) 
//						{
//							callBack(module);
//							callBack = null;
//						}
//					}
//				}
			}
		}
		
		public function getModule(moduleType:String):IModule
		{
			return m_ModuleList[moduleType]; 
		}
	}
}