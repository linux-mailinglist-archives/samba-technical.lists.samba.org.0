Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB312A8342
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 14:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HSZznVSJXdxk1whIBYDzqZPeXvaQgp0TKYosKukZTk0=; b=1uxEiwlvCkGlvVMH7sHYRQfLgl
	gpatEIqrgMRGh378ZsJoA9bEyCm6M/TIY3rqVM9tnJ/HAUDYUuEWCFqjicw4eBIqhVqgieo5bWVPL
	NZFjghU9xZXeou/xuZnESzHa7ELADoN7Upw0IEiwyHSiWSaIir3XWFHn6yHzUn0bPT/g/AVGXTjPX
	+6fCLhecI3RHBqVDvkX3Dp/TxeO31eCVnYUPT9pVsVD6qs6Z0HqggnYqoi8F0RwH5ktc80Lndc9oI
	TeqaOHDNUSLbWPrHHl4zsCODtvKv3VSHCIcb/oipFRzPh3dQHcOiy/vuIfsgk83DZfwRe0a7WjUzH
	2sgjO3fQ==;
Received: from localhost ([::1]:18658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5Upq-003P9v-G9; Wed, 04 Sep 2019 12:56:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44352) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Upm-003P9o-7y
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 12:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=HSZznVSJXdxk1whIBYDzqZPeXvaQgp0TKYosKukZTk0=; b=ty+26eKmhunn3q/qh2aXF5fEpI
 0tKLSWqwIZyFOm2M7T++d22CBpniKsVAeElCRG5KC9fNatTbbWXS+gKKCarizJw2EF9xbpM+28lDh
 TH3eM7lXTXxgx6BX4VktxckG3i3qdTFPc8DdCrJQ1NRRWB6BdR+GrMFw/uq5wZZqcS7k=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Upl-0006VY-JE; Wed, 04 Sep 2019 12:56:25 +0000
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
To: Alexander Bokovoy <ab@samba.org>, =?UTF-8?Q?G=c3=bcnther_Deschner?=
 <gd@samba.org>
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
 <20190904114035.GD25360@onega.vda.li>
 <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
 <20190904120318.GE25360@onega.vda.li>
 <f8d0132c-7d8c-b90f-af58-6533246141b0@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <b54f470e-d35f-ca3a-b86d-0373c3d7f364@samba.org>
Date: Wed, 4 Sep 2019 14:56:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f8d0132c-7d8c-b90f-af58-6533246141b0@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Vzw5mRA8TykxMrUin6n35VbpDyqYhhh6Y"
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
--Vzw5mRA8TykxMrUin6n35VbpDyqYhhh6Y
Content-Type: multipart/mixed; boundary="XL2Dm1kIlKqiiQzFutu3okhwjjTvgAdBw";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Alexander Bokovoy <ab@samba.org>, =?UTF-8?Q?G=c3=bcnther_Deschner?=
 <gd@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <b54f470e-d35f-ca3a-b86d-0373c3d7f364@samba.org>
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
 <20190904114035.GD25360@onega.vda.li>
 <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
 <20190904120318.GE25360@onega.vda.li>
 <f8d0132c-7d8c-b90f-af58-6533246141b0@samba.org>
In-Reply-To: <f8d0132c-7d8c-b90f-af58-6533246141b0@samba.org>

--XL2Dm1kIlKqiiQzFutu3okhwjjTvgAdBw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 04.09.19 um 14:54 schrieb Stefan Metzmacher via samba-technical:
> Am 04.09.19 um 14:03 schrieb Alexander Bokovoy via samba-technical:
>> On ke, 04 syys 2019, G=C3=BCnther Deschner via samba-technical wrote:
>>> Hi Alexander,
>>>
>>> On 04/09/2019 13:40, Alexander Bokovoy wrote:
>>>
>>>>> @@ -2122,7 +2122,7 @@ ADS_STATUS ads_create_machine_acct(ADS_STRUCT=
 *ads,
>>>>> =20
>>>>>  	ret =3D ads_find_machine_acct(ads, &res, machine_escaped);
>>>>>  	ads_msgfree(ads, res);
>>>>> -	if (ADS_ERR_OK(ret)) {
>>>>> +	if (ADS_ERR_OK(ret) && ads_count_replies(ads, res) =3D=3D 1) {
>>>>>  		DBG_DEBUG("Host account for %s already exists.\n",
>>>>>  				machine_escaped);
>>>> I wonder if the check has to be ads_count_replies(ads, res) > 0 ?
>>>> Technically, there could be a unique name but there might be names i=
n
>>>> multiple OUs.
>>>
>>> The LDAP query looks for the specific samaccountname of that machine
>>> which will be unique in the entire domain namespace.
>>
>> Ok, discussed it more on IRC and since GC search will not be done here=
,
>> '=3D=3D 1' is OK.
>>
>> RB+, please push.
>=20
> Please add
>=20
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14007
>=20
> As that's the already existing bug for the regression.
> And I think is has a similar patch attached.

Actually please take the patch from the bug
as it also moves ads_msgfree(ads, res);

Thanks!
metze




--XL2Dm1kIlKqiiQzFutu3okhwjjTvgAdBw--

--Vzw5mRA8TykxMrUin6n35VbpDyqYhhh6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1vtHUACgkQDbX1YShp
vVYfjA//biZtcjExDCQmlVtZolqj1OYcU0d3D/mA5RDB4o9U5xZv9i1zryGD5aQ2
BB72dLOemG5kTCNkF856xDj7rLYj68w+lbpQpC9LIIPt9zvmi2pN5ODjp7RWTISH
hEJH+Tm0QAsZIH7jhsDKi5mN4gX9Lt57Zr6MrBmw85E+EZVgzcHKvEu64fzegcaZ
cFa/AfVIy+zifU388T8vaFR1Jd7IxN6g8bj71AIys5xulAGrtUWIOjw6Za66eE/O
uOJZur9BKnK5jZhI0UIBaa6ZKfYSeU9JfuQVD+GLCuQOMbeIeRYV1Is/K4kT0yev
U3vuka/zA+Dpw1/HAZHwTSdTuBBJD2dtoD4MXozR1QJ83xdnrObrr0Irsymzf2qc
kflCr3BWcAtcaAjXaAjF/0n0vQ3uyteJtun0cXHuxneLc8eenF2R4lHwzNyfSaNo
dcfhAdiBMwb27uGqFwke0e3Wo1Nxs7Q02FIt1rREDaLEjF0tW/v5FrYLsBbfNuC7
Hu9RCVz7pJ1q6Q1kfP1Gu3Br44M4C3lldVwycXuRM5Kg6xBK4z72oVkJUwrZrddK
7J+lA0CJSbysXy87nQeUIIAdVyEITvjNyvyt5eKHCUM4kkZ0iKrOwnCRF8Hg0yzz
yM/oQJUgUFFmysgymzmRWgLLxLZPgBNODYS7YG3IrGHDL0ttLwc=
=7/lm
-----END PGP SIGNATURE-----

--Vzw5mRA8TykxMrUin6n35VbpDyqYhhh6Y--

