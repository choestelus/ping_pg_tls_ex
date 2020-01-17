defmodule PingPgTls.Application do
  use Application
  import PingPgTls.DBConnection

  def start(_type, _args) do
    {:ok, pid} = Task.Supervisor.start_link()
    main(pid)
    {:ok, pid}
  end

  defp main(_args) do
    PingPgTls.DBConnection.test_connect()
  end
end
