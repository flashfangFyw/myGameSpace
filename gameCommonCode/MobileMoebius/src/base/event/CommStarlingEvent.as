package base.event
{
	import starling.events.Event;
	
	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class CommStarlingEvent extends Event
	{
		private var m_Data:Object;
		
		public function CommStarlingEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
			m_Data = data;
		}
		public function getData():Object
		{
			return m_Data;
		}
	}
}