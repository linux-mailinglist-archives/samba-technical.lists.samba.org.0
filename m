Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE721B3E4
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jul 2020 13:22:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=P4414qbgtoLz/9Q0EQW/V7k5cG3aZo1mOjipawWQWx8=; b=zbPLonz/nOCUwVgTqcgycQllY/
	K0vo6pjK0QB1zBbSe27Ji3JdGU6rkUBsfcm3+Lx3iz779/MB/092RXpRTnrI5PB8KQnsPAVkOCLxP
	7etfIgyD37mS9L6ID8KGGkEcGJ1J+HECip2prxhgmfX2gepQ92K1atHx2AnmJol+A1DSRHGZFuVug
	EDI+WeG0Bx5cMZrp7KGjknzeQ/3mFnzpcfHp05O94fqQCU2vatmkkduq0RHuSBnL60dG5ThsqO9M0
	4RHHJXE/ooB+8qQLd1gR09pGTWU3QJVdSZffJTd78QljMNnDulY++NG00YMxgoZWMeulSQVp2K1K0
	ySUCdxsQ==;
Received: from localhost ([::1]:28736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtr72-006dW7-8B; Fri, 10 Jul 2020 11:22:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62020) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtr6u-006dW0-II
 for samba-technical@lists.samba.org; Fri, 10 Jul 2020 11:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=P4414qbgtoLz/9Q0EQW/V7k5cG3aZo1mOjipawWQWx8=; b=igOktZwSfPrhIqvXwCr7h4BRTk
 sYVnTlEu6J5K7oeELufSkwAeY401nA5NKAGBI1gnUy/eFhqJvpMEo0mL26wlbTk36pKWT7zNvuj0B
 j9qSzXUlKIZHXFxcAE2/dkjZ8w+enfdwmnlHmwZhpjFbFuR9RKyYqqzB575wructcKDEJ+dE2pYox
 uYMnZDJBOLoFWVrymXIngfk/FdDxu+2YHrAsVhsg2KWPD+WOmrMt0x3rUfDt9M4kkYt1rXMrCNch8
 Qf2qVzzis5lg06Pe8oE/+CuBinJjnYoJIbYTwt6NhZ4lrbCuU+O6nCQq0DYVFUWitNu2g/ZuyuehI
 A7wJFkvC2Fp63GvZtcffD3a5IRQfdBaaN4ksMR+R1UXnWG6CwaGoSqSWlU2YBUv2lZb5gNKTg166T
 0Vjab7JEDc+SiwJxMn5N58kF7dA46h17k152m3kZmgkunPl4+DprBNJQEDx220bwuWU9C/pJayoqF
 6YIwPN0aTtMJwHmT39ZoLPlx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtr6t-0002mA-Ic; Fri, 10 Jul 2020 11:22:31 +0000
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
Message-ID: <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
Date: Fri, 10 Jul 2020 13:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200710110737.GA1585556@sernet.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PVaNZhulvxx4bDyiCeOuBheUf4r8bgmD0"
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
--PVaNZhulvxx4bDyiCeOuBheUf4r8bgmD0
Content-Type: multipart/mixed; boundary="wf31UMFLddbWUoSjxWcKhDjE4pVq6B5aW"

--wf31UMFLddbWUoSjxWcKhDjE4pVq6B5aW
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Bj=F6rn!

Am 7/10/20 um 1:07 PM schrieb Bj=F6rn JACKE via samba-technical:
> can someone pleae review and push eventually?

How does this relate to the discussion in

https://lists.samba.org/archive/samba-technical/2020-May/135241.html

that resulted in commit 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a ?

Thanks!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--wf31UMFLddbWUoSjxWcKhDjE4pVq6B5aW--

--PVaNZhulvxx4bDyiCeOuBheUf4r8bgmD0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl8IT3YACgkQqh6bcSY5
nka1cA//V9zmqDnJLV/c12ectOEQpDXltM8XZl8cYSYbLcX7Sbw28kiYQp2GC4R2
LuBwWtQNpGvPyGO0GS/j8IyLRjl4p6sWhf74dfsNrBkEj5sEHjFwOcBnLxZRD6vs
Ey68jeLBY+pgbpRLLBp3rQ689vJlth/bXkaYZ6mbP+vUayAuGA25FT8T0N9MX3F8
r3GKCyJ6YiCZm9BDwNPtgDvjdEXYMcedAR38ujvR8yW0URnH2pXsVw5UaHOlxkfW
s4SuQneXBjSU1pJldiHPAzDIuNYdbVl2WCJkR2sNUSS+I68N0XDbolpq7rxufLDo
MUUbgn25HArLAEYagzMSRTvdQJ57zvpHIp3a+Kx81aqnkgoVBfasu7oDtryOuLMB
xFMNLbWAyJ0bezAojAVgp2HQNjuEbteUIhR0S1RJ+bxYKcsCEg4ikAj/+pV0i/73
BMhosuhqzQOu7IZ3DgIfe/MURDvAQuFblKygMoCBqFtR0CRkFnQG9uZGshTll+z6
OFgldlMH37m6zGAa2D4lTU4gJkd6wncWQG/D2UU4YeC2vwdPSmn5iv6o6dgu0Iwc
PDZN/bNuWmwYFkYCJvAzWcZHBgbvATcKVWba31xdPvf1a156Kr3BzDBuMCFLhcys
I5PlvaNj5jWjgZAjA3i8ixVAFOMY/7wlU4N3PtuSFp6O7lLY7Oo=
=iPk4
-----END PGP SIGNATURE-----

--PVaNZhulvxx4bDyiCeOuBheUf4r8bgmD0--

