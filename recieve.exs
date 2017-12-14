{:ok, connection} = AMQP.Connection.open(System.get_env("CLOUDAMQP_URL"))
{:ok, file} = File.open "hello", [:append]
{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "temperaturePub", durable: true)

defmodule Getdata do
  def worker(channel, file, queue) do
    {:ok, payload, meta} = AMQP.Basic.get channel, queue 
    IO.binwrite file, payload <> "\n"
    AMQP.Basic.ack(channel, meta.delivery_tag)
  end
end


for _ <- 1..200, do:
  Getdata.worker(channel, file, "temperaturePub")

File.close file

#getmessage()
#File.close file
