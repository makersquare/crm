// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require underscore
//= require jquery
//= require jquery_ujs
//= require foundation
//= require angular
//= require angular-resource
//= require_tree ./datatables
//= require modernizr
//= require ng-rails-csrf
//= require angular-animate
//= require angular-route
//= require_tree ./angular-foundation
//= require_tree ./balancedjs
//= require_tree ./angular
//= require angular-mocks

$(function(){ $(document).foundation(); });
