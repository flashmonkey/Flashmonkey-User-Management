package org.flashmonkey.controller.command
{
	import mx.controls.Alert;
	
	import org.flashmonkey.controller.signal.ChangeLocation;
	import org.flashmonkey.model.Location;
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.model.api.IUserModel;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class LoginCommand extends SignalCommand
	{
		[Inject] public var service:IUserService;
		
		[Inject] public var user:IUser;
		
		[Inject] public var model:IUserModel;
		
		[Inject] public var changeLocation:ChangeLocation;
		
		public function LoginCommand()
		{
			super();
		}
		
		public override function execute():void
		{	
			service.login(user)
				.addCompleteListener(onLoginComplete)
				.addErrorListener(onLoginError)
			.execute();
		}
		
		private function onLoginComplete(o:IOperation):void
		{
			model.user.value = user;
			
			changeLocation.dispatch(Location.DASHBOARD);
		}
		
		private function onLoginError(o:IOperation):void 
		{
			Alert.show(o.error, "Problem");
		}
	}
}