package utility
{
	import flash.events.IEventDispatcher;
	import flash.utils.getTimer;
	

	/******************************************************
	 *
	 * 创建者：njw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class TestUtility
	{
		public static var m_Time:int = 0;
		public static var m_ModuleEventDispatcher:IEventDispatcher;
		
		public static function onStart():void
		{
			m_Time = getTimer();
		}
		
		public static function onEnd(str:String = ""):void
		{
			var time:int = getTimer();
			var str2:String = "测试经过时间：" + (time - m_Time) + "   " + str;
//			sendAlert(str);
			trace(str2);
			m_Time = time;
		}

		public static function IsNull(value:*,msg:String):Boolean 
		{
			if(null == value) 
			{
				sendAlert(msg);
				sendLog(msg);
				return true;
			}
			else
			{				
				return false;	
			}
		}
		
		public static function sendLog(str:String):void
		{
//			if(m_ModuleEventDispatcher) m_ModuleEventDispatcher.dispatchEvent(new ModuleEvent(ModuleEnum.MODULE_EVENT_LOG,str));
		}
		
		public static function sendAlert(str:String):void
		{
//			if(m_ModuleEventDispatcher) m_ModuleEventDispatcher.dispatchEvent(new ModuleEvent(ModuleEnum.MODULE_EVENT_ALERT,str));
		}
		
	}
}