package org.flashmonkey.controller.command
{
	import mx.controls.Alert;
	
	import org.flashmonkey.controller.signal.ChangeLocation;
	import org.flashmonkey.controller.signal.FindLoggedInUser;
	import org.flashmonkey.model.Location;
	import org.flashmonkey.model.api.IDestinationHelper;
	import org.flashmonkey.model.api.ILoginErrorHandler;
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.model.api.IUserModel;
	import org.flashmonkey.model.api.LoginState;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class LoginCommand extends SignalCommand
	{
		[Inject] public var service:IUserService;
		
		[Inject] public var helper:IDestinationHelper;
		
		[Inject] public var findLoggedInUser:FindLoggedInUser;
		
		[Inject] public var user:IUser;
		
		[Inject] public var model:IUserModel;
		
		[Inject] public var errorHandler:ILoginErrorHandler;
		
		public function LoginCommand()
		{
			super();
		}
		
		public override function execute():void
		{	
			model.status.value = LoginState.LOGGING_IN;
			
			service.login(user)
				.addCompleteListener(onLoginComplete)
				.addErrorListener(onLoginError)
			.execute();
		}
		
		private function onLoginComplete(o:IOperation):void
		{
			findLoggedInUser.dispatch(o.result.name);
		}
		
		private function onLoginError(o:IOperation):void 
		{
			model.status.value = LoginState.LOGGED_OUT;
			
			errorHandler.handleError(user, o.error);
		}
	}
}