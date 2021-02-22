Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E75C132167D
	for <lists+samba-technical@lfdr.de>; Mon, 22 Feb 2021 13:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lYiFjxwR39IDE/QgDw8s7AA6CMyGnpfP1RaAcaCxFso=; b=W8D3GTghA+2SeTrtbXZlPq8x+W
	p/60VTb96E7Osz39GdoXVSVgKkoDJW2/a2EppXO3BeynF6RWt4F4iGCuA8yC8TpP9qY3aVh0EuhY0
	cs+wx0r6iQStwrP+P6lrxYJSV9SQK7EihoTh1vsxYOhunbKnbx3E2wdmByCCSebRxwlT02Mz5gVcs
	U9U3gSPdYN6qVq5EE+NkXk93/aUEEZEg5AdEuRgQtlVACYHbblP0q4z2Hxyjnn73OSD2VUP7kJOlw
	V/LMgL+GwyV6L5Ox+EOZpCqF6ZRummwXAeS5VQiwR0Kps/KVZWP9tOBJgBWDidLsW3XliRRRqVOa2
	j1aYM0Mw==;
Received: from ip6-localhost ([::1]:29152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lEAFm-000tQk-6Q; Mon, 22 Feb 2021 12:23:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37872) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lEAFg-000tQd-2V
 for samba-technical@lists.samba.org; Mon, 22 Feb 2021 12:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=lYiFjxwR39IDE/QgDw8s7AA6CMyGnpfP1RaAcaCxFso=; b=sSRjcJEgps/xKe7UVnGqqueh95
 PKcRaSzuVxRXBcVhkftFYPBKVtYKdloyLKFObOP6EDYjGYWnZ1RZEfT/DkW2KE9j04J6RilHUXO7L
 nDzuVKFZCqcPr7hTs14Fky9hqrhtF0cffRYVtSLUyXYrPyyOEv58BhU2sfAVJ/bS5x2PpoCvkbXr9
 P6dOyvsuB5ldh4D9UWcZJc7JKo4eOR0WtnEVttPAzLKrneG/YWn0RgTlV/7/uLA2ZxIEgkxkXyTUz
 hBw7p3K24uQ3VdS2+MKCA7qWpuCVvlBMhBy5MnIZvJfFVGOBXfTX05+vy1CHIXf4cqmo8ISluqP5A
 rr9PJ3CBpXOfa7+ZMAdM/44szHnSvCoy6TaMIRiOitbQ359dXB5pOVQHCTplbLbWPt4BvJDgjYUh+
 w+QLgS/hAQQpF3P4ufN5sO4OthDcqmKaIriUOxNh1UlhiVYrawxMm1LYRB6UYQfR9Z6cbsPDLeDVM
 CoHgmCVEObyswHxhXKW4Mb6q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lEAFf-00011I-CL; Mon, 22 Feb 2021 12:23:47 +0000
Subject: Re: Provisioning an ADDC with vfs_nfs4acl_xattr
To: Thomas <tgeppert@digitx.de>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <AM9PR05MB76360A339F47095CA02FA87DCF839@AM9PR05MB7636.eurprd05.prod.outlook.com>
Message-ID: <82963790-7a08-9e22-1baf-2a5d2bf4e712@samba.org>
Date: Mon, 22 Feb 2021 13:23:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <AM9PR05MB76360A339F47095CA02FA87DCF839@AM9PR05MB7636.eurprd05.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lhI1NmRaxBHL77ASghSObuOV0Tk5C1DtR"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lhI1NmRaxBHL77ASghSObuOV0Tk5C1DtR
Content-Type: multipart/mixed; boundary="1lqYwMj1ciEE5rXKS6uG1EK2nbpIvpj5h";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Thomas <tgeppert@digitx.de>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <82963790-7a08-9e22-1baf-2a5d2bf4e712@samba.org>
Subject: Re: Provisioning an ADDC with vfs_nfs4acl_xattr
References: <AM9PR05MB76360A339F47095CA02FA87DCF839@AM9PR05MB7636.eurprd05.prod.outlook.com>
In-Reply-To: <AM9PR05MB76360A339F47095CA02FA87DCF839@AM9PR05MB7636.eurprd05.prod.outlook.com>

--1lqYwMj1ciEE5rXKS6uG1EK2nbpIvpj5h
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 2/20/21 um 9:44 PM schrieb Thomas via samba-technical:
The ACL retrieved from the filesystem is compared against the above ACL=20
and if it doesn't match an exception is thrown by the sysvolcheck.
>=20
> The first issue is related to the fact that the first and fourth ACE in=
 the above ACL are identical.
> The nfs4acl_xattr vfs module does merge these ACEs into one ACE in its =
code path (smbacl4_MergeIgnoreReject() in nfs4_acls.c) when setting the A=
CL and would also remove a duplicate ACE when reading the ACL (check_for_=
duplicate_sec_ace() in nfs4_acls.c). Therefore the ACL returned for a dir=
ectory in the sysvol Policy branch by vfs_nfs4acl_xattr has one ACE less =
than the target ACL. It looks like the acl_xattr vfs module is not doing =
this.

I guess nfs4:acedup =3D dontcare should fix this.

> For files in the sysvol Policy branch there are additional issues. The =
nfs4acl_xattr vfs module removes all inheritance flags from the ACL on a =
file (nfs4_acl_add_sec_ace() in nfs4_acls.c).

I guess this could be bug 14631.

<https://bugzilla.samba.org/show_bug.cgi?id=3D14631>

> It also removes the Creator/Owner ACE from the file ACL in the same fun=
ction. Code comment: /* A non inheriting creator owner entry has no effec=
t. */
>=20
> In the context of the sysvol Policy folders and files I now have the fo=
llowing questions.
>=20
> Is my understanding correct that for directories the following ACL is e=
quivalent to the above ACL ?
> O:DA G:DA D:P
> (A;OICI;0x001f01ff;;;DA)
> (A;OICI;0x001f01ff;;;EA)
> (A;OICIIO;0x001f01ff;;;CO)
> (A;OICI;0x001f01ff;;;SY)
> (A;OICI;0x001200a9;;;AU)
> (A;OICI;0x001200a9;;;ED)
>=20
> And for files the following ACL is equivalent ?
> O:DA G:DA D:P
> (A;;0x001f01ff;;;DA)
> (A;;0x001f01ff;;;EA)
> (A;;0x001f01ff;;;SY)
> (A;;0x001200a9;;;AU)
> (A;;0x001200a9;;;ED)
>=20
> After changing the samba-tool code to expect the above ACLs for Policy =
folders and files the sysvolcheck does complete without errors.
>=20
> What tests can I run to check if this vfs_nfs4acl_xattr based ADDC inst=
allation is sane and working properly ?

Maybe it's easier to use vfs_acl_xattr instead and just patch it to use=20
a different xattr name.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--1lqYwMj1ciEE5rXKS6uG1EK2nbpIvpj5h--

--lhI1NmRaxBHL77ASghSObuOV0Tk5C1DtR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmAzolIFAwAAAAAACgkQqh6bcSY5nkaa
7g//T+9oamNWvd0ZSwxCUOVSkUzd6jX9F7BDgmTwxRlvlt98fHYPzky/nfQNh8kTZVwgeIkFGx9q
hBdWKm5NL+t93DtK4niWBYrf6dhmkjZC6F4wkrr2GUkeLzMzhwHR6ZNNzkWqYA34xQGr/brkEZf0
oGu9ByDm/wmybPeCccZFGpXKXe/dSf+5Iy6DuT+D9BoTJRx4UOQ7isTfIxyA2HEBL1QUPOW7gplV
6cZDXZDMHbvlY5pXQ1oF+2AdlSD1gZS0ohi6b+psF0M9Q25IRzYaniX63KAC0DewvEKUQs/HPPnQ
W/RCAj9MaCW5u0qAfTyAzfUepfNiTkKnqoj07vVY9Qk6U3VCsV0dkuYD2b/kWsrPTFfrWl9FX5UY
ywYrovXMseY4R0Op5BqNJshfvMp9KrLWlTBIT4x7BtpTWt8HDJNY1i7tFWNLriUB15gAPcUMYFRe
SQrK0QhLsEWiPnymdxX4n+2uJkwJdA3HjFqvrlOmSHAqSc09wjiPKl4SrhPZN8n6K+SoXFUuMfEZ
OOOAfgeZ/5JYKy1PXxM7lcfH/UETYemukjNosqBD0skggP0Y+UznLV/zOcvQZd8LAfzOsTJkvMDm
b0WSKIR5sJWVxcxbJsD+qpljLs9AtPABXGs/4TWabFBSSunN865EE99Qwb342tbkzMjZttSrTotn
NJ0=
=IKKv
-----END PGP SIGNATURE-----

--lhI1NmRaxBHL77ASghSObuOV0Tk5C1DtR--

