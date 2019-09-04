Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 234BBA834D
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 15:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=MFKovwl3xLz5G/E09D46K0EQP0CR2gpkddeq7GrYzSA=; b=d5QlnFHFoYd9AI/84Dxb1A/SYY
	k9aR6Z01tlewUmdtoGXXn/o8o4sb/GWHlBwVTF4Rqjp0fNReoVi7uXdLZGKYXeJIEjq7TGtG9Cg+d
	aw9lyG7UMhNSnxsCcQkdhTtli/dS0AHY7JGCeru/fDYnPO/plCSV2UFxzBeAORpbcYQKxUk2Wrk9v
	QKmueqc4I6NRUCmCKAz/2q2t/q+hu0SE2a/Sw1fzkQv4UMX6V4F9w4Hl6HIsoqXkvhTWu0cna1J3P
	QhhKAkCWIfbO5Zs1yhteyUQEfTjrRyWmWJgcpYSylsMbpsVhZB4LuAMMGNAoMLoWP3PrKyVMehsIy
	BeygLFsQ==;
Received: from localhost ([::1]:19444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5UtB-003PGY-FW; Wed, 04 Sep 2019 12:59:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45850) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Ut7-003PGR-TJ
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 12:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=MFKovwl3xLz5G/E09D46K0EQP0CR2gpkddeq7GrYzSA=; b=s7zqXwXSzlXuQ9F7GJbEsoyNdr
 Gu8TEV/Qp50gRSOPhJ7PiVLIjd1OZnBfTERbimxpQdvtFa3RoNtuyqoYEWTTxMSbzT+sEusPXiPrX
 H9E60XZ+btBgX0Lc27mK0H/UXIImKgmk/lISsk/cOKqFu9zgBQpd0BUlJJ+pwT5qXDyg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Ut6-0006Z3-Px; Wed, 04 Sep 2019 12:59:52 +0000
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
To: Stefan Metzmacher <metze@samba.org>, Alexander Bokovoy <ab@samba.org>
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
 <20190904114035.GD25360@onega.vda.li>
 <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
 <20190904120318.GE25360@onega.vda.li>
 <f8d0132c-7d8c-b90f-af58-6533246141b0@samba.org>
 <b54f470e-d35f-ca3a-b86d-0373c3d7f364@samba.org>
Openpgp: preference=signencrypt
Message-ID: <4b1a3c2c-7689-fb4b-699c-31bb8183544c@samba.org>
Date: Wed, 4 Sep 2019 14:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b54f470e-d35f-ca3a-b86d-0373c3d7f364@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Li5JFRTRIQCPXV4Db4luslfQEyFfKUOJ3"
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
From: =?utf-8?q?G=C3=BCnther_Deschner_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Li5JFRTRIQCPXV4Db4luslfQEyFfKUOJ3
Content-Type: multipart/mixed; boundary="srsZQw20FKGU9L4KlsyhRVu3DVLJu2qoy";
 protected-headers="v1"
From: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
To: Stefan Metzmacher <metze@samba.org>, Alexander Bokovoy <ab@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <4b1a3c2c-7689-fb4b-699c-31bb8183544c@samba.org>
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
 <20190904114035.GD25360@onega.vda.li>
 <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
 <20190904120318.GE25360@onega.vda.li>
 <f8d0132c-7d8c-b90f-af58-6533246141b0@samba.org>
 <b54f470e-d35f-ca3a-b86d-0373c3d7f364@samba.org>
In-Reply-To: <b54f470e-d35f-ca3a-b86d-0373c3d7f364@samba.org>

--srsZQw20FKGU9L4KlsyhRVu3DVLJu2qoy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/09/2019 14:56, Stefan Metzmacher via samba-technical wrote:
> Am 04.09.19 um 14:54 schrieb Stefan Metzmacher via samba-technical:
>> Am 04.09.19 um 14:03 schrieb Alexander Bokovoy via samba-technical:
>>> On ke, 04 syys 2019, G=C3=BCnther Deschner via samba-technical wrote:=

>>>> Hi Alexander,
>>>>
>>>> On 04/09/2019 13:40, Alexander Bokovoy wrote:
>>>>
>>>>>> @@ -2122,7 +2122,7 @@ ADS_STATUS ads_create_machine_acct(ADS_STRUC=
T *ads,
>>>>>> =20
>>>>>>  	ret =3D ads_find_machine_acct(ads, &res, machine_escaped);
>>>>>>  	ads_msgfree(ads, res);
>>>>>> -	if (ADS_ERR_OK(ret)) {
>>>>>> +	if (ADS_ERR_OK(ret) && ads_count_replies(ads, res) =3D=3D 1) {
>>>>>>  		DBG_DEBUG("Host account for %s already exists.\n",
>>>>>>  				machine_escaped);
>>>>> I wonder if the check has to be ads_count_replies(ads, res) > 0 ?
>>>>> Technically, there could be a unique name but there might be names =
in
>>>>> multiple OUs.
>>>>
>>>> The LDAP query looks for the specific samaccountname of that machine=

>>>> which will be unique in the entire domain namespace.
>>>
>>> Ok, discussed it more on IRC and since GC search will not be done her=
e,
>>> '=3D=3D 1' is OK.
>>>
>>> RB+, please push.
>>
>> Please add
>>
>> BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14007
>>
>> As that's the already existing bug for the regression.
>> And I think is has a similar patch attached.
>=20
> Actually please take the patch from the bug
> as it also moves ads_msgfree(ads, res);
>=20
> Thanks!
> metze

Will do and close the new bug, I was looking and looking a regression
bug but did not find it earlier.

Thanks for checking!

Guenther

--=20
G=C3=BCnther Deschner                    GPG-ID: 8EE11688
Red Hat                         gdeschner@redhat.com
Samba Team                              gd@samba.org


--srsZQw20FKGU9L4KlsyhRVu3DVLJu2qoy--

--Li5JFRTRIQCPXV4Db4luslfQEyFfKUOJ3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQi7xTdNz0EbkNwwhJI6TdojuEWiAUCXW+1QAAKCRBI6TdojuEW
iBXFAJ4nXxYpD9OSyNBEO8tdXnJqbmX3LQCbBc5ezAXG5yUhUYKFpRbDHMSwS0s=
=17Mz
-----END PGP SIGNATURE-----

--Li5JFRTRIQCPXV4Db4luslfQEyFfKUOJ3--

