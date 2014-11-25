<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Facebook Login JavaScript Example</title>

<script src="<c:url value='/js/jquery-2.1.1.min.js'/>"></script>
<script type="text/javascript">

function getFrase() {
		$.getJSON("frase", function(data) {
			alert(data.frase)
			$("#frase").append("<h1>" + data.frase + "</h1>");
			FB.login(function(){
				 FB.api('/me/feed', 'post', {message: data.frase});
				}, {scope: 'publish_actions'});


		});
		/* 		$.get('frase', function(data) {	
		 alert(data.frase);
		 });
		 */
	}
</script>
</head>

<body>
	<script>
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			// The response object is returned with a status field that lets the
			// app know the current login status of the person.
			// Full docs on the response object can be found in the documentation
			// for FB.getLoginStatus().
			if (response.status === 'connected') {
				// Logged into your app and Facebook.
				testAPI();
			} else if (response.status === 'not_authorized') {
				// The person is logged into Facebook, but not your app.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			} else {
				// The person is not logged into Facebook, so we're not sure if
				// they are logged into this app or not.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into Facebook.';
			}
		}

		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample
		// code below.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : 339693829546150,
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.1' // use version 2.1
			});

			// Now that we've initialized the JavaScript SDK, we call 
			// FB.getLoginStatus().  This function gets the state of the
			// person visiting this page and can return one of three states to
			// the callback you provide.  They can be:
			//
			// 1. Logged into your app ('connected')
			// 2. Logged into Facebook, but not your app ('not_authorized')
			// 3. Not logged into Facebook and can't tell if they are logged into
			//    your app or not.
			//
			// These three cases are handled in the callback function.

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});

		};

		// Load the SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		// Here we run a very simple test of the Graph API after login is
		// successful.  See statusChangeCallback() for when this call is made.
		function testAPI() {
			console.log('Welcome!  Fetching your information.... ');
			FB
					.api(
							'/me',
							function(response) {
								console.log('Successful login for: '
										+ response.name);
								document.getElementById('status').innerHTML = 'Thanks for logging in, '
										+ response.name + '!';
							});
		}
	</script>

	<script>
		function getFriends() {
			FB
					.api(
							"/me/taggable_friends",
							function(response) {
								$(document.body)
										.prepend(
												'<div class="test-list" style="position: fixed; z-index: 99999999; left: 10%; overflow: scroll; height: 500px; top: 25%;"></div>')

								for (var i = 0; i < response.data.length; i++) {
									friends[i] = response.data[i]
									/* 	$('.test-list').prepend(
												'<li>' + response.data[i].name
														+ '</li>'); */
								}
							});

			FB.api("/me/posts", function(response) {
				console.log(response);
				$('.test-list').prepend('<li>' + response + '</li>');

			});
		}
	</script>

	<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<fb:login-button scope="public_profile,email,user_friends,read_stream" onlogin="checkLoginState();">
	</fb:login-button>

	<div id="status"></div>
	<div id="frase"></div>
	
	
	<button onClick="getFrase()">Frase</button>
</body>
</html>