Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7D4045F5
	for <lists+samba-technical@lfdr.de>; Thu,  9 Sep 2021 09:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WXUE/4BFbiUOi4t2gsZcNpyVioJk6ry9Rh5OjMrpRMA=; b=iiJdRHmS6rshMNSdznI0PN8SvA
	8X1ScXVNkrZnjUxkDRA07lomUL1kZo+Mxt8xKgcTOpy429fxfN+1S2NHem3ITZhZR8PJM4psGEuRn
	NhXosxA8gnP67RCLMLl+qimEoRxjeTTve4ZNxI1G+L0/cBFbhuJXo/VWGDP4cvkYRsalsVgTcGWYw
	YUDdiP7gyEnSWIgfBxUHOo95WazEk0L8arMLGT7rQUO4LGWQ5kmif7Zu6AG+TSb7QQ3E+afQSXvTr
	GcY0xFU3t4bT77thDwS442SloRBIPZIkdULrTswESuBJmKsjlYn7KCcou1Vb1LFUs35UkvocXZ7tC
	vf76U6XQ==;
Received: from ip6-localhost ([::1]:64340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mOEBs-00E1IC-2E; Thu, 09 Sep 2021 07:09:44 +0000
Received: from ozlabs.org ([203.11.71.1]:33765) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mOEBk-00E1I2-90
 for samba-technical@lists.samba.org; Thu, 09 Sep 2021 07:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1631171367;
 bh=WXUE/4BFbiUOi4t2gsZcNpyVioJk6ry9Rh5OjMrpRMA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CReKLBMkISJ7Aw8ShgOE3wKaPoSBES3z/vZfMUISsJBesWBdIuWbOU4MkQfCqVDhm
 xyKXWKtReAoMQ8NGhk2Q7YstXdEXotnJ8shZUGvP2vRmct/25uF1v3EGhRHvtQlGCO
 Eec/ccQcg9zv9aawlTd2EAM51tSRjDCA9LI+yI/EmcWZsB/NfcmZXLT8SJwwiNiCuh
 BfXGYnRszvKvhaWgEFllyf9/vF/76s0EmcSVEIUnJFN4DPTlRoPZuMD4LDl7SlC4mn
 mY9Sn/PuqZ+YUkh8k8AnRWsoVmpkMT7GSJxajSuzG7HvTszZfBdB3OlPjMiRIErMjD
 MbHNEOGBF2/kw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H4qr71SGdz9sXk;
 Thu,  9 Sep 2021 17:09:26 +1000 (AEST)
Date: Thu, 9 Sep 2021 17:09:16 +1000
To: Ralph Boehme <slow@samba.org>
Subject: Re: Is Samba's compile_commands.json useful?
Message-ID: <20210909170916.045b5e3c@martins.ozlabs.org>
In-Reply-To: <877e249b-c99d-380d-45d1-d5950e2b50d4@samba.org>
References: <20210909122517.5bc193cb@martins.ozlabs.org>
 <877e249b-c99d-380d-45d1-d5950e2b50d4@samba.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mo=odZlPCfS=1L.FwOxkCSD";
 protocol="application/pgp-signature"; micalg=pgp-sha512
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--Sig_/Mo=odZlPCfS=1L.FwOxkCSD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Sep 2021 06:49:52 +0200, Ralph Boehme <slow@samba.org> wrote:

> Am 09.09.21 um 04:25 schrieb Martin Schwenke via samba-technical:
> > What am I missing? =20
>=20
> I also noticed this a few days ago when using lsp im emacs as well.
>=20
> It seems it's a regression introduced by=20
> 5d53b848f60efbb71e4cd2f51f33a06369ca9055. If I revert this change I get=20
> a working compile database.
>=20
> Looking...

Thanks!

That was one of the commits I took a brief look at while trying to
understand the problem myself.  I didn't try reverting it.  I also
didn't notice the new call to:

    Scripting.run_command('clangdb')

in buildtools/wafsamba/samba_deps.py the first time around.

Duplicating that from
third_party/waf/waflib/extras/clang_compilation_database.py looks like
it should do some deep magic... but it seems like it isn't quite working
as expected.  Deep magic always deserves a comment to explain some
subset of what, why and how... :-D

peace & happiness,
martin

--Sig_/Mo=odZlPCfS=1L.FwOxkCSD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEpl+9WVt0RsCS8yPD7qs4B6MivQgFAmE5sxwACgkQ7qs4B6Mi
vQilfA/+Ig4buUdDCHhFINyUguEbj7tVdHMe7ts1/KROV6ufQQc4Y8S9R/fFj5vz
t8KqbUM37CBYQm4BkKXPv193en6XZ54kC/LzQitG4JDMH0/oId5dQZ57zZZNNGY5
CQQh6XK4IjLKtIMKd9z5Py5iUi+scLC3lZ/l3e7CylipoE3vXu/twTHdHHzXw4vr
ld8gUVGbVYX2eHYiwKkZKceI87k+BE6Qookat9o4y2qC842aC1PykR78D7I7zyB7
yi/AVXWMPZfDUndjFpCXEEyqjU0syu6/SNuPrBhthozbynk5gsRtg5yWNnE8Eej6
HXlSToYq9+H1fMPcIB3QpGIJ7Jzl4Qf9vcgz2G18TMEmOwMAG2jxS+spLeMpRjEp
RAVZxxGRLnHfDLfhtzX4VcnLBZcq6q4VEDSzhatLLdS2VdmM+mRJAco7bJgNDhFi
FOMgxdgu6E6HnRFI7iZBzTHckp6xlBdkDDNdxmne15zu8OFfdipAQq1g33c5kXvM
Q4AWlI43WlZZcHvo5LKfCQGkzHqu47WBWNcbFzmuNHE8RW9IBeDXtxfreVMG84rk
rDDBKoqrVTjpWssBnvATFT9v2vYOv2CayLLUCSciiDTKEyrbL6hRbP8RZvTU4JI2
8DEbF9iCruVdOgl2FraohZWvoVK1W5RuQMhRFfm4N5dsbMvchpY=
=1emQ
-----END PGP SIGNATURE-----

--Sig_/Mo=odZlPCfS=1L.FwOxkCSD--

