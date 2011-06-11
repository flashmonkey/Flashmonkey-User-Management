package org.flashmonkey.controller.command
{
	import mx.controls.Alert;
	
	import org.flashmonkey.controller.signal.ChangeLocation;
	import org.flashmonkey.model.Location;
	import org.flashmonkey.model.api.IUserModel;
	import org.flashmonkey.model.api.LoginState;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class LogoutCommand extends SignalCommand
	{
		[Inject] public var service:IUserService;
		
		[Inject] public var model:IUserModel;
		
		[Inject] public var changeLocation:ChangeLocation;
		
		public function LogoutCommand()
		{
			super();
		}
		
		public override function execute():void
		{
			model.status.value = LoginState.LOGGING_OUT;
			
			service.logout()
				.addCompleteListener(onLogoutComplete)
				.addErrorListener(onLogoutError)
			.execute();
		}
		
		private function onLogoutComplete(o:IOperation):void 
		{
			model.user.value = null;
			
			model.status.value = LoginState.LOGGED_OUT;
			
			changeLocation.dispatch(Location.LOGIN);
		}
		
		private function onLogoutError(o:IOperation):void 
		{
			Alert.show(o.error, "Problem");
		}
	}
}