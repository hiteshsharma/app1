require 'sinatra'

get '/' do
  "<a href='/write-test'>Test Write in iframe</a><br/>
<a href='http://ec2-23-20-231-145.compute-1.amazonaws.com:3000//set-cookie' target='_blank'>Set 3rd party cookie in other window</a><br/>
<a href='/read-test'>Test read in iframe</a><br/>
<a href='http://ec2-23-20-231-145.compute-1.amazonaws.com:3000//test-redirect'>Test cookie via redirect</a><br/>
<a href='http://ec2-23-20-231-145.compute-1.amazonaws.com:3000//clear-cookie'>clear 3rd party cookie<a>
"
end
get '/write-test' do
"<p>iframe below</p><iframe src='http://ec2-23-20-231-145.compute-1.amazonaws.com:3000//testwrite' width=500 height=500></iframe>"
end

get '/read-test' do
  "<p>iframe below</p><iframe src='http://ec2-23-20-231-145.compute-1.amazonaws.com:3000//test-read' width=500 height=500></iframe>"
end
