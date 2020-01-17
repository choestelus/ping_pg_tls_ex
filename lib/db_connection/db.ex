defmodule PingPgTls.DBConnection do
  def test_connect do
    opts = [
      hostname: "localhost",
      port: 5432,
      username: "postgres",
      password: "postgres",
      database: "postgres",
      ssl: true,
      ssl_opts: [
        cacertfile: "cert/pg_ca.crt",
        keyfile: "cert/pg_client.key",
        certfile: "cert/pg_client.crt",
        verify: :verify_peer,
        version: [:"tlsv1.2", :"tlsv1.3"],
        server_name_indication: :disable,
        fallback: false
      ]
    ]
    {:ok, pid} = Postgrex.start_link(opts)
    IO.inspect(pid)
    Postgrex.query!(pid, ~s(SELECT 1+1), []) |> IO.inspect()
  end
end
