package com.sse.ayena.gateway.loader
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.FileFilter;
	import flash.net.FileReference;

	/**
	 * 导入导出基类 
	 * @author shenshouer
	 * 
	 */
	[Event(name="result_success", type="com.sse.ayena.events.DataEvent")]
	[Event(name="fault_error", type="com.sse.ayena.events.DataEvent")]
	public class BaseExportAndInportLoader extends EventDispatcher
	{
		/**
		 * 文件导入导出类  
		 */		
		protected var fileLoader:FileReference;
		/**
		 * 设置选择的文件类型 
		 */		
		protected var fileFiter:FileFilter;
		
		public function BaseExportAndInportLoader()
		{
		}
	}
}