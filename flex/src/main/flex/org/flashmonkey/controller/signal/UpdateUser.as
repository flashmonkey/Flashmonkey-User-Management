package org.flashmonkey.controller.signal
{
	import org.flashmonkey.model.api.IUser;
	import org.osflash.signals.Signal;
	
	public class UpdateUser extends Signal
	{
		public function UpdateUser()
		{
			super(IUser);
		}
	}
}