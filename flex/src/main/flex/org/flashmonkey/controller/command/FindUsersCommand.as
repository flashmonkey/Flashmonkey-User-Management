package org.flashmonkey.controller.command
{
	import org.flashmonkey.model.api.IUserModel;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class FindUsersCommand extends ServiceCommand
	{
		[Inject] public var service:IUserService;
		
		[Inject] public var model:IUserModel;
		
		protected override function get call():IOperation
		{
			return service.findAll();
		}
		
		public function FindUsersCommand()
		{
			super();
		}
		
		protected override function onServiceCallComplete(o:IOperation):void
		{
			model.users.value = o.result;
		}
	}
}