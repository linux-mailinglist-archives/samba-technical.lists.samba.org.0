Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEEC5FF399
	for <lists+samba-technical@lfdr.de>; Fri, 14 Oct 2022 20:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Or+jOylAUqYM/wOIp80CrZBQG9bxMilFbOgb51GsS8o=; b=FZ/9+iW8hEtwJE1SR6p3VoO58k
	fEc0p/TM/FHWX3h8tQ26lKufiGRmdTXayP148B5Svl88NoJWAyjBka1x23L9CrDjEWfLPX4r1d5Bx
	6B+KSY/r0ykPI/yARRQUqUo3zS9eZDgxgBk1ZnFNfDye1NAHU2IIUbq03Hh0LpymDn1kpX07lB8mJ
	Uc5lUZo745f9byFqmqzZoGObfWuFT8JWRB8uDPsGNtgxqZnJudFy3osjcSl9i4ffkhSRCimCzbeY7
	cM8DmRU25kYJS0xzoOXwiQTHZKDYmshc9ysdb4hnYlNK0o+qstxtu5OtT3Auia/lSoLZfdvO6Xf/d
	vGFwg5aA==;
Received: from ip6-localhost ([::1]:60106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ojPQI-002ULH-BR; Fri, 14 Oct 2022 18:28:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32060) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ojPQD-002UL8-A7
 for samba-technical@lists.samba.org; Fri, 14 Oct 2022 18:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=Or+jOylAUqYM/wOIp80CrZBQG9bxMilFbOgb51GsS8o=; b=wFDnftU6gVLzuXZiaiLE+RdL3B
 7XHy72LUR3eaMOMHN29pBBj6v9DmTj31C1lw6V1hRvzf7m7VwtySkX0+hRwEoQm2P9TBU/frsTiW4
 uwdiKz5+gKIzU6tEnS9WB3W+t13NNAcOjbqAOiLG0jvd/2LI7abGc6Cn3OxkDM2ptOOTYsmPhMHj5
 vq/hllnu34fjAAEhopT3r0c20lu86FJYNa1sQjxiPFSJnvWEumUz3lMSWSAE9VA6nIA/JnxqYkkf4
 B7mpjlUYX0jInMesYLq51Ah9W7RMGbRi1QEvX0ngsheSuRbnBPknheOmRSYhI0BVVZlSAm2wDFJEI
 vMTg5MnrSUaUXkF6kLhg5R5yz6GV7EeTMd/8fSevgRC0piTJDYP1Q3ZGYXU+cur9py0bbD9pklGtj
 esplS31Zk0b4tVZCQKLjTmvzoiuZZ4rkC2ah8SPEiI1hqixaIZvrWimweI/USgqJxLqmRdHF9J1fd
 jMX69H9QIcVoDx9QDojI38oN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ojPQ8-004HYD-4Y; Fri, 14 Oct 2022 18:28:32 +0000
Message-ID: <180c61e4-2de5-0cc3-6d31-fd350227a63b@samba.org>
Date: Fri, 14 Oct 2022 20:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US, de-DE
To: Tom Talpey <tom@talpey.com>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
 <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
 <bfbb1347-be6e-a7c8-497a-f8a08248cdc0@samba.org>
 <54c46768-ff78-f9ed-fab5-da20d79ce31e@samba.org>
 <724a820463e6b68137a06d4c8b6ae962c236aa81.camel@samba.org>
 <35d239c7-86c6-dccd-815f-0a4c771204c3@samba.org>
 <46642e17-d7b9-187c-acc2-1fb9ccd09ffc@talpey.com>
 <ace9ff7a-bdb3-d2e0-deb0-944a44ce7266@samba.org>
 <0b6c9604-48f6-a00c-3ddd-dacff83f19a8@talpey.com>
 <2086d65d-ca70-a203-93f2-642a50721434@samba.org>
 <844a53dd-3b98-2d16-20e7-b3b4095243a5@talpey.com>
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
In-Reply-To: <844a53dd-3b98-2d16-20e7-b3b4095243a5@talpey.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 14.10.22 um 20:15 schrieb Tom Talpey:
> On 10/14/2022 10:03 AM, Stefan Metzmacher wrote:
>> Am 14.10.22 um 15:52 schrieb Tom Talpey:
>>> On 10/14/2022 9:45 AM, Stefan Metzmacher wrote:
>>>> Hi Tom,
>>>>
>>>>>> It means RCV_SHUTDOWN gets set as well as TCP_CLOSE_WAIT, but
>>>>>> sk->sk_err is not changed to indicate an error.
>>>>>
>>>>> This is correct, because the TCP connection is in "half-closed" state.
>>>>> The peer has closed, but the outgoing stream is still open. The TCP
>>>>> protocol has supported this since forever.
>>>>>
>>>>> This is not a transitory state. The connection can remain in it forever.
>>>>> The peer is now in FIN_WAIT_2 and will send no further data. It's
>>>>> waiting for our FIN, and in turn the local socket is waiting for a
>>>>> close() call to do so. But pretty much any other socket operation
>>>>> can still be performed.
>>>>
>>>> Thanks for the explanation!
>>>>
>>>>>> It means if (sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)) doesn't
>>>>>> hit as we only have RCV_SHUTDOWN and sk_stream_wait_memory returns -EAGAIN.
>>>>>
>>>>> Probably because the peer has stopped reading the socket. FIN_WAIT_2 is
>>>>> a super-problematic state, because the only way to exit it is to receive
>>>>> a FIN or RST, which we're evidently not sending. Most implementations
>>>>> run a timer as failsafe, but it's always rather long (minutes).
>>>>
>>>> Yes, we need 'socket options' with TCP_KEEPCNT, TCP_KEEPIDLE, TCP_KEEPINTVL and/or TCP_USER_TIMEOUT
>>>> and/or a user space timer in order to have lower timeouts.
>>>
>>> That won't help. The peer is there, and the connection is up.
>>> The keepalive will succeed! Even if it failed, it's not prompt,
>>> and reducing the KEEPINTVL is a very bad idea. Servers should not
>>> be pinging their clients in any event.
>>>
>>> What peer is doing this? Most Windows clients will perform an
>>> abortive close, but this one is doing it  gracefully. The
>>> server should deal with either, of course, so I'm mostly just
>>> curious.
>>
>> I guess the client is gone or it waits for our FIN,ACK
>> but it no longers acks the data from our sendqueue, which we most likely try
>> to send out before sending out FIN,ACK.
> 
> Technically speaking, it's waiting for the server's FIN. The TCP
> layer has acked the incoming FIN, but has left the sending side
> open until the server app calls close(sock).

Ok.

>> But I only have the information from the public mails and I haven't
>> tried to reproduce it.
> 
> I think the challenge is to determine what combination of pollfd bits
> come back when the socket is in this state. If the server can detect
> this, it can close the socket.

Yes, see below.

>>  From https://lists.samba.org/archive/samba/2022-September/241873.html:
>>  > As clients we have some NetAPP-FAS running which doing the auth. via LDAP. On NetApp timeouts for LDAP are set to 3sec per default.
>>  >
>>  > Some queries seem to need more time to answer so the client tries to close the connection but the (samba-)server-part leaves the socket open in CLOSE_WAIT.
>>  >
>>  > In some of such cases the corresponding process (ldap-worker) runs forever(?) with 100% cpu. A strace shows the ldap-worker pushing some info (the answer?)
>>  > to the socket. If one let it go the server slows down gradually while more and more connections stay in CLOSE_WAIT.
> 
> Right, that's because the server is looping between seeing the pollfd
> bits, attempting to send, getting EAGAIN, and repeat, right?
> 
> We can't just bail out on EAGAIN, so it's down to figuring out the
> pollfd, or calling some socket state API when looping,  to detect
> the half-close.

Yes, freebsd and linux are generating POLLRDHUP in that case. But I'm also checking for
POLLHUP and POLLERR and if we see them we generate an error in userspace instead of calling writev over and over again.

metze


