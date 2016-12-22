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
- [x] make the clone commands run in parallel
- [x] display output from clone commands and maintain order
- [x] create CLI interface to handle first-time cloning
- [ ] refactor repos to read from .rosirc
- [ ] refactor clone to read from .rosirc
- [ ] create CLI interface to handle executing commands across all repos (dlrosi exec)
- [ ] add CLI params for restricting commands to subsets of the repos
- [x] refactor directory locations to be in config
- [ ] create CLI interface to handle tagging across repos for production release

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
