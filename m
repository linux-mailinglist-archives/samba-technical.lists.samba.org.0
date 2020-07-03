Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 845132133FC
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jul 2020 08:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=8IFo9t7bPDeMq27BEQRGD5ti9hAqUsdwGJzGNkAEEjc=; b=tSqFKkAv3kIqHxq0GMRWzWczcI
	rmiLa5Md8oWMCf1voKXJxqmZSEKEOdZlbihvw6gT9oz8KXC/SjCOoQtYL5mPSyH602vj4DB6eiGbu
	GdxKgYsNk8ONz+hrVfJmNPAjW02iUsgRN8tkZaoV4FtLFE92dEmVahNrSO7rVClAmP61cVbSMCWMC
	XVTwxxXUnCWTuLTHp3aJBXZrHA2rd+IUPrabHbkpjySJ/NnpxuC7GKhGi1DPmz1R2oQWzQC+m8fAK
	1u2u4CCZ8tBuz98QxUMJfeiC3uo1GtPY7gMLru+p/HGcfETI0NKsmD5XajEVxUQcXWhwrphYiy+wd
	4LMYQVhg==;
Received: from localhost ([::1]:49918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jrF1E-005DZR-Lu; Fri, 03 Jul 2020 06:17:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29040) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrF18-005DZK-ED
 for samba-technical@lists.samba.org; Fri, 03 Jul 2020 06:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=8IFo9t7bPDeMq27BEQRGD5ti9hAqUsdwGJzGNkAEEjc=; b=q8XlZ2vzf99A8Yxo/ekPniw/QM
 9hzNfgw5cc3sO06GcWfOiK6PSmKgodNhc8HGUNwvtO9H4QeoK5zSTPnn/hLnbSUbU8myMEHQXUzcx
 /XojAJdaOCcENe2LvtecDzdzJoAsmLctZYDzc+P1Nx8I+2IB726ibdMfznhlPmPvdM8X8QG1VIJKX
 BPK0ZYSxbYDhsOBvQx0fbp+pq5oV1O8t4PXFp4Qm0ePFWjUOVgGQKRqcdw1reCnIGGj5pXhIX+LvP
 D7r9QhTXl0cAGqQJgi69kjfqONUG1lI90g1vaT7QKEGSvGinbBkckuqJiSbeti9pleOPKG8vCrkOq
 +lkv8nxAWXQIQQ/6lmo5cG6ag9OFV5MTDBAQaP4RsD3CS0h0bPQ0/uAjFWyv5JmT98IHz/ciWfjN7
 GZ6spwalrs+3hPGG72+aAb5WmDDODndh9ZfMLjwH4smhlS73KRNx0qx+naLOgk+XyafK9qD2czRL9
 PFLlxt3QkAx9PqceGlj57zKW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrF17-00061z-2o; Fri, 03 Jul 2020 06:17:45 +0000
Subject: Re: libwbclient (LGPLv3) linking to samba-util (GPLv3) in Samba 4.12
To: Andrew Bartlett <abartlet@samba.org>
References: <4160624d8abe5a0d8d7a31573068746b3e19e439.camel@samba.org>
 <053bd96d-6633-26f4-ddb3-7f447e42c17d@samba.org>
Message-ID: <1eb04f79-d812-9a18-c770-413b17e1df51@samba.org>
Date: Fri, 3 Jul 2020 08:17:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <053bd96d-6633-26f4-ddb3-7f447e42c17d@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MioOuv3aPkVEo9AsM02OUxwSpAB7w4yK3"
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
Cc: Swen Schillig <swen@linux.ibm.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MioOuv3aPkVEo9AsM02OUxwSpAB7w4yK3
Content-Type: multipart/mixed; boundary="GIyBQ0SoOag1N99Zl4DrC9sRMicNPaACu"

--GIyBQ0SoOag1N99Zl4DrC9sRMicNPaACu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 7/2/20 um 9:40 PM schrieb Ralph Boehme via samba-technical:
> Am 7/2/20 um 9:30 PM schrieb Andrew Bartlett:
>> G'Day Folks,
>>
>> I just noticed this because debian failed to build due to an extra
>> symbol added to our internal samba-util library.
>>
>> samba-util is a 'big ball of mud' library of Samba stuff, licensed
>> GPLv3 and very, very helpful for stuff in Samba.  Work is slowly
>> happening to try and pry it apart into a directed graph of smaller
>> libraries, but for now that is how it works.
>>
>> Either way, it is GPLv3 and is therefore not permitted to be a
>> dependency of libwbclient, which is our tiny winbind client lib for
>> linking into OTHER PARTS of a running system, eg nss, pam and
>> potentially other tools.  It is LGPLv3, and important distinction.
>>
>> I don't know why our ABI stuff didn't pick it up, but I know some on
>> the team have ideas about how to reinforce that.
>>
>> We need to disconnect these two parts, then try and undo the damage in=

>> the distributions due to the extra symbols.=20
>=20
> drat! Sorry for this mess, if noone else gets to it before, I'll take a=

> look tomorrow.

https://gitlab.com/samba-team/samba/-/merge_requests/1439

Can we use a subsystem that contains LGPL code and then use that as
needed in both LGPL libs and GPL libs?

That's the approach I'm taking here to avoid libraray proliferation,
otherwise we may end up with one libraray per function. :)

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--GIyBQ0SoOag1N99Zl4DrC9sRMicNPaACu--

--MioOuv3aPkVEo9AsM02OUxwSpAB7w4yK3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl7+zYcACgkQqh6bcSY5
nkbFBRAAtkfjXwNV4aP72lVS3xACyDbtmMmTUFD/wbirqqpf19kYX7bdP/2YR7ya
slmqVpGa6mAOCLTYamcgdQklyRfj967mAzv70xb/4O/it25Ee96ucEOOLEpcAD+t
cGnU5vPgChPRsoYXI2TLA6cyLiAsr/EhMCkGmBxDPDF59aD6H1q5rh9AaZ8fodWy
pzM/9V6NeTIXF0cTiz9vbIAlOm6Oh9CgjuDWCXgC+S6mV9QKRBnM+CoKmnQJX+gd
wFhOP0SnpF5i+oNvdMiHxNX9BP3jDLqohiV1n2hlvcAutMruo2CCP06svNqL2bSa
404z+xQHxlla1TLFtGmdmGNw5n5n1B+lIS1dPFj5pWQPBeVtLRZMeuCpf9kg7z8W
OrTKq0fFPVWm+IQBN0ez1ehmxAE8QRQJayl3NA8BWH5ybMHzSoIAMOcy8MpdZl6Q
JI7NjirDHFjIGge7DpjlSUnOs5sYHMJmvUkPVarRT5dckknMSqP62Nd/AC9hbFtq
K1CvX/CIblxPL3TqJTLpDLUchdwF4XlB0K4R/C834O97j2iDj2ABGxKEI7bLpcji
wPZ4CZUiCaktbLanoX3q+afP4BVdfQIUm0y4QagNbJ5qbX+Y2vGegkZwCAhkSB5A
k2qYKJFLPPNwNfGIs6RCGH1GTlrHYE4SQGrR3MkMeEeqNorK/yo=
=Wzh7
-----END PGP SIGNATURE-----

--MioOuv3aPkVEo9AsM02OUxwSpAB7w4yK3--

