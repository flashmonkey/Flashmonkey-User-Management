package org.flashmonkey.controller.command
{
	import mx.controls.Alert;
	
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class RegisterCommand extends SignalCommand
	{
		[Inject] public var user:IUser;
		
		[Inject] public var service:IUserService;
		
		public function RegisterCommand()
		{
			super();
		}
		
		public override function execute():void
		{
			service.register(user)
				.addCompleteListener(onRegisterComplete)
				.addErrorListener(onRegisterError)
				.execute();
		}
		
		private function onRegisterComplete(o:IOperation):void
		{
			trace("login complete");	
		}
		
		private function onRegisterError(o:IOperation):void 
		{
			Alert.show(o.error, "Problem");
		}
	}
}