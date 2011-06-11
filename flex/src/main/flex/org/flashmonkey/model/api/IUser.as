package org.flashmonkey.model.api
{
	import mx.collections.IList;

	[Bindable] public interface IUser
	{
		function get id():int;
		function set id(value:int):void;
		
		function get createdAt():Date;
		function set createdAt(value:Date):void;
		
		function get lastLogin():Date;
		function set lastLogin(value:Date):void;
		
		function get username():String;
		function set username(value:String):void;
		
		function get email():String;
		function set email(value:String):void;
		
		function get password():String;
		function set password(value:String):void;
		
		function get roles():IList;
		function set roles(value:IList):void;
		
		function get userType():String;
		function set userType(value:String):void;
		
		function get isAdmin():Boolean;
		function set isAdmin(value:Boolean):void;
		
		function hasRole(role:RoleEnum):Boolean;
	}
}