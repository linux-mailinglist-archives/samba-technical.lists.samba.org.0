Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49296BBE18
	for <lists+samba-technical@lfdr.de>; Mon, 23 Sep 2019 23:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JiJkSlNWy+IG1zOd52VaA1/F17mqio481wZ8e8Ii23M=; b=Z1WEJQ23FdcWrxKAfvyTbH4lU/
	0Jft2Zxsn05dbqMwPtdVUkDIzVLWMttYu1UzqfkypVen4abQvjtpmW+KkeKNNi3XoSwuTbB8EtJMu
	oR6O+UGneSFIjv+1yYbifi34sJV+Is/iCJ6Pq95/r0ba1X5yPLL6a6LggThb1aSLNq2Gi0rs4womp
	xoRrq/uMdXiLzOz7uJ5KpU8rwgWR+fgaYiPWNnya3s2pADYhE+UMLHa0EmFsdCguT8He80uaGq4RF
	kaHI+Bc9+KMvXxoYpitYG5qKau+Lpi7dRxh6j/mhrpNgN5Qyh8TTl22libNyOzUprabX2Kz2w3udv
	RTvLcuPA==;
Received: from localhost ([::1]:18486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCW9Z-0084cN-W3; Mon, 23 Sep 2019 21:45:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56156) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCW9V-0084cE-V2
 for samba-technical@lists.samba.org; Mon, 23 Sep 2019 21:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=JiJkSlNWy+IG1zOd52VaA1/F17mqio481wZ8e8Ii23M=; b=OLGwwx2N1zjW10chPgbLUGDdVd
 Q7y/vxS3Vd9tm9BYUa2HwYGWWsI8bTZmZ6wv6lcVKfZBjTnHRnMEc6Y+onKhJQhLFV3J6ekzDccvN
 2IxZiCI7iAJA72rG1LMnRnodStmuYC9FBBcsB3uYQQtk4FOC5hMAEXaQBdP4unBLAY64=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCW9V-0006xz-05; Mon, 23 Sep 2019 21:45:49 +0000
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
Date: Mon, 23 Sep 2019 23:45:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="jNun0zHPUNgfK2zkF594qhE7jILrH0otz"
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
--jNun0zHPUNgfK2zkF594qhE7jILrH0otz
Content-Type: multipart/mixed; boundary="0AxQ5ZHO4jf1vRCyEnAddAZ6E3xNMY9Vt";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Message-ID: <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
In-Reply-To: <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>

--0AxQ5ZHO4jf1vRCyEnAddAZ6E3xNMY9Vt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Rowland,

> On 23/09/2019 20:39, Christof Schmitt via samba-technical wrote:
>> The behavior of winbindd changed in regards to whether a group with
>> ID_TYPE_BOTH returns a fake user structure. This surfaced during a tes=
t
>> of creating files from a SMB client and then checking the ownership
>> directly on the file system.
>>
>> make testenv SELFTEST_TESTENV=3Dad_member_idmap_rid
>> is an environment that provides ID_TYPE_BOTH for testing.
>=20
> Surely if that is a testenv, then it should be removed or modified, a
> Unix domain member using idmap_rid will not work in that way, using
> 'getent passwd' against a group returns nothing.

No, it did with 4.5 and that's how it's supposed to be.
That's exactly what ID_TYPE_BOTH is all about.

metze


--0AxQ5ZHO4jf1vRCyEnAddAZ6E3xNMY9Vt--

--jNun0zHPUNgfK2zkF594qhE7jILrH0otz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2JPQYACgkQDbX1YShp
vVZYUhAAlFHJ4Kq3kXdDl7b8ju0S+SwH8zyLceMwVFgTaDpYWyKBxrLxE+A75lmf
7EaTtnAAU8XzfKSmsEIhVGUy5C0NUjhvCaAJTN/sx8BQCVgSkvpQxZAKUn9RDOpn
qP9fGwqx9B4rrffPi1gae3wAIZGu/dqWmljMuaDKXHT1BzAQCFSl3cZcI+pkQk3r
yTQSwdDBcb+ATkrkMzIWdEoT/ZpKvLD1tMp6YVIP3u3DSpv2oiYOIuCg8RI9RxF1
WFqkS29ePWTHqMfGYx+CCR5OMn5wJhmyQSFMOoOwiV40/Td/KByMjAgKbMkvmNwc
3jsUVCDOjWQg2/NfhGBkfLRvUlSTds0EfNTLH5jg9N2ZqcbFH0vBGHCQ8Rakfkq8
DUByvN0Vr7b/+WeygIIUqwrvbAboQCFvXKvb2ig1ctAHHg6E3FbcLz49gg57hc1a
0ObXuzc/7OuA8Xi4Zf5fsxn7Cf3dA4NzZrQc5WPNX58/sK2vlOx9WvOTmyjXEOTi
dQk3stwNCbxFXclW0WXHp+qVeEa3KU9UcHPpRWRJfhLTSoR3R2ef8X5ae7nb+pkg
/AP8lt/HGkUAR4Ug2El1ufeXn4HcbZDe+b8SzXDr+QoyfvGmhCM7OVn9HQdEOWQ0
IPSisLvL21fSiN3AQ/hkY/t8N+Eg0QD3LqWOl2jazzHo1GVzLIQ=
=/+zl
-----END PGP SIGNATURE-----

--jNun0zHPUNgfK2zkF594qhE7jILrH0otz--

