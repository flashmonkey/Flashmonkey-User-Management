package org.flashmonkey.controller.command
{
	import mx.controls.Alert;
	
	import org.flashmonkey.model.api.IDestinationHelper;
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.model.api.IUserModel;
	import org.flashmonkey.model.api.LoginState;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class FindLoggedInUserCommand extends SignalCommand
	{
		[Inject] public var username:String;
		
		[Inject] public var service:IUserService;
		
		[Inject] public var helper:IDestinationHelper;
		
		[Inject] public var model:IUserModel;
		
		public function FindLoggedInUserCommand()
		{
			super();
		}
		
		public override function execute():void
		{
			service.findUserByName(username)
				.addCompleteListener(onFindUserComplete)
				.addErrorListener(onFindUserError)
			.execute();
		}
		
		private function onFindUserComplete(o:IOperation):void 
		{
			var user:IUser = o.result as IUser;
			model.user.value = user;
			
			model.status.value = LoginState.LOGGED_IN;
			
			helper.onLogin(user);
		}
		
		private function onFindUserError(o:IOperation):void 
		{
			Alert.show(o.error, "Problem");
		}
	}
}