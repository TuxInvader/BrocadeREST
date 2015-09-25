#!/usr/bin/ruby

require 'json'
require 'net/https'
require 'uri'
require 'openssl'
require 'digest'

require_relative 'restcontroller'
require_relative 'puppetmanifest'

module BrocadeREST

	class SDController < RestController

		def initialize(host, port, restVersion, user, pass, loggerLevel=0)
			super(user, pass, "https://#{host}:#{port}/api/tmcm/#{restVersion}/", PuppetManifest, nil, true )
			@restVersion = Float(restVersion)
			@workdir =  File.expand_path( "#{File.dirname(__FILE__)}/.." )
			@loggerLevel = Integer(loggerLevel)
			@probeName = "PUPPETPROBE"
		end

	end

end

