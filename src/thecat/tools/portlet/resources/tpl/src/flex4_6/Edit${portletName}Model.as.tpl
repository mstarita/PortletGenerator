package ${packageName} {
	
	[Bindable]
    [RemoteClass(alias="${packageName}.Edit${portletName}ModelBean")]
	public class Edit${portletName}Model {

		private var _showParams : Boolean;
		private var _param1 : String;
		private var _param2 : String;
		private var _param3 : String;

		public function set showParams(value:Boolean):void {
            _showParams = value;
        }
        public function get showParams():Boolean {
            return _showParams;
        }

        public function set param1(value:String):void {
            _param1 = value;
        }
        public function get param1():String {
            return _param1;
        }

		public function set param2(value:String):void {
            _param2 = value;
        }
        public function get param2():String {
            return _param2;
        }
        
        public function set param3(value:String):void {
            _param3 = value;
        }
        public function get param3():String {
            return _param3;
        }
	}
}
