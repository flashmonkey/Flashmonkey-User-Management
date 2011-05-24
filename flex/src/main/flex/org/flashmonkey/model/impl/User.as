package org.flashmonkey.model.impl
{
	import org.flashmonkey.model.api.IUser;

	[RemoteClass(alias="org.flashmonkey.user.domain.UserEntity")]
	[Bindable]
	public class User implements IUser
	{
		private var _id:int;
		
		public function get id():int
		{
			return _id;	
		}
		public function set id(value:int):void
		{
			_id = value;
		}
		
		private var _firstName:String;
		
		public function get firstName():String
		{
			return _firstName;
		}
		public function set firstName(value:String):void
		{
			_firstName = value;
		}
		
		private var _lastName:String;
		
		public function get lastName():String
		{
			return _lastName;
		}
		public function set lastName(value:String):void
		{
			_lastName = value;
		}
		
		private var _username:String = "";
		
		public function get username():String
		{
			return _username;
		}
		public function set username(value:String):void
		{
			_username = value;
		}
		
		private var _email:String;
		
		public function get email():String
		{
			return _email;
		}
		public function set email(value:String):void
		{
			_email = value;
		}
		
		private var _password:String = "";
		
		public function get password():String
		{
			return _password;
		}
		public function set password(value:String):void 
		{
			_password = value;
		}
		
		private var _confirmPassword:String;
		
		public function get confirmPassword():String
		{
			return _confirmPassword;
		}
		public function set confirmPassword(value:String):void
		{
			_confirmPassword = value;
		}
		
		private var _dob:Date;
		
		public function get dob():Date
		{
			return _dob;
		}
		public function set dob(value:Date):void
		{
			_dob = value;
		}
		
		private var _authorities:Array = [];
		
		public function get authorities():Array
		{
			return _authorities;
		}
		public function set authorities(value:Array):void 
		{
			_authorities = value;
		}
		
		private var _active:Boolean = true;
		
		public function get active():Boolean
		{
			return _active;
		}
		public function set active(value:Boolean):void
		{
			_active = value;
		}
		
		public function User()
		{
		}
		
		public static function from(obj:Object):User 
		{
			if (obj)
			{
				var user:User = new User();
			
				user.username = obj.name;
				user.authorities = obj.authorities;
				
				return user;
			}
			
			return null;
		}
	}
}