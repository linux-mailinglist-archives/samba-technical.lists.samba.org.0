Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A57AE2C823
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2019 15:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ptBxTqHF0G5NMhtvwsvWBlBv6tYi+amOheEPob2Z2KY=; b=wF7gOouTdgZ6/v4S5QZvMwVVOd
	z9UBWRCkEpD4Mg5WpBt9wcjBd1kmgLu2OTAeJ6djzq6Ok2bsPk36mLxrKGOSp7sh2GTaIo3VJtu6h
	ZVSQwYNOKPyxgF/lQ++KMqywwFx/I6WqYgcPUF9doKY3AqU6eO3htHRHyQWT0I7EDZuB9Gybv1uUE
	ZXC6+8j9FCx23KBJjSl9Q/WT6/jEKAanslbbIpb4OlMG1hBwius6H5SHZpvS8cvrlkz11lVhyBAVE
	pj+07b/A4s+lcHMH7m+b1OAYgpa3hvTcm1RgD234X66a7SHSDkRoh5e/sTeSYIosPRKBev6CWa2wk
	kEAtsxwA==;
Received: from localhost ([::1]:35268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVcUd-002MW3-HD; Tue, 28 May 2019 13:50:19 +0000
Received: from [2a01:4f8:192:486::147:1] (port=51596 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVcUT-002MVw-Gm
 for samba-technical@lists.samba.org; Tue, 28 May 2019 13:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=ptBxTqHF0G5NMhtvwsvWBlBv6tYi+amOheEPob2Z2KY=; b=U8/OFxqc7/y8ApRqfo01RXkTZB
 k4F8m5D7EpzmbtwlU/3Db+Fp4QgftNr8ZJIuGyA7hfsBrlrDECww3WZhulVFi+2X6Ol07oHbBhf1L
 YKB3CpzJ4WI3PPD5x58IGMAkDsPwB0s6+Y/3j90hzWOg/fQk1ABgfZScRxcCeaz8DyCk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVcUN-00007H-AJ; Tue, 28 May 2019 13:50:03 +0000
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
To: Ralph Boehme <slow@samba.org>, Amit Kumar <amitkuma@redhat.com>
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
 <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
 <20190527140812.qeyamc5kzomgipuj@inti>
 <6aa5bc8a-24f1-8bf5-5f58-99b3df1e84fd@redhat.com>
 <20190528095640.fcn2gm5gb62qoqel@inti>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <bd98b9d8-ec9e-4cf6-6351-e35d724c82cc@samba.org>
Date: Tue, 28 May 2019 15:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528095640.fcn2gm5gb62qoqel@inti>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="X9MW9g2EQJFed7276I7N0wT9b9G63H9pI"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
--X9MW9g2EQJFed7276I7N0wT9b9G63H9pI
Content-Type: multipart/mixed; boundary="0TkNv0rABndyawurLljgOJtDEViBFrwBc";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Ralph Boehme <slow@samba.org>, Amit Kumar <amitkuma@redhat.com>
Cc: samba-technical@lists.samba.org
Message-ID: <bd98b9d8-ec9e-4cf6-6351-e35d724c82cc@samba.org>
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
 <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
 <20190527140812.qeyamc5kzomgipuj@inti>
 <6aa5bc8a-24f1-8bf5-5f58-99b3df1e84fd@redhat.com>
 <20190528095640.fcn2gm5gb62qoqel@inti>
In-Reply-To: <20190528095640.fcn2gm5gb62qoqel@inti>

--0TkNv0rABndyawurLljgOJtDEViBFrwBc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 28.05.19 um 11:56 schrieb Ralph Boehme via samba-technical:
> On Tue, May 28, 2019 at 12:47:05PM +0530, Amit Kumar wrote:
>> Created merge request:
>> https://gitlab.com/amitkuma/samba/commit/1a6f331445364de623d02425c8d8b=
46a59eb2c53
>>
>=20
> Thanks! Unfortunately you targetted the wrong repo
> (samba-team/devel/samba instead of samba-team/samba).
>=20
> Please follow the instructions at
> <https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Other_Samba_develo=
pers>
>=20
>=20
>>
>> Attached patch as well.
>> (0001-s3-winbind-Not-abort-when-received-NULL-SID.patch)
>=20
> you're somehow munging the patches, replacing tabs for spaces, that's
> why the patch again doesn't apply.
>=20
> Looking at the patch, I wonder whether we should skip the trusts with
> null-sid instead of adding them?

I'd also prefer to skip the domain completely.

metze



--0TkNv0rABndyawurLljgOJtDEViBFrwBc--

--X9MW9g2EQJFed7276I7N0wT9b9G63H9pI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAlztPIcACgkQDbX1YShp
vVZbxA/+PFtYZljGmJ6kr2+OV81jseGXH6hkbysDq/lhdg7dwsBv2AZIYe62ykQU
u+vkWl1TLKKUXS/mxeVvBH7k44tpg0mx0Q8LYMjGMr9BjsO4+hBcMPQtUYaWVmMw
VbmfuOCG1epHBPtNWvwHL8CWPbz54Br1bWFaIBZX3ASz6oiYTx00FKUI9v8yGKTh
wtF2Ox8xVejX4RdiITpcRnelnsi0SHWpWvAb8+4s1KZGTf1ycg+ZN3YNPxoGJx+C
3t7AZptELKlLJDSNSbNvKxF3URdpYGOBcdJtVEf4siPwPmuxuYVo10U+VToJsYCj
4E7ghjV/ZrbzCCNnbVAZ6DiYGo/StzNQa3YnM/plr2Vk1VvRCFnobIQCELO+5NVs
tByu/J1/wSxijVykcYcUCEhTNyxssVpnatN+m7paSbizjpNxqFkDHNu3lHazw5ry
Lzi340vMtWwyB6eA3IqR05EEVUVSlfsBd0OQPBZ/w+ylPy0VyG4U5EksRjLMjURS
Kn2zBJvp+er3rnq2zXSNHa5WP7BkPobGYMWl8XjQA6GsEslj1rNcsslAR52O8mAF
mfOsGr/lTjYlX3JWKNJb9pfyNJrADw4OSnmfTj+8JKh8rXGFuQriF38B5hXodueE
06kCkgabro1hug2ymMNFy48gEY3ysyw5x3yTIabOIFlWVzpMFQQ=
=7TCn
-----END PGP SIGNATURE-----

--X9MW9g2EQJFed7276I7N0wT9b9G63H9pI--

