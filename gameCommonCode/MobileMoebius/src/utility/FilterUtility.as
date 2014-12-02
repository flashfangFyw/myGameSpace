package utility
{
	import flash.filters.BitmapFilterQuality;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;

	/**
	 *
	 * 创建者：njw
	 * 修改者：
	 * 说明：
	 */
	public class FilterUtility
	{
		public static const GLOW_FILTER_GREEN:Array = [new GlowFilter(0x00FF00,1,4,4,8,BitmapFilterQuality.LOW)];
		public static const GLOW_FILTER_RED:Array = [new GlowFilter(0xFF0000,1,2,2,3,BitmapFilterQuality.LOW)];
//		public static const GLOW_FILTER_WHITE:Array = [new GlowFilter(0xFFFFFF,1,2,2,3,BitmapFilterQuality.LOW)];
//		public static const GLOW_FILTER_LOW:GlowFilter = [new GlowFilter(0xFFFFCC,1,6,6,2,BitmapFilterQuality.LOW)];
		
		/**
		 * 选择效果 
		 */
		public static const GLOW_FILTER_SELECT:Array = [new GlowFilter(0xFFFF00,1,5,5,2,BitmapFilterQuality.LOW)];
		
		/**
		 * 灰度 
		 */
		public static const GRAYSCALE_FILTER:Array = [new ColorMatrixFilter([0.3086,0.6094,0.0820,0,0,0.3086,0.6094,0.0820,0,0,0.3086,0.6094,0.0820,0,0,0,0,0,1,0])];
		
		/**
		 * 白色模糊 
		 */		
//		public static const WHITE_COLOR_FILTER:Array = [new ColorMatrixFilter([1, 0, 0, 0, 45, 0, 1, 0, 0, 45, 0, 0, 1, 0, 45, 0, 0, 0, 1, 0])];
		
		/**
		 * 高亮 
		 */		
//		public static const HIGHT_LIGHT_FILTER:Array = [new ColorMatrixFilter([1, 0, 0, 0, 50, 0, 1, 0, 0, 50, 0, 0, 1, 0, 50, 0, 0, 0, 1, 0])];
		public static const HIGHT_LIGHT_FILTER:Array = [new ColorMatrixFilter([1, 0, 0, .5, 0, 0, 1, 0, 0.5, 0, 0, 0, 1, 0.5, 0, 0, 0, 0, 1, 0])];
		
		/**
		 * 黑色笔触
		 */		
//		public static const BLACK_STROKE:GlowFilter = [new GlowFilter(0, 0.7, 2, 2, 17, 1, false, false)];
		
		/**
		 * 字体描边 投影滤镜
		 */
		public static const OUTLINE_FILTER:Array = [new DropShadowFilter(0,45,0x000000,1,3.1,3.1,10,BitmapFilterQuality.LOW)];
		
		/**
		 * 绿色描边 
		 */		
		public static const GREEN_GLOW:Array	    = [new GlowFilter(0x55AA22, 1, 4, 4, 6)];
		/**
		 * 默认蓝
		 */
		public static const COLORTRANSFORM_BLUE:ColorTransform = new ColorTransform(0.06,0.6,0.85,0.58);
		/**
		 * 地图移上 滤镜
		 * GlowFilter(0xFFFF00,1,5,5,2,BitmapFilterQuality.LOW)
		 */
		public static const MAP_OVER_FILTER:Array = [new GlowFilter(0xFFCC00,1,6,6,2.5,BitmapFilterQuality.HIGH),new ColorMatrixFilter([1.25,0,0,0,2.875,0,1.25,0,0,2.875,0,0,1.25,0,2.875,0,0,0,1,0])];
		public static const MAP_GRAY_FILTER:Array = [new ColorMatrixFilter([0.49,0.53,-0.07,0,-1.57,0.19,0.65,0.09,0,-1.57,0.32,0.33,0.29,0,-1.57,0,0,0,1,0])];
		/**
		 * 地图投影 滤镜
		 */
		public static const MAPSHADOW_FILTER:Array = [new DropShadowFilter(250,60,0x000000,1,20,20,0.40)];
		
	}
}