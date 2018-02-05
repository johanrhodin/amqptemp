# Amqptemp

This project needs the `AMQP` elixir library and an environment variable: `CLOUDAMQP_URL` 

To run: `mix run main.exs`
or `export CLOUDAMQP_URL=amqps://...`
`mix run recieve.exs/` to test.

You can also set it up as a cronjob with `crontab -e`
Should rewrite as a loop instead
