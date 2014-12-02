package utility
{
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.utils.Dictionary;

	/**
	 *
	 * 创建者：njw
	 * 修改者：
	 * 说明：
	 */
	public class CommonUtility
	{		
		public static const DEFAULT_FONT:String = "SimSun";//黑体：SimHei 宋体：SimSun 微软雅黑体：Microsoft YaHei
		
		//屏蔽鼠标事件
		public static function shutMouseEvent(textField:TextField):void
		{
			if(null == textField) return;
			textField.mouseEnabled = false;
			textField.mouseWheelEnabled = false;
		}
		
		//打开鼠标事件
		public static function openMouseEvent(textField:TextField):void
		{
			if(null == textField) return;
			textField.mouseEnabled = true;
			textField.mouseWheelEnabled = true;
		}
		
		public static function setStringToText(textField:TextField,str:String):void
		{
			if(null == str) str = "";
			if(textField) textField.text = str;
		}
		
		public static function setTextType(textField:TextField,type:String):void
		{
			if(null == textField) return;
			if(type == TextFieldType.INPUT){
				textField.autoSize = "left";
				textField.mouseEnabled = true;
				textField.selectable = true;
				textField.type = type;
			}
			
			if(type == TextFieldType.DYNAMIC){
				textField.mouseEnabled = false;
				textField.selectable = false;
				textField.type = type;
			}
		}
		
		public static function setTextFieldButtonMode(textField:TextField):void
		{
			if(textField) 
			{
				textField.mouseEnabled = true;
				textField.htmlText = "<a href='event:'>" + textField.htmlText + "</a>";
			}
		}
		
		public static function setStringToHtmlText(textField:TextField,str:String):void
		{
			if(null == str) str = "";
			if(textField) textField.htmlText = str;
		}
		
		/**设置文本下划线**/
		public static function setTextFieldUnderline(textField:TextField):void
		{
			if(textField) textField.htmlText = "<u>"  + textField.htmlText + "</u>";	
		}
		
		//快速排序
		//调整为 quickSort(data:Array,callBack:Function)
		public static function quickSort(data:Array,low:int,high:int):void
		{ 
			var i:int,j:int,pivot:int; 
			if(low < high)
			{
				pivot=data[low]; 
				i=low;  
				j=high; 
				
				while(i<j) 
				{ 
					while (i<j && data[j]>=pivot) 
						j--; 
					if(i<j) 
						data[i++]=data[j]; //将比枢轴记录小的记录移到低端 
					
					while (i<j && data[i]<=pivot) 
						i++; 
					if(i<j)  
						data[j--]=data[i]; //将比枢轴记录大的记录移到高端 
				} 
				
				data[i]=pivot; //枢轴记录移到最终位置 
				
				quickSort(data,low,i-1); 
				quickSort(data,i+1,high); 
			} 
		}
		
		public static function releaseArray(array:Array):void
		{
			if(null == array) return;
			array.splice(0,array.length);
			
			//TODO njw:测试以下方法
//			array.length = 0;	//方法1
			
//			while(array.length)
//			{
//				array.pop();
//			}					//方法2
		}
		
		public static function releaseDictionary(dic:Dictionary):void
		{
			if(null == dic) return;
			var key:String;
			var keyList:Array = new Array;
			for(key in dic)
			{
				keyList.push(key);
			}
			for each(key in keyList)
			{
				delete dic[key];
			}
			releaseArray(keyList);
		}
		
		/**
		 * 填充字符串
		 * @param source 源字符串
		 * @param len 需要填充的长度
		 * @param fillStr 用来填充的字符
		 * @param fillAfter 是否为后填充<b>默认为false</b>
		 * @return
		 */
		public static function FillString(source:String, len:int, fillStr:String, fillAfter:Boolean = false):String
		{
			var cnt:int = len - source.length;
			
			for (var i:int = 0; i < cnt; i++)
			{
				if (fillAfter)
				{ //尾部添加
					source += fillStr;
				}
				else
				{ //前端添加
					source = fillStr + source;
				}
			}
			
			return source;
		}
	}
}