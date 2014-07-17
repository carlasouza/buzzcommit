#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'haml'
#require 'gabba'

set :public_folder, File.dirname(__FILE__) + '/public'
set :root, File.dirname(__FILE__)
set :static, enable
set :dump_errors, false
set :raise_errors, false
set :show_exceptions, false
set :port, 80
set :bind, '162.252.240.6'

configure :production do
  $host = 'http://buzzcommit.com'
end

get '/' do
  require_relative './buzzfeed_commit.rb'
  type = ['type1', 'type2', 'type3'].shuffle.first
  @msg = BuzzfeedCommit.send type
  puts @msg
  haml :home
end

get '/robots.txt' do
 'User-agent: *'
end

get '/ta' do
  'Copyright Carla Souza <contact@carlasouza.com>'
end

not_found { redirect to('/') }
error { redirect to('/') }


__END__

@@ home
!!!
%html
  %head
    %title Buzzfeed style Commits
    %meta{content: "svn, github, buzzfeed, git, commit, message, coding, programming", name: "keywords"}/
    %meta{content: "Commits Buzzfeed Style", name: "description"}/
    %link{href: "http://buzzcommit.com/", rel: "canonical"}/
    :css
      * {margin: 0;} html, body {height: 100%;} .wrapper {min-height: 100%; height: auto !important; height: 100%; margin: 0 auto -8em;} .footer, .push {height: 8em;}
  %body
    .wrapper
      %center{style: "color: #333; padding-top: 200px; font-family: Courier; font-size: 24px; font-weight: bold;"}
        %a{href: "/", rel: "nofollow", style: "text-decoration: none; color: #333;"}= @msg.downcase.capitalize + '.'
      .push
    .footer
      %center{style: "color: #333; font-family: Courier; font-size: 11px;"}

        %script{async: "", src: "//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"}
        / Buzzfeed commit msg
        %ins.adsbygoogle{"data-ad-client" => "ca-pub-8736132667973306", "data-ad-slot" => "9669078882", style: "display:inline-block;width:728px;height:90px"}
        :javascript
          (adsbygoogle = window.adsbygoogle || []).push({});

        %br/
        %a{href: 'http://carlasouza.com'} ♥ by carlasouza.com
    :javascript
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-52950937-1']);
      _gaq.push(['_setDomainName', 'buzzcommit.com']);
      _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);
      (function() {
       var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
       ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    
