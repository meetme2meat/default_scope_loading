
unless File.exists?('Gemfile')
  File.write('Gemfile', <<-GEMFILE)
    source 'https://rubygems.org'
    ruby '2.3.3', :engine => 'jruby', :engine_version => '9.1.15.0'
    gem 'activerecord','5.0.6'
    gem 'activerecord-jdbcsqlite3-adapter','50.0'
  GEMFILE

  system 'bundle'
end

require 'bundler'
Bundler.setup(:default)
require 'active_record'
config = {pool: 20, adapter: 'sqlite3', database: 'break.sqlite3'}
ActiveRecord::Base.establish_connection(config)

class ResporgAccountId < ActiveRecord::Base
  has_many :ip_addresses
  default_scope { where(active: true) }

  def self.all_addresses
    all.each do |resporg|
      resporg.only_addrs
    end
  end

  def only_addrs
    ip_addresses.pluck(:address)
  end
end

class IpAddress < ActiveRecord::Base
  belongs_to :resporg_account_id
end
Thread.abort_on_exception = true


loop do
  20.times do
    Thread.new do
      ActiveRecord::Base.connection_pool.with_connection do
        begin
          ResporgAccountId.all_addresses
        rescue => exception
           puts exception.message
           puts exception.backtrace
        end
      end
    end
  end
  puts "... Done"
  sleep 10
end
