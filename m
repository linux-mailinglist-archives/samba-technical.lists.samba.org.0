Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2287AD3A
	for <lists+samba-technical@lfdr.de>; Wed, 13 Mar 2024 18:28:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MA6F1oWervV4yTf9sdlRkmUY6JHezIhU/a2seVqV4Nw=; b=WTZUIg6/V3hwfap4FKZ6eOh2TS
	8YJek6CVIiDLx1nSAGn0zIrqhwRI+MWi8Uex6sr3QT2DDVr0xGOu0OrvLjlOe/4KTKpwEl8Ftn3r2
	SeeUa4ttlWXxwWND4ru15H4bmUuYFWeiQmqghLk0Dy4CDaagHr6OmyyLjd7NdRLqkT788u0C7afwp
	qES4j46oU28SIfTXwUznS/IfxeeUglhkwn5IcMnWdeZDPcN0wmH3XZno7/Cr/96Vdlkgznhhh9U2T
	ONaWsyxXAmTBPdyFuWgxMM1CkhzpJQMxkonCUvmxHh2pL/RlQh1E/Jyp3FwtTW7rGgRCI9iwIXRf5
	VwVBzGPg==;
Received: from ip6-localhost ([::1]:23874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rkSOp-000J78-4b; Wed, 13 Mar 2024 17:28:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56322) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rkSOi-000J71-Tv
 for samba-technical@lists.samba.org; Wed, 13 Mar 2024 17:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=MA6F1oWervV4yTf9sdlRkmUY6JHezIhU/a2seVqV4Nw=; b=tYH4GbfcnX8vIOFaJujG/xZs3O
 /H02qGW95JLKQr81gqbjOMgSuxku9rOkREOwFPuwb6z47CR6XSaJXD81dIFYWFxZpKftfPCX6cq/m
 zmCfVWzN0zSMMS6yXE9DNFBNT452OIYODoZI6I416a5o02oukVi0I3ZZ8KtOhZM4qtQ2gcfRUD7QY
 /W92+LqdLBDfpIcGYHK8N7Uwx7d1rRkrw+DkdWk6mHDA2vh3XWfotzSUhUGPBzcf5JHTnrS2EGVBk
 kz0GP8LzFD6ryMSvEY10WcVVHLjFRUgmEz8XAcJKcvEQFhpIBIvoZckv8vmfEpwx/7vMl5CAGROvK
 xREV2zBpRYnmxBefpvLllEKM9eGx9MaiAqtEKfjkihNRsF2I75ruEmLt5w9aDF+PEokwW+JkwrJws
 Q3c0U87dxmVrBbkqRxDXL9ef3cFXO6In/rS93Srik3sHlgOPt3UzMYBX4J+VkWg3GSKHHr1SO9SI4
 zs45MTnCloPIma+S6pKqy5Pl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rkSOf-000ibz-1q; Wed, 13 Mar 2024 17:28:09 +0000
Message-ID: <f427b422-6cfc-45ac-88eb-3e7694168b63@samba.org>
Date: Wed, 13 Mar 2024 18:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 0/5] net: In-kernel QUIC implementation with
 Userspace handshake
Content-Language: en-US, de-DE
To: Xin Long <lucien.xin@gmail.com>
References: <cover.1710173427.git.lucien.xin@gmail.com>
 <74d5db09-6b5c-4054-b9d3-542f34769083@samba.org>
 <CADvbK_dzVcDKsJ9RN9oc0K1Jwd+kYjxgE6q=ioRbVGhJx7Qznw@mail.gmail.com>
In-Reply-To: <CADvbK_dzVcDKsJ9RN9oc0K1Jwd+kYjxgE6q=ioRbVGhJx7Qznw@mail.gmail.com>
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

Am 13.03.24 um 17:03 schrieb Xin Long:
> On Wed, Mar 13, 2024 at 4:56 AM Stefan Metzmacher <metze@samba.org> wrote:
>>
>> Hi Xin Long,
>>
>> first many thanks for working on this topic!
>>
> Hi, Stefan
> 
> Thanks for the comment!
> 
>>> Usage
>>> =====
>>>
>>> This implementation supports a mapping of QUIC into sockets APIs. Similar
>>> to TCP and SCTP, a typical Server and Client use the following system call
>>> sequence to communicate:
>>>
>>>          Client                    Server
>>>       ------------------------------------------------------------------
>>>       sockfd = socket(IPPROTO_QUIC)      listenfd = socket(IPPROTO_QUIC)
>>>       bind(sockfd)                       bind(listenfd)
>>>                                          listen(listenfd)
>>>       connect(sockfd)
>>>       quic_client_handshake(sockfd)
>>>                                          sockfd = accecpt(listenfd)
>>>                                          quic_server_handshake(sockfd, cert)
>>>
>>>       sendmsg(sockfd)                    recvmsg(sockfd)
>>>       close(sockfd)                      close(sockfd)
>>>                                          close(listenfd)
>>>
>>> Please note that quic_client_handshake() and quic_server_handshake() functions
>>> are currently sourced from libquic in the github lxin/quic repository, and might
>>> be integrated into ktls-utils in the future. These functions are responsible for
>>> receiving and processing the raw TLS handshake messages until the completion of
>>> the handshake process.
>>
>> I see a problem with this design for the server, as one reason to
>> have SMB over QUIC is to use udp port 443 in order to get through
>> firewalls. As QUIC has the concept of ALPN it should be possible
>> let a conumer only listen on a specif ALPN, so that the smb server
>> and web server on "h3" could both accept connections.
> We do provide a sockopt to set ALPN before bind or handshaking:
> 
>    https://github.com/lxin/quic/wiki/man#quic_sockopt_alpn
> 
> But it's used more like to verify if the ALPN set on the server
> matches the one received from the client, instead of to find
> the correct server.

Ah, ok.

> So you expect (k)smbd server and web server both to listen on UDP
> port 443 on the same host, and which APP server accepts the request
> from a client depends on ALPN, right?

yes.

> Currently, in Kernel, this implementation doesn't process any raw TLS
> MSG/EXTs but deliver them to userspace after decryption, and the accept
> socket is created before processing handshake.
> 
> I'm actually curious how userland QUIC handles this, considering
> that the UDP sockets('listening' on the same IP:PORT) are used in
> two different servers' processes. I think socket lookup with ALPN
> has to be done in Kernel Space. Do you know any userland QUIC
> implementation for this?

I don't now, but I guess QUIC is only used for http so
far and maybe dns, but that seems to use port 853.

So there's no strict need for it and the web server
would handle all relevant ALPNs.

>>
>> So the server application should have a way to specify the desired
>> ALPN before or during the bind() call. I'm not sure if the
>> ALPN is available in cleartext before any crypto is needed,
>> so if the ALPN is encrypted it might be needed to also register
>> a server certificate and key together with the ALPN.
>> Because multiple application may not want to share the same key.
> On send side, ALPN extension is in raw TLS messages created in userspace
> and passed into the kernel and encoded into QUIC crypto frame and then
> *encrypted* before sending out.

Ok.

> On recv side, after decryption, the raw TLS messages are decoded from
> the QUIC crypto frame and then delivered to userspace, so in userspace
> it processes certificate validation and also see cleartext ALPN.
> 
> Let me know if I don't make it clear.

But the first "new" QUIC pdu from will trigger the accept() to
return and userspace (or the kernel helper function) will to
all crypto? Or does the first decryption happen in kernel (before accept returns)?

Maybe it would be possible to optionally have socket option to
register ALPNs with certificates so that tls_server_hello_x509()
could be called automatically before accept returns (even for
userspace consumers).

It may mean the tlshd protocol needs to be extended...

metze

