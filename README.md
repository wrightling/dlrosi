# Dlrosi

## Design
Command Flow
- create_directories # high level directories for repos to slot into
- repos # list of all ROSI repos + frontends
- |> clone_repos

## TODO
- [x] lay out design as a simple command flow
- [x] implement create_directories
- [x] implement repos (hard-code for now)
- [x] implement clone
- [ ] make the clone commands run in parallel
- [ ] implement update # git stash + pull on all repos
- [ ] refactor repos to read from .rosirc
- [ ] refactor directory locations to be in config

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `dlrosi` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:dlrosi, "~> 0.1.0"}]
    end
    ```

  2. Ensure `dlrosi` is started before your application:

    ```elixir
    def application do
      [applications: [:dlrosi]]
    end
    ```

