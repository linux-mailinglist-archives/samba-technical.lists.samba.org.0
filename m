Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30B87A45D
	for <lists+samba-technical@lfdr.de>; Wed, 13 Mar 2024 09:57:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xATN+fNLVBW0nteqrTdPZMmMoa9Qs0vDSOCiZfaH0lg=; b=EOoIeThgMAIPRyWTNdy4ywm4nX
	zXoG1y5211v1Ajf74Z41rdnCyHP3Lu1mAaRq+wmtBvvaEMRGOKN50sGN9sCqlepeOvwMbt061lcRV
	xlIcA6KifRkkgcQ2gYMdCa0cj0hnwZoYPAoJM6PTTtCnxJCFX7zcmyx5EUvpiNV2eyKek+0xnfI3g
	3S/XFMGYx3VU2DOzOEEF80LtYUSDDc7URIiUPY27pJCpaQOp2vv9S9ZRNnMvEEsMz6LThgg2nW1Y0
	8/9OVa3r5yDgw1iabGf5PAyPQC8+P35gKloRkYJzQrglT3OdO5cuYcMpNQw7wkRLcDetgQAu8DP3U
	kGdUEZyw==;
Received: from ip6-localhost ([::1]:39624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rkKPs-000HKx-JI; Wed, 13 Mar 2024 08:56:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35248) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rkKPn-000HKq-Kd
 for samba-technical@lists.samba.org; Wed, 13 Mar 2024 08:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=xATN+fNLVBW0nteqrTdPZMmMoa9Qs0vDSOCiZfaH0lg=; b=PrIwJ+KCxV6PSDaxTUgT33tXBI
 VrFziHv26mOylNEZR+pli8jUbx0FO8s8je8jIcW4sMj3AL0CyOD1T9GnV2G5l9/OVZ2dbVWNIpWnj
 wAL98punqFnsGrTMDZLbhmmPHIVP4g0Gn9CZtOyOKX6OMYQF+fFD1Owv2NkiBdiJjPLCjxQHShWSM
 cZPtCc/6qIaYkfccOXpvY6O8CC38Tc63E+9WF0pIzk5q3ouRu3vOZTWpxkjfYGlENxygtS8K0fGF8
 exdgMuDYhDm1TZQaNh2GQG2SN6QXNIb0AmVZY/kfFm9kk+Ei0FAqNjTkzcBrRJLtDtZEg2u9g5MwY
 o3t/sWAQVkgH9sgN/UFoDxTjCqADtRbqE00Uo0MJPH4WleVXAtKLvobTxUhednqiSFZZX4TikZIFE
 Dk8ZmWGBytateOQaH7csYP55mHfBjLj04wiknvGf2k7Ujtgycht7YI2ke6Lf9TkXbRkqv4pKvt5qi
 pIJcbk84ByAHzbr0J6v6XY5d;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rkKPl-000dql-00; Wed, 13 Mar 2024 08:56:45 +0000
Message-ID: <74d5db09-6b5c-4054-b9d3-542f34769083@samba.org>
Date: Wed, 13 Mar 2024 09:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 0/5] net: In-kernel QUIC implementation with
 Userspace handshake
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>
References: <cover.1710173427.git.lucien.xin@gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <cover.1710173427.git.lucien.xin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Sabrina Dubroca <sd@queasysnail.net>,
 Samba Technical <samba-technical@lists.samba.org>,
 Jeff Layton <jlayton@kernel.org>, davem@davemloft.net,
 Steve French <smfrench@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Chuck Lever III <chuck.lever@oracle.com>, Tyler Fanelli <tfanelli@redhat.com>,
 kuba@kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Pengtao He <hepengtao@xiaomi.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Xin Long,

first many thanks for working on this topic!

> Usage
> =====
> 
> This implementation supports a mapping of QUIC into sockets APIs. Similar
> to TCP and SCTP, a typical Server and Client use the following system call
> sequence to communicate:
> 
>         Client                    Server
>      ------------------------------------------------------------------
>      sockfd = socket(IPPROTO_QUIC)      listenfd = socket(IPPROTO_QUIC)
>      bind(sockfd)                       bind(listenfd)
>                                         listen(listenfd)
>      connect(sockfd)
>      quic_client_handshake(sockfd)
>                                         sockfd = accecpt(listenfd)
>                                         quic_server_handshake(sockfd, cert)
> 
>      sendmsg(sockfd)                    recvmsg(sockfd)
>      close(sockfd)                      close(sockfd)
>                                         close(listenfd)
> 
> Please note that quic_client_handshake() and quic_server_handshake() functions
> are currently sourced from libquic in the github lxin/quic repository, and might
> be integrated into ktls-utils in the future. These functions are responsible for
> receiving and processing the raw TLS handshake messages until the completion of
> the handshake process.

I see a problem with this design for the server, as one reason to
have SMB over QUIC is to use udp port 443 in order to get through
firewalls. As QUIC has the concept of ALPN it should be possible
let a conumer only listen on a specif ALPN, so that the smb server
and web server on "h3" could both accept connections.

So the server application should have a way to specify the desired
ALPN before or during the bind() call. I'm not sure if the
ALPN is available in cleartext before any crypto is needed,
so if the ALPN is encrypted it might be needed to also register
a server certificate and key together with the ALPN.
Because multiple application may not want to share the same key.

This needs to work indepented of kernel or userspace application.

We may want ksmbd (kernel smb server) and apache or smbd (Samba's userspace smb server)
together with apache. And maybe event ksmbd with one certificate for
ksmbd.example.com and smbd with a certificate for smbd.example.com
both on ALPN "smb", while apache uses "h3" with a certificate for
apache.example.com and nginx with "h3" and a certificate for
nginx.example.com.

But also smbd with "smb" as well as apache with "h3" both using
a certificate for quic.example.com.

I guess TLS Server Name Indication also works for QUIC, correct?

For the client side I guess dynamic udp ports are used and
there's no problem with multiple applications...

metze

