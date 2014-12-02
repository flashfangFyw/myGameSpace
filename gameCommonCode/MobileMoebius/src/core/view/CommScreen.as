package core.view
{
	import flash.events.KeyboardEvent;
	
	import feathers.controls.Screen;
	import feathers.utils.display.getDisplayObjectDepthFromStage;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class CommScreen extends Screen
	{
		public function CommScreen()
		{
			super();
		}
		override protected function screen_addedToStageHandler(event:Event):void
		{
			if(event.target != this)
			{
				return;
			}
			this.addEventListener(Event.REMOVED_FROM_STAGE, screen_removedFromStageHandler);
			//using priority here is a hack so that objects higher up in the
			//display list have a chance to cancel the event first.
			var priority:int = -getDisplayObjectDepthFromStage(this);
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_DOWN, screen_nativeStage_keyDownHandler, false, priority, true);
			init();
		}
		protected function init():void {}
	}
}