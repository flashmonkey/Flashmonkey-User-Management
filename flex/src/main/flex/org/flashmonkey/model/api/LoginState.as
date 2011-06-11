package org.flashmonkey.model.api
{
	public class LoginState
	{
		public static const AUTHORISING:LoginState = new LoginState("authorising");
		public static const LOGGING_IN:LoginState = new LoginState("loggingIn");
		public static const LOGGED_IN:LoginState = new LoginState("loggedIn");
		public static const LOGGING_OUT:LoginState = new LoginState("loggingOut");
		public static const LOGGED_OUT:LoginState = new LoginState("loggedOut");
		
		{
			_enumCreated = true;
		}
		
		private static var _enumCreated:Boolean;
		
		private var _name:String;
		
		public function LoginState(name:String)
		{
			_name = name;
		}
	}
}