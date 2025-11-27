Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC18C8FC35
	for <lists+samba-technical@lfdr.de>; Thu, 27 Nov 2025 18:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=461Vy01Zb0nwzw3ifoGzpi9dK4EZy7C3bNQOK9nUwXw=; b=XLbJhQ7ECK3O3gt+sVAS3OvsDQ
	JWTHxtYNsW4G6CVRpyXzbHjEFwMZ+VbhEt0nLPMaP5nO+C6kU5/yWV/3qsRvahb0cuciCeTdW83jY
	6CAWz6p8f4kSBdHLrDpsWVwWaTSiJxLWLQTm33KxvC+O1fDrJeSJqvSm/nWh/sK9zsWKTxuX7hGom
	lYcIQda2ulmiXdaW1wJB6RjoymzMyjTVmhPFmEKzXtsGy8hnX59sKQIKHVA7DTRijDXHPGhrIHEhU
	BiH3QgkqzuSJn4f26Ih0sWIzsiyKZRNGnfsPawM6/KHcIV9/2GERFGPs/jE+s1r3+R8F800PK1uH3
	EyjeN02A==;
Received: from ip6-localhost ([::1]:37528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOg5x-00DSuG-Ma; Thu, 27 Nov 2025 17:47:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39968) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOg5t-00DSu9-D6
 for samba-technical@lists.samba.org; Thu, 27 Nov 2025 17:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=461Vy01Zb0nwzw3ifoGzpi9dK4EZy7C3bNQOK9nUwXw=; b=k9vbGoB0kfzIMMqR8vXteUGamz
 ooV5kYNXah6tFldH1rDE4Wshj5wUDlA7CLUxvd/HbcfRNo5IyFdjG8+AKEcvTPb1p6ObMXYuakp1b
 Irusrg5dlETX8KQ7MmuTaa6LwU/rwou1Q3+Xrbgj9xEnllAtDQbPqJCIjn8vsAMRG+y8175ofdQdd
 ziAGF2nQ0sqw3LluD7cn2D5PNpGENV0XNfGCbJD3ehsImK1CWZs+CTGT6zv0zzlOzB69xq4pLX1Rf
 TTZj4fgoPlaDOJ3K/4OmGZYqwAKG284x+tT9qvUlcldYl82tE8AKIAX2tN3OBjb/fhkbSp/LbjmKm
 pCyNzanGt3wWFXvyTBrmP9YyuNAT8xSWrLBhXaGpaAP20ud3nfnsaRNcl/Ix3D9IpLfHf7wLaL8qS
 BVjf9vSb1PbgYRgMHzokaEthQL6FpMQ1rev19toZDhiPJsiE/xwX/TdL/BhemSQXw8eS+Mqc28BPy
 28mbKXm/2zIscztuxegPStsp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOg5r-00G22i-01; Thu, 27 Nov 2025 17:47:47 +0000
Message-ID: <53eb849d-d5c1-4b8c-8d83-bacd18d129b1@samba.org>
Date: Thu, 27 Nov 2025 18:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: define IPPROTO_SMBDIRECT and SOL_SMBDIRECT constants
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
References: <20251126111407.1786854-1-metze@samba.org>
 <3dd5c950-e3e4-42b8-a40b-f0ee04feb563@redhat.com>
Content-Language: en-US
In-Reply-To: <3dd5c950-e3e4-42b8-a40b-f0ee04feb563@redhat.com>
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
Cc: linux-cifs@vger.kernel.org, Willem de Bruijn <willemb@google.com>,
 Xin Long <lucien.xin@gmail.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, samba-technical@lists.samba.org,
 Kuniyuki Iwashima <kuniyu@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 quic@lists.linux.dev
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Paolo,

> On 11/26/25 12:14 PM, Stefan Metzmacher wrote:
>> In order to avoid conflicts with the addition of IPPROTO_QUIC,
>> the patch is based on netdev-next/main + the patch adding
>> IPPROTO_QUIC and SOL_QUIC [2].
>>
>> [2]
>> https://lore.kernel.org/quic/0cb58f6fcf35ac988660e42704dae9960744a0a7.1763994509.git.lucien.xin@gmail.com/T/#u
>>
>> As the numbers of IPPROTO_QUIC and SOL_QUIC are already used
>> in various userspace applications it would be good to have
>> this merged to netdev-next/main even if the actual
>> implementation is still waiting for review.
> 
> Let me start from here... Why exactly? such applications will not work
> (or at least will not use IPPROTO_QUIC) without the actual protocol
> implementation.

There's the out of tree quic driver, that is used by some people
see https://github.com/lxin/quic.

And Samba 4.23 already uses the specific *_QUIC values,
so it would be good to make sure the values are not used for
something else, by accident.

> Build time issues are much more easily solved with the usual:
> 
> #ifndef IPPROTO_*
> #define IPPROTO_
> #endif

Sure, but that still only works reliable if the constants
don't change.

> that the application code should still carry for a bit of time (until
> all the build hosts kernel headers are updated).

The build hosts often don't have current kernel headers
anyway, that's why applications have the hard coded (at least fallback values).

But a host might have a newer kernel (or out of tree module)
at runtime, which would allow the application to use the feature.

> The above considerations also apply to this patch. What is the net
> benefit? Why something like the above preprocessor's macros are not enough?

It's mainly to have the constants reserved in order to avoid collisions
at runtime.

And in the current case also the merge conflict between the two patchsets,
that's another why I thought it would be good to the _QUIC patch already
accepted.

> We need at least to see the paired implementation to accept this patch,

I hope to post the first part of the _SMBDIRECT socket code next
week, it's already working for the in kernel users cifs.ko and ksmbd.ko,
but I want to split the relatively large commit into smaller chunks,
for better review, the current state consists of the top 3 commits of
https://git.samba.org/?p=metze/linux/wip.git;a=shortlog;h=refs/heads/master-ipproto-smbdirect-v0.5
1. the addition of the socket layer above the existing code, for in kernel use only
2. change cifs.ko to use it
3. change ksmbd.ko to use it.

Opening it for userspace will be developed in the next weeks.

 > and I personally think it would be better to let the IPPROTO definition
 > and the actual implementation land together.

In general I'd agree with you, I'm fine with deferring this patch
a bit and will cope if the _QUIC patch is also deferred.

Anyway thanks for the feedback!
metze

