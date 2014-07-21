#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'haml'

set :public_folder, File.dirname(__FILE__) + '/public'
set :root, File.dirname(__FILE__)
set :static, enable
set :dump_errors, true
set :raise_errors, false
set :show_exceptions, false
set :port, 80
set :bind, '162.252.240.6'

configure :production do
  $host = 'http://buzzcommit.com'
end

get '/' do
  require_relative './buzzfeed_commit.rb'
  type = ['type1', 'type2', 'type3', 'type4',
          'type5', 'type6', 'type7', 'type8',
          'type9', 'type10', 'type11', 'type12',].shuffle.first
  @msg = BuzzfeedCommit.send type
  puts @msg
  haml :home
end

get '/robots.txt' do
 'User-agent: *'
end

get '/ta' do
  CGI.escapeHTML 'Copyright Carla Souza <contact@carlasouza.com>'
end

not_found { redirect to('/') }
error { redirect to('http://developerexcuses.com') }


__END__

@@ home
!!!
%html
  %head
    %title BuzzCommit - BuzzFeed-style commit messages generator
    %meta{content: "svn, github, buzzfeed, git, commit, message, coding, programming", name: "keywords"}/
    %meta{content: "BuzzCommit - BuzzFeed-style commit messages generator", name: "description"}/
    %link{href: "http://buzzcommit.com/", rel: "canonical"}/
    %link{href: "http://fonts.googleapis.com/css?family=Montserrat:700", rel: "stylesheet", type: "text/css"}/
    %link(rel="stylesheet" type="text/css" href="style.css")
  %body
    .wrapper
      %center
        %h1
          What if programmers used
          %span.red.buzzfeed BuzzFeed
          style commit messages?
        %p
          git commit -m "
          %a.buzzfeed.message{href: "/", rel: "nofollow"}= @msg.downcase.capitalize + '.'
          "
      .push
      %center
        %iframe{allowtransparency: "true", frameborder: "0", scrolling: "no", src: "//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fbuzzcommit.com&width&layout=button&action=like&show_faces=false&share=false&height=20&appId=106768876164959", style: "border:none; overflow:hidden; height:20px; width: 70px;"}
        %a.twitter-hashtag-button{ "data-url" => "http://buzzcommit.com", href: "https://twitter.com/intent/tweet?button_hashtag=BuzzfeedCommit&text=#{CGI.escapeHTML('\''+@msg.downcase.capitalize+'.\'')}"} Tweet this commit
        :javascript
          !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
    .footer
      %center

        %script{async: "", src: "//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"}
        / Buzzfeed commit msg
        %ins.adsbygoogle{"data-ad-client" => "ca-pub-8736132667973306", "data-ad-slot" => "9669078882", style: "display:inline-block;width:728px;height:90px"}
        :javascript
          (adsbygoogle = window.adsbygoogle || []).push({});

        %br/
        %a.red{title: 'Made by', href: 'http://carlasouza.com'}♥
        %a{title: 'Inspiration', href: 'https://storify.com/anirvan/buzzfeed-style-commit-messages'}♦
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

