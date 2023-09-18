Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E297A400E
	for <lists+samba-technical@lfdr.de>; Mon, 18 Sep 2023 06:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=B7P4zlOWyGfVobPYerpsKYAT8ukOcmiUwaVXu2rzGt0=; b=SCbE49h6G1mDDzAa//OXVRWK37
	58/rVewlIMzNwUm6gyuwpwmup+sAmG11OFqsb71bCMI2Mczmrv77XOQt39Gr1meKC9WZj7sH0vovf
	v+Umz9evyuWXKe0PDH2Gn1++Wn0iNlKfRYc86EcXmMg8nyJgufkwEw+l7ZlvA+q/qZV+uKuWa54Hl
	q6lTl2BMRgkBoKSojxPwQPBED+7lr/DjXfjdPtc3xD+6wOiIlrN+gP/XDEgXpjQ6uOyS42l4ONQHr
	D52fhoLhbzsGWeF8Q9bRm6vHU5wPslgOZ229kJsexpSzc3Pn/VMVoAYbWKVDshVVq3fjV301BIGRv
	9TqUbcbQ==;
Received: from ip6-localhost ([::1]:48778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qi5uC-0055B0-8A; Mon, 18 Sep 2023 04:30:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50724) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qi5u5-0055Aq-66
 for samba-technical@lists.samba.org; Mon, 18 Sep 2023 04:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=B7P4zlOWyGfVobPYerpsKYAT8ukOcmiUwaVXu2rzGt0=; b=IwS0tZCwlmZT6k1QQe02YysjCo
 F+/AEe7ax01yo3TvQo50vWh5AALUU2+5vyUhLgYqNdMaek43Isel60YvY+JknXj8UxeJBWeOMOn3c
 H4sGLwhKRMAB9/WVGzGmHHuEgWs+75gwrAXGy+EPniHRPbKrsn1/LU4ZWX+/zgBl7JoT5SrejAf8a
 RgrdhwXTTOwnH3qkkwY6VtwqDrJbJsEb0AGnCrygD2PJFTtD0FDrQQKWuYIDRv4+2mjZqV/SA99Ut
 HWSYEpqLGxQRudB6g7HP3dd0XmR1URTxf+H5GQPNJYsPLERHj0o70uupxv1zBrEb9dngHVqo/OJ0a
 FNEN2xXnPYO6MIkmYsdgJ9vrsjwgLJ3n2+12d85oFUxHbe6sIlnvt8v1nlhGyAsrOzVejl+GXEL7n
 uugB65UxO278Sj2iLka7ORDO3JnKAPF0vavtyY8f5uaWX+6ArCWnVDg6r6x/aj/tPG2Cw+ZYWYmYR
 KzHcMYUFETcZW3hma8oKF3gJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qi5u0-00E1Hq-32; Mon, 18 Sep 2023 04:30:29 +0000
Message-ID: <62b64347-9721-1f16-7b0e-5ee891a4e746@samba.org>
Date: Mon, 18 Sep 2023 16:30:20 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Content-Language: en-GB
To: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org,
 Joseph Sutton <josephsutton@catalyst.net.nz>,
 Andrew Bartlett <abartlet@samba.org>
References: <E1qgurV-00D6IX-Sc@hrx0.samba.org>
 <10fa91cb-8275-b297-5dda-458cd292773c@samba.org>
 <d2b18801-6121-722b-42b9-379cacc14be0@samba.org>
In-Reply-To: <d2b18801-6121-722b-42b9-379cacc14be0@samba.org>
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/09/23 8:05 pm, Stefan Metzmacher via samba-technical wrote:
> Am 15.09.23 um 10:02 schrieb Stefan Metzmacher via samba-technical:
>> Am 15.09.23 um 00:31 schrieb Andrew Bartlett:
>>> commit 5c580dbdb3e6a70c8d2f5059e2b7293a7e780414
>>> Author: Joseph Sutton<josephsutton@catalyst.net.nz>
>>> Date:   Mon Sep 4 13:20:34 2023 +1200
>>>
>>>      s4:kdc: Add correct Asserted Identity SID in response to an 
>>> S4U2Self request
>>>      I’m not sure exactly how this check was supposed to work. But in 
>>> any
>>>      case, within fast_unwrap_request() the Heimdal KDC replaces the 
>>> outer
>>>      padata with the padata from the inner FAST request. Hence, this 
>>> check
>>>      does not accomplish anything useful: at no point should the KDC 
>>> plugin
>>>      see the outer padata.
>>>      A couple of unwanted consequences resulted from this check. One 
>>> was that
>>>      a client who sent empty FX‐FAST padata within the inner FAST 
>>> request
>>>      would receive the*Authentication Authority*  Asserted Identity SID
>>>      instead of the*Service*  Asserted Identity SID. Another 
>>> consequence was
>>>      that a client could in the same manner bypass the restriction on
>>>      performing S4U2Self with an RODC‐issued TGT.
>>>      Overall, samba_wdc_is_s4u2self_req() is somewhat of a hack. But the
>>>      Heimdal plugin API gives us nothing better to work with.
>>>      Signed-off-by: Joseph Sutton<josephsutton@catalyst.net.nz>
>>>      Reviewed-by: Andrew Bartlett<abartlet@samba.org>
>>
>> Shouldn't we backport this?
> 
> Same for these:
> 
> commit ba1750082adf87a700711f7b99573434f50fc41b
> Author: Joseph Sutton <josephsutton@catalyst.net.nz>
> Date:   Fri Aug 25 11:04:32 2023 +1200
> 
>      claims.idl: Be more lenient in our expectations for the compression 
> of claims
> 
>      384 bytes is not a strict threshold below which claims are never to be
>      compressed. Windows has been known to compress claims a mere 368 bytes
>      in size.
> 
>      Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
>      Reviewed-by: Andrew Bartlett <abartlet@samba.org>
> 
> commit 571ff5f31411689e9eb67ce8df837e79bb1fef2d
> Author: Joseph Sutton <josephsutton@catalyst.net.nz>
> Date:   Fri Aug 25 11:01:09 2023 +1200
> 
>      claims.idl: Allow empty claim value buffers
> 
>      Windows doesn’t reject these, nor do we have any reason to do so.
> 
>      Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
>      Reviewed-by: Andrew Bartlett <abartlet@samba.org>
> 
> metze
> 
> 
> 

I don’t think we need to backport “claims.idl: Be more lenient […]”. It 
will make a difference only to testing against Windows, and I don’t 
believe that difference is likely to be exhibited by our existing tests 
in Samba 4.19. The heuristic by which Windows decides whether or not to 
compress the claims is always liable to be changed, anyway.

Similarly, I don’t think we need to backport “claims.idl: Allow empty 
claim value buffers” either. Apart from testing, Samba 4.19 should never 
be pulling an NDR claims structure in the first place, nor should it 
need to.

The first commit, “s4:kdc: Add correct Asserted Identity SID […]”, is 
probably worth backporting, though.

Regards,
Joseph

