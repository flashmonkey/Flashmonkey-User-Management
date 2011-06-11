package org.flashmonkey.controller.command
{
	import flash.display.Sprite;
	
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	import org.flashmonkey.controller.signal.FindUsers;
	import org.flashmonkey.model.api.IUser;
	import org.flashmonkey.model.api.IUserModel;
	import org.flashmonkey.operations.service.IOperation;
	import org.flashmonkey.service.IUserService;
	
	public class DeleteUserCommand extends ServiceCommand
	{
		[Inject] public var service:IUserService;
		
		[Inject] public var user:IUser;
		
		[Inject] public var model:IUserModel;
		
		[Inject] public var findUsers:FindUsers;
		
		protected override function get call():IOperation
		{
			return service.destroy(user);
		}
		
		public function DeleteUserCommand()
		{
			super();
		}
		
		public override function execute():void
		{
			Alert.show("Are you sure you want to delete '" + user.username + "'?", "Are you sure?", Alert.YES | Alert.NO, contextView as Sprite, onClose);
		}
		
		private function onClose(e:CloseEvent):void 
		{
			switch (e.detail)
			{
				case Alert.YES:
					super.execute();
					break;
				
				default:
					break;
			}
		}
		
		protected override function onServiceCallComplete(o:IOperation):void
		{
			findUsers.dispatch();
			
			model.selectedUser.value = null;
		}
	}
}