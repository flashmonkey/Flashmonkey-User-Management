package org.flashmonkey.model.impl
{
	import org.flashmonkey.model.api.IRole;
	
	[Bindable]
	[RemoteClass(alias="org.flashmonkey.user.domain.RoleEntity")]
	public class Role implements IRole
	{
		public function Role()
		{
		}
		
		private var _id:int;
		
		public function get id():int
		{
			return _id;
		}
		public function set id(value:int):void
		{
			_id = value;
		}
		
		private var _name:String;
		
		public function get name():String
		{
			return _name;
		}
		public function set name(value:String):void
		{
			_name = value;
		}
	}
}