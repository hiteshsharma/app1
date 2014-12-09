require 'sinatra'
set :ssl, true
configure do
  mime_type :javascript, 'text/javascript'
end
#use Rack::SSL
app2Url = "https://app2:4002";#http://ec2-23-20-231-145.compute-1.amazonaws.com:3000";
get '/' do
  "<a href='/write-test'>Test Write in iframe</a><br/>
<a href='" + app2Url + "/set-cookie' target='_blank'>Set 3rd party cookie in other window</a><br/>
<a href='/read-test'>Test read in iframe</a><br/>
<a href='/test-redirect'>Test cookie via redirect</a><br/>
<a href='" + app2Url + "/clear-cookie'>clear 3rd party cookie<a><br/>
<a href='/test-js'>set cookie via third party js on page</a>
"
end
get '/write-test' do
"<p>iframe below</p><iframe src='" + app2Url + "/testwrite' width=500 height=500></iframe>"
end

get '/read-test' do
  "hello world"
end

get '/test-redirect' do
  redirect to(app2Url + "/test-redirect")
end

get '/another-route' do
  "redirect succesful"
end
get '/test-js' do
  "<html><head>
<script type='text/javascript'>
function afterLoad(){
var thirdPartyUrl = '" + app2Url + "/test-read';
window.setTimeout(function(){
 var ifrm = document.getElementById('ifrm');
 ifrm.src = thirdPartyUrl;
}, 10000);
}
</script>
<script type='text/javascript' src='" + app2Url + "/javascript'></script>
</head>
<body onload='afterLoad()'>
script loaded<br/>
<p>loading iframe in 10 seconds</p>
<iframe id='ifrm' src='' width=500 height=500></iframe>
"
end
