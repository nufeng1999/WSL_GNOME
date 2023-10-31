from gi.repository import GLib
import dbus_next
from dbus_next.aio import MessageBus


bus = MessageBus().connect()

def handler(message):
    print("Received Logout signal")
    # 处理逻辑

bus.add_message_handler(handler, 
                        interface_name="org.gnome.SessionManager",
                        member_name="Logout")

#loop = asyncio.get_event_loop()
#loop.run_forever()

#bus = MessageBus()

#bus.add_signal_receiver(
#    logout_handler,
#    signal_name="Logout",
#    dbus_interface="org.gnome.SessionManager",
#    bus_name="org.gnome.SessionManager"
#)
#def logout_handler(user_data=None):
#    print("Received logout signal.") 

loop = GLib.MainLoop()
loop.run()

