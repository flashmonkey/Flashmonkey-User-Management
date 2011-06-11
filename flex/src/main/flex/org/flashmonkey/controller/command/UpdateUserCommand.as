package org.flashmonkey.controller.command
{
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;

	public class UpdateUserCommand extends ServiceCommand
	{
		[Inject] public var user:IUser;
		
		[Inject] public var service:IUserService;
		
		protected override function get call():IOperation
		{
			return service.update(user);
		}
		
		public function UpdateUserCommand()
		{
			super();
		}
	}
}