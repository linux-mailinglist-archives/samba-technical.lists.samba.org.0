Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4B21BDE8
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jul 2020 21:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fDsu7k4zRbORtCL3JC1PwlMh9dzpb6W+klN7izVxOwE=; b=xA6Qt24iJRpoDRa1syj21mxeJl
	OzEak/jSOQH+Vfc/u2ro4TmTjL04Jvm7R9PRhfYZ4C8ppdmy0YTiTWX9YcM6WzeT2/brdmVIGUItS
	5lEmjaSkclYq9dBeLfktN9hocvyJKSeunVB48xBdeJKle5MQUJez/9YTZMaLvHtdSWgX7po+HT5PV
	H0/kkmPpXZ/8ZjAXpHbk4IFU/h3r+PMBN5wh4D7OlhxuPZY7hszq7v1xlXyek2GlvxO/yn06KWqt9
	/UBin+qkvr+09H8iEMpp3QXFaeOhmIpzUsQgZBDVp5Ncyd92EpVBac4b7hFLzyKkkedskQXwCNpIG
	fOwCwT7A==;
Received: from localhost ([::1]:48166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtywq-006i1H-1k; Fri, 10 Jul 2020 19:44:40 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:42189) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtywj-006i1A-9f
 for samba-technical@lists.samba.org; Fri, 10 Jul 2020 19:44:35 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1jtywf-0005BX-Ed; Fri, 10 Jul 2020 21:44:29 +0200
Received: by intern.sernet.de
 id 1jtywf-0007WY-AH; Fri, 10 Jul 2020 21:44:29 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1jtywe-006hVs-VH; Fri, 10 Jul 2020 21:44:28 +0200
Date: Fri, 10 Jul 2020 21:44:28 +0200
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200710194428.GA1596727@sernet.de>
Mail-Followup-To: Stefan Metzmacher <metze@samba.org>,
 Ralph Boehme <slow@samba.org>, samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
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


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Metze,

On 2020-07-10 at 20:31 +0200 Stefan Metzmacher via samba-technical sent off:
> I don't see why your change would be needed, I actually think it makes
> the situation worse, as --disable-snapper is no longer available

I tried to descibe that in the bug report. Our correct way to disable shared
modules is to use --with-shared-modules=3D'!module_name'.  That mechanism g=
ets
broken by 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a. So the new option
introduced by 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a is not needed and it
makes our generic mechanism to disable the shared module stop working.

> and configure would just fail if dbus-1 is not available.

that's what it currently also does. This is because in the discussion it was
desired that this should be a forced enabled feature by default. Personally=
 I
would prefer forced-enabled features for developer builds if this is meant =
to
detect failrures in autobuild. But that's another discussion. In any case
configure fails (intentionally) with 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e=
0a
and without 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a by default if dbus-1 is
unavailable.

Bj=F6rn

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXwjFGQAKCRAxQwafzsNC
P0xsAP9VNNg2avs4F0sdnudnk/0uWRzbwzZpsmoSyC8asn+F9AD+PONrVpmDwTHb
C77rLLCG48+k7N/7wr3l40MXu4RsXQU=
=6vw4
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--

