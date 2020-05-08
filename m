Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F11CAC53
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 14:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=cYZfo/Tk0R+8ROQxoLSKDVXzww70qpz17yCAEWeu72U=; b=EVamnvTAUH+II1sLHyE/LEKCDK
	jIsLYr2097NbJ1NsGjxs3Esf9Om1sS5mw+NeoN096HxuWzhyhHejdxp4XMTx7oYYtxVc80hrZkyJo
	IfE4lhyVrmVMnV+QcVMBC8n3QoPISTci4+UBQsXoX4uo7uvIRSRSh3Dcud7g5rAsgx7WWMCAR8rFT
	1cSOK6+7PuuyrdfWQjrO0cEhzJzg8llq7sSQBJFN0umOGFbGsWu8Pq1VAWGOnA58vW81cT0hZpj+M
	/7W7OnEDipJbnCWDZXzUO6e4rd8WbHdNkkkK7I9XuLuHnnIMTw+3YbT+z3deZUhQpzxotrE+sIoo2
	rCXQMF7g==;
Received: from localhost ([::1]:61622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX2V6-003Eno-3N; Fri, 08 May 2020 12:53:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX2Uy-003Enh-5e
 for samba-technical@lists.samba.org; Fri, 08 May 2020 12:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=cYZfo/Tk0R+8ROQxoLSKDVXzww70qpz17yCAEWeu72U=; b=rbg4tsz8/wRaJLWh0UqyVTNGwM
 eL3jd7jeuNQiKHza/NThI4QL07D+0VPIPYpuvoXIAnYX0IEvgwm6Bxf/c+ZHWrcddrGvOGwezwrVy
 yF5kT21kl+HVpsCcHkF0Wvnhss8MA74nONAMPJ3i9pZOV3DWPQ1dfeYP5LRSIcEXjbPHkiVKuL+f9
 gcF2bSAgqiSWmTd1vwYYnjWX3FO4bJc1x5tdpljeGTXQ+t8qCviXTzN4QzQbB6/RZnIskMsh0HcVp
 Aba5Mu/Y1HzEQmDwVW7dYguamV9SZpwHK4Xui3V9x+fMHfTk61bpye/ujlwujRb8i5iQk4ssHMwBL
 XcUknWrsJQGuWtznO6APm1WGfcNTWXRoBrl4s6V5kKP11sPu43YiF1xCmiYOAqWxhdxQjOiarV0fN
 RQIKKwCLT0+bTXUI1az3MJVJDILvmB4g2JrnwKSF/zgScpjDAnU1roZNpRjaKka7okT96flZPaq2g
 YITbGSqvsCnMU8rdfBralTQW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX2Ux-0004Pd-EI; Fri, 08 May 2020 12:53:03 +0000
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Anoop C S <anoopcs@cryptolab.net>, Jeremy Allison <jra@samba.org>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer> <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
Message-ID: <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
Date: Fri, 8 May 2020 14:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="IGUkeWzYSyLuEm3ZLvx6Q32nyP5CfthUi"
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IGUkeWzYSyLuEm3ZLvx6Q32nyP5CfthUi
Content-Type: multipart/mixed; boundary="mnCD18tzXBaRNODVPrKaUw0ToFKA8LTJp";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@cryptolab.net>, Jeremy Allison <jra@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer> <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
In-Reply-To: <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>

--mnCD18tzXBaRNODVPrKaUw0ToFKA8LTJp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 08.05.20 um 12:02 schrieb Anoop C S:
> On Thu, 2020-05-07 at 23:27 -0700, Jeremy Allison via samba-technical
> wrote:
>> On Fri, May 08, 2020 at 10:39:38AM +0530, Anoop C S wrote:
>>> Your patch fixes mismatch in SHA256 checksum of 100 bin files
>>> copied
>>> using Windows explorer in my environment.
>>>
>>>> If so I'll fix it up to be production-ready,
>>>> (for example I think I can get rid of the
>>>> immediate event useage) fix the pwrite case
>>>> and then cut it onto bite-sized reviewable chunks.
>>
>> OK, here's the "production ready" version.
>> Gets rid of the crappy immediate event.
>>
>> Still doesn't fix the io_uring pwrite issue
>=20
> Just to mention...
>=20
> ...at least copying good set of files into vfs_io_uring enabled share
> using Windows explorer didn't cause any mismatch on final SHA256
> checksum.
>=20
>> but if can confirm that this version also fixes
>> the problem (and it's a much cleaner patchset :-)
>=20
> This patch set also fixes corruption with copying of files from
> vfs_io_uring enabled share.

Can you please also test the patch I posted here:
https://bugzilla.samba.org/show_bug.cgi?id=3D14361#c21

Thanks!
metze



--mnCD18tzXBaRNODVPrKaUw0ToFKA8LTJp--

--IGUkeWzYSyLuEm3ZLvx6Q32nyP5CfthUi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl61VisACgkQDbX1YShp
vVZYVBAAw6VovgwqMFJxfvTgm1wemJCQQhqRX99MculSs9drNagAuuUoo2RAbx4l
Fjc+kU8g3CFXvG0cDmoEoBxYLuFJgFZTx8tddBJV9bHx8YdrNAVVim4ub0mErmFC
6WJEgE/5HDT6a3MJZ2xlC7E9UA1jTXKXjsH/ZYci/umeoZS4MwI2GK7reWgNFIw7
17MgIcPwlhsLi6DRWn4Ybjva36weTgsKUmrvbUjLJzbKczzzctvK1TWS8E3T7+ag
6o8uXp4RlVYDLHi0rBW4GJa7ENvC4XwX1TA1wtzLiIiGfU6v9w3JeC9OefCXUBt8
BxwVzCmv9b8l28hvVn066JlMhC5m0ih2MmZWXQax0xFIj9xq/kKQipYkHCPPY0JT
G0BK/CqQLPk1aOyEPwxQ4uBRFfOYf7z6dCKUo4GHsbkLk7UY2cuqGg1n+G2e6iCq
vKcsNtrQLFevEpVIg7tU6KPnoN9D2vTLPGvCFicTmMqR5lZbsdZokJzzUoQWcYzb
uOYWU8G/1bAImJ8YfUSL3iJtvc9sx+bXePRat26ff17WUAqWy8qUusPTYUkIz6jw
A2bNTVNdqGOHmu43UoSRPquBx4pZI6taM6wbOIzDU81iaw/oUH9wIGfxXjnfN/ho
kDpTJR7cKqIQGGIqY6SnSoNbx2vX39abBztnZ4Y8ijr/do0SOZw=
=lWgq
-----END PGP SIGNATURE-----

--IGUkeWzYSyLuEm3ZLvx6Q32nyP5CfthUi--

