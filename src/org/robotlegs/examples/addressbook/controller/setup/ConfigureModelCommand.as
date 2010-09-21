package org.robotlegs.examples.addressbook.controller.setup
{
    import org.robotlegs.examples.addressbook.model.ContactsModel;
    import org.robotlegs.mvcs.Command;
    
    public class ConfigureModelCommand extends Command
    {
        override public function execute():void
        {
            injector.mapSingleton(ContactsModel); 
        }
    }
}