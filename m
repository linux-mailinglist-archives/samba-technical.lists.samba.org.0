Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51192102DAC
	for <lists+samba-technical@lfdr.de>; Tue, 19 Nov 2019 21:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=IZiqlC0ng7S5REs3Ga91J9NxDJaFiX4k4cE/oleM9uU=; b=ljodKt/dulwLChHoOeAMGchMdN
	s8X0JvdpbdtZ6qmMEdqbMTSAc9bVx3U9CEJexRUpRdh40EKjpszmGdPYIPhj2WmoJWkVtJNaZB093
	MNQfAA1fGXkSp3jC5heHpvZRjvLdetHRx1NZ/m1anrLLHGh9HIUlmLwgm35v2mKzpzPepKUC1tymX
	xzNdG+rbZwlzQrjTaUyqwI/A9NG5olCa3R1zqtikVJa4TyiXOiGyEOR9mo7sC7MV7vI3tDh7pWlNM
	9cnuzLcN7mQvMGkIrpUG8WfKnH6WQ8IzFXjy9qSxkUPk4K1gokmmSZhn8hZz7urtXYkK633ZarGZC
	PlkrS/fA==;
Received: from localhost ([::1]:24932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXAK0-001fAp-LG; Tue, 19 Nov 2019 20:42:00 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:37498) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXAJu-001fAi-RE
 for samba-technical@lists.samba.org; Tue, 19 Nov 2019 20:41:58 +0000
Received: from [IPv6:2404:130:0:1000:295f:724:d9bc:f644] (unknown
 [IPv6:2404:130:0:1000:295f:724:d9bc:f644])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 326A88089E; 
 Wed, 20 Nov 2019 09:41:47 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1574196107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=IZiqlC0ng7S5REs3Ga91J9NxDJaFiX4k4cE/oleM9uU=;
 b=r/+W2RLF8T8/R7W1w6xkUcyPgV7flNLULDmn1Ov6v6tgi2OR8+N78n+pgdgwvWRboXuy0g
 6rhb5Okme8Kl1B8g1u9EFV8ytcnpAkNYqidb6AXVQFq++cPvQlVmT6SnNSJgMdx7U84bS6
 ObAbW/meMNT/QPmidAAqiGpKl7Qi4j+efCxY8VQ00UfUe9g36swXnxyv75eIpl6B1kyRc0
 cACXwzBI18C1hGQdmEY6MzwrlqIZib0FhsH3ED5Ow9RfsayYyhnQdvR/sNdW/zH1g66kka
 nUc6G9E2D4Cmfy9byy1TSGP3reSbH0icz0eo6rEOm6QgB3m/+rWOWbgQTaL7Vw==
Subject: Re: feedback on ldap improvement in samba 4.11
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
 <9dc8dc485f6bdf08823c5a86043c459c51ffd173.camel@samba.org>
 <230ee6a4-d875-d749-cb60-80eb8ecd25d0@catalyst.net.nz>
 <6d01a1c1ce4d79aff60db993e084cb1fe4697351.camel@samba.org>
Openpgp: preference=signencrypt
Message-ID: <c5d17eed-537b-45e0-3cc9-0a2d79f9c55b@catalyst.net.nz>
Date: Wed, 20 Nov 2019 09:41:42 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6d01a1c1ce4d79aff60db993e084cb1fe4697351.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="33pMGC78QoNshxGqesCaCJ672nOXmlVlg"
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--33pMGC78QoNshxGqesCaCJ672nOXmlVlg
Content-Type: multipart/mixed; boundary="zfHUjlnZkbmbk1bjocFVZYVIyLckARHpN";
 protected-headers="v1"
From: Gary Lockyer <gary@catalyst.net.nz>
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
Message-ID: <c5d17eed-537b-45e0-3cc9-0a2d79f9c55b@catalyst.net.nz>
Subject: Re: feedback on ldap improvement in samba 4.11
References: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
 <9dc8dc485f6bdf08823c5a86043c459c51ffd173.camel@samba.org>
 <230ee6a4-d875-d749-cb60-80eb8ecd25d0@catalyst.net.nz>
 <6d01a1c1ce4d79aff60db993e084cb1fe4697351.camel@samba.org>
In-Reply-To: <6d01a1c1ce4d79aff60db993e084cb1fe4697351.camel@samba.org>

--zfHUjlnZkbmbk1bjocFVZYVIyLckARHpN
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: quoted-printable

Sorry did not word that the way I intended.  I'm reluctant to
automatically re-spawn a new process when it's predecessor was
terminated with a SIGKILL.  It just seems a bit like introducing samba
process "whack a mole" into some poor sysadmins day.

Perhaps with an option to enable restart on SIGKILL and clearly document
the behaviour. Expanding the log messages to clearly explain what's
going on, would also be useful.

So a qualified Yes

Ng=C4=81 mihi
Gary



On 20/11/19 09:25, Andrew Bartlett wrote:
> We can't ignore SIGKILL, which is why the OOM killer uses it.
>=20
> What is being asked for is to add SIGKILL to the list of signals
> eligible for a restart in prefork_child_pipe_handler.=20
>=20
> Andrew Bartlett
>=20
> On Wed, 2019-11-20 at 09:10 +1300, Gary Lockyer via samba-technical
> wrote:
>> Yeah still a little reluctant about having processes ignoring
>> SIGKILL,
>> but given that we use the control pipes to shut down it should
>> probably
>> be ok.  It's just going to require a bit of thought to make sure
>> things
>> can be shut down.
>>
>> Ng=C4=81 mihi
>> Gary
>> On 20/11/19 08:53, Andrew Bartlett via samba-technical wrote:
>>> On Wed, 2019-11-13 at 11:24 +0100, Denis Cardon via samba-technical
>>> wrote:
>>>> Hi everyone,
>>>>
>>>> I just wanted to say how impressed I was with the improvement in
>>>> memory=20
>>>> handling in ldap server in samba 4.11 that were announced in the
>>>> changelog.
>>>>
>>>> I was doing some debug on OOMKiller issues on a Samba-AD 4.9 with
>>>> a=20
>>>> large database in production. There are some buggy softwares that
>>>> make=20
>>>> queries for all users (the most peculiar one I have seen is a
>>>> print=20
>>>> driver...) and Samba 4.9 properly handles the query but allocate
>>>> around=20
>>>> 2GiB RAM for the query while the client downloads the result.
>>>> With a=20
>>>> handfull of such queries piling up it can quickly run the server
>>>> out
>>>> of=20
>>>> memory.
>>>>
>>>> On the other hand with Samba-4.11 memory is allocated in a much
>>>> more=20
>>>> frugal way and it can handle hundred of such buggy queries
>>>> without=20
>>>> crashing (it may be slow but it does not crash). So kudos the
>>>> Catalyst=20
>>>> dev team for that great piece of work!
>>>
>>> Thank you so much!  This work started long, long ago when Simo (at
>>> the
>>> time controversially) made ldb async, so it was really nice to be
>>> able
>>> to finish the job and see the end result finally show in something
>>> so
>>> valuable.=20
>>>
>>> When we did it, we were not sure that it would help outside our
>>> synthetic benchmarks, so to hear the difference it makes in the
>>> real
>>> world is wonderful!
>>>
>>>> About the prefork model, the master ldap process is properly
>>>> restarting=20
>>>> the child process after a SIGTERM but it is not restarting after
>>>> a=20
>>>> SIGKILL. Is it normal?
>>>
>>> I get Gary's view about a manual kill -9 respawing perhaps being
>>> unwanted, but I agree, a re-spawn system that doesn't cope with the
>>> OOM
>>> killer is less than ideal, I would have expected such a process to
>>> be
>>> restarted (perhaps after a bit longer wait).=20
>>>
>>> Andrew Bartlett
>>>
>>
>>


--zfHUjlnZkbmbk1bjocFVZYVIyLckARHpN--

--33pMGC78QoNshxGqesCaCJ672nOXmlVlg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAl3UU4YACgkQei/9ZKIy
R1MKqggAmAiHWspuSxhzpUnnNH0n1x+SjBJJvOdXM0AWuIMZH7iWvHQEauLWxt4z
370ByVDec4Ln2osDE8fpHLa//bKKs5p4gxdbRYPJjwVsNonFsyxw+Yh3aurTTvYj
z6nz52WukePnQOmv4sM+t+KDw8iI5RZrLr+UXgK9xUyJMOUt/oAK31+cxjuObEPR
o6w4oMLaCAL1Sz1ay2gKC5Gk0lwR3g4WGjPBMtCqbLgFRT8ICl2IGd7ocZq2Z455
RTT3dicG3JDx3DdBEca25sFkEk7V2x3SuBYvM36Fqw06lyPLkhTJALWMC8zbRnDQ
hwqwY1SVBHL/FlHvwfnTTXgR/oNa/g==
=P4jk
-----END PGP SIGNATURE-----

--33pMGC78QoNshxGqesCaCJ672nOXmlVlg--

