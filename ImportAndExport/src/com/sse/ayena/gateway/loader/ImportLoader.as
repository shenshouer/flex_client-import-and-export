package com.sse.ayena.gateway.loader
{
	import com.sse.ayena.events.DataEvent;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;

	public class ImportLoader extends BaseExportAndInportLoader
	{
		public function ImportLoader()
		{
			fileLoader = new FileReference;
			fileFiter = new FileFilter("请选择xml文件","*.xml");
			fileLoader.addEventListener(Event.SELECT, selectHander);
			fileLoader.addEventListener(Event.COMPLETE, completeHandler);
			fileLoader.addEventListener(IOErrorEvent.IO_ERROR, faultHander);
			fileLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, faultHander);
		}
		
		public function importData():void
		{
			if ( fileLoader == null )
				throw Error("导出出错！");
			
			fileLoader.browse([fileFiter]);
		}

		private function faultHander(event:IOErrorEvent):void
		{
			event.stopImmediatePropagation();
			this.removeAllEventListener();
			dispatchEvent(new DataEvent(DataEvent.FAULT_ERROR, null));
		}

		private function selectHander(event:Event):void
		{
			event.stopImmediatePropagation();
			fileLoader.load();	
		}

		private function completeHandler(event:Event):void
		{
			event.stopImmediatePropagation();
			this.removeAllEventListener();
			dispatchEvent(new DataEvent(DataEvent.RESULT_SUCCESS, FileReference(event.target).data));
		}
		
		private function removeAllEventListener():void
		{
			if (fileLoader.hasEventListener(Event.SELECT))
				fileLoader.removeEventListener(Event.SELECT, selectHander);
			
			if (fileLoader.hasEventListener(Event.COMPLETE))
				fileLoader.removeEventListener(Event.COMPLETE, completeHandler);
			
			if (fileLoader.hasEventListener(IOErrorEvent.IO_ERROR))
				fileLoader.removeEventListener(IOErrorEvent.IO_ERROR, faultHander);
			
			if (fileLoader.hasEventListener(SecurityErrorEvent.SECURITY_ERROR))
				fileLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, faultHander);
		}
			
	}
}