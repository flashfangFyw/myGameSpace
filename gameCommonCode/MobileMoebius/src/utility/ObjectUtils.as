package utility
{
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * 创建者：njw
	 * 修改者：
	 * 说明：
	 */
	public class ObjectUtils
	{
		public static function BaseClone(source:*):*
		{
			var typeName:String = getQualifiedClassName(source);
			var packageName:String = typeName.split("::")[1];
			var type:Class = Class(getDefinitionByName(typeName));
			
			registerClassAlias(packageName, type);
			
			var copier:ByteArray = new ByteArray();
			copier.writeObject(source);
			copier.position = 0;
			return copier.readObject();
		}
		
		public static function IsString(value:*):Boolean 
		{
			return ( typeof(value) == "string" || value is String );
		}
		
		public static function IsNumber(value:*):Boolean 
		{
			return ( typeof(value) == "number" || value is Number );
		}
		
		public static function IsBoolean(value:*):Boolean 
		{
			return ( typeof(value) == "boolean" || value is Boolean );
		}
		
		public static function IsFunction(value:*):Boolean 
		{
			return ( typeof(value) == "function" || value is Function );
		}
		
		public static function IsNoNull(value:*,info:String):Boolean 
		{
			if(value) return true;
			else
			{
				//做debug和release的判断
				trace(info);
				return false;	
			}
		}
		
		/**
		 * 
		 * @param src
		 * @param tag
		 * src和tag类型必须相同，要拷贝的属性必须是public
		 * 如果属性为复杂对象，要继续进行分析:这里暂时分析所有的属性类型都是基本型
		 */		
		public static function Memcpy(src:Object,tag:Object):void
		{
			if(null == src || null == tag) return;
			var srcTypeName:String = getQualifiedClassName(src);
			var tagTypeName:String = getQualifiedClassName(tag);
			if(srcTypeName != tagTypeName) return;
			var xml:XML = describeType(src);
			var variables:XMLList = xml.variable;
			for each(var item:XML in variables)
			{
				var name:String = item.@name.toString();
				//				var type:String = item.@type.toString();
				tag[name] = src[name];
			}
		}
	}
}