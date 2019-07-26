Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E2977244
	for <lists+samba-technical@lfdr.de>; Fri, 26 Jul 2019 21:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=5W8ATVYv1BMjpDAkfXtFqdctzVcQz7j0l3wDLYsfu60=; b=1LZMXXBMRj6R370ZYyFV/DU+Zp
	kwJGP8+xtT27NsWwX4KbpuPxJQMpY5TrKe+NSToR1OVmXCqA/wPRAHGRUh5Oxui4YBphOtottxJ98
	raacQtE7tykHdHt74Z/yb5vIW2nxJdMa5inCPeTJuD6QtC9fbAfRXJv1vqCp2Ua09AiqpeGMSiwtU
	jYhWy8Drw5RJGmvWOZGHnvQ0Aa83p9q5jrOjdTUETaBzfd3WEV9f55yzIYOXVLwJIx4KVQCB3fGNC
	+kLyKvmGYrrr9Zul+equ7Jo3FoDCO+JDUi5wFgk0pR+OaXYs8NxGt97NrQBdj/nDIh2inCBJQIdqi
	F7G5Z4Pg==;
Received: from localhost ([::1]:48152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hr63z-000X41-50; Fri, 26 Jul 2019 19:39:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53128) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hr63v-000X3u-66
 for samba-technical@lists.samba.org; Fri, 26 Jul 2019 19:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=5W8ATVYv1BMjpDAkfXtFqdctzVcQz7j0l3wDLYsfu60=; b=vfYvbzthRnH3RFFFgmhSEx9ewq
 oe7798dbyW1Yvt+wgs30RcY2ROXNOYG3mwgVDh1FC/sAfQE9oC3Giy/gLG4beOrZmlQFFoC0D58e+
 X5mYqVc9yBDI1OhBFcRS0bvKvXajfcCqj21TtPGrlyCdRGUSSudHaBBraXcpzCEdugKs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hr63u-00079O-GH; Fri, 26 Jul 2019 19:39:30 +0000
To: Gary Lockyer <gary@catalyst.net.nz>,
 Samba Technical <samba-technical@lists.samba.org>
References: <7860b3f6-995c-9d5b-e337-7ca579ea1b05@catalyst.net.nz>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: DNS performance.
Message-ID: <a7ffc446-80c1-97b5-879f-302bc89bcc5d@samba.org>
Date: Fri, 26 Jul 2019 21:39:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7860b3f6-995c-9d5b-e337-7ca579ea1b05@catalyst.net.nz>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ouE3zPAmWRJlHQYMtOJrqQDNm6wmfEtur"
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
--ouE3zPAmWRJlHQYMtOJrqQDNm6wmfEtur
Content-Type: multipart/mixed; boundary="R0uTkPBpncRE8u3tQUJMWOptI7FKG8V0H";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Gary Lockyer <gary@catalyst.net.nz>,
 Samba Technical <samba-technical@lists.samba.org>
Message-ID: <a7ffc446-80c1-97b5-879f-302bc89bcc5d@samba.org>
Subject: Re: DNS performance.
References: <7860b3f6-995c-9d5b-e337-7ca579ea1b05@catalyst.net.nz>
In-Reply-To: <7860b3f6-995c-9d5b-e337-7ca579ea1b05@catalyst.net.nz>

--R0uTkPBpncRE8u3tQUJMWOptI7FKG8V0H
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Gary,

> One of the performance bottlenecks that we're seeing on the AD is DNS
> performance in both the internal and BIND9 serverts.  I've taken a quic=
k
> look at enabling pre-fork on the internal DNS server this mostly works.=

>=20
> Queries work, but updates don't
>=20
> The updates use DNS TSIG to do the authentication, which requires
> holding authentication state between requests.
>=20
> I did look at using shared memory to hold this state but could not work=

> out how to copy the auth_session_info and gensec_security strucures int=
o
> the shared memory.

We could use a tdb similar to the netlogon challenges,
see schannel_save_challenge().
There are gss_export_sec_context/gss_import_sec_context
and we may have gensec hooks for it, which would be also useful
in other cases.

> A possible approach would be to:
>   * Launch a crypto worker process that handles the tsig processing and=

>     maintains the associated state.
>   * The DNS worker processes forward the TSIG packets to the crypto
>     worker via messaging, and wait for the response.
>   * None TSIG queries are handled directly by the DNS worker process.
>=20
> One possible issue is that we would be limited to a single crypto
> worker. However the assumption is that query loads are much greater tha=
n
> the update loads. And given that we currently only store 128 sessions
> this seems to be likely.
>=20
> This should all work, the only bit I'm unsure about would be waiting fo=
r
> a response over messaging, but believe that this should be doable.

That would also work, but I think I'd prefer a tdb.
metze


--R0uTkPBpncRE8u3tQUJMWOptI7FKG8V0H--

--ouE3zPAmWRJlHQYMtOJrqQDNm6wmfEtur
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl07Vu0ACgkQDbX1YShp
vVaGYhAAxWjlTjIAWxJ/LHVRhmeiEM9N+qG5n/ULyhYlek3AT67mGlI69dQZvTXJ
+cWZbwKXUdZW3giGP1IdsvNVQQ2kOomCXBnRDB1ULKCD03G5Ac301RsNZAYFYuye
g+loDG5gbpRy5vOuHaIbd6d2E6Ks6IIcwPQul087sk+ws3ZO2AKYWWE1AgyCI0yZ
bNO1Fqf7vdOQ1ECzFxxL7500a4+wZhFWwb9p03sFn25B8mTT0ekXzq7riI+ZKSKR
lmKN2pxUMdFY30iRD8hOJXI9vikDfgXmCxVd0ompR8RH3l+UDofmGA+61EbLhfKo
XM96pvzzeWYnq5N8KLdZz9aPl1Cj/sgtZAJX57AAiriskI9/STD/KkudOIcjzYwh
lyA28dcoRSA+0FFsV7IWEmPR3kitbIfccCY0iyKOBEgMW2VUwp8MTQ+xxS5JsVM9
AdCCN0RtpP03OkEwhTtGO/Ixrt6KS9lPhZjfX1rjeR+VKHA0lSGLSvnRetyB/E7A
0JA1GiC8sO9XsO8keZS0IAVBJAQClWHuEF1yLKFlOQlLx2wz/Gz4279GK/pEoJ+f
xLaQnW/XGg6p5+ZQjRJH6OCVU2Hj6u1Qrem5SADKDsvtZGFCFeuXPnli/JjfuQrv
wyo7m8UNJzgsbd7gyZnVBHpUPZ3Lgx/04RBgtcNs04Vbg14h8gg=
=0TOw
-----END PGP SIGNATURE-----

--ouE3zPAmWRJlHQYMtOJrqQDNm6wmfEtur--

