Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E334829F
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 21:12:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=A3CTIzpsy8N2dS99kYKyKu9PtxTFY4irzFKcSsFP290=; b=WB3Wd+iCr4dsFaVTE+sA4Qv4cC
	uco0jkpPDSmsFMef9CQvV1GMqDC7dGODAU/shAqzE+i5POGTyQCDoEyCv5qokLYBx+XEYx9vIQXUm
	uTOnaOagu/bKi3JFvv9EiGG8NeGwgqSBtcjLbw21v5o1xHT/euPlErC/OhABsm7qF1JtvQs8m0dxQ
	6b4KJbTHLPRToK2kHiGfKGtu+MOj0XTwEu6XnG8r1TVhRa5jly9U+yG+85MjOBZDuMEE3cMSLK9PN
	CatJByBbpH1Pyh5fIssiYA0d2fvjRfCCqSA29SXNsBDQNilvKtGW9fcT3PPYmAJamkhH3+gPwdSaP
	iShze3Gg==;
Received: from ip6-localhost ([::1]:48924 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP9rH-006dya-NF; Wed, 24 Mar 2021 20:12:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24922) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9rC-006dyT-7C
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 20:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=A3CTIzpsy8N2dS99kYKyKu9PtxTFY4irzFKcSsFP290=; b=0eqHLyj+0R7enOvv6yGoANVDUt
 lGoTcZplat33no1+RjnJe9T4i5CVDWulz269z5d1UlIesY7qFtxnVFRP68wl/DpPV3wka/apVXNZW
 Ct5lKRlVRlMqGCBPKKwS1eT30wwXWPqWQs3CRInUS7jWRdgpfbcL66e1YrWhYMBIh13RmtQyMqfip
 mTJ3ZYsweA2dvVhUTKwmvMel/6kGPv61S5MKHDRN84Xi4/7H95ytczNSp+NmgiMciH7BYJuNO48YO
 pHzCWWuRg8pgEExMXyhexJlXVWKELm8X5MlAaQWaf3xSoF4wYMMY6DqNi9fAXTbYg4iKRiaVlAZ4s
 Sb5bYJv53eq3sqejMhekeaAjNX1MSTyq/zdrJit6SIzMSLHRzdd4QloYdrFLsrLQH1kFEWsjaLwv4
 yVbDC8Mwauv190+r/KxIuSBa4sddWJHo+Ccai+0XoAdNhx5aFBJ0jefjiFfb6v7dXi59bllZy2/Qz
 fZlFOgYcTjmgMPZBs/rBFfvz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9rB-00085i-PZ; Wed, 24 Mar 2021 20:11:57 +0000
Subject: Re: Drop NIS support
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
Message-ID: <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
Date: Wed, 24 Mar 2021 21:11:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RhmGO2mZyDMjaMXuBagFXxls7dzOODRVT"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RhmGO2mZyDMjaMXuBagFXxls7dzOODRVT
Content-Type: multipart/mixed; boundary="AaLQRnip13ZHQfTOdW1OA7RnHHcXIV6PT";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Message-ID: <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
Subject: Re: Drop NIS support
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
In-Reply-To: <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>

--AaLQRnip13ZHQfTOdW1OA7RnHHcXIV6PT
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 3/24/21 um 6:57 PM schrieb Rowland penny via samba-technical:
> On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
>> On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-technical
>> wrote:
>>> On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via
>>> samba-technical wrote:
>>>> Hi,
>>>>
>>>> could we drop NIS support for Samba 4.15?
>>>>
>>>> This means getting rid of lib/replace/system/nis.h and yp_*() ...
>>> +1 from me. Let's see if anyone else is still
>>> using it.
>>>
>>> So the current list for 4.15 will be Tru64, HPUX, NIS.
>>>
>>> Any more for any more ?
>> Just to be clear to others, this is not the so-called NIS support in
>> the AD DC which at one point helped Active Directory Users and
>> Computers managed the rfc2307 user attributes.
>>
>> I'm happy for the real NIS support to go.
>>
>> In terms of other things to trim, what about some of the printing
>> modes?
>>
>> Andrew Bartlett
>>
> How about idmap_hash ? The one that says 'DO NOT USE THIS BACKEND' at=20
> the top of its manpage.

=2E..unless you know what you're doing.

There are folks out there using this at scale so removing this is not=20
really something we should consider.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--AaLQRnip13ZHQfTOdW1OA7RnHHcXIV6PT--

--RhmGO2mZyDMjaMXuBagFXxls7dzOODRVT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmBbnQwFAwAAAAAACgkQqh6bcSY5nkbx
BRAAp5DPWRcmanI6bPRBi+lvM4Yw4oNJSvTkge9Jnx5LcuSQCqAWtlDRURw0wyKcKTc5FIrjFmls
Lea/24Qf1t48Ui//zbqUzdlu4kE2mzdxRmQZbyNq3wTzrIhQIvIcQPP/b2TFcB9wa9H69qkEoKsu
4+v3DSDodN4XxzDDE7V/Ma2p4eQZS9V+iTBXS1UwX/6aQsZ+u//pCQznra1xOVksJTGxsKRpfTqV
zt1xC/kgZqyrhkXfuZawJZowk2E8g/NwyNS9XNPEmF5Et1QxSoIVbEeAOpAXbE11d2mF9uEZ8i6f
k0gxiJDzdGPbTe/KPG04ZhTbysj11EVfBFKODXSjUgIlMZqEHrvzmOLsfig0w0z42CNkleJt2RWC
lmEpE37CglrNyl8GLQ3ufwijbDKAKN7UClB8pBMJY4I083FRWFpCWLS6Gqn83POKbbTx2dpqa1AQ
LhibgOgPkbHPqI6xxIpWdVCTMjaWG/8IjGngI0SkybJdFZ4rUOQdVS1A9mXSvp7AE9c9eE5XYALI
JxhO9HnN2QQThpB3JijBn4JOhXMsOXtaeINt92JpMfqJfkrFMcMKEXOb3mLPhGJAv0cqlAVegNQ/
NxTAtBYHh/TQf74AjtXoUWLMwvlk/1ghYSPqFEMrtLzTrMwDPlLEwMwWPSuw69Gx/596j0PzQa5b
S9o=
=pe5x
-----END PGP SIGNATURE-----

--RhmGO2mZyDMjaMXuBagFXxls7dzOODRVT--

