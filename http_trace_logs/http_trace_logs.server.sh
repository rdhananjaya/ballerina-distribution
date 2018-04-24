# Trace logs are logged at TRACE level. To enable trace logs, the log level has to be set to TRACE using the runtime argument: <br> '-e b7a.http.tracelog.console=true'. <br>
$ ballerina run http_trace_logs.bal -e b7a.http.tracelog.console=true
ballerina: HTTP trace log enabled
ballerina: initiating service(s) in 'http_trace_logs.bal'
ballerina: started HTTP/WS server connector 0.0.0.0:9090
# In the logs, 'http.downstream' refers to the HTTP traffic that flows between the client and Ballerina, while 'http.upstream' refers to the HTTP traffic that flows between Ballerina and the backend.
[2017-12-19 10:41:38,638] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78] REGISTERED
[2017-12-19 10:41:38,642] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:/127.0.0.1:9090 - remote:/127.0.0.1:34232] ACTIVE
[2017-12-19 10:41:38,667] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:/127.0.0.1:9090 - remote:/127.0.0.1:34232] INBOUND: DefaultHttpRequest(decodeResult: success, version: HTTP/1.1)
GET /hello HTTP/1.1
Host: localhost:9090
User-Agent: curl/7.47.0
Accept: */*
[2017-12-19 10:41:38,678] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:localhost/127.0.0.1:9090 - remote:/127.0.0.1:34232] INBOUND: EmptyLastHttpContent, 0B
[2017-12-19 10:41:38,679] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:localhost/127.0.0.1:9090 - remote:/127.0.0.1:34232] READ COMPLETE
[2017-12-19 10:41:38,997] TRACE {tracelog.http.upstream} - [id: 0x8ddce239] REGISTERED
[2017-12-19 10:41:39,000] TRACE {tracelog.http.upstream} - [id: 0x8ddce239] CONNECT: httpstat.us/23.99.0.12:80, null
# In the log record, 'id' refers to the ID of the channel between Ballerina and the remote host (either a backend service or a client).
# In cases where Ballerina is in the middle (like in this example), the upstream traffic logs include a 'correlatedSource' in addition to the channel ID.
# This refers to the downstream channel ID of a connection to a client whose request resulted in the upstream connection to the backend.
# The correlated source ID is included in the upstream HTTP traffic logs. It can be used to filter out both the downstream and upstream traffic of a connection with a client.
[2017-12-19 10:41:39,492] TRACE {tracelog.http.upstream} - [id: 0x8ddce239, correlatedSource: 0x1aac3b78, host:/10.100.5.32:48730 - remote:httpstat.us/23.99.0.12:80] ACTIVE
[2017-12-19 10:41:39,500] TRACE {tracelog.http.upstream} - [id: 0x8ddce239, correlatedSource: 0x1aac3b78, host:/10.100.5.32:48730 - remote:httpstat.us/23.99.0.12:80] OUTBOUND: DefaultHttpRequest(decodeResult: success, version: HTTP/1.1)
GET /200 HTTP/1.1
Accept: */*
User-Agent: curl/7.47.0
Host: httpstat.us
[2017-12-19 10:41:39,505] TRACE {tracelog.http.upstream} - [id: 0x8ddce239, correlatedSource: 0x1aac3b78, host:/10.100.5.32:48730 - remote:httpstat.us/23.99.0.12:80] OUTBOUND: EmptyLastHttpContent, 0B
[2017-12-19 10:41:39,508] TRACE {tracelog.http.upstream} - [id: 0x8ddce239, correlatedSource: 0x1aac3b78, host:/10.100.5.32:48730 - remote:httpstat.us/23.99.0.12:80] FLUSH
[2017-12-19 10:41:39,820] TRACE {tracelog.http.upstream} - [id: 0x8ddce239, correlatedSource: 0x1aac3b78, host:/10.100.5.32:48730 - remote:httpstat.us/23.99.0.12:80] INBOUND: DefaultHttpResponse(decodeResult: success, version: HTTP/1.1)
HTTP/1.1 200 OK
Cache-Control: private
Content-Length: 6
Content-Type: text/plain; charset=utf-8
Server: Microsoft-IIS/8.0
X-AspNetMvc-Version: 5.1
Access-Control-Allow-Origin: *
X-AspNet-Version: 4.0.30319
X-Powered-By: ASP.NET
Set-Cookie: ARRAffinity=5561bcd4410e7dcb382685ca392a9616bfd9665a940678d6245115e1ec8153a0;Path=/;HttpOnly;Domain=httpstat.us
Date: Tue, 19 Dec 2017 05:11:39 GMT
[2017-12-19 10:41:39,838] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:localhost/127.0.0.1:9090 - remote:/127.0.0.1:34232] OUTBOUND: DefaultHttpResponse(decodeResult: success, version: HTTP/1.1)
HTTP/1.1 200 OK
Cache-Control: private
Access-Control-Allow-Origin: *
X-AspNet-Version: 4.0.30319
Set-Cookie: ARRAffinity=5561bcd4410e7dcb382685ca392a9616bfd9665a940678d6245115e1ec8153a0;Path=/;HttpOnly;Domain=httpstat.us
Content-Length: 6
Date: Tue,19 Dec 2017 05:11:39 GMT
Content-Type: text/plain;charset=utf-8
X-AspNetMvc-Version: 5.1
X-Powered-By: ASP.NET
Server: Microsoft-IIS/8.0
[2017-12-19 10:41:39,848] TRACE {tracelog.http.upstream} - [id: 0x8ddce239, correlatedSource: 0x1aac3b78, host:/10.100.5.32:48730 - remote:httpstat.us/23.99.0.12:80] INBOUND: DefaultLastHttpContent(data: PooledSlicedByteBuf(ridx: 0, widx: 6, cap: 6/6, unwrapped: PooledUnsafeDirectByteBuf(ridx: 408, widx: 408, cap: 1024)), decoderResult: success), 6B
200 OK
[2017-12-19 10:41:39,861] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:localhost/127.0.0.1:9090 - remote:/127.0.0.1:34232] OUTBOUND: DefaultLastHttpContent(data: PooledSlicedByteBuf(ridx: 0, widx: 6, cap: 6/6, unwrapped: PooledUnsafeDirectByteBuf(ridx: 408, widx: 408, cap: 1024)), decoderResult: success), 6B
200 OK
[2017-12-19 10:41:39,865] TRACE {tracelog.http.upstream} - [id: 0x8ddce239, correlatedSource: 0x1aac3b78, host:/10.100.5.32:48730 - remote:httpstat.us/23.99.0.12:80] READ COMPLETE
[2017-12-19 10:41:39,868] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:localhost/127.0.0.1:9090 - remote:/127.0.0.1:34232] FLUSH
[2017-12-19 10:41:39,893] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:localhost/127.0.0.1:9090 - remote:/127.0.0.1:34232] READ COMPLETE
[2017-12-19 10:41:39,899] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:localhost/127.0.0.1:9090 - remote:/127.0.0.1:34232] INACTIVE
[2017-12-19 10:41:39,901] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:localhost/127.0.0.1:9090 - remote:/127.0.0.1:34232] CLOSE
[2017-12-19 10:41:39,907] TRACE {tracelog.http.downstream} - [id: 0x1aac3b78, correlatedSource: n/a, host:localhost/127.0.0.1:9090 - remote:/127.0.0.1:34232] UNREGISTERED
