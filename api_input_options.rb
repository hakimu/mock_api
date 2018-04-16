require_relative 'mock_client'
require 'optparse'

options = {}

parser = OptionParser.new do |opts|

  opts.banner = "Usage: api client [options]"

  # opts.on('-a', '--account=ACCOUNT', Array, 'Account(s) to be pulled from the API') do |account|
  #   options[:account] = account
  # end

  opts.on('-o', '--organization=organization','Organization number to be pulled from the API') do |organization|
    options[:organization] = organization
  end





  # opts.on('-f', '--file=FILE', 'File to be parsed') do |file|
  #   options[:file] = file
  # end

  # opts.on('-n', '--name=name', Array, 'List of metric names') do |name|
  #   options[:name] = name
  # end

  opts.on('-h', '--help', 'Display') do
    puts opts
    exit
  end

end.parse!

raise OptionParser::MissingArgument.new("Searching by organization (-o, --organization=organization) is mandatory") if options[:organization].nil?

metrics = MockClient.new("http://localhost:9292").accounts_by_org_id(options[:organization])




# puts metrics

# audit_log_parser = AuditLogParser.new(options)

# $stdout.puts audit_log_parser.run