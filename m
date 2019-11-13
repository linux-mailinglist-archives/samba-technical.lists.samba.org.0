Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A82F6FB946
	for <lists+samba-technical@lfdr.de>; Wed, 13 Nov 2019 20:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=AnnVr8sFIj3W9PEwbcAvKwCegO/9Ua9DWlwMlf5sAPE=; b=erM+6YvEh6YxzetczQJFsJ0mGF
	Mj7pWg24b1C/UO2urpRXd6WfV+9zR3b9eP+w12pa03W2T+NJjf3W1ABTT7i/K9yRKHdTA5lDVyHyA
	hKTiBUWXr9bRCWk0J8yw4xvMD4w2VieaLME1v+6URvRmfJdqMr8DD8qJlkGSYtsEX3hsdz6bdd+Ye
	9772m56jb3ca0yoxe4ebgGnb9vaiU5/M4ad3pPVu5jieIyj/MAfAleC3uOz6fpuDc5Fm7rSRQiJSK
	WGRCpVbYHdo/1TWF1kB5QmfDog7gqnd80o1AMJRqpicyY0aX/fJLTOr5fxlNiIKdWwnZJi9E2g5V8
	3yZDyjSg==;
Received: from localhost ([::1]:24796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUymL-000FzZ-Ii; Wed, 13 Nov 2019 19:58:13 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:48112) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUymF-000FzO-M1
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 19:58:11 +0000
Received: from [IPv6:2404:130:0:1000:b511:6110:326e:9667] (unknown
 [IPv6:2404:130:0:1000:b511:6110:326e:9667])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 74D4A810DF
 for <samba-technical@lists.samba.org>; Thu, 14 Nov 2019 08:40:18 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1573674018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=AnnVr8sFIj3W9PEwbcAvKwCegO/9Ua9DWlwMlf5sAPE=;
 b=EAioKKMTykkga4fiXQO//R5WXWvR2r5CbC2vjduJMsJ+Uu5Md28/dhxihQnNqhZIarIiwp
 4lHojvn1ZfwmeA7fUy/snKP3mZg6jEICDZYScnaWQ60ymdwmYUBXupmt7ObStn7oQOO0Dg
 5jqrh3/UvcR5ewBIa3gKkSp4eHEp9qVGMXh5h2ViRpAfiUk9YkF++2/La98AuP2BCbvbYU
 c95tt/bTRQnabD7i0YC6EQ1n3DCV1Gkn0ds60BtoBeNrjrfXMi9iopAaGHfAkv3a5Pf8AF
 hx4Tqo0/7avMNA/weR3wOSJkFV775e2zGo6RYOiEy27Hz7UMra9v1mlUSYqZiw==
Subject: Re: feedback on ldap improvement in samba 4.11
To: samba-technical@lists.samba.org
References: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
Openpgp: preference=signencrypt
Message-ID: <36c80274-fefe-e1ff-c6ee-223f85195c22@catalyst.net.nz>
Date: Thu, 14 Nov 2019 08:40:12 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="TupK1kFtN8Mbl7IaE2ryyskVT6vkUG6Qc"
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TupK1kFtN8Mbl7IaE2ryyskVT6vkUG6Qc
Content-Type: multipart/mixed; boundary="3quwGqzhgAOxK7crRQFHPjoYMNdz5PVDm";
 protected-headers="v1"
From: Gary Lockyer <gary@catalyst.net.nz>
To: samba-technical@lists.samba.org
Message-ID: <36c80274-fefe-e1ff-c6ee-223f85195c22@catalyst.net.nz>
Subject: Re: feedback on ldap improvement in samba 4.11
References: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
In-Reply-To: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>

--3quwGqzhgAOxK7crRQFHPjoYMNdz5PVDm
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: quoted-printable

That's by design, as I get confused by processes that restart after a
SIGKILL.

On 13/11/19 23:24, Denis Cardon via samba-technical wrote:
> About the prefork model, the master ldap process is properly restarting=

> the child process after a SIGTERM but it is not restarting after a
> SIGKILL. Is it normal?

Ng=C4=81 mihi
Gary


--3quwGqzhgAOxK7crRQFHPjoYMNdz5PVDm--

--TupK1kFtN8Mbl7IaE2ryyskVT6vkUG6Qc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAl3MXCEACgkQei/9ZKIy
R1M5xwf+McahHFlALnTj/3FBfGtLMW1hyJ6Wizw8CYfGeQ08DPtS2EOsgdxdN77t
3zx5kOeja5SIyaRS6TbMeYxVRDwU+rh8W4unOQUWWjh/aOcbAPxmP2SXb3uQBxNI
Nu6fpEp7iVDRnhFL3k7rOUkpf4cOK9YAzP/0/vmSyjxIubhT4yzuCF2dsvzK0MsL
xScuvgJjmjX/3EcRZ4tBDH12tr7NMcfgVwmtFiNmEZZLxAeTvPMNc7R6hH7hH/cS
G9YCqqVdLBaYUfrO3D+6Z/3k/qfjiOj+fJKhzViO5vlzzpMWFaxgUvJ/4w/lD9mo
fuYZV/lfje5sbZQRQ0FatX67ldJcNA==
=exAh
-----END PGP SIGNATURE-----

--TupK1kFtN8Mbl7IaE2ryyskVT6vkUG6Qc--

