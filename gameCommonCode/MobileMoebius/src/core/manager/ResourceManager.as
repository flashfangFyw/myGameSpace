package core.manager
{
	import starling.textures.Texture;
	import starling.utils.AssetManager;

	/******************************************************
	 *
	 * 创建者：fyw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class ResourceManager
	{
		public function ResourceManager()
		{
		}
		private static var am:AssetManager = new AssetManager();
		public static function get assetManager():AssetManager
		{
			return am;
		}
		/**
		 * 获取指定名称的纹理
		 * 如果assetmanager里面有,则使用assetmanager里面的纹理
		 * 如果没有,使用嵌入素材
		 */
		public static function getTexture(name:String):Texture
		{
			var texture:Texture = assetManager.getTexture(name);
			if( !texture )
			{
				var cls:Class = null;//Assets[name+"Cls"];
				texture = Texture.fromBitmap( new cls() );
			}									
			return texture;
		}
		/**
		 * 获取之前素材开头的纹理集
		 */
		public static function getTextures(prefix:String, result:Vector.<Texture>=null):Vector.<Texture>
		{
			return assetManager.getTextures( prefix, result );
		}
	}
}