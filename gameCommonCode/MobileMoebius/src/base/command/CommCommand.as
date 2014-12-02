package base.command
{
	import org.robotlegs.mvcs.StarlingCommand;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;
	
	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class CommCommand extends StarlingCommand
	{
//		[Inject]
//		public var starlingEventDispatcher:EventDispatcher;
		
		public function CommCommand()
		{
			super();
		}
		protected function dispatchStarlingEvent(event:Event):Boolean
		{
//			if(starlingEventDispatcher.hasEventListener(event.type))
//				return starlingEventDispatcher.dispatchEvent(event);
			return true;
		}
	}
}