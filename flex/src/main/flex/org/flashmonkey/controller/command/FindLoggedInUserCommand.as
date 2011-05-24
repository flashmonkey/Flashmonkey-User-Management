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
	
	public class FindLoggedInUserCommand extends SignalCommand
	{
		[Inject] public var username:String;
		
		[Inject] public var service:IUserService;
		
		[Inject] public var model:IUserModel;
		
		[Inject] public var changeLocation:ChangeLocation;
		
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
			model.user.value = o.result as IUser;
			trace("found user -- switching to dashboard");
			changeLocation.dispatch(Location.DASHBOARD);
		}
		
		private function onFindUserError(o:IOperation):void 
		{
			Alert.show("Problem", o.error);
		}
	}
}