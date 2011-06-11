package org.flashmonkey.controller.command
{
	import mx.controls.Alert;
	
	import org.flashmonkey.controller.signal.FindLoggedInUser;
	import org.flashmonkey.model.api.IUserModel;
	import org.flashmonkey.model.api.LoginState;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class GetAuthenticationCommand extends SignalCommand
	{
		[Inject] public var service:IUserService;
		
		[Inject] public var model:IUserModel;
		
		[Inject] public var findLoggedInUser:FindLoggedInUser;
		
		public function GetAuthenticationCommand()
		{
			super();
		}
		
		public override function execute():void
		{
			service.getAuthentication()
				.addCompleteListener(getAuthenticationComplete)
				.addErrorListener(getAuthenticationError)
			.execute();
		}
		
		private function getAuthenticationComplete(o:IOperation):void 
		{
			if (o.result != null)
			{
				model.status.value = LoginState.LOGGING_IN;
				
				findLoggedInUser.dispatch(o.result.name);
			}
			else
			{
				model.status.value = LoginState.LOGGED_OUT;
			}
		}
		
		private function getAuthenticationError(o:IOperation):void 
		{
			Alert.show(o.error, "Problem");
		}
	}
}