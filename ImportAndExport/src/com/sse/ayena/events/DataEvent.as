package  com.sse.ayena.events
{
	import flash.events.Event;
	/**
	 * 数据服务事件 
	 * @author shouer
	 * 
	 */	
	public class DataEvent extends Event
	{
		/**
		 * 数据调用成功派发的事件
		 * */
		public static const RESULT_SUCCESS:String = "result_success";
		/**
		 * 数据调用失败派发的事件
		 * */
		public static const FAULT_ERROR:String = "fault_error";
		
		
		public static const DATA_ADD:String = "data_add";
		public static const DATA_DEL:String = "data_del";
		
		private var _data:Object;
		
		public function DataEvent(type:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this._data = data;
			super(type, bubbles, cancelable);
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		override public function clone():Event
		{
			return new DataEvent(type,this.data, bubbles, cancelable);
		}
	}
}