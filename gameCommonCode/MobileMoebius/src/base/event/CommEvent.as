package base.event
{
	import starling.events.Event;
	
	
	/******************************************************
	 *
	 * 创建者：njw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	
	public class CommEvent extends starling.events.Event
	{		
		private var m_Data:Object;
		
		public function CommEvent(type:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			m_Data = data;
		}
		
		public function getData():Object
		{
			return m_Data;
		}
		
//		override public function clone():Event
//		{
//			var evt:CommEvent = new CommEvent(this.type,m_Data);
//			return evt;
//		}
		
	}
}