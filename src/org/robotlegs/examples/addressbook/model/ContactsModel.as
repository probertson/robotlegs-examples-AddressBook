package org.robotlegs.examples.addressbook.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.examples.addressbook.events.ContactEvent;
	import org.robotlegs.examples.addressbook.model.events.ContactsModelEvent;
	import org.robotlegs.examples.addressbook.model.vo.Contact;
	import org.robotlegs.examples.addressbook.service.events.ContactServiceEvent;
	import org.robotlegs.mvcs.Actor;
	
	public class ContactsModel extends Actor
	{
        public function ContactsModel()
        {
            _list = new ArrayCollection();    
        }
        
		private var _list:ArrayCollection;

		public function get list():ArrayCollection
		{
			return _list;
		}

		public function set list(value:ArrayCollection):void
		{
			_list = value;
			dispatch(new ContactsModelEvent(ContactsModelEvent.LIST_LOADED));
		}
		
		private var _selected:Contact;

		public function get selected():Contact
		{
			return _selected;
		}

		public function set selected(value:Contact):void
		{
			_selected = value;
			dispatch(new ContactsModelEvent(ContactsModelEvent.SELECTED));
		}
		
		public function create():Contact
		{
			var contact:Contact = new Contact();
			dispatch(new ContactsModelEvent(ContactsModelEvent.CREATED));
			selected = contact;
			return contact;
		}
		
		public function remove(contact:Contact):void
		{
			var contactIndex:int = list.getItemIndex(contact);
			if(contactIndex > -1) list.removeItemAt(contactIndex);
			if(selected == contact) selected = null;
			dispatch(new ContactsModelEvent(ContactsModelEvent.REMOVED));
		}
	}
}