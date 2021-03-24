Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA63483A3
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 22:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HDN62dQ4zm+Rf5oPqjexKKUAkND5i0mk1tvUIjzCJkI=; b=l5Lh4rQveIkOuyT4vSPKaw0Z1P
	evnjT6KPHUl2DRxn8LixYWJg3VtEUckIiDPhTa/dVHycb/9kmBiDv2vgh1C9bazM27NrBRFsbsJ2T
	zZkumZMDxTKUTZNo/pTBJ9hBR4ubWD9kqpOUx4/XU5PeRWzMDgD7EJzsofqMsFwLDzfCK4FKsJsJ0
	ar8It5TZNbaJmPTyx9W5dRX8hokWaurWzbRZvNsQGgJ7vobWY7v0Oauaho2AivbPfiASztI11uTw/
	mC8R4eH3/1f92R/ZEZvM4K9LVXonpf9hJdAzt8Dkwscw/7eVekIpYQgFhH+SGLL0wKl1OojsjsJRV
	Bf6vPQAg==;
Received: from ip6-localhost ([::1]:59982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPB45-006fXX-NF; Wed, 24 Mar 2021 21:29:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPB40-006fXQ-02
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 21:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=HDN62dQ4zm+Rf5oPqjexKKUAkND5i0mk1tvUIjzCJkI=; b=PI4wDYmcaLzOM80CicyJYqMHSe
 xUBJ3eUCKspUQ9ZB0Y82OpuhXDVPLrr0TsnVzgYfaV4+H7uxhgDc9uQZMG7Ce2k72L0sOBA/fl39R
 Nh2xndoWoBuahlXUOkK0JjPM+BzG6PLgHZB9f96QZQRpXbie496rsWoD+YsILRspBoGhWwDCqogy4
 WF5N9Iqa6IWNerO7IK4a1fWVkX6AOIo1eK2xiyD7Y0VPBDIeIzHHk8fyj56kkNBPUd0GLtFHWUDss
 2SGBEGJbTyzz8IPKKZS4UPSXEj2WW3zaaQ+0EGJ+1yUYSnvw6AvYiqoWlqAyROesJrcfSzpmhtdsJ
 TMnFKwUBsDgeRiTa9pK4kPJ6s4NGBZhW3NaVJM4D60nYi5f/LvZnGkVzKIz4p3+7BsOlbhZ8UZ2ML
 jnywppxLIflUIup3cPonhg0c9AadOGb7vN4YBorxPoNp58uzoJxCMbepu1nHRSza5lxlAJpjmR99k
 r74Vv3xv866HtAUB8H/6nAsK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPB3z-0000OP-0K; Wed, 24 Mar 2021 21:29:15 +0000
Subject: Re: Drop NIS support
To: Rowland penny <rpenny@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
 <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
 <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
Message-ID: <a76c4d92-4b3a-0d42-15eb-aea8951781da@samba.org>
Date: Wed, 24 Mar 2021 22:29:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="U3nGj85X1uqVzchP9Oc4raWLsDUep9iFq"
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
--U3nGj85X1uqVzchP9Oc4raWLsDUep9iFq
Content-Type: multipart/mixed; boundary="x6GZM2C93GyRzuYyAUtRePo9nHmRqRdvt";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Rowland penny <rpenny@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
Message-ID: <a76c4d92-4b3a-0d42-15eb-aea8951781da@samba.org>
Subject: Re: Drop NIS support
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
 <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
 <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
In-Reply-To: <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>

--x6GZM2C93GyRzuYyAUtRePo9nHmRqRdvt
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 3/24/21 um 9:44 PM schrieb Rowland penny:
> On 24/03/2021 20:23, Andrew Bartlett wrote:
>> On Wed, 2021-03-24 at 20:16 +0000, Rowland penny via samba-technical
>> wrote:
>>> On 24/03/2021 20:11, Ralph Boehme wrote:
>>>> Am 3/24/21 um 6:57 PM schrieb Rowland penny via samba-technical:
>>>>> On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
>>>>>> On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-
>>>>>> technical
>>>>>> wrote:
>>>>>>> On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider
>>>>>>> via
>>>>>>> samba-technical wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> could we drop NIS support for Samba 4.15?
>>>>>>>>
>>>>>>>> This means getting rid of lib/replace/system/nis.h and
>>>>>>>> yp_*() ...
>>>>>>> +1 from me. Let's see if anyone else is still
>>>>>>> using it.
>>>>>>>
>>>>>>> So the current list for 4.15 will be Tru64, HPUX, NIS.
>>>>>>>
>>>>>>> Any more for any more ?
>>>>>> Just to be clear to others, this is not the so-called NIS
>>>>>> support in
>>>>>> the AD DC which at one point helped Active Directory Users and
>>>>>> Computers managed the rfc2307 user attributes.
>>>>>>
>>>>>> I'm happy for the real NIS support to go.
>>>>>>
>>>>>> In terms of other things to trim, what about some of the
>>>>>> printing
>>>>>> modes?
>>>>>>
>>>>>> Andrew Bartlett
>>>>>>
>>>>> How about idmap_hash ? The one that says 'DO NOT USE THIS
>>>>> BACKEND' at
>>>>> the top of its manpage.
>>>> ...unless you know what you're doing.
>>>>
>>>> There are folks out there using this at scale so removing this is
>>>> not
>>>> really something we should consider.
>>>>
>>>> -slow
>>>>
>>> Well according to the manpage 'DO NOT USE THIS BACKEND', they
>>> shouldn't
>>> be using it, you cannot have it both ways.
>> Rowland, the 'on new installations' is silent, but implied.
>=20
>=20
> It might be to you, but to a normal user it isn't readily known.
>=20
>>
>>> Either it shouldn't be used,
>>> or those warnings need to be removed from the manpage.
>> The world is not always so black and white (and would be far more
>> boring if it was).
>=20
>=20
> You are entering into dangerous waters there, you are not supposed to=20
> mention what you mentioned =F0=9F=98=82
>=20
>>
>> Andrew Bartlett
>>
>=20
> OK, how about this, I rewrite the idmap_hash manpage to say that it is =

> only retained for existing users but must not be used for new=20
> installations.


nah, it can be used for new installations just fine. I'll try to look=20
into this tomorrow and discuss a better wording with metze.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--x6GZM2C93GyRzuYyAUtRePo9nHmRqRdvt--

--U3nGj85X1uqVzchP9Oc4raWLsDUep9iFq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmBbrykFAwAAAAAACgkQqh6bcSY5nka5
uA//YsOY/88M9vD/3m/rPeyAdevZRkaGT0RQIAn+ihBmFACOx6vkJHNl7v/Eg192QNATmZ0phMUp
2ebUQLkGjOruqQO7H+4UZefBFUaisKA+dFpIDYU8YufLVbPxCeYd8ZB/1Jo0ZkepDSo3b797oZBj
EX9ym5X1EMvZ+x+x57emAnmJEX0YDG7wxNNAbtsa61wHKYaQi+b2cGQ98DlaZgajPuwe3lgJrsuZ
Z1NG7qTtU/N2huDxk4lGmPlWOAxeKcZiS43rUDvhJ3gRYPSCf3Vg8/rMGozNEF6A2JS4ytPXrwpk
0TVmpUfqZ/iEJdx/K+bXj+2R1JPuTQYI589g+/kvbfPg/HPsSCVJ9N8xxEPpsvmDPNmawRSsX0UE
z7uz0gkGyQNX6x8v3FzrtDinNU8p8Wl5MYAEjkU+NB/epZj++ZVwsrpVU2XSlBrhmpX+3uragQA/
21q0+zG2JBG6yUuOMwekzZlzrllUrQzRdckFFabb0LxC7PtO2ZII0kOIaWlTs5/DeK6vyrqaiyrO
9TPYWV0IlgEX+p1zHXCeWHRGRkl6fxafqpFEfA1KvpYiG+D7ueOH5qadIwUCe9BGxnZzOy3GbrR3
FqPF+I6DFWRPbOe/dctwajOklQMA5awcGmziG4l3Y1b7M5fVcUcSPPdshxL+sBb2s9eCItqah2vg
mBs=
=VaDM
-----END PGP SIGNATURE-----

--U3nGj85X1uqVzchP9Oc4raWLsDUep9iFq--

