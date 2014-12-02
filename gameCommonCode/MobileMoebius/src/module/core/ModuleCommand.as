package module.core
{
	import module.base.ModuleEventDispatcher;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：模块基础命令
	 *
	 ******************************************************/
	public class ModuleCommand extends Command
	{
		[Inject]
		public var m_ModuleEventDispatcher:ModuleEventDispatcher;
		
		public function ModuleCommand()
		{
			super();
		}
		
		protected function addModuleListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			m_ModuleEventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		protected function removeModuleListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			m_ModuleEventDispatcher.removeEventListener(type, listener, useCapture);
		}
		/**
		 * 发送全局框架事件
		 */
		protected function dispatchToModules(event:Event):Boolean
		{
			if(m_ModuleEventDispatcher.hasEventListener(event.type))
				return m_ModuleEventDispatcher.dispatchEvent(event);
			return true;
		}
		/**
		 * 发送模块内框架事件
		 */
		protected function dispatchToContext(event:Event):Boolean
		{
			if(eventDispatcher.hasEventListener(event.type))
				return eventDispatcher.dispatchEvent(event);
			return false;
		}
	}
}