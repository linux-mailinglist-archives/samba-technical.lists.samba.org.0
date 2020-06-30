Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018720F96E
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jun 2020 18:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SXCRfKl6xVLKLMjcM/07fo8fpguvBJ0YwZQ7iYaLquQ=; b=uy5sm4mprZ1tdPasVtGVzRi6Pw
	7/gySsAVr/POZvusS2+b3bb+tmfAphuMmYu1atZHn3hGOmYtehgJRd1oVeE63AuB4Vg9gcWx9JW3N
	OjSXmEZwx8dqb4uRJ44Nk7X1ORmFGBfdrSr0R6hOczLY5iL8BDpemD/cDvLQg8AIicIoKPXyz6j/8
	xYW/mPkgcZFF3N/aeo/oluVvdxA+mtYvALLGo4TVQNDhd0i8ka8X5fLMKyy/o2Vdp31KCmG7n/bXP
	gVIW4Qr06qUUBmPoCWjMSqwEHHFoZirM7OrXidHwi3ca81NN5b+ySIcDcTgRrSzmgZ1vrwZavothB
	lfD5fxXg==;
Received: from localhost ([::1]:58568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jqJ7l-002nrg-NB; Tue, 30 Jun 2020 16:28:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41204) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqJ7e-002nrZ-JW
 for samba-technical@lists.samba.org; Tue, 30 Jun 2020 16:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=SXCRfKl6xVLKLMjcM/07fo8fpguvBJ0YwZQ7iYaLquQ=; b=V0FCAhClP3uqX3kJHgDbSSqWx+
 Q+juzF12Emvs7LQ+UJN/jrxUpZa/CzXVnUSuX+AvZmJaghOKZlXKP8szvr08RT4+hyMTr6+6FxO/O
 uHfmhBUDlJgbEm8oj7JLcLLVAwOMdoGwmDFSlm5v903KqqxHvm8n8ojUHmNBBScFYtCSOZTG6qSxJ
 W72Wp/R3XrxIMr8E5xISQGR6met5R3lE090JIvLdmvu1nSv4JMlagDarFSv1+NK+4CCmlq48uL3SJ
 C+uKF0IXwoo/a6uVpmYIOKW1BpVFMLaxdJmxWvir4pYwY9bKLDIH8dOgf80wTcVXkkdQs+yUvzxC7
 dx6zAacS6fLkTz357CuhSKA2BodyPX4lhkjTKs2nGTRokJaC2Z3SbxVwoEOgi2qhm+rS0LmZYmH2s
 /RKSvydacLYSb6FQ8ow2K8Me9LzXh+bgX5nL1UNesPgNxEvhRqEYuBOYHH1aorGouYxXdfx2L4kpk
 sdD+e5gs006smYZ+caOMQtgn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqJ7d-0001v6-Nx; Tue, 30 Jun 2020 16:28:37 +0000
To: Anoop C S <anoopcs@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
 <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
Subject: Re: socket-wrapper fd-passing
Message-ID: <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
Date: Tue, 30 Jun 2020 18:28:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="OcaWbeaJAsbETISIKVQOqzOb2WvWuUI84"
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
--OcaWbeaJAsbETISIKVQOqzOb2WvWuUI84
Content-Type: multipart/mixed; boundary="Lfr5MrfTllUtlomiXXlSmTh1XVvd0GWda";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
Subject: Re: socket-wrapper fd-passing
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
 <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
In-Reply-To: <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>

--Lfr5MrfTllUtlomiXXlSmTh1XVvd0GWda
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Anoop,

>>> I guess it means we would need to undo some of the changes we made
>>> to one array of socket_info structures.
>>>
>>> I'll let you know if I get the basic passing of information via the
>>> tmp
>>> pipe working...
>>
>> As Samba does not require that the socket is usable from two
>> processes
>> at the same time, I guess we can take a short cut and just pass
>> the socket_info structure (an array of them) through the pipe.
>> That would allow us to have multichannel tested in gitlab/autobuild.
>=20
> I am looking through your changes and will let you know in case I need
> more clarifications.
>=20
>> I'll see if I can get this to work. Once we have these basics,
>> we can try to improve the design to be more generic with shared
>> structures, when we really need it.

I made good progress, see
https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing-unix
https://gitlab.com/metze/socket_wrapper/-/pipelines/161689331

And for Samba:
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/master-multichannelhttps://gitlab.com/samba-team/devel/samba/-/pipeline=
s/161691424
https://gitlab.com/samba-team/devel/samba/-/pipelines/161691541

I'll add some more tests tomorrow and debug why some samba tests are
failing...

metze


--Lfr5MrfTllUtlomiXXlSmTh1XVvd0GWda--

--OcaWbeaJAsbETISIKVQOqzOb2WvWuUI84
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl77aC0ACgkQDbX1YShp
vVbdNw//XqnV+PoaHOAfBo5qZ2WOzaRaUdRZw46ZalhrZJ0aAKN+bysvGWsbnWFx
OByAuorz8MOBAyYb0Qx48R/WKCsFMj46d9Zx2OMBCQ4mpmuAM1gRCH24rFWNFWkX
b1zaGdXXY276u2llrVEZZL2p6JtSgUkqCBnkRByrV+fC87/P0xYU3ziDCvB0goUQ
wkhe+s4PV/w1Rg06N/Xk+uTSJO/SaiECc5t78gzqH7Byg2genf5r4lRZhHOKAqWh
DHnXKQTvMzi0uNtjVX5Zy07agJBU/+rhI35mqrPYnhmN3BcQUCtzmfU3o1S55nG5
3qo00AHodnOqJ0lmAHIFb8IHPW+mZvROZ58ZAvi77F4IDeoGLoIjJcpybU53LY0i
a1PcI8txv3FYQfHBzPGN8Y9bR7E2uvBpTvrdYIvAOlbqCgYOZUGZt1984/cPQAQx
AsVB87vOJGTJ4awi3TU+9ItX6+8ciHpUbnYfhPJtthI2U3NCP8YeuCRSKUwVzrOu
SAEboLtmU9ge3RC2pqhVqIW+NGwwV82IlmX/t2kPVlwgfjRhCqOk77T3BCLYCakq
wzaO9x9V92EMeXPBC3lVKvGP9WSkJf1aSsYt9xINPy9y1wqrntaMLol46ZcU7op2
ujls6xFgSJ2CutAVT3JeyVJSBZqm3GUafj5fGnjaWLy5piIibgM=
=wbg6
-----END PGP SIGNATURE-----

--OcaWbeaJAsbETISIKVQOqzOb2WvWuUI84--

