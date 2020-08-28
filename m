Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5B2555F3
	for <lists+samba-technical@lfdr.de>; Fri, 28 Aug 2020 10:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dFNX8pd9IrQ8fvxjTPDdJGngZqHPauxslDMEnxUTHhk=; b=Phc+mMR8DPTxMUitIltp4k0/jI
	ER2RBaN17G6ZfRlH/GwjK5s8Hqu9WtFOTMO/Jp6/EnFA954alN6+hhucf1tE9VoOKjywyUyVjha/4
	Rk7rokWAK0PRXqhXt7ODaKH1HisFcIADmsshyTrja4uzer+vup6hmC5LYu/uNR4cMtH4cOpXNsus0
	mAJUAy4tkvnzRJ6B90HgOtFkk9iPHjDvb8i/lZyQeyEbkfP3WTicB4dyJYoGslHdyyUSRFBHskXo4
	CPsIh99K1f9vVcsTiVYqMD1TeIPavON4UtQ3esYUgV61T4Kqapy3q8ua6a0SMqVA+CH+fE3s/9v+P
	zngeM9HA==;
Received: from localhost ([::1]:31028 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBZOP-00146F-PH; Fri, 28 Aug 2020 08:05:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBZOK-001468-E5
 for samba-technical@lists.samba.org; Fri, 28 Aug 2020 08:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=dFNX8pd9IrQ8fvxjTPDdJGngZqHPauxslDMEnxUTHhk=; b=cXhn4U6zbFX+DMa7KXyKM6y/oS
 wm0WSQhXVda4aZXYQA53a3m8whjp5KHZ9MsLnKEtmXsMubllf6JK1kBFcYsmSYd0SKuGLVpt8/pDC
 ruumhO+80C+WXsKjN9e2NTIg9611tiTGe2CF1lapibwZ3R7i/2dhrJeRdFKFzs8lJd+bPm2E/vzuX
 6aT3CBzD0nRS/uEdCdRwnlxcuyq+exHDvAzvYutXlpUC/BjQfvghWQJAsH5iLftWg/j4uRr9NmtJj
 0ey5Y790ZTLpMOAfM/xz6jZKl4KBIpcdyv0Dnb7YtkxWsUksiOAuH1BttXLnCbhCrCajxqpolHP/3
 GvfFScNP0gSLdM/qDqmxGwm1qczdacjfF6KgzthquzbuxkhpWVJGTFsbdPb1wey4bp3XGA26WDO/R
 uIesXJY8vU/C0xZxbTrdGWGpng2MsZGUg0VTM1Rc7Djzd6lmdjbHYzomeozxYfVlyB1otdgrO2qyI
 /Qv2mOZqicbMfXA/GoC8N7fn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBZOJ-00022T-Kk; Fri, 28 Aug 2020 08:05:43 +0000
To: Anoop C S <anoopcs@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
 <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
 <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
 <9208357e5cb0d33ef1a4e6e021341edb41ce6c80.camel@samba.org>
Subject: Re: socket-wrapper fd-passing
Message-ID: <779c563c-19d6-4299-cf03-29fb655699ff@samba.org>
Date: Fri, 28 Aug 2020 10:05:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9208357e5cb0d33ef1a4e6e021341edb41ce6c80.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="LaNHheXj8UIILdAdHGuwkPdFl9qxIC3of"
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
--LaNHheXj8UIILdAdHGuwkPdFl9qxIC3of
Content-Type: multipart/mixed; boundary="1MG8tY75cDTseJdUiIF05KHM9xJzdUMna";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <779c563c-19d6-4299-cf03-29fb655699ff@samba.org>
Subject: Re: socket-wrapper fd-passing
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
 <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
 <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
 <9208357e5cb0d33ef1a4e6e021341edb41ce6c80.camel@samba.org>
In-Reply-To: <9208357e5cb0d33ef1a4e6e021341edb41ce6c80.camel@samba.org>

--1MG8tY75cDTseJdUiIF05KHM9xJzdUMna
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Anoop,

>>>>> I guess it means we would need to undo some of the changes we
>>>>> made
>>>>> to one array of socket_info structures.
>>>>>
>>>>> I'll let you know if I get the basic passing of information via
>>>>> the
>>>>> tmp
>>>>> pipe working...
>>>>
>>>> As Samba does not require that the socket is usable from two
>>>> processes
>>>> at the same time, I guess we can take a short cut and just pass
>>>> the socket_info structure (an array of them) through the pipe.
>>>> That would allow us to have multichannel tested in
>>>> gitlab/autobuild.
>>>
>>> I am looking through your changes and will let you know in case I
>>> need
>>> more clarifications.
>>>
>>>> I'll see if I can get this to work. Once we have these basics,
>>>> we can try to improve the design to be more generic with shared
>>>> structures, when we really need it.
>>
>> I made good progress, see
>> https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing-unix
>> https://gitlab.com/metze/socket_wrapper/-/pipelines/161689331
>>
>> And for Samba:
>> https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/h=
eads/master-multichannel
>=20
> Is this still the up-to-date branch with socket_wrapper changes pulled
> in along with multichannel tests enabled?

Basically yes, but it also has some unrelated stuff in it.

Here's a subset of it just for socket_wrapper and multichannel tests:
https://gitlab.com/samba-team/devel/samba/-/commits/metze-multichannel

>> https://gitlab.com/samba-team/devel/samba/-/pipelines/161691424
>> https://gitlab.com/samba-team/devel/samba/-/pipelines/161691541
>> I'll add some more tests tomorrow and debug why some samba tests are
>> failing...
>=20
> Were you able to complete a successful Samba CI run with fd-passing
> changes?

If I remember correctly, yes.

I just started a new pipeline here:
https://gitlab.com/samba-team/devel/samba/-/pipelines/183002136

There are two main items left to do:
1. cleanup the socket_wrapper.c:
  - struct swrap_unix_scm_rights =3D> adding a uint64 magic
    (if possible the magic should be derived from the
    definition of swrap_unix_scm_rights_payload,
    see profile_setup() in source3/profile/profile.c
    where we do something similar.
  - we need to remove some #if 0 code

2. Find a way to keep the smb2.lease.dynamic_share test running
   - We may only activate multichannel support on a few test environments=

     instead of all, it's still off by default and we should mainly test
     the default behavior of smbd

   - And/or we need to rewrite the test to use multiple user sessions
     and %U in 'path =3D' instead of %R. Or two tcons to the same share (=
on a single connection)
     and using %t (together with a root preexec script) instead of %R.

metze





--1MG8tY75cDTseJdUiIF05KHM9xJzdUMna--

--LaNHheXj8UIILdAdHGuwkPdFl9qxIC3of
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl9IutMACgkQDbX1YShp
vVa6Cg/8CjHYrDvL8PsAggGanYH3AanxnKMYrR3Brth3jVO7lKwjpuYjXufMhIOs
h8efHE/zhMJICSOaMdz0+VnClrIBzFS6CIEgIMhg+8+OA3thl76y6u2obU3fYAqY
FNKh5xaAkPd5Gih+sl+1h0OLiH4QhKe89bJphxLbtRDp1AK9rImiP9NqJt7E8AV0
GxjBcsnXxfkyUSo/+F6LltARVk7Zuy1vBJMr4RwQPnxgkf3OCWQsCy8QuE5Zb9KX
Za8Zsif82Oa5XrpEPdMFQs5uGWFXbUQm5YKlz0lVVqetrA1Hcpt0LU7uoi1KSbgf
SFhizkmOo85VNdRyq4QL1MPRKbfQ9GwQg59oRbpuxiYu9lXIVU7K5d1OC6Pqtqj7
bGd0/7g5L5lomzgY5ZNU+6hGF45qe6PAsHM9xnNSvvSaw8nI/m0vFrz5vCd0d41K
RUP9V5pI38mCAf8JL2ru0XvzR6H0u4r4AtDUbgwcGXIn5WmRFZk1PWY/X3Z8/UX2
1V+UygMziSXzdM+pOwX+KHGHHuv1bqwoou8aPd6NXSb/RMT+fBVqP6GoydiqYWyQ
wZjsyXueFPNdb8d5ailPloqNHFveL2coUb452S80sjfuquyafNfOJi7jsb15XSMh
zpRjmNfmltfhqOEwJGXcYohnmbnCmdEmaq+365HVu8IcpOvtWIs=
=vn35
-----END PGP SIGNATURE-----

--LaNHheXj8UIILdAdHGuwkPdFl9qxIC3of--

