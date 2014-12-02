package base.interfaces
{
	import flash.utils.ByteArray;

	/**
	 *
	 * 创建者：njw
	 * 修改者：
	 * 说明：配置数据在打包的时候，做重复ID的判断
	 */
	public interface IConfig
	{
		function parseXML(data:XML,cls:Class,needAsyn:Boolean = false):void;
		function parseByteArray(data:ByteArray,cls:Class):void;
//		function parseJSON(data:JSON,cls:Class = null):void;
	}
}