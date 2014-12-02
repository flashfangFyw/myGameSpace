package module.base
{
	
	import org.robotlegs.core.IInjector;
	
	import starling.display.DisplayObjectContainer;

	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class ModuleInfo
	{
		public var m_Name:String;
		public var m_Data:Object;
		public var m_Injector:IInjector;
		public var m_ParentContainer:DisplayObjectContainer;
		public var m_Order:int = 1;	//加载顺序 默认为最优先
		
		public function ModuleInfo(name:String = "",data:Object = null,container:DisplayObjectContainer = null,injector:IInjector = null):void
		{
			m_Name = name;
			m_Data = data;
			m_Injector = injector;
			m_ParentContainer = container;
		}
		
		public function getName():String
		{
			return m_Name;
		}
		
		public function getData():Object
		{
			return m_Data;
		}
		
		public function getContainer():DisplayObjectContainer
		{
			return m_ParentContainer;
		}
		
		public function getInjector():IInjector
		{
			return m_Injector;
		}
		
		public function getOrder():int
		{
			return m_Order;
		}
	}
}