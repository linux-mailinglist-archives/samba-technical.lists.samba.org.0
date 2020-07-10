Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC121B43A
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jul 2020 13:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pL2+PIklyIXpTtZZxDk6m1HVo1RRpjI1eK6hU+JrSeg=; b=tr/n2kAnDJvzVxX9frKn6Nk7fJ
	iHbSe4KDjsE5+pBuyHZqQiOLDjvLEpxTdX9ovuZHe3g40uyhavYNOaMTvT6Y6i0fxymqNQP1TJxuz
	sihYdx75Ac+i5ed2WcZXLayZnK/+SCcOp+m6GknfcM2JzlyREAkrvyEcohVjTl6cUgwEutd9MJXzu
	T3Oew7ahMaX7pAjvQ8cTspAxqKGcOIxY5Hs5EU7fzsxTxtCpJAo4Y/4NlO7mE3BfReT+d0ZBdM7w4
	L1uxMVXccyx6LW/bVExxwFQ6roj2yw/cLdQaj/sHhsEzctsVdpfIIx6N8+R1m5WKH1GwT39TM9Hs0
	AgbLHvmA==;
Received: from localhost ([::1]:29516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtrSd-006djL-TW; Fri, 10 Jul 2020 11:45:00 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:50749) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtrSX-006djE-IU
 for samba-technical@lists.samba.org; Fri, 10 Jul 2020 11:44:56 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1jtrSX-00079f-4U; Fri, 10 Jul 2020 13:44:53 +0200
Received: by intern.sernet.de
 id 1jtrSW-0000K0-Ub; Fri, 10 Jul 2020 13:44:53 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1jtrSW-006epI-Rx; Fri, 10 Jul 2020 13:44:52 +0200
Date: Fri, 10 Jul 2020 13:44:52 +0200
To: Ralph Boehme <slow@samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200710114452.GB1572444@sernet.de>
Mail-Followup-To: Ralph Boehme <slow@samba.org>,
 samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ralph,

On 2020-07-10 at 13:22 +0200 Ralph Boehme via samba-technical sent off:
> Am 7/10/20 um 1:07 PM schrieb Bj=F6rn JACKE via samba-technical:
> > can someone pleae review and push eventually?
>=20
> How does this relate to the discussion in
>=20
> https://lists.samba.org/archive/samba-technical/2020-May/135241.html
>=20
> that resulted in commit 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a ?

configure --help says (among lots og other things):

  --with-shared-modules=3DSHARED_MODULES
            Comma-separated list of names of modules to build shared. May i=
nclude !module to disable 'module'. Can be '!FORCED' to disable all non-req=
uired
            shared only modules. Can be '!DEFAULT' to disable all modules d=
efaulting to a shared build. Can be 'ALL' to build all default static modul=
es
            shared. The most specific one wins, while the order is ignored =
and --with-static-modules is evaluated before --with-shared-modules


That information was obviously missed in that discussion above.

Bj=F6rn

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXwhUsQAKCRAxQwafzsNC
P7jtAQDf2f7Kgy3zMgvWeoo9ftQzmNWS5mYYAWk5RWY7UIf31wD+IosTNK8BRORG
nF76L2AX+Vtz8zVyKz46tcKOmEy05wA=
=lFOj
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

