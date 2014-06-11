require 'sinatra'

get '/' do
  "<a href='/write-test'>Test Write in iframe</a><br/>
<a href='https://bkgxzlhytq.localtunnel.me/set-cookie' target='_blank'>Set 3rd party cookie in other window</a><br/>
<a href='/read-test'>Test read in iframe</a><br/>
<a href='https://bkgxzlhytq.localtunnel.me/test-redirect'>Test cookie via redirect</a><br/>
<a href='https://bkgxzlhytq.localtunnel.me/clear-cookie'>clear 3rd party cookie<a>
"
end
get '/write-test' do
"<p>iframe below</p><iframe src='https://bkgxzlhytq.localtunnel.me/testwrite' width=500 height=500></iframe>"
end

get '/read-test' do
  "<p>iframe below</p><iframe src='https://bkgxzlhytq.localtunnel.me/test-read' width=500 height=500></iframe>"
end
