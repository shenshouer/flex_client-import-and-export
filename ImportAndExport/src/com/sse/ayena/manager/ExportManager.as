package com.sse.ayena.manager
{
	
	import com.sse.ayena.gateway.loader.ExportLoader;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	
	/**
	 * 导出xml数据管理器 
	 * @author shenshouer
	 * 
	 */	
	public class ExportManager
	{
		public function ExportManager()
		{
		}
		
		/**
		 * 数据导出xml格式 
		 */		
		public static function exportVisualGraphData():void
		{
			var data:String = FlexGlobals.topLevelApplication.out.text;
			
			var el:ExportLoader = new ExportLoader;
			el.exportData(data);
		}
		
	}
}