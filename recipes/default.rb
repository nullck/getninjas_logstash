#
# Cookbook Name:: getninjas_logstash
# Recipe:: default
#
# Copyright 2015, GetNinjas Teste
#
# All rights reserved - Do Not Redistribute
#

include_recipe "getninjas_logstash::install"
include_recipe "getninjas_logstash::config-d"
include_recipe "getninjas_logstash::restart"
include_recipe "getninjas_logstash::curator"
include_recipe "redis::server"
