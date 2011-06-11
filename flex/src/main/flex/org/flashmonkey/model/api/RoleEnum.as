package org.flashmonkey.model.api
{
	public class RoleEnum
	{
		public static const ROLE_ADMIN_KEY:String = "ROLE_ADMIN";
		public static const ROLE_USER_KEY:String = "ROLE_USER";
		
		public static const ROLE_ADMIN:RoleEnum = new RoleEnum(ROLE_ADMIN_KEY);
		public static const ROLE_USER:RoleEnum = new RoleEnum(ROLE_USER_KEY);
		
		{
			_enumCreated = true;
		}
		
		private static var _enumCreated:Boolean;
		
		private var _name:String;
		
		public function RoleEnum(name:String)
		{
			_name = name;
		}
		
		public function toString():String
		{
			return _name;
		}
	}
}