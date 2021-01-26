Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BC9304087
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 15:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2eyiPXfIzj+cxJk2rndiVQSAIgp8NWshiww9386kY2I=; b=EHQqoy6I7OwjFyvk9HgvZVZ33Y
	A5v1qfEUrWCxUV3yO17ItPHTXAEWaUheiy1GLOUKStXlEX+Zxt9RbTlpxTtwXLcs7HVyyruQALU0L
	MdMqvdTbm+cufHLCiR0/FMb5XgnpEn6sz6QLAyWTJYDMgW4R/Olq5XG9S06Z5mv87ieDe9gBX0PHo
	cikmzrqdNBMkqw9QWDr6RBbpA6eDenjL6Gcx8+g+NlZ7LfArJbJjCC/yGoabwaFhHuLqqo9sGerbe
	oQ+wnU6PHA7XNf/M/qp2nILGPsNaZPyATZCLY7RBnnaEBPAn53/hDfKillcENLbjF37r6k8ncLWWh
	lFq/zzbA==;
Received: from ip6-localhost ([::1]:28002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4PS9-007ERi-5T; Tue, 26 Jan 2021 14:36:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59512) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4PS4-007ERb-8o
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 14:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=2eyiPXfIzj+cxJk2rndiVQSAIgp8NWshiww9386kY2I=; b=kK5sRvr3FpfGdWVdjBpl6fcrh3
 7w3G/+dqGLdr0qLhzVvY86U8CWp3qlBkQcBCsl+QlVl+njbzPriFMyqVB62Kvq0fUonv1JHQmkrxe
 A3K1aqP3NwDOL5X2UAKFYKhGAVIotQm01/0u7lX77ZPwxNgge5MLiIgBSRSdWJjRr6hM/mycp0Z1I
 mOYpXyB2es8ZfFRDJlcp0/YRMErWXgo96Qr6Pz5KXf8OpLHZtPttlayeKSoMef3ri/XjYEg3mEbN1
 kG+xZMgwlCRg7l90U6qZxSaJlaRDecYMJ99P8fCAuSUw/YkiT5gg+KwhppbZQbOFgXTnQmgy2y+Bz
 VIFZV13t6I2ClvFYGrQWSMAyHt4/+Hs7lDkvr+IHI1Y3RV4i7la4aK7HB3czGbIdhAbbHvtrB67HG
 k7y0XS8046KvOMtQyc1uCgU4HCITSXlPKk/Luu3cc1OwXRd6jVT2wRI/aggb/h3H5brvw8t7HcfaS
 QQQKasHbfNlu+ave/t9EAJxW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4PRy-0004NJ-G3; Tue, 26 Jan 2021 14:36:10 +0000
To: Namjae Jeon <namjae.jeon@samsung.com>,
 linux-cifsd-devel@lists.sourceforge.net
References: <CGME20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a@epcas1p2.samsung.com>
 <20210126022335.27311-1-namjae.jeon@samsung.com>
Subject: Re: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
Message-ID: <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
Date: Tue, 26 Jan 2021 15:36:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126022335.27311-1-namjae.jeon@samsung.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="C0dGR74xL4613Z5p7CjMYQYWAx1Y4Swbz"
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--C0dGR74xL4613Z5p7CjMYQYWAx1Y4Swbz
Content-Type: multipart/mixed; boundary="wO5UQttwQyX0BdTJzVL9O059gdDym7VRt";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Namjae Jeon <namjae.jeon@samsung.com>,
 linux-cifsd-devel@lists.sourceforge.net
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
Subject: Re: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
References: <CGME20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a@epcas1p2.samsung.com>
 <20210126022335.27311-1-namjae.jeon@samsung.com>
In-Reply-To: <20210126022335.27311-1-namjae.jeon@samsung.com>

--wO5UQttwQyX0BdTJzVL9O059gdDym7VRt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Namjae,

> Samba team request that ksmbd should make xattr format of ksmbd compati=
ble
> with samba's one. When user replace samba with ksmbd or replace ksmbd
> with samba, The written attribute and ACLs of xattr in file should be u=
sed
> on both server. This patch work the following ones.
>  1. make xattr prefix compaible.
>     - rename creation.time and file.attribute to DOSATTRIB.
>     - rename stream. to DosStream.
>     - rename sd. to NTACL.
>  2. use same dos attribute and ntacl structure compaible with samba.
>  3. create read/write encoding of ndr functions in ndr.c to store ndr
>     encoded metadata to xattr.

Thanks a lot!

Do you also have this a git commit in some repository?

I played with ksmbd a bit in the last days.

I can also test this commit and check if the resulting
data is compatible with samba.

metze


--wO5UQttwQyX0BdTJzVL9O059gdDym7VRt--

--C0dGR74xL4613Z5p7CjMYQYWAx1Y4Swbz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmAQKNQACgkQDbX1YShp
vVaLPw//S+x1nTYVUV4dbn1pWiZnT9bNHjLTHEgdBb/WuSzSAuTO8k12lNTTcx9V
zFCKpoM7w2OJtZnetrck2EKBBF/EkDJCP5dsNi4AuLKoIEcoxzwQj/gduok44sxD
tVTrm//yg2nJrMse4qhTeXFZN3PojUX/yLbZM2mH0wksBS1AbutKfXidnGGGBA1u
Gm6muDamnNcg9mPOrvjpyLJdoMra14wUhkQvlOMrJXAtC3FZw0cqBTpBXOTBawQL
+heWy80LRGLe32OJIEXCWFTWTvp+kfisw52tB/EnoQWaBafs7rFTCL000F3PqGSB
BzncNu1sVtEdaYtYDjDLyZloGetsrnYrjKs+LK7EFF37nmU4AchXW2A6wzATKMku
x0EliDmiW6WM4t/huqzQ0M6gFP5wb/Y8JyV3tKyMLzo6UvI1oSfwhL5u1iIpNYd7
zEFyyzSDJBzzCPdt17p5RNL3uTNzJPh4tsu1LNrQ7BDswTkdhHIx7oiFTdneaO1y
I5d5+VMK/H7fX6yioqzAGTOPVa7gm+gZ5sSuAZVIe1Tb67rEodBN2qU9y3cLnBg1
zHs4DIeQeQUG63t13w/Yh37tKLgW4fi4vDTZsC+ITZG4+QqTZuY/5pjpo/Ca586q
i06GLwLPogaLXnEdFgilPcOQxsl45zKdt+NYsU/N82Fd3qzSvlQ=
=ZLL8
-----END PGP SIGNATURE-----

--C0dGR74xL4613Z5p7CjMYQYWAx1Y4Swbz--

