Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F307C87BA4A
	for <lists+samba-technical@lfdr.de>; Thu, 14 Mar 2024 10:22:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pQJBXiXVDXol04nOz0tKcQ7g2JwJVkzgDd+D59XFthE=; b=dQydX13VHCuZJYeN/Mh+Shj3eq
	/VbZswoy3kYZWgFge73sFs3oL2cj07v97N0vKFp+p2RO+isEm+ElV8rJTxrrblfkHBA9xb0Tr4Nyl
	B4bpzmcN5/iq2HoLMUwjR2i94IIzh29uli3j6IS6HrnFI284tvtuaYEQqoe0lJ8HNCmCocDkHNFf7
	rxYH3aqo6sBvF2OMtIiHUwYSDZNY6kSpIH0vby5d4BkJaWXRlFz7biAfLF82gE2+PpV1ypT6wV7I3
	Qt27gJrNauK7qps5z9aBV1hHvq6dCOGYWZ92LHFCDA85kKW9Y6AIGO/Q+rqllHX5u2hpAEfrOU79a
	gBHaZirw==;
Received: from ip6-localhost ([::1]:62166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rkhHe-000L2A-Ti; Thu, 14 Mar 2024 09:21:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44288) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rkhHa-000L23-3y
 for samba-technical@lists.samba.org; Thu, 14 Mar 2024 09:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=pQJBXiXVDXol04nOz0tKcQ7g2JwJVkzgDd+D59XFthE=; b=GffrsFyM9iWmnCa2zO0rywbYVs
 EE4p09icANGAQFVXpiqxj3pQIrx8cTDW9owys0JsWd2wdGp4WEd6WCNaHmFrAkWXLXPGUuOr6K0rJ
 N89+sfTTHKm3zbVCop071XnK5FVIXPE/F+VtTM91r8TX3ik0ZxciVNz4aCB/9WLT5nyqFjxfDLv6m
 9siXpmF9nkyDoEGiLsg4LgNSj4iY2+2FS7KIJZ+qlPwxj5MGRN5ON2+Pi8Ytml3bcCdEqskTLk1Zj
 vRbXpV2gv9tiXzTLVCrZA1ZNMrtbg7xfdRqfJGoiasSRpxuj5LKkF/Zie1dwDW4nhIa6jiwMsgNBf
 uf5DznRLPolC5P4mnDQqwIDLO3RG6iYiWUvA2DNQzfFeiYQc1sL0GQZM1wfaTVH0pn3G/k5b3wmli
 MhtHlJxX5K/JJFbzyM99ZjeaaEjPtzA7f16+aSIot+VRIY23zPxuUn+Qb5O61Jqxr0tRUrgjRIonG
 fZwh2/j61eX1zUyZnF8JTxCl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rkhHX-000qEs-1A; Thu, 14 Mar 2024 09:21:47 +0000
Message-ID: <438496a6-7f90-403d-9558-4a813e842540@samba.org>
Date: Thu, 14 Mar 2024 10:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 0/5] net: In-kernel QUIC implementation with
 Userspace handshake
Content-Language: en-US, de-DE
To: Xin Long <lucien.xin@gmail.com>
References: <cover.1710173427.git.lucien.xin@gmail.com>
 <74d5db09-6b5c-4054-b9d3-542f34769083@samba.org>
 <CADvbK_dzVcDKsJ9RN9oc0K1Jwd+kYjxgE6q=ioRbVGhJx7Qznw@mail.gmail.com>
 <f427b422-6cfc-45ac-88eb-3e7694168b63@samba.org>
 <CADvbK_cA-RCLiUUWkyNsS=4OhkWrUWb68QLg28yO2=8PqNuGBQ@mail.gmail.com>
In-Reply-To: <CADvbK_cA-RCLiUUWkyNsS=4OhkWrUWb68QLg28yO2=8PqNuGBQ@mail.gmail.com>
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, network dev <netdev@vger.kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <smfrench@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Chuck Lever III <chuck.lever@oracle.com>, Tyler Fanelli <tfanelli@redhat.com>,
 Samba Technical <samba-technical@lists.samba.org>, kuba@kernel.org,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 Pengtao He <hepengtao@xiaomi.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 13.03.24 um 20:39 schrieb Xin Long:
> On Wed, Mar 13, 2024 at 1:28 PM Stefan Metzmacher <metze@samba.org> wrote:
>>
>> Am 13.03.24 um 17:03 schrieb Xin Long:
>>> On Wed, Mar 13, 2024 at 4:56 AM Stefan Metzmacher <metze@samba.org> wrote:
>>>>
>>>> Hi Xin Long,
>>>>
>>>> first many thanks for working on this topic!
>>>>
>>> Hi, Stefan
>>>
>>> Thanks for the comment!
>>>
>>>>> Usage
>>>>> =====
>>>>>
>>>>> This implementation supports a mapping of QUIC into sockets APIs. Similar
>>>>> to TCP and SCTP, a typical Server and Client use the following system call
>>>>> sequence to communicate:
>>>>>
>>>>>           Client                    Server
>>>>>        ------------------------------------------------------------------
>>>>>        sockfd = socket(IPPROTO_QUIC)      listenfd = socket(IPPROTO_QUIC)
>>>>>        bind(sockfd)                       bind(listenfd)
>>>>>                                           listen(listenfd)
>>>>>        connect(sockfd)
>>>>>        quic_client_handshake(sockfd)
>>>>>                                           sockfd = accecpt(listenfd)
>>>>>                                           quic_server_handshake(sockfd, cert)
>>>>>
>>>>>        sendmsg(sockfd)                    recvmsg(sockfd)
>>>>>        close(sockfd)                      close(sockfd)
>>>>>                                           close(listenfd)
>>>>>
>>>>> Please note that quic_client_handshake() and quic_server_handshake() functions
>>>>> are currently sourced from libquic in the github lxin/quic repository, and might
>>>>> be integrated into ktls-utils in the future. These functions are responsible for
>>>>> receiving and processing the raw TLS handshake messages until the completion of
>>>>> the handshake process.
>>>>
>>>> I see a problem with this design for the server, as one reason to
>>>> have SMB over QUIC is to use udp port 443 in order to get through
>>>> firewalls. As QUIC has the concept of ALPN it should be possible
>>>> let a conumer only listen on a specif ALPN, so that the smb server
>>>> and web server on "h3" could both accept connections.
>>> We do provide a sockopt to set ALPN before bind or handshaking:
>>>
>>>     https://github.com/lxin/quic/wiki/man#quic_sockopt_alpn
>>>
>>> But it's used more like to verify if the ALPN set on the server
>>> matches the one received from the client, instead of to find
>>> the correct server.
>>
>> Ah, ok.
> Just note that, with a bit change in the current libquic, it still
> allows users to use ALPN to find the correct function or thread in
> the *same* process, usage be like:
> 
> listenfd = socket(IPPROTO_QUIC);
> /* match all during handshake with wildcard ALPN */
> setsockopt(listenfd, QUIC_SOCKOPT_ALPN, "*");
> bind(listenfd)
> listen(listenfd)
> 
> while (1) {
>    sockfd = accept(listenfd);
>    /* the alpn from client will be set to sockfd during handshake */
>    quic_server_handshake(sockfd, cert);
> 
>    getsockopt(sockfd, QUIC_SOCKOPT_ALPN, alpn);

Would quic_server_handshake() call setsockopt()?

>    switch (alpn) {
>      case "smbd": smbd_thread(sockfd);
>      case "h3": h3_thread(sockfd);
>      case "ksmbd": ksmbd_thread(sockfd);
>    }
> }

Ok, but that would mean all application need to be aware of each other,
but it would be possible and socket fds could be passed to other
processes.

>>
>>> So you expect (k)smbd server and web server both to listen on UDP
>>> port 443 on the same host, and which APP server accepts the request
>>> from a client depends on ALPN, right?
>>
>> yes.
> Got you. This can be done by also moving TLS 1.3 message exchange to
> kernel where we can get the ALPN before looking up the listening socket.
> However, In-kernel TLS 1.3 Handshake had been NACKed by both kernel
> netdev maintainers and userland ssl lib developers with good reasons.
> 
>>
>>> Currently, in Kernel, this implementation doesn't process any raw TLS
>>> MSG/EXTs but deliver them to userspace after decryption, and the accept
>>> socket is created before processing handshake.
>>>
>>> I'm actually curious how userland QUIC handles this, considering
>>> that the UDP sockets('listening' on the same IP:PORT) are used in
>>> two different servers' processes. I think socket lookup with ALPN
>>> has to be done in Kernel Space. Do you know any userland QUIC
>>> implementation for this?
>>
>> I don't now, but I guess QUIC is only used for http so
>> far and maybe dns, but that seems to use port 853.
>>
>> So there's no strict need for it and the web server
>> would handle all relevant ALPNs.
> Honestly, I don't think any userland QUIC can use ALPN to lookup for
> different sockets used by different servers/processes. As such thing
> can be only done in Kernel Space.
> 
>>
>>>>
>>>> So the server application should have a way to specify the desired
>>>> ALPN before or during the bind() call. I'm not sure if the
>>>> ALPN is available in cleartext before any crypto is needed,
>>>> so if the ALPN is encrypted it might be needed to also register
>>>> a server certificate and key together with the ALPN.
>>>> Because multiple application may not want to share the same key.
>>> On send side, ALPN extension is in raw TLS messages created in userspace
>>> and passed into the kernel and encoded into QUIC crypto frame and then
>>> *encrypted* before sending out.
>>
>> Ok.
>>
>>> On recv side, after decryption, the raw TLS messages are decoded from
>>> the QUIC crypto frame and then delivered to userspace, so in userspace
>>> it processes certificate validation and also see cleartext ALPN.
>>>
>>> Let me know if I don't make it clear.
>>
>> But the first "new" QUIC pdu from will trigger the accept() to
>> return and userspace (or the kernel helper function) will to
>> all crypto? Or does the first decryption happen in kernel (before accept returns)?
> Good question!
> 
> The first "new" QUIC pdu will cause to create a 'request sock' (contains
> 4-tuple and connection IDs only) and queue up to reqsk list of the listen
> sock (if validate_peer_address param is not set), and this pdu is enqueued
> in the inq->backlog_list of the listen sock.
> 
> When accept() is called, in Kernel, it dequeues the "request sock" from the
> reqsk list of the listen sock, and creates the accept socket based on this
> reqsk. Then it processes the pdu for this new accept socket from the
> inq->backlog_list of the listen sock, including *decrypting* QUIC packet
> and decoding CRYPTO frame, then deliver the raw/cleartext TLS message to
> the Userspace libquic.

Ok, when the kernel already decrypts it could already
look find the ALPN. It doesn't mean it should do the full
handshake, but parse enough to find the ALPN.

But I don't yet understand how the kernel gets the key to
do the initlal decryption, I'd assume some call before listen()
need to tell the kernel about the keys.

> Then in Userspace libquic, it handles the received TLS message and creates
> a new raw/cleartext TLS message for response via libgnutls, and delivers to
> kernel. In kernel, it will encode this message to a CRYPTO frame in a QUIC
> packet and then *encrypt* this QUIC packet and send it out.
> 
> So as you can see, there's no en/decryption happening in Userspace. In
> Userspace libquic, it only does raw/cleartext TLS message exchange. ALL
> en/decryption happens in Kernel Space, as these en/decryption are done
> against QUIC packets, not directly against the TLS messages.
> 
>>
>> Maybe it would be possible to optionally have socket option to
>> register ALPNs with certificates so that tls_server_hello_x509()
>> could be called automatically before accept returns (even for
>> userspace consumers).
>>
>> It may mean the tlshd protocol needs to be extended...
>>
> so that userspace consumers don't need quic_client/server_handshake(), and
> accept() returns a socket that already has the handshake done, right?
> 
> We didn't do that, as:
> 
> 1. It's not a good idea for Userspace consumers' applications to reply on
>     a daemon like tlshd, not convenient for users, also a bit weird for
>     userspace app to ask another userspace app to help do the handshake.
> 2. It's too complex to implement, especially if we also want to call
>     tls_client_hello_x509() before connect() returns on client side.
> 3. For Kernel usage, I prefer leaving this to the kernel consumers for
>     more flexibility for handshake requests.
> 
> As for the ALPNs with certificates, not sure if I understand correctly.
> But if you want the server to select certificates according to the ALPN
> received from the client during handshake. I think it could be done in
> userspace libquic. But yes, tlshd service may also need to extend.

I was just brainstorming for ideas...

metze

