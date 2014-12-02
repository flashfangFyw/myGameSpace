package utility
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	/******************************************************
	 *
	 * 创建者：njw
	 * 功能：
	 * 说明：
	 *	 
	 ******************************************************/
	
	public class EffectUtility
	{
		public static function DrawSector(mc:MovieClip,x:Number=200,y:Number=200,r:Number=100,angle:Number=27,startFrom:Number=270,color:Number=0x666666):void
		{
			mc.graphics.clear();
			mc.graphics.beginFill(color,0.5);
			mc.graphics.lineStyle(0,0xff9999);
			mc.graphics.moveTo(x,y);
			angle = (Math.abs(angle)>360)?360:angle;
			var n:Number = Math.ceil(Math.abs(angle)/45);
			var angleA:Number = angle/n;
			angleA = angleA*Math.PI/180;
			startFrom = startFrom*Math.PI/180;
			mc.graphics.lineTo(x+r*Math.cos(startFrom),y+r*Math.sin(startFrom));
			for (var i:int =1; i<=n; i++) 
			{
				startFrom += angleA;
				var angleMid:Number = startFrom-angleA/2;
				var bx:Number = x+r/Math.cos(angleA/2)*Math.cos(angleMid);
				var by:Number = y+r/Math.cos(angleA/2)*Math.sin(angleMid);
				var cx:Number = x+r*Math.cos(startFrom);
				var cy:Number = y+r*Math.sin(startFrom);
				mc.graphics.curveTo(bx,by,cx,cy);
			}
			if (angle != 360) 
			{
				mc.graphics.lineTo(x,y);
			}
			mc.graphics.endFill();
		}
		
		public static function tweenBezier(dis:DisplayObject,srcX:Number,srcY:Number,toX:Number,toY:Number,endCall:Function):void
		{
			
		}
		
	}
}