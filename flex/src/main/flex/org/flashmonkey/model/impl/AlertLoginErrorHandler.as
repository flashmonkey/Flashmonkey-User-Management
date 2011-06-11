package org.flashmonkey.model.impl
{
	import mx.controls.Alert;
	import mx.rpc.Fault;
	
	import org.as3commons.lang.ClassUtils;
	import org.flashmonkey.model.api.ILoginErrorHandler;
	import org.flashmonkey.model.api.IUser;

	public class AlertLoginErrorHandler implements ILoginErrorHandler
	{
		private static const DUPLICATE_USERNAME_ERROR_STRING:String = "There was an unhandled failure on the server. query did not return a unique result: 5";
		
		private static const NULL_POINTER_ERROR_STRING:String = "There was an unhandled failure on the server. java.lang.NullPointerException";
		
		public function AlertLoginErrorHandler()
		{
		}
		
		public function handleError(user:IUser, error:*):void
		{
			if (error is Fault)
			{
				var fault:Fault = Fault(error);
				
				switch (fault.faultString)
				{
					case DUPLICATE_USERNAME_ERROR_STRING:
						Alert.show("Seems your username isn't unique.", "Problem logging in '" + user.username + "'");
						break;
					
					case NULL_POINTER_ERROR_STRING:
						Alert.show("username and/or password not recognised, please try again", "Problem Logging in '" + user.username + "'");
						break;
					
					default:
						break;
				}
			}
		}
	}
}