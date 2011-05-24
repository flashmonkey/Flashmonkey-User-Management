package org.flashmonkey.controller.command
{
	import mx.controls.Alert;
	
	import org.flashmonkey.controller.signal.FindLoggedInUser;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class GetAuthenticationCommand extends SignalCommand
	{
		[Inject] public var service:IUserService;
		
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
				trace("There's a logged in user '" + o.result.name + "' - finding their details");
				
				findLoggedInUser.dispatch(o.result.name);
			}
		}
		
		private function getAuthenticationError(o:IOperation):void 
		{
			Alert.show(o.error, "Problem");
		}
	}
}