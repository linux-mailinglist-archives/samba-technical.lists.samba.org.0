Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D73A833D
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 14:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=B34DpWoH9s8XEySufISMDRlMdloVVTrK3SbbS+DW8Go=; b=fTC47tKJX3w/g4Us06t1ar83L8
	7dY4/SMUcwXnsPbcd+4C2SIu0AfYXbf101eHOz1C2A0Je68EQp7nSWM48Uo4HOFbvI5cM0xMa+s3v
	iKpmhNRBo0HCX1a6GDG/v0onmMqk3+njFI68vzcd/+hE/VkGD0bCkb7b5f8hUZad8g906v009qb9p
	mo1sKtXhUMmNfDxBfe2+9bSRgXRwqCy9AhnLNK12Qjd3jk33Ta0Fuxyojkl7YM99QRm5CostYicyC
	9DmeQSKXqOwZFPfl0w8C1ANG5HpSRZxPKsT7KABON13TFF6muhLhhyPn0mcOkQYMzrGfyzI3uyuHr
	wmMFtmsg==;
Received: from localhost ([::1]:65418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5Unn-003P3X-Ay; Wed, 04 Sep 2019 12:54:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43524) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Uni-003P3Q-J7
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 12:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=B34DpWoH9s8XEySufISMDRlMdloVVTrK3SbbS+DW8Go=; b=u19NYxY4+NQD78eCFYhRv4MMKs
 0P7vBzqbkfWr+0eGEINUwZ0su96hPeN4uWXNQ1hdMCaZfvd6yyS6WHjjVi56YqN4CugJ1T1rvL+pB
 rmS4V1QkrhT+d9bvfNsSCbhHJSkIy7iC4TvBHUWv0fJnpFK0xtW+VtpF3f9DgWcHWlpE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Unh-0006SI-0g; Wed, 04 Sep 2019 12:54:17 +0000
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
To: Alexander Bokovoy <ab@samba.org>, =?UTF-8?Q?G=c3=bcnther_Deschner?=
 <gd@samba.org>
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
 <20190904114035.GD25360@onega.vda.li>
 <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
 <20190904120318.GE25360@onega.vda.li>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <f8d0132c-7d8c-b90f-af58-6533246141b0@samba.org>
Date: Wed, 4 Sep 2019 14:54:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904120318.GE25360@onega.vda.li>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="dOwB9KVPtg8vkm5el3ZNM2tq687Ybze2X"
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
--dOwB9KVPtg8vkm5el3ZNM2tq687Ybze2X
Content-Type: multipart/mixed; boundary="aVINPdJnybddjWFXv5EhburletygOWp8R";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Alexander Bokovoy <ab@samba.org>, =?UTF-8?Q?G=c3=bcnther_Deschner?=
 <gd@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <f8d0132c-7d8c-b90f-af58-6533246141b0@samba.org>
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
 <20190904114035.GD25360@onega.vda.li>
 <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
 <20190904120318.GE25360@onega.vda.li>
In-Reply-To: <20190904120318.GE25360@onega.vda.li>

--aVINPdJnybddjWFXv5EhburletygOWp8R
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 04.09.19 um 14:03 schrieb Alexander Bokovoy via samba-technical:
> On ke, 04 syys 2019, G=C3=BCnther Deschner via samba-technical wrote:
>> Hi Alexander,
>>
>> On 04/09/2019 13:40, Alexander Bokovoy wrote:
>>
>>>> @@ -2122,7 +2122,7 @@ ADS_STATUS ads_create_machine_acct(ADS_STRUCT =
*ads,
>>>> =20
>>>>  	ret =3D ads_find_machine_acct(ads, &res, machine_escaped);
>>>>  	ads_msgfree(ads, res);
>>>> -	if (ADS_ERR_OK(ret)) {
>>>> +	if (ADS_ERR_OK(ret) && ads_count_replies(ads, res) =3D=3D 1) {
>>>>  		DBG_DEBUG("Host account for %s already exists.\n",
>>>>  				machine_escaped);
>>> I wonder if the check has to be ads_count_replies(ads, res) > 0 ?
>>> Technically, there could be a unique name but there might be names in=

>>> multiple OUs.
>>
>> The LDAP query looks for the specific samaccountname of that machine
>> which will be unique in the entire domain namespace.
>=20
> Ok, discussed it more on IRC and since GC search will not be done here,=

> '=3D=3D 1' is OK.
>=20
> RB+, please push.

Please add

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14007

As that's the already existing bug for the regression.
And I think is has a similar patch attached.

Thanks!
metze



--aVINPdJnybddjWFXv5EhburletygOWp8R--

--dOwB9KVPtg8vkm5el3ZNM2tq687Ybze2X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1vs/QACgkQDbX1YShp
vVYicg//b4Mx7j6rEkdVLuMClCl+lgmuZzecG4hO6FLxdBMZEEAi/4to4CaygVBM
AQ8MoE9/+9LH0DDTweKqQygHD7h5xgYhXF7LbU9T5iiLtED6SK8ZpzwfBADKS4fv
lTFboKkoJa1XPO0pNQDZm2r0HayvEjMrW91xFH6sxQmFfp8Zm/ZX+IjIsG5giiW/
6CikrunJlX+usP+j3cOFpl1YX2524uQrNEvBUvz1fZKS5X8BJeSeOK6Tj7AwgkBl
ZF7BwTxCadRRHYh/w3Eg5PwA6/IMxF07FSwRKtNx3u/U+ksMfA9SLBC7HPnzTcRZ
B+F0pwvXRHNnURyDWS1XvIgHGymgjXPQy4fN6Oy4UpSntHvFs5ZQachfkL5g5M7v
DtvRSBIusL9JJVM0c+aRZaYse81uRYuS6aaobH+7MOwoELxCknOy6xBnOUE0Dcmc
CHtPj3VzyRkeM4lD6J5U2ySgaoetogvZ/mxsKYyzH80pL+CeIGokqMBPjANEnmtU
f7kbA0F9kICCcVHGeuSq5RF1Ina0xEVuyrAWRdf8gWQ+clMi0syFMSxd1A+NqlUN
ppv6dzi00rJAk8F49SxO13SDYyZzM6gL1bDoFQi7M2x2snkmoM8KslEleuj7LuXo
NKlFAF8JUQhsQi4+PbEPmn4xgi3/XtWYB9O89r14aipoZUVefx4=
=O3bn
-----END PGP SIGNATURE-----

--dOwB9KVPtg8vkm5el3ZNM2tq687Ybze2X--

