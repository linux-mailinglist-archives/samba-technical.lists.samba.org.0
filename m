Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5C5EE39D
	for <lists+samba-technical@lfdr.de>; Wed, 28 Sep 2022 19:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nI/6H9rn7WzWB8lphKG/BrqbK6A4c3qNgREPVl4/cTo=; b=2NAMTYrdCNeAcR6idAltyE0osN
	WEVgYxDU5YWdE/ofvXlQvhTeWr7dFJI8OLaZfew/+pRWE9YYXyB0eoXRJY42firIRxTfTzmDMk5Hr
	dgFxfnWOpGIUoWAsgBVpU2EcPuXAizhkIsJIQSBeNpKm2tY6cXZWALcUkjXYwfR/zUJVIQ0TaywVf
	hoXPEV/0XLwJK7dHh004/9gQ32Qyn3EvzaMd0uSUrEhcfHOVl8JaLfC0u9q/Q4tscrvBo85ixEE7v
	KKDpwXneOiMuVsV965Nv2EqXBkHxil20G9lYDEhNhQVTTnEaCLJPAt9z4JU2HHSZAa9wuNBUSlERQ
	mnVvzkfQ==;
Received: from ip6-localhost ([::1]:28250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odbGQ-004gCs-6v; Wed, 28 Sep 2022 17:54:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19396) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odbGL-004gCj-Gv
 for samba-technical@lists.samba.org; Wed, 28 Sep 2022 17:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=oGifRDJHO1cS2bTCStqUVyktOdLSWsvnnecEgOLV+SE=; b=omS52UNhWoONTVcNu2gr5hLDDa
 5RrPZYIuhIDBVXVwJV30g6tgmNmOo524xyVBwmB47ufFluTGoccgz8MBZ0b1FuRzCyHtBLTS6sdbZ
 dUmVSX+DH1r7xHurLwssbJlpuegMFxHZ5zwovLDsc7l0DLxzb29lwIx2aWA2/16ud4E1i/F0dOgqZ
 srhkJmJsT+3C66ULZFX4kRFv+eghZLJ6qEG3RVXjUSBu/JBRGjLdCes1o5d5cnqvMrWlDgxk2HRng
 9L5JORZY/1tR00BdoQde0p4ruNNP+k3/YUQtd4/WiZLAby2RMLXZGP4k4UKKipknZ1SySpk935q0v
 vCEsrDzm1isg15OTZr6ixDYHrVKu5nMZZnyL3avLtZskZw9GdHy3S3enruAvQzauH940snZ/S7Y0Q
 XMnTOw4jVx+iIuIy0Ep2UIyjKZDjzZ0QaFd4Dhq6+AV2XQC9sUb3wH+akL/NF0cvv9F0BQCe80ORn
 +JPA21mjWxeXyvzoUjoMCU9n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1odbGJ-002G7s-U7; Wed, 28 Sep 2022 17:54:24 +0000
Message-ID: <c7c6a7091ea929b2937ea41c5b07d37439277571.camel@samba.org>
Subject: Re: buggy krb5 ccache behavior and cmocka unit tests
To: Christian Merten <christian@merten.dev>, samba-technical@lists.samba.org
Date: Thu, 29 Sep 2022 06:54:20 +1300
In-Reply-To: <adaa5aab-92d5-019d-f86e-969938cb5788@merten.dev>
References: <adaa5aab-92d5-019d-f86e-969938cb5788@merten.dev>
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-09-28 at 14:04 +0200, Christian Merten via samba-technical
wrote:
> Hello,
>=20
> 1.) I encountered a few issues when using other ccache names in=20
> samba-tool. For example:
>=20
> samba-tool user list --use-kerberos=3Drequired --use-kerberos=3Drequired=
=20
> --use-krb5-ccache=3DKEYRING:persistent:12345:12345
>=20
> gives NT_STATUS_UNSUCCESSFUL
>=20
> although klist correctly shows a ticket that is working with ldapsearch.
>=20
> Also using --use-krb5-ccache=3DDIR gives a segmentation fault. The=20
> segmentation fault is thrown somewhere in the python function=20
> set_named_ccache patched in auth/credentials/pycredentials.c. I tried to=
=20
> track it back to the actual c code, but I stumbled upon cmocka tests.=20
> This leads me to my second question:

DIR and KEYRING are implemented in MIT Kerberos, if you are running
Samba as an AD DC then you will most likely have Samba built with our
bundled Heimdal Kerberos.

In any case, these are not tested.

> 2.) How do I run cmocka unit tests? I tried make subunit-tests=20
> TESTS=3Dauth.credentials.tests.test_creds but I only get: skipping subuni=
t=20
> (testscenarios are not available).

Try shortening the test name, the part of the code that filters for
tests doesn't see into the full test, only the prefix.

Andrew Bartlett


--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

