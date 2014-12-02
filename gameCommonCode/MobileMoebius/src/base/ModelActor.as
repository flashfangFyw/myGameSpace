package base
{
	
	import org.robotlegs.mvcs.Actor;
	
	
	/******************************************************
	 *
	 * 创建者：njw
	 * 功能：
	 * 说明：派生类之间不能嵌套注入：比如AModel中注入BModel,BModel中注入AModel,会陷入无限循环错误
	 *
	 ******************************************************/
	
	public class ModelActor extends Actor 
	{
		public function ModelActor()
		{
			super();
		}
		public function addEventListener(type:String,listener:Function):void
		{
			_eventDispatcher.addEventListener(type,listener);
			//			eventMap.mapListener(_eventDispatcher,type,listener);
		}
	}
}