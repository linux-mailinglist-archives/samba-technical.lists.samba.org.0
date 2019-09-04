Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A9CA8143
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 13:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=wPIpA77Ti0B6gCzPZdRf60f1+EOX3BCS/TNZUoZ55Pc=; b=jJ0gLQXQiQuHnP0NnXXLA7VfK6
	i9Z8CmYGWw7F/WAIjXX/rhqHhTvzUwU/32cwqPN9HDq+CNNZ+Hy8RTNde1mEdxRvQ3/ihRSAXQbQy
	qJwr6YxKcsb576lIr6JUSHjRsqvIM51gTrVcGKheFYe6BNQipd9/+TFfd9nBJWdlHNDrOtb1LQchN
	glYu3S+rU50+2ghUZAUQwnemO+6MNbxABKT1CXKy1VSXoMJd7srS7BLf8A6ygeJqkXEZ2Dr7i0Py5
	khTzDPgNnL8qh7fzXX6ju13zkpSt8JTAifeMme/kcZ8GLqBH6x2EUO1FTn48LrQ0jgq2i/p0ewKL2
	jNO5MDwA==;
Received: from localhost ([::1]:55678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5Tia-003NTN-5U; Wed, 04 Sep 2019 11:44:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12554) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5TiW-003NTG-Rm
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 11:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=wPIpA77Ti0B6gCzPZdRf60f1+EOX3BCS/TNZUoZ55Pc=; b=BzfDhdJ29eMCK3SKf0ezi+Czd7
 9oAKqp6JepMLB/s8ZZt72N4CmBtMC3b7rMEiKtfFFWv8mth3dNRq8GVEok8JZsqXaqn6SvWYNoVTm
 TIMNbzR/jGkWn/WUC90sLiVbUBwp0Aa3vXnRUNbcs7HVVa83OkfbXltrXj8Hqr9UmjLE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5TiV-0005YK-DB; Wed, 04 Sep 2019 11:44:51 +0000
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
To: Alexander Bokovoy <ab@samba.org>
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
 <20190904114035.GD25360@onega.vda.li>
Openpgp: preference=signencrypt
Message-ID: <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
Date: Wed, 4 Sep 2019 13:44:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904114035.GD25360@onega.vda.li>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="lpz7ZmFAR9M4WA8uSm0AitGA1abOpetgh"
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
--lpz7ZmFAR9M4WA8uSm0AitGA1abOpetgh
Content-Type: multipart/mixed; boundary="xY7pyUPyaQayGzjnyDEGapD8VCcQhUVOn";
 protected-headers="v1"
From: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
To: Alexander Bokovoy <ab@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <adc25872-d764-23ac-69fa-9fc2f958e346@samba.org>
Subject: Re: [PATCH] Fix joining specific ou (regression from #13861)
References: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
 <20190904114035.GD25360@onega.vda.li>
In-Reply-To: <20190904114035.GD25360@onega.vda.li>

--xY7pyUPyaQayGzjnyDEGapD8VCcQhUVOn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On 04/09/2019 13:40, Alexander Bokovoy wrote:

>> @@ -2122,7 +2122,7 @@ ADS_STATUS ads_create_machine_acct(ADS_STRUCT *a=
ds,
>> =20
>>  	ret =3D ads_find_machine_acct(ads, &res, machine_escaped);
>>  	ads_msgfree(ads, res);
>> -	if (ADS_ERR_OK(ret)) {
>> +	if (ADS_ERR_OK(ret) && ads_count_replies(ads, res) =3D=3D 1) {
>>  		DBG_DEBUG("Host account for %s already exists.\n",
>>  				machine_escaped);
> I wonder if the check has to be ads_count_replies(ads, res) > 0 ?
> Technically, there could be a unique name but there might be names in
> multiple OUs.

The LDAP query looks for the specific samaccountname of that machine
which will be unique in the entire domain namespace.

> Other than that, RB+, please push.

Thanks!
Guenther

--=20
G=C3=BCnther Deschner                    GPG-ID: 8EE11688
Red Hat                         gdeschner@redhat.com
Samba Team                              gd@samba.org


--xY7pyUPyaQayGzjnyDEGapD8VCcQhUVOn--

--lpz7ZmFAR9M4WA8uSm0AitGA1abOpetgh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQi7xTdNz0EbkNwwhJI6TdojuEWiAUCXW+jqwAKCRBI6TdojuEW
iFz4AKCQw17A7G65m+HUpbJESW6H1tA0cACgnH920InWvivfva8S4BdbO09c7q8=
=jrwE
-----END PGP SIGNATURE-----

--lpz7ZmFAR9M4WA8uSm0AitGA1abOpetgh--

