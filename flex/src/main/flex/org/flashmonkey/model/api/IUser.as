package org.flashmonkey.model.api
{
	[Bindable] public interface IUser
	{
		function get id():int;
		function set id(value:int):void;
		
		function get firstName():String;
		function set firstName(value:String):void;
		
		function get lastName():String;
		function set lastName(value:String):void;
		
		function get username():String;
		function set username(value:String):void;
		
		function get email():String;
		function set email(value:String):void;
		
		function get password():String;
		function set password(value:String):void;
		
		function get confirmPassword():String;
		function set confirmPassword(value:String):void;
		
		function get dob():Date;
		function set dob(value:Date):void;
		
		function get authorities():Array;
		function set authorities(value:Array):void;
		
		function get active():Boolean;
		function set active(value:Boolean):void;
	}
}