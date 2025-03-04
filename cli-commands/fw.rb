# frozen_string_literal: true

UbiCli.base("fw") do
  options("ubi fw subcommand [...]")
  post_options("ubi fw (location/fw-name|fw-id) subcommand [...]")
end

Unreloader.record_dependency(__FILE__, "cli-commands/fw")
