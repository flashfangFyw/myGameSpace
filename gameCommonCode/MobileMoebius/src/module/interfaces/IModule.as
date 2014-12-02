package module.interfaces
{
	import base.interfaces.IDisposeObject;
	
	import org.robotlegs.core.IInjector;
	
	import starling.display.DisplayObjectContainer;
	
	public interface IModule extends IDisposeObject
	{
		function isStatus(value:uint):Boolean;
		function startUp(injector:IInjector = null):void;
		function setParam(param:Object):void;
		function setParentInjector(injector:IInjector):void;
		function setParentContainer(container:DisplayObjectContainer):void;
		function setName(name:String):void;
		function getName():String;
		function stop():void;
		function recover():void;
		function update():void;
	}
}