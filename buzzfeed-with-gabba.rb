#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'haml'
require 'gabba'

set :public_folder, File.dirname(__FILE__) + '/public'
set :root, File.dirname(__FILE__)
set :static, enable
set :dump_errors, false
set :raise_errors, false
set :show_exceptions, false
set :port, 80
set :bind, '162.252.240.6'

configure :production do
  $host = 'http://git.icanhazmsg.com'
  $ga = Gabba::Gabba.new("UA-52951298-1",$host)
end

get '/' do
  require_relative './buzzfeed_commit.rb'
  type = ['type1', 'type2', 'type3'].shuffle.first
  @msg = BuzzfeedCommit.send type
  gabba.identify_user(cookies[:__utma], cookies[:__utmz])
  puts $ga.page_view("Home", "/")
  haml :home
end

not_found { haml :home }
error { haml :home }


__END__

@@ home
!!!
%html
  %head
    %title Buzzfeed style Commits
    %meta{content: "git, commit, message, coding, programming", name: "keywords"}/
    %meta{content: "Buzzfeed style commits", name: "description"}/
    %link{href: "http://youwontbeliveinthiscommit.com/", rel: "canonical"}/
    :css
      * {margin: 0;} html, body {height: 100%;} .wrapper {min-height: 100%; height: auto !important; height: 100%; margin: 0 auto -8em;} .footer, .push {height: 8em;}
  %body
    .wrapper
      %center{style: "color: #333; padding-top: 200px; font-family: Courier; font-size: 24px; font-weight: bold;"}
        %a{href: "/", rel: "nofollow", style: "text-decoration: none; color: #333;"}= @msg.downcase.capitalize
      .push
    .footer
      %center{style: "color: #333; font-family: Courier; font-size: 11px;"}
        :javascript
          <!--
              google_ad_client = "ca-pub-4336860580083128";
              google_ad_slot = "1671975908";
              google_ad_width = 728;
              google_ad_height = 90;
              //-->
        %script{src: "http://pagead2.googlesyndication.com/pagead/show_ads.js", type: "text/javascript"}
        %br/
        = succeed "\u{a9}" do
          %br/

