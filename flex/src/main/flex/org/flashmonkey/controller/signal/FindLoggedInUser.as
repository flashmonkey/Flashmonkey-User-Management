package org.flashmonkey.controller.signal
{
	import org.osflash.signals.Signal;
	
	public class FindLoggedInUser extends Signal
	{
		public function FindLoggedInUser()
		{
			super(String);
		}
	}
}