{:ok, connection} = AMQP.Connection.open(System.get_env("CLOUDAMQP_URL"))
{:ok, channel} = AMQP.Channel.open(connection)
temphumidity = System.cmd("sudo", ["/home/pi/Adafruit_Python_DHT/examples/AdafruitDHT.py", "22", "4"]) 
AMQP.Queue.declare(channel, "temperaturePub")
AMQP.Basic.publish(channel, "", "temperaturePub", to_string(temphumidity))
IO.puts " [x] Sent "<> to_string(temphumidity)
AMQP.Connection.close(connection)
