package core.view
{
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.StarlingMediator;
	
	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class CommMediator extends StarlingMediator
	{
		[Inject]
		public var injector:IInjector;
		
		//可以调整为mediatorMap来管理
		protected var m_ComponentMediatorList:Array;
		
		public function CommMediator()
		{
			super();
		}
		override public function onRegister():void
		{
			initComponentMediator();
//			preInitView();
			initView();
//			addModuleListener(ModuleEventEnum.MODULE_STAGE_RESIZE,onStageResizeHandler);
			addEvent();
			initRequest();
		}
		protected function registerComponentMediator(component:Object,cls:Class,param:Object = null):void
		{
			if(null == cls) return;
			if(null == m_ComponentMediatorList) m_ComponentMediatorList = [];
			var mediator:IMediator = new cls;
			mediator.setViewComponent(component);
//			mediator.setParam(param);
			injector.injectInto(mediator);
//			mediator.preRegister(true);
			m_ComponentMediatorList.push(mediator);
		}
		protected function initComponentMediator():void {}
		protected function initView():void {}
		protected function addEvent():void {}
		protected function removeEvent():void {}
		protected function initRequest():void {}
	}
}