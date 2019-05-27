Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BFD2B15C
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 11:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=6maWO5UQY/M5aP3GZFq3+1NEzFO19k6vEIVjYmPpTSM=; b=nqa8dJSP78dgv7xNiXAuFHxVnO
	oOJgglLi1Zo3H6vJ4mDI8rOAX/uqroGiTlSv9/20AQc771a4wTWCJPdoWYKB31BLACNseJC18fOmv
	h+mcyD8bnoJMLuEF5Z5j3meRb0a/IAK2L0eyXiRyicw4MUVOEL7JbgCupuVmJA0159ZbXm5tMCymp
	CPiDsob7r/m6bEgnoCHNp1CR3RROlll3DaBFOrxqvpfa81FUr1cVTRBNuS+BoWcwR8V+pU/iNc+gR
	rfPmV4EWRL3AvTNMJ/YJRKIBSKCwH03EPALZVnmd8JMVUYRlmIDNeaycgk0Ym6ByII/5UKcZUXT9K
	vb9pA+gQ==;
Received: from localhost ([::1]:54598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVC1U-0029cy-VY; Mon, 27 May 2019 09:34:29 +0000
Received: from [2a01:4f8:192:486::147:1] (port=38634 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVC1Q-0029cr-IK
 for samba-technical@lists.samba.org; Mon, 27 May 2019 09:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=6maWO5UQY/M5aP3GZFq3+1NEzFO19k6vEIVjYmPpTSM=; b=TSBu02naOqojSnh44qE9nm6t5N
 j/+4ULckeV7j9YXm3VRtbYiaqDlvHoD7crjErK3XDw6hyB5oeqz2mXoTinzQ/1klD0sTjwGK8J+6+
 BT0a7f74OGyJWECVO1dPe1N9rBFygiiFYL9ICV7k6yj390G5CynQ5bhak6XwNLnXSdw0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVC1K-00056G-Ho; Mon, 27 May 2019 09:34:18 +0000
Subject: Re: [PATCH] zfsacl: Fix ACL behavior issues with vfs_zfsacl
To: Andrew Walker <awalker@ixsystems.com>, Christof Schmitt <cs@samba.org>
References: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
 <20190517054426.aoyovsk4cwsse2li@inti>
 <CAB5c7xofY0NQMrf_UX36JHDucoN5f-N-HdPvXis3PXMRbSEQpw@mail.gmail.com>
Message-ID: <764e0998-97b3-c47d-bbc7-73c8f748d58d@samba.org>
Date: Mon, 27 May 2019 11:34:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAB5c7xofY0NQMrf_UX36JHDucoN5f-N-HdPvXis3PXMRbSEQpw@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------58D88C3EF22D59CF24B4B014"
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------58D88C3EF22D59CF24B4B014
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On 5/20/19 1:00 PM, Andrew Walker via samba-technical wrote:
 > Thanks for the feedback and suggestions. I'll try to get this done thi=
s
> week or next week. You are correct that ZFS has the  NFSv4.1 ACL flags,=
 but
> FreeBSD does not currently implement NFSv4.1 ACL inheritance. The
> suggestion of just mapping what we receive over the wire is a good one.=
 I
> could probably do this for the case of Solaris and Illumos.
>=20
> One possible alternative is that I could move this logic/lies to libsun=
acl
> (the library that maps ZFS ACLs to FreeBSD ACLs) so that there won't be=
 a
> FreeBSD-specific parameter for vfs_zfsacl. In this case the only thing =
I
> would need to add to fix disabling inheritance in samba is mapping the
> NFSv4.1 ACL flags to control flags like gpfs does.
>=20
> Let me know if you prefer the second approach.

Not sure if I like either of both. :)

Iirc the protected flag only comes to play client side, when Windows
Explorer performs tree inheritance for new created ACEs. My NT ACL mind
model is currently swapped out and not fully swapped back in, so I might
be missing something. Jeremy?

So basically the only thing you need to implement this in the filesystem
is storing the flag, no need to attach any semantics to it in the
filesystem. The chmod command could be updated to honor the flag when
appyling ACL changes in directory tree mode, not sure if how GPFS
handles this.

Christof do you know? I guess chmod on GPFS will ignore the protected fla=
g.

So ideally we could convince the OpenZFS folks to add the flag and store
it on disk. I'm still not convinced that setting the flag for any ACL
that doesn't contain inheritable ACEs is a good idea.

Thoughts?
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

--------------58D88C3EF22D59CF24B4B014
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFzgBK0BCADMj5sZpYD3LrcDnDxTUTpzS4Fpnba5QUUtmmT8muJQZhu9ARqQ
lKHnRnYMvGIfN/6Ju3l9FUG7uAbwiY0+4g8wgkc7cqLhla/m5ilR0RSj/4NBlYrc
SViPqHtye7U43tSBWKeisK/aSaChtxe11GU7piWCc7iZS0Pdh5nk6Bjgtyu13y0+
d1QxcWBUTYa1kVQTGcWjBGlAsD20x/pojhA98mgzR7IQ4D/opWvsT3PkqKfrXbIA
BxJlNLI9oBdQ9kPXatbDWzpgFV6lbb0LenjuAFmnhJa5RkIsQBOo1H8igfFGC/EY
xa/83xTYhB9kAb8bZ/OQXKYWLwgh31SuawY3ABEBAAG0HVJhbHBoIEJvZWhtZSA8
c2xvd0BzYW1iYS5vcmc+iQFUBBMBCAA+FiEE94NHVYAePaUwrPPQZC0vYQ+8I1QF
AlzgBK4CGwMFCQHhM4AFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQZC0vYQ+8
I1QQnQgAokhbUXheexlL3ZZOrMQhYh0mCL7AAlPWt96dEoJImBNUsvGFh04hmU/x
PghTnqO3879YPAxGjWtCnDnNsxLRbl6wasMqKpMzJuFieTMsY0670Ce04UW7R1Jg
Ae43o4nWVwtqug3j4rOG1Wk51mtxxrKjTnbIcKN3B4mU4vuWXVfiBm1iX3ISlRAz
VRRcEhxVCq7whLaBh/AK+cpkVK/fEjvUr1MXT0BqtGowDRRiy4IbCww19b7soHJI
fvfZvIicxlrERHKzfpTe3pNUSEsJJZBq7QfshnQluOrHDbwoUd2UXmU5qMLaDrdD
E9bA4tSsfSh48Nu2wHGAgu6nkIP5yrkBDQRc4ASuAQgAtpj76xoodLJ3VZAjSruR
Cxg3AZACD7LRZ6ioz2qJtJmiHyKhbr3RHrfah2mCcISNZydxiRv9sn7oxt2a6lgn
CZJNevc815G3nU8dn+dY/zgZiQCtk/vllX8Uvkta4/dkGNJXXk+czj7PXSGH9KcD
i+3m6RpivOgc/nqKPuuej+iFII+SN71opgDAuLdJNNrD4zdh33qEZPqdVxsbSTGW
Oc501Mm6MKwuYJwwWbxM1hK7d6dFC521QAv6//tm0medMd8mA7+4bZFV8gDMZg++
vGxT/f6B0bYu/cacv6rN4J+PHfn5hXkv757wJbWISN8rUowsGCerAVKjSMEiXqN+
pwARAQABiQE8BBgBCAAmFiEE94NHVYAePaUwrPPQZC0vYQ+8I1QFAlzgBK4CGwwF
CQHhM4AACgkQZC0vYQ+8I1R9bwgAhQnf/Z4cd3CmE/j0+Vcnrcy+cAcMlnqnjRAt
mooh/1MR15ml2mPp7/SSPYp3ZJ0VCaKRkEwcchSRAFrEacLt1cTTbtZs1oubReLU
QclqKatK4QWyLTB/MlcY9+P8zDedDxoG5YNVXNbEPGzd9TdadT1YGlCCVjOc3nuX
IITkv/X+Yk12ZFJ9JvMQM96vuBgBlCX/dr0cxSA0oqKC8UplMsXfkQJ7QYLB+JW2
D40ukeoKKarpF1/ys0gSP7Qi9jk4We8KkSzfv9NGfH56THbtA2FydOXNIgn+jYP5
gFKuxrEsr79mTlVwszKjC8DG+7jBz+1Y/mM+0kEJcBaz5KEgvg=3D=3D
=3DUz8n
-----END PGP PUBLIC KEY BLOCK-----

--------------58D88C3EF22D59CF24B4B014--

