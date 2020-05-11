Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF21CE4D2
	for <lists+samba-technical@lfdr.de>; Mon, 11 May 2020 21:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=B3bHNiPEpoyLl8bZ21YDt7Sw+QHpq8qq1erGpDeE/v0=; b=lT6vWBBGfo809JCEf1weCvDLJN
	4V2ZbBeJ1gb0CtT8em38dqbmgbTXIbLPpBhQCQUZXnUOFFGBT5uqPzxmuS8EXgX6TLaRXxlSYkNUt
	ekT1cDFTA+ZMcBe1eTYUE4/DCEx2nIQ3eXNMGVafNWdlO+ruEbhoLaDz4TJxW4Hg5rJKjsXYQIpj2
	BY4OVdlxac7w2SjlIHNRLL4AjfTm6NrRmoqWCPrWds4VvH+Z1CYUjXL+aTn/SU2phDWUsq0I7vda/
	4lV97rREws68aYecLWhga4tL/9tgUz1Cqetdg2pA6cpFbfqB1eMMQ1Y3z/15NQdQkXYL0y91da1CJ
	38aGt+TQ==;
Received: from localhost ([::1]:25822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYEVW-003tOu-1Q; Mon, 11 May 2020 19:54:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55370) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYEVQ-003tOn-Le
 for samba-technical@lists.samba.org; Mon, 11 May 2020 19:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=B3bHNiPEpoyLl8bZ21YDt7Sw+QHpq8qq1erGpDeE/v0=; b=0Ve5xRYLORsOtPyHrWJ/Ipb9H7
 hz8nyRLK3tal7/TEIkS7iia7zDNSS8JP2oF3SvvcSOrQ0Go4yuQe0FuB1Du2G7k2E9yrMxjoeO+1y
 9owVQTfw0MjLORGRfS15vwVMnFgFIN/VgIxcHn+RqfeLw0yrB4ZDhLafnAl2I6xQQb+y0r0b9WoMQ
 Bl+W4EzGuqakGpwBb/wGWp5xhS5uUgYKAT0VCzdU3kSml8ythlgMORC3Oju4piRCo4y2GQfdJWs82
 LJmhYJk+QUVIXCk8AfIo4YTuWLEJsiqyEtuy9wIn7sdvuWR+RLs1kk+WTZMaKUN92YKbrXXa6ZmpI
 hd4bXj+Ya3MLki1ejahEHgsHF0/qOgrJHACyFmoNgM4/CgUustyIPVZ06YkC3cru5luCfLqA6yvTT
 TmF/fYU8Zt56nHLTrO2N836+G68uj29XOsFMFIAFmBeW9UJr+XM4Ded1b8CA8/MhTn3fcwoDqOAFp
 MUaHGTO+JsXYP36p1qtaTiQ/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYEVP-0005Xv-SS; Mon, 11 May 2020 19:54:28 +0000
To: Jeremy Allison <jra@samba.org>
References: <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer> <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
 <20200508215055.GA2912@jeremy-acer>
 <9ba6f926-f0b5-6cd1-36f1-2ccdf1c8b5eb@samba.org>
 <20200509025010.GA9523@jeremy-acer>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <ea463fd4-0670-548a-f64b-275e5250a2f2@samba.org>
Date: Mon, 11 May 2020 21:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200509025010.GA9523@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="3kJTNENYRB7aNBYPQCmwEQYR13x6KBABJ"
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3kJTNENYRB7aNBYPQCmwEQYR13x6KBABJ
Content-Type: multipart/mixed; boundary="JBtKwf3aP9N1Ca4bDISYq35uVejvKn7P8";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>
Message-ID: <ea463fd4-0670-548a-f64b-275e5250a2f2@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer> <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
 <20200508215055.GA2912@jeremy-acer>
 <9ba6f926-f0b5-6cd1-36f1-2ccdf1c8b5eb@samba.org>
 <20200509025010.GA9523@jeremy-acer>
In-Reply-To: <20200509025010.GA9523@jeremy-acer>

--JBtKwf3aP9N1Ca4bDISYq35uVejvKn7P8
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 09.05.20 um 04:50 schrieb Jeremy Allison via samba-technical:
> On Sat, May 09, 2020 at 12:04:55AM +0200, Stefan Metzmacher via samba-t=
echnical wrote:
>> Am 08.05.20 um 23:50 schrieb Jeremy Allison:
>>> RB+ from me if you add a comment header above the function
>>> as well as in the commit so it explains what it's doing.
>>>
>>> Feel free to crib my ascii art to explain in the header
>>> comment too :-).
>>>
>>> Thanks for the cleanup !
>>
>> I'll do that on Monday.
>=20
> Here's an updated version with added
> comments inside
>=20
> [PATCH 20/29] vfs_io_uring: avoid stack recursion of vfs_io_uring_queue=
_run()
>=20
> so I could actually (hopefully) understand
> it if I have to go back and look at it in 5 years time :-).

Thanks! I've done some experiments with offset < 0 and it's not allowed
for SMB2 read nor write.

I'll post the updated patchset to the merge request shortly.

It would be great if someone could verify it with a 5.6 kernel.

metze


--JBtKwf3aP9N1Ca4bDISYq35uVejvKn7P8--

--3kJTNENYRB7aNBYPQCmwEQYR13x6KBABJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl65rW4ACgkQDbX1YShp
vVbDFg//fdX6NgkO/Y+2kZSzKNX7QtYa/wlBnrRKfHIsqmO29l6EUhNUEe16JSZQ
oHJHfRtYVEAvwQgIwBlplX6Z6wZxVkp4CAq06aARXDIptkXk0Ukq4jprgj2HDYh1
bJqkOZfQPcUBrIrrkq/soECnaiFs3Ex92YOw14z0wBGJuw/JMXXU5tHPF6DPQVNb
Hqm/a1DOUbvHoyoTqi9qMsu81EVq817InI7k9L76n6oUSNPZiQJ6xCzD2Ic1aLOH
C+YEbOtUlEaXTGBnI8IwHXxCrRHQZvvTxDYf3svVCQ0+M/REwSoh4e29q1zBSjjS
YS7KjImykXbOJGOwA0Qaz4Qh/yWDkdtDuQ+4M+81yQUTyboKRr8n1drOENQHh7ko
9c0q7czwXX0bg19PJAesUWyC68cfTSkUusgcPiGl036GKV19FhrmeVWz+OT6ZCUh
YRDsTMAe1XzPFfMKtNqXHcpVrW0QRtQdRJWXZMrGLqWo7kX5BerceOlfomErH9GY
ufQaITOij4WW/u5vTyxKAm06PH0Fjitu3xuo6i0XKFvMuv+cdLQpW2ri0BK8dVwR
2k9xfS534bKOFYNz+uSkzANu1ZUlmtEVM9ETLLAPRXu8qn+z08FeO/obaPFwCAFp
OtJ7bXBSJJNwD9fsWA/PWoq6qxHXAN7JsnMzjg55cpngMtiQR1s=
=t0wO
-----END PGP SIGNATURE-----

--3kJTNENYRB7aNBYPQCmwEQYR13x6KBABJ--

