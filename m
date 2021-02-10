Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEEB317274
	for <lists+samba-technical@lfdr.de>; Wed, 10 Feb 2021 22:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=brQk4g97WeQFiUwKR+8c7imQWvfZpic6JQDazOs+hlM=; b=CnO0k5DspwIp17IBrmfQCGIFCE
	ZqKkl+tOxAWefQsK3tNVCCor7PzsBp0n/DYEZjEOHEAr9rltqWEsU+qIBFnAe4dnGLXuoyREfDtjS
	Jbgyjw0s0+Kf+zl977ka+QkbVqusoDTUbEfH5+LtxkWnWt1QJ28pNP51Cm+0tSAxVHuTtCus2nEvn
	4138B0Ic8iHyRLRFT6FTkfvxtLxxuCM8wh3ULeFEHy1izwD7H3A3Jjg+iU17hrx6RTPqJndWNrQUz
	aCdVUjG7ZBzBl3Q0d1t7NPSZz5SIaGPFPHwOqt1P2HFZqg+qt0/o+I0gxIDY9yBj1ENsVoprnxT7j
	HPDCsz1Q==;
Received: from ip6-localhost ([::1]:32806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l9xA9-00C6U8-Bo; Wed, 10 Feb 2021 21:36:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57608) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9x9w-00C6Tm-88; Wed, 10 Feb 2021 21:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=brQk4g97WeQFiUwKR+8c7imQWvfZpic6JQDazOs+hlM=; b=TYg5g4La64IkrC83eabPLSB3gh
 r7sQs9ws8v/3Isn7kMFzc8lgPzHr2Csd9Vz3fW58XsjLYMnKpHbAgpxkr0D07CIxEA7vtzintTGeG
 s+Z5nnPdLk8I85hm/P+MmXIgN/BEShFnJZks7gpNVDm1t8BSx16daHgxTka8PBvoporDgU2cDNyHe
 oQvL2w34s8gnpe2D2xFBJ+uQdxwzz1iq5gSpIM1WlG7U98Yg9ChK2+NcWqTBqHkM0AsjY6EBgype0
 p/SlmH42AlUyo0O0A1pcej2bdBzO0upPbrF9W5k/GkL4sB41j5O54Utg2LlKeHEnNIDwr3PT8K8+c
 EzzIsrphaLzUZPc4I74gXBTsvzJpDdvnm3nWE552FxegaKJ9JSUxA7l0vGZFkrdJ6iWMTL/D3KJwe
 9mzZc64PNaJn6OB5ibdFeKpKKZFeKsMMyssXSEu8uktEHl2RczEHlkF9eRT33VGDeZPfVDbVOrvDE
 7RI6sskQtv5LRou+eF529QVv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9x9v-0006Da-IS; Wed, 10 Feb 2021 21:36:27 +0000
Subject: Conflicting public symbols... (Re: [SCM] Samba Shared Repository -
 branch master updated)
To: samba-technical@lists.samba.org, samba-cvs@lists.samba.org
References: <E1l9wbe-005h28-1I@hrx0.samba.org>
Message-ID: <ce529d61-561e-aecb-86cb-5f51aabf38bd@samba.org>
Date: Wed, 10 Feb 2021 22:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <E1l9wbe-005h28-1I@hrx0.samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ZK8eIKyb8fIqCYnNiG8EMjZkuyMAhwJFZ"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZK8eIKyb8fIqCYnNiG8EMjZkuyMAhwJFZ
Content-Type: multipart/mixed; boundary="Zjwqv250a20d49eUrgLQ2D5cjygR15OyX";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: samba-technical@lists.samba.org, samba-cvs@lists.samba.org
Message-ID: <ce529d61-561e-aecb-86cb-5f51aabf38bd@samba.org>
Subject: Conflicting public symbols... (Re: [SCM] Samba Shared Repository -
 branch master updated)
References: <E1l9wbe-005h28-1I@hrx0.samba.org>
In-Reply-To: <E1l9wbe-005h28-1I@hrx0.samba.org>

--Zjwqv250a20d49eUrgLQ2D5cjygR15OyX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

> - Log -----------------------------------------------------------------=

> commit 551532d007970ab11dca71b532754728a6a78496
> Author: xzhao9 <i@xuzhao.net>
> Date:   Sun Jan 3 13:02:18 2021 -0500
>=20
>     s3:registry Renaming get_charset() to smbreg_get_charset()
>    =20
>     Rename to smbreg_get_charset() function to avoid naming conflict
>     with MariaDB.
>    =20
>     Signed-off-by: xzhao9 <i@xuzhao.net>
>     Reviewed-by: Jeremy Allison <jra@samba.org>
>     Reviewed-by: David Mulder <dmulder@suse.com>
>    =20
>     Autobuild-User(master): Jeremy Allison <jra@samba.org>
>     Autobuild-Date(master): Wed Feb 10 21:00:28 UTC 2021 on sn-devel-18=
4

Do we need a bug report to backport this?

There's a similar problem reported here:
https://www.downtowndougbrown.com/2021/01/tracking-down-a-segfault-that-s=
uddenly-started-happening/

Does anyone have time to have a deeper look?

Thanks!
metze


--Zjwqv250a20d49eUrgLQ2D5cjygR15OyX--

--ZK8eIKyb8fIqCYnNiG8EMjZkuyMAhwJFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmAkUdIACgkQDbX1YShp
vVahsw/+Krv/KpAaJLpF/6PPne9BjggHFY4Atv5hdqro3vyU/DDb+xEYnYMad5FE
VxhcJE64wk/uAXY0P2u/5Y9LrjdzJvbKpBQtVz/U/s8YEHysmL+RUz98NoAhXQi5
1h488+d9IGHM7vuXwXEaXJZ76JeF4QcDqzc4mD5OW/m+OfQ3ILS9M6E5JY/VQ8F3
vMPlCb6qy43wvwVF5Cb1fd0jrrLNOXGxW4zVEEzH1AJptfI4hSZLzGH/rkANziQ1
eZlrM3KseCYKJuVhSmFucqb3CP3dniij77NUNwMo3z2McH1KYYVv4FmzHclQ9VUq
9l7wV3J9sQKtI2JbZ3QojRN817uH0WZ3Lr4luK8lsMsrsrfONpr9HqLJW5omyMWM
3xatTATAv5IisdRWpQvtIvASBYXSbuNqUNQ/0l4usrU7JoaJzpMqIjuJzJZtUf11
EdxRDptbzuWC4cDEaR5h0BaT04emZjjxCp/FdPGmNlPw24khHl4Um6Xaocrt1gdP
VKr69L5uwbC+zfFSMLmnQMpzHzJBcxUv3S53kBYo95cAeVVKEoU7/GMI4GCvsdgy
HOeyY4d11FCfppfETyYEntV62VrNQSMJr++ddKNiZ7e3xf3u3L2kKzKdvNAM5nnE
XleV1zrN7plFQUDxPr7DQWdXwrxjrC2FEVWhRZ0ldVr/HaBWFdc=
=qvVD
-----END PGP SIGNATURE-----

--ZK8eIKyb8fIqCYnNiG8EMjZkuyMAhwJFZ--

