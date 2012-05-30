package com.sse.ayena.manager
{
	import com.sse.ayena.events.DataEvent;
	import com.sse.ayena.gateway.loader.ImportLoader;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	
	/**
	 * 导入数据 
	 * @author shenshouer
	 * 
	 */
	public class ImportManager
	{
		public function ImportManager()
		{
		}
		
		public static function importVisualGraphData():void
		{
			var il:ImportLoader = new ImportLoader;
			il.addEventListener(DataEvent.FAULT_ERROR, errorHandler);
			il.addEventListener(DataEvent.RESULT_SUCCESS, successHandler);
			il.importData();
		}

		private static function successHandler(event:DataEvent):void
		{
			var data:String = String(event.data);
			FlexGlobals.topLevelApplication.out.text = data;
		}

		private static function errorHandler(event:DataEvent):void
		{
			trace(event.data.toString());
			Alert.show("导入数据失败","错误");
		}
	}
}