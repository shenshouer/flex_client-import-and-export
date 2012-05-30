package com.sse.ayena.gateway.loader
{
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.FileReference;
	
	import mx.controls.Alert;
	import mx.formatters.DateFormatter;
	
	import spark.formatters.DateTimeFormatter;
	

	public class ExportLoader extends BaseExportAndInportLoader
	{
		public function ExportLoader()
		{
			fileLoader = new FileReference;
			fileLoader.addEventListener(Event.COMPLETE, completeHandler);
			fileLoader.addEventListener(IOErrorEvent.IO_ERROR, ioerrorHandler);
		}
		
		protected function ioerrorHandler(event:IOErrorEvent):void
		{
			Alert.show("数据导出失败！", "错误提示!");
			event.stopImmediatePropagation();
		}
		
		protected function completeHandler(event:Event):void
		{
			Alert.show("数据导出成功！", "提示");
			event.stopImmediatePropagation();
		}
		
		public function exportData(data:Object):void
		{
			if ( data == null ){
				Alert.show("没有导出数据", "提示");
				return;
			}
			var df:DateFormatter = new DateFormatter;
			df.formatString = "YYYYMMDDHHNNSS";
			var name:String = "graphData_" + df.format((new Date)) + ".txt";
			this.save(data, name);
		}
		
		/**
		 * @param data 需要保存的数据
		 * @param name 设置保存文件的名称。如：xxx.xml
		 * */
		public function save(data:Object, name:String):void
		{
			fileLoader.save(data, name);
		}
	}
}