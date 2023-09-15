Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 529707A17F1
	for <lists+samba-technical@lfdr.de>; Fri, 15 Sep 2023 10:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=53okt010xs04oecISDnjMKaPCjO/6pdf1s6dKomAL5M=; b=ZtuO7nxIwhwkE/gRYomRDq3zQJ
	upVIssrLQzfYXGDly041ofL9d6Dayd0CZ8pClE5yOMUUuSBzV7IgNPdcwMfvzQLiYbB+78LPWliq/
	yGzBCOhDMClfIKZPxy6EbS52uLskRxOu6aGiw6/EK3zp6oQhKKrzrMPsBzZiqbQdfber3SoHFE5uT
	zwAY2M1z8l0wTP23dUyr34X1p3jmzDIKHio8k4hyGHoxJ5TIzWIULaXmRxcdQXc3xrxYQt0kvt7hN
	u9lbt3fk/qhXtg1Q5Q6iH4sgL1DjFGOIJw0aMTItuL35K2YB+wjvEp/7+tXMKdBwAfjcQPx8VATVx
	tgnqBk8g==;
Received: from ip6-localhost ([::1]:26920 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qh3pG-004VgT-Hm; Fri, 15 Sep 2023 08:05:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43488) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qh3p5-004VgK-JO
 for samba-technical@lists.samba.org; Fri, 15 Sep 2023 08:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=53okt010xs04oecISDnjMKaPCjO/6pdf1s6dKomAL5M=; b=BSpPkHuTLfCm1sKNOHgfo4kx0S
 hiKLqxKWcVeMpMdh1AwNlWqxRq6TKHPRDV+NJiqv+fVDRxXwSPcdwNpmNuF3WRyyztT8ktFFnRevs
 UOYgPGSJoIXJjwqAJelckJo0FUcGwMI3bsyFjAYmWfElr//sVJ+pbHQbyu4bzrxvmbkP5Z0ODAHFm
 ucnJEXWVk/Ph3Zk/UU5UfH34Tq/k8g+qJpT6LTzS5hPU3AAXWRCR5FYsaa1b19z5VqSoaFDS5ZVgQ
 JG0Ov4Pillnok8FarFqiuAFb9oXDWutMOxj7OesIh6otMgN62DiZJDK6grZOXaxTrP/byE7t7BMwe
 70sdw8EzU7BYNudMGNGHfvM1kI+bXpIsiG3olM1x2DmBRcc1qBEn+8KCveaR6VEd8a/1SJDS0jhMl
 N0qkF6tspHJNdImyJdaV/4qCc7xLmGYKFfR29adacByN1+Wk2ldFJZupLwjhxLAj9sjqw5qCAZLmp
 8owi5m10SDXzyg7PgMvNVRvb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qh3p3-00DeI3-2j; Fri, 15 Sep 2023 08:05:06 +0000
Message-ID: <d2b18801-6121-722b-42b9-379cacc14be0@samba.org>
Date: Fri, 15 Sep 2023 10:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Content-Language: en-US, de-DE
To: samba-technical@lists.samba.org,
 Joseph Sutton <josephsutton@catalyst.net.nz>,
 Andrew Bartlett <abartlet@samba.org>
References: <E1qgurV-00D6IX-Sc@hrx0.samba.org>
 <10fa91cb-8275-b297-5dda-458cd292773c@samba.org>
In-Reply-To: <10fa91cb-8275-b297-5dda-458cd292773c@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 15.09.23 um 10:02 schrieb Stefan Metzmacher via samba-technical:
> Am 15.09.23 um 00:31 schrieb Andrew Bartlett:
>> commit 5c580dbdb3e6a70c8d2f5059e2b7293a7e780414
>> Author: Joseph Sutton<josephsutton@catalyst.net.nz>
>> Date:   Mon Sep 4 13:20:34 2023 +1200
>>
>>      s4:kdc: Add correct Asserted Identity SID in response to an S4U2Self request
>>      I’m not sure exactly how this check was supposed to work. But in any
>>      case, within fast_unwrap_request() the Heimdal KDC replaces the outer
>>      padata with the padata from the inner FAST request. Hence, this check
>>      does not accomplish anything useful: at no point should the KDC plugin
>>      see the outer padata.
>>      A couple of unwanted consequences resulted from this check. One was that
>>      a client who sent empty FX‐FAST padata within the inner FAST request
>>      would receive the*Authentication Authority*  Asserted Identity SID
>>      instead of the*Service*  Asserted Identity SID. Another consequence was
>>      that a client could in the same manner bypass the restriction on
>>      performing S4U2Self with an RODC‐issued TGT.
>>      Overall, samba_wdc_is_s4u2self_req() is somewhat of a hack. But the
>>      Heimdal plugin API gives us nothing better to work with.
>>      Signed-off-by: Joseph Sutton<josephsutton@catalyst.net.nz>
>>      Reviewed-by: Andrew Bartlett<abartlet@samba.org>
> 
> Shouldn't we backport this?

Same for these:

commit ba1750082adf87a700711f7b99573434f50fc41b
Author: Joseph Sutton <josephsutton@catalyst.net.nz>
Date:   Fri Aug 25 11:04:32 2023 +1200

     claims.idl: Be more lenient in our expectations for the compression of claims

     384 bytes is not a strict threshold below which claims are never to be
     compressed. Windows has been known to compress claims a mere 368 bytes
     in size.

     Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
     Reviewed-by: Andrew Bartlett <abartlet@samba.org>

commit 571ff5f31411689e9eb67ce8df837e79bb1fef2d
Author: Joseph Sutton <josephsutton@catalyst.net.nz>
Date:   Fri Aug 25 11:01:09 2023 +1200

     claims.idl: Allow empty claim value buffers

     Windows doesn’t reject these, nor do we have any reason to do so.

     Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
     Reviewed-by: Andrew Bartlett <abartlet@samba.org>

metze



