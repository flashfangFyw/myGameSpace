package utility
{
	import flash.net.LocalConnection;
	import flash.system.System;

	public class GCUtility
	{
		public static function RecycleMemory():void
		{	
			try
			{
				new LocalConnection().connect("empty");
				new LocalConnection().connect("empty");
				System.gc();
			}
			catch (e:Error)
			{
				
			}
		}
	}
}