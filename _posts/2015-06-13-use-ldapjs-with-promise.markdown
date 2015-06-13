---
layout: post
title:  "How to use ldapjs with promise"
date:   2015-06-13 11:52:45
comments: True
categories: promise
---

[I found that using promise is hard 0](http://stackoverflow.com/questions/30682597/use-ldapjs-with-promise/30684817)

[I found that using promise is hard 1](http://stackoverflow.com/questions/30802935/use-ldapjs-with-bluebird-promise)

But I finally figure it out, thanks to [http://www.html5rocks.com/en/tutorials/es6/promises/](http://www.html5rocks.com/en/tutorials/es6/promises/)

    // The following code is a working version
    // http://www.html5rocks.com/en/tutorials/es6/promises/

    var ldap = require('ldapjs');
    var config  = require('./config');

    var my_filter = "(&(objectCategory=person)(objectClass=user)" + "(cn=" + 'someone' + "))";
    var ldap_username = config.ad.username;
    var ldap_password = config.ad.password;
		var ldap_url = config.ad.url;
		var ldap_dn_search = config.ad.dn_search;

		process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
		ldap.Attribute.settings.guid_format = ldap.GUID_FORMAT_B;

		var opts = {
			filter: my_filter,
			scope: 'sub',
		};


		//test
		console.log(my_filter);
		console.log(ldap_username);
		console.log(ldap_password);
		console.log(ldap_url);
		console.log(ldap_dn_search);

		var client = ldap.createClient({
			url: ldap_url
		})


		/*
		// Note: this code is working and I convert it by using promise.
		client.bind(ldap_username, ldap_password, function (err) {
			client.search(ldap_dn_search, opts, function (err, search) {
				search.on('searchEntry', function (entry) {
				  var user = entry.object;
				  console.log(user);
				});
			});
			 
		});
		*/

		function promise_client_bind() {
			return new Promise(function(resolve, reject){
				client.bind(ldap_username, ldap_password, function(err){
				  if(!err) {
				    resolve('success_bind');
				  }
				  else {
				    reject('error_bind');
				  }
				});
			});
		}

		function promise_client_search() {
			return new Promise(function(resolve, reject) {
				client.search(ldap_dn_search, opts, function (err, search) {
				  if(search) {
				    resolve(search);
				  }
				  else {
				    reject(err);
				  }
				});
			});
		}

		function promise_ldap_search() {
			return new Promise(function(resolve, reject) {
				client.search(ldap_dn_search, opts, function (err, search) {
				  if(search) {
				    resolve(search);
				  }
				  else {
				    reject(err);
				  }
				});
			});

		}

		// Finally is here!
		promise_client_bind().then(function(response) {
			promise_client_search().then(function(search){

				search.on('searchEntry', function (entry) {
				  var user = entry.object;
				  console.log(user);

				  // Print user then exit, work!!!! 
				  process.exit(0);
				});

			}, function(error){
				console.error('error', error);
			});


		}, function(error) {
			console.error("Failed!", error);

		});
		
