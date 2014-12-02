package base.cfg
{

	/******************************************************
	 *
	 * 创建者：njw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class BaseConfigInfo
	{
		public var id:int;
		public static const SPLIT_SYMBOL:String = "-";
		public static const SPLIT_SYMBOL_EXTEND:String = "|";
		public static const SPLIT_SYMBOL_LIST:String = ",";
		
		public function BaseConfigInfo()
		{
		}
		
		/**
		 * xml赋值
		 * @param	obj
		 */
		public function fillXml(xmlObj:XML):void
		{
			if(xmlObj == null) return ;
			var dataList:XMLList = xmlObj.attributes();
//			var len:int = xmlObj.attributes().length();
			var len:int = dataList.length();
			for(var i:int=0;i<len;i++)
			{
				var data:XML = dataList[i];
				var propertyname:String = data.name();
				if(!hasOwnProperty(propertyname)) continue;
				this[propertyname] = data;
			}
		}

		public function getKey():String
		{
			return String(id);
		}
		
		public function getID():int
		{
			return id;
		}
		
//		protected function parseAwardList(str:String):Array
//		{
//			var list:Array = str.split(SPLIT_SYMBOL_LIST);
//			if(null == list) return null;
//			var len:int = list.length;
//			if(len == 0) return null;
//			var awardList:Array = new Array(len);
//			for(var i:int = 0; i < len; ++i)
//			{
//				var listTmp:Array = String(list[i]).split(SPLIT_SYMBOL);
//				var configInfo:AwardInfo = new AwardInfo;
//				if(listTmp.length > 0) configInfo.m_Type = listTmp[0];
//				if(listTmp.length > 1) configInfo.m_SubType = listTmp[1];
//				if(listTmp.length > 2) configInfo.m_Value = listTmp[2];
//				awardList[i] = configInfo;
//			}
//			return awardList;
//		}
		
		protected function getAttributeList(attributeStr:String):Array
		{
			if(attributeStr == "")
			{
				return [];
			}
			var list:Array = attributeStr.split(SPLIT_SYMBOL_LIST);
			var len:int = list.length;
			for(var i:int = 0; i < len; i++)
			{
				var str:String = list[i];
				list[i] = str.split(SPLIT_SYMBOL_EXTEND);
			}
			return list;
		}
		
	}
}