package org.flashmonkey.controller.signal
{
	import org.flashmonkey.model.api.IUser;
	import org.osflash.signals.Signal;
	
	public class DeleteUser extends Signal
	{
		public function DeleteUser()
		{
			super(IUser);
		}
	}
}