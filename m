Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B235B27AA52
	for <lists+samba-technical@lfdr.de>; Mon, 28 Sep 2020 11:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=CjrvuvhZCCTlVcAJY5iWt8Zf0O4Yugt93WbunRTo6vU=; b=LVk9I0mVOgzIGGpCOu2p5ZIGDk
	jSyJEnsFviMVhiTFNrYYeTulEU4cPM/dgzUCPcgKFjkTPL3uy+HxvCefCSGYLkrvAq6yA/X0itj34
	GOMolJXLRG014sAJndvuiCKaJ20otBc7O5gFrdbktQgaZstyHoHoujesfEkpt/e9r4JGC8gKbvVF/
	awYKszpemEUAtRELnhpABE0pybVrKaCNhAXTtKAY6pUuXqmn09onhkJ428my1LbSrKLTfdYJBupTU
	boPz3p03r+pLR8A2YeKS/k8i/evrNg6q/6EOL2JHmAAqNnkteQXqsS3qsAeUlUgPd5eETrUBVgBQU
	4BkRJpVw==;
Received: from ip6-localhost ([::1]:63060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kMpAN-007fBb-Ox; Mon, 28 Sep 2020 09:09:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40780) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kMpAI-007fBU-5Z
 for samba-technical@lists.samba.org; Mon, 28 Sep 2020 09:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=CjrvuvhZCCTlVcAJY5iWt8Zf0O4Yugt93WbunRTo6vU=; b=dk9YfHMlw/6tVyWeXGRq/GMuy9
 TmWYHA4LF8/7FRLOfZsD7PDBY4x9A+22C81QmAxsAgWa4zJjRpniokOJ9X8T5XT15Ztk0CC9qWO+P
 BXMxq/wHT49vyVqmZXIqUNt2RQ5YItlkBXQ9VWURutDdng8U2VvCdyYNrkUgfwkpxr8iBOConORjd
 PFWYhsiAwhqTAJFt8EPOkbuaaSDkl2FkLpRfcOQ/dFYYo3LC//WwMfoHY8Asg6ZPLNsseZ8UcTCB8
 fn0rXOg3btwb239QX+TElDtkaDkWrtTsw9TxjJyL5AT0G5HM/EW0SDh/sNMDmpbGXCU6IxvoHH+iS
 BmcQGGgJCefdYcyevIez8GfyoZAla8q+Nw3SglCVO2ZEvAT/KVasCNpRVRaHDvS9UvGX+3RD6rWNn
 tgrbGtSl7aH8VI+vTq6pXsJCVZM/bLv6HUdmta0JdEaNQh1hy8dqJ6Sgj2jogg/VcilpRT2nK2YPo
 IIVMYdbOBqP2OmUDhH4qHeFX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kMpAG-0004MN-Ub; Mon, 28 Sep 2020 09:09:45 +0000
Subject: Re: winbindd callbacks not triggered
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <CAC-fF8S+4hyY+dsWLFPcfxjR0thU64SrCGX8u8n_3YEi-0RwVA@mail.gmail.com>
Message-ID: <d8a1a7eb-b20d-9236-232f-ba1cb51a59cc@samba.org>
Date: Mon, 28 Sep 2020 11:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8S+4hyY+dsWLFPcfxjR0thU64SrCGX8u8n_3YEi-0RwVA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OmIk9LjDXidFtVhPXc5iQrNDS0gUlpK1L"
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
--OmIk9LjDXidFtVhPXc5iQrNDS0gUlpK1L
Content-Type: multipart/mixed; boundary="kjA90RAwEHVaIRqy1ZgXeOV9u6NmOOhqz"

--kjA90RAwEHVaIRqy1ZgXeOV9u6NmOOhqz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 9/28/20 um 10:51 AM schrieb Isaac Boukris via samba-technical:
> Thoughts?

have you tried setting "winbind:request profile threshold" to something
like 5 or 10?

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--kjA90RAwEHVaIRqy1ZgXeOV9u6NmOOhqz--

--OmIk9LjDXidFtVhPXc5iQrNDS0gUlpK1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl9xqFcACgkQqh6bcSY5
nkZrEBAAnl/PRIHOl3drJ5GqgVPiLC/ynXtQfG5lVcJQEsQD3IvAh6rtUd0MAgbB
CTrviDvxzVDbwyXR8kUfONS+XY9YUNL3ktpZbQ/85j3PEPRAFVnZssaQvuDxGpiJ
Cq/I5S0ST9l/b7RYG3X4uq5VnhaG89A93dhWkEshjirD9SO52dB5Z0bASrj7elSu
XUA1A4BJoHDibsumlwB61QDAeAuxClZjlA0DyzGOdd4y2TJgLRyqsTnxhqPtUeEh
7Gx59Te6bZ7qmaSTVtYBoJyWqk6j8FjRAytzyTE3SbNmbynUYehN+7gPYgiSsQKX
uaHFItXGSvoX64UUfCVwIOOo8SoBOWffqwB2zZTzLu7pN3qazR3ND+xw108fdqXq
PfkSxS295STICnVTxHrGsOLbQiF7mbABNTUQctnpE5KQVpT/eE8JqAp8DnMHhdgT
AFxfpBKuQ4Kd/xAbzw1xPeJcfYsbBYM1V3yplZtDtL18PLdA1oJTUlZmwOseK0pQ
KgsJXaro5EoHaZ6h7bsuG3c5yx9PAN0Yc1XlDxjLYXt8Q17hgg3OyiNJg4QjaNr6
DDe/1PA6Ug080HZvn2avM/gd4lqbFhyBFETgSk2/ppLMceL9YEX7cDY6wdyUCKhG
PL/qVhgWHqhknqWPt7cjuKBeNTBjcNf2qPBLr3TttcxS4gGQAwg=
=htpF
-----END PGP SIGNATURE-----

--OmIk9LjDXidFtVhPXc5iQrNDS0gUlpK1L--

