package utility
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;

	/**
	 *
	 * 创建者：njw
	 * 修改者：
	 * 说明：
	 */
	public class ActionUtility
	{
		//这个全局的量要做调整
		private static var isShake:Boolean = false;
		
		//微小的震动
		public static function shake(dis:DisplayObject,times:uint = 2,offset:uint = 4,speed:uint = 32):void 
		{
			if(isShake) return;
			isShake = true;
			var point:Point = new Point(dis.x,dis.y);
			var offsetXYArray:Array = [0,0];
			var num:int = 0;
			var u:int = setInterval(function():void 
			{
				offsetXYArray[num%2] = (num++)%4<2 ?0:offset;
				if(num>(times*4 + 1))
				{
					clearInterval(u);
					num = 0;
					isShake = false;
				}
				dis.x = offsetXYArray[0] + point.x;
				dis.y = offsetXYArray[1] + point.y;
			},speed);
		}
	}
}