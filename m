Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DFC36ECFA
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 17:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=2i26i2jDuBdNrKbn+6C9c1szLU5bKL1w2wuo/3hP6KE=; b=VoK+8KBdmvs/jeit6WRe2hmNni
	0frWSpCQOR9zj+nhJ078EJ0eTLSQnzKNgxL2pUUcyehOTDfJeJzcMlq/JYWI1C6IKN1dXGigoHcFP
	TCOsnohnM9snucUrtz/fh53C0EOX6BV9qmw9mBFz/xaZj//bW/zNXCg6rA+3IJRGmyd27KOBHCMIa
	r2C0b9eKK4SzV3P5Rj6TqPEbZZA60MPMIYhBJE4p9LJ6yja3IalqT/qDBccYctD9Z6fIGHonOsx4i
	LXdgOKF5oPqvzrWsfzBApYxgS5BhRcvyltqGZn32YmHEECWcTPeuL00zmDtA/0FpHxVqn2yUFIcCG
	up6W7YBA==;
Received: from ip6-localhost ([::1]:57262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc8Ee-00DC7l-LG; Thu, 29 Apr 2021 15:05:48 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:38664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc8EY-00DC7d-8L
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 15:05:45 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1620313530.43239@90hd9IOwDGLOkt01VEnlRw
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: E57DD11EF16.A9EE9
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id E57DD11EF16
 for <samba-technical@lists.samba.org>; Thu, 29 Apr 2021 17:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1619708727;
 bh=2i26i2jDuBdNrKbn+6C9c1szLU5bKL1w2wuo/3hP6KE=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=JT7n0ReDpSe1JycsNy1j1W6s9f4araBULtMp2ss/ibVYc32AcN7qOhMu7oISst5fN
 p5PsZkZ7Q3qZ/LjsrQZAS18dw4mIhgzGgsg/NjBokHO9apDAGW0ngMp555WICkvYtD
 qIWr3Sh6SDp5yw8m2LTUyfnj36ZlTyJ0Hh9cUIp2IxYh0Qpm8fSy0sYRW7QXSkVfNx
 RqMi9v2nUxs11wx8e25eEMb2GUhssr3LZwpA7hgKXJ0+5yQxJjUr/WUG1vXNtWgLdO
 hpjOq3/TN9NRxWCMYpmZtZr2z20QL0FHhkWPX8FWYOmSoNE1HlftoOQAjFToE+Zk8B
 dGhxArJN4LZ/Q==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 2A20218C2496
 for <samba-technical@lists.samba.org>; Thu, 29 Apr 2021 17:05:34 +0200 (CEST)
Subject: RE: Samba git and our MR process (was: Re:
 ctdb/utils/etcd/ctdb_etcd_lock python => python3)
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Thu, 29 Apr 2021 17:05:34 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b76012f7512f99d4ea31e04fa86ac80a8c4cec08.camel@samba.org>
References: <vmime.6089435c.6458.7483af847178031c@ms249-lin-003.rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: Adc9CRo0m1D3U3IsQs20U24PMs+1mQ==
Message-Id: <vmime.608acb3e.24bd.33979ab2262d1c1e@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you Andrew, for the reply.=20


> -----Oorspronkelijk bericht-----
> Van: Andrew Bartlett [mailto:abartlet@samba.org]=20
> Verzonden: woensdag 28 april 2021 21:22
> Aan: L.P.H. van Belle; samba-technical@lists.samba.org
> Onderwerp: Samba git and our MR process (was: Re:=20
> ctdb/utils/etcd/ctdb_etcd_lock python =3D> python3)
>....=20
..=20

>=20
> Also, even if you try to push to master, it will be rejected=20
> unless you
> go via autobuild, so accidents are pretty hard.
>=20
> Hopefully this helps you gain some of the confidence you need here.

I'll try a start again with the typo's found by lintian..=20
That are a few.=20

Greetz,=20

Louis


