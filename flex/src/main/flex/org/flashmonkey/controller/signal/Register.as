package org.flashmonkey.controller.signal
{
	import org.flashmonkey.model.api.IUser;
	
	import org.osflash.signals.Signal;
	
	public class Register extends Signal
	{
		public function Register()
		{
			super(IUser);
		}
	}
}