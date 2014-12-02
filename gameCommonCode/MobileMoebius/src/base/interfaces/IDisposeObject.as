package base.interfaces
{
	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public interface IDisposeObject
	{
		/**
		 *	清空为初始化状态
		 */
		function onClear():void;
		
		/**
		 *	清理对象
		 */
		function onDispose():void;
	}
}