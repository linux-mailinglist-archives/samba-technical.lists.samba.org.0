Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A50961F4F51
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 09:43:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AvsdbFSWqBfEYLn7kQjdli7V2dxRy2ur2ILA3pvhEfY=; b=6AOfd5XwoFTKQGsy/24X56wwG0
	rgtaQteOUBSeBNTfaHvsbi4Hu7542+kHnEUi3ZWE9uReC7r9UjhCIbYPVnNqBjmRtoBpCY29kYOzP
	hvEdvsCkHVK+bFMpj0lWsq0sS18ne114TVdPYOewi40asNi5T5XIiscfHJK8M/z02BqlV0XPN4oL4
	gudRA9RFYbJyVxeoyXbJR4tFAxdD7JFF1mp2fmUzx+8QpzCs9VKbMCmlBaJm+myrCXCPWcbMiwZ6t
	Br3Xrm2lxNPCXPU0BXeow28xiHA0/yDLV9UGjV9xeo/RqMYpRq7a/mE5zRIA0qWZpruLaGdXUELI+
	lfc3JLNg==;
Received: from localhost ([::1]:22012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jivNc-009iE0-Ko; Wed, 10 Jun 2020 07:42:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43152) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jivNX-009iDt-P4
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 07:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=AvsdbFSWqBfEYLn7kQjdli7V2dxRy2ur2ILA3pvhEfY=; b=k9mU0M9EoT939GwiymdWeN2BIf
 Rpr8X3kw1SUNXAIBmwKOIH8tqkuqSS/o3wWi75s9vzPGPLBnqV4thS5Wdmy4ZJVUc1qsrpNIBg0Zd
 HSTShXSckHgD9awE1xgfaPDCOpO6+Nl0e56AtqCd9KlMYFcbYS4kU3taSLgFHzOkHCzXSdRzeQv8o
 7tCgLozPQ3dUCsxrl4L5qOlWr+9suEGXqDb6aaQRSl2sUXq1CJw/JZoaMjkHZzBnHaueIFJkIuyZD
 f+Gf6eHCl7M+D8kiCkPDhlYik0COhEInw4ptaneHBZhMImbJV3n/+ikEHoGIqbZLvH+sGflOY5cem
 UNKkUCH8ady3EmWNlTbbRbCEzLw2YdwfwmIFX1BX3SENtBvb8T3Kpg4XEeJTzrYI3K7wh+Fs72+Ku
 t8YHqYMAbdzDIel0HyUF187bJRiSsm4adD616lmnDbNmGKMVgDk6Al3XpI+eIHfLfAjrpc4Xt7C9u
 mqqjogjva4WuKS8bPi/zARmd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jivNX-0005bT-0C; Wed, 10 Jun 2020 07:42:31 +0000
To: Jeremy Allison <jra@samba.org>, Andreas Schneider <asn@samba.org>
References: <20200609172503.C9CF014037C@sn.samba.org>
 <12540524.HQrcsopkBd@magrathea> <20200610055428.GA24503@jeremy-acer>
Subject: Re: Accidential push of patch was: [SCM] Samba Shared Repository -
 branch master updated
Message-ID: <13e042a2-4253-e2ee-6118-63c92400298f@samba.org>
Date: Wed, 10 Jun 2020 09:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610055428.GA24503@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="LxVxZVhTeJjmqwtBz6S4E8anXeJkxTyun"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LxVxZVhTeJjmqwtBz6S4E8anXeJkxTyun
Content-Type: multipart/mixed; boundary="c0SyYKUzI4v7tX83qCrhrZFJyzipzPHNF";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jeremy Allison <jra@samba.org>, Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Message-ID: <13e042a2-4253-e2ee-6118-63c92400298f@samba.org>
Subject: Re: Accidential push of patch was: [SCM] Samba Shared Repository -
 branch master updated
References: <20200609172503.C9CF014037C@sn.samba.org>
 <12540524.HQrcsopkBd@magrathea> <20200610055428.GA24503@jeremy-acer>
In-Reply-To: <20200610055428.GA24503@jeremy-acer>

--c0SyYKUzI4v7tX83qCrhrZFJyzipzPHNF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10.06.20 um 07:54 schrieb Jeremy Allison:
> On Wed, Jun 10, 2020 at 07:26:10AM +0200, Andreas Schneider via samba-t=
echnical wrote:
>> On Tuesday, 9 June 2020 19:25:03 CEST Andreas Schneider wrote:
>>
>>> commit b458f8fbb7febf3584fa648128b4e1dc764059f7
>>> Author: Stefan Metzmacher <metze@samba.org>
>>> Date:   Wed Aug 7 12:11:58 2019 +0200
>>>
>>>     s3:libsmb: add a cache for cli_session_creds_prepare_krb5()
>>>
>>>     Signed-off-by: Stefan Metzmacher <metze@samba.org>
>>>     Reviewed-by: Andreas Schneider <asn@samba.org>
>>>     Reviewed-by: Volker Lendecke <vl@samba.org>
>>
>> Ups, this was pushed by accident. Should I revert this or do we deal w=
ith this=20
>> later?
>=20
> What effect does it have ?

The idea was to avoid doing kinit twice for a given cli_state and
cli_credentials combination.

But this doesn't have protection against pointer reusage, which can
really happen, there's a reason why I invented this commit for a similar
caching problem:

commit 0cec96526bf4d3209caf36c4a19632ff5d5dd112
Author: Stefan Metzmacher <metze@samba.org>
Date:   Fri Oct 4 10:02:56 2019 +0200

    smb2_server: make sure we detect stale smbXsrv_connection pointers
in smbXsrv_channel_global

    Pointer values can be reused (yes, I hit that during my testing!).
    Introduce a channel_id to identify connections and also add
    some timestamps to make debugging easier.

    This makes smbXsrv_session_find_channel() much more robust.

    Signed-off-by: Stefan Metzmacher <metze@samba.org>
    Reviewed-by: Guenther Deschner <gd@samba.org>

I think we should revert b458f8fbb7febf3584fa648128b4e1dc764059f7,
there will be better ways to avoid the kinit overhead.

metze



--c0SyYKUzI4v7tX83qCrhrZFJyzipzPHNF--

--LxVxZVhTeJjmqwtBz6S4E8anXeJkxTyun
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl7gjuIACgkQDbX1YShp
vVYqfQ//RDZ++8PKQeNXOB3pGZ211TjLnEvrAE/X1ZBshLeJkh36NyHYzD1r/XqO
T2zeV0BCP+6gi8R24N360s8FnF5pd/Jcmc33TB6RlyjdBGlekqU1iQN5jQidFSJv
7G7tNHPC3M6KzaeQ0Z4eu3o4ISs1hDlO0i6izG5iTPfbxbLjlVxFa3+WKqhYjZyL
KUPwLyS/dtIcZ5GqI7SHxT7kCPeDksqsn0IvAcecsf1j6OZyEIvvfFjQcPq6B3th
u8GO1vdQDgs4h0O5uPi9q9vo6+DIOvLoSqLc69yJ+X9weRbNEzpF1bWIQ8YwDmAr
q6FMJ9bgxqnkSdCzVUHPAUfrypQ1+XVdNxkXQ5abcJu3rzAOmRUCUWINFb+her8S
5Mnx4R2sZeoUrujRc5M6e62217e++kQ0NItF9CdRRoiPjVgxcg9PTT5zWlUcsnQh
ngNEq3LBu0xGj4a1tE7L23hRlTYehJMJm9bhQmvdHUv9IhyY/ePfqsS3pV82cUoQ
uod90XNfzqKzi6EJh/uC0rOnGh5TPWypufmVWGwWCL2hegWlsVvx0P04xdjfdgpV
LJhJhTbYaHABFf61Gd8X+kUpQ5NLhBQVn6XTiGaHXP7ff3M4/hogVC62LXYDF0O3
RRW1z/+kWc99SU0zklSs+8fF4yYhCw60xpSMBsJ1pwbRWDog3MQ=
=yCEa
-----END PGP SIGNATURE-----

--LxVxZVhTeJjmqwtBz6S4E8anXeJkxTyun--

