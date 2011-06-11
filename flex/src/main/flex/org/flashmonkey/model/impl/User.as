package org.flashmonkey.model.impl
{
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.messaging.AbstractConsumer;
	
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.model.api.RoleEnum;

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
		
		private var _createdAt:Date;
		
		public function get createdAt():Date
		{
			return _createdAt;
		}
		public function set createdAt(value:Date):void
		{
			_createdAt = value;
		}
		
		private var _lastLogin:Date;
		
		public function get lastLogin():Date
		{
			return _lastLogin;
		}
		public function set lastLogin(value:Date):void
		{
			_lastLogin;
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
		
		private var _roles:IList = new ArrayCollection();
		
		public function get roles():IList
		{
			return _roles;
		}
		public function set roles(value:IList):void 
		{
			_roles = value;
		}
		
		private var _userType:String;
		
		public function get userType():String
		{
			return _userType;
		}
		public function set userType(value:String):void
		{
			_userType = value;
		}
		
		public function get isAdmin():Boolean
		{
			return hasRole(RoleEnum.ROLE_ADMIN);
		}
		public function set isAdmin(value:Boolean):void
		{
			
		}
		
		public function User()
		{
		}
		
		public function hasRole(role:RoleEnum):Boolean
		{
			for each (var o:Object in roles)
			{
				if (o.name == role.toString())
				{
					return true;
				}
			}
			
			return false;
		}
	}
}