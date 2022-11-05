Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A221B61DDAD
	for <lists+samba-technical@lfdr.de>; Sat,  5 Nov 2022 20:21:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=UucifEMxlWwXM64irWSp3Yp3RTmwYPiWE45tJiNA2/0=; b=Nfjs82jKI0mUhn7OaIngOgoCB2
	ZI2U3atWesCRU6f2ENDLHOgU9WDUsZmGI2ckjnic6PrIBWJUs6c96hPcn1VcZ27EFA8hInQlE2LHF
	TnIdILixonezFAfHEHm8AbMWoifkY1MGGQTh0yW9v5n4Q2Yq1qM3gHAFYwNoCIzmr1Uv1rGIdUZEo
	G7X9T8Vf44myfBK0Zlc1nr6MjMBit1Msl7uawCSbefwQrRmeIzAq4MnGwgbSyH2my1eeKh5k1NQdn
	nGl3+0gWwbzht6B64HA7jWeylYcBPHvURPziMemJeCgGUReAiEbV+cWJRXN9DDSC1BxfLfFFNhm5N
	cObPIvmg==;
Received: from ip6-localhost ([::1]:19140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1orOjL-00B22f-Mi; Sat, 05 Nov 2022 19:21:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10038) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1orOjF-00B22W-SO
 for samba-technical@lists.samba.org; Sat, 05 Nov 2022 19:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=sSNBChAzx31t5nekbVNFlVuzJ9UQELtguxWgA34adO8=; b=OFyHC50qWuZ1Bx8CAFCRiJ+1/j
 e9ee6UBQqNrHcYyM2TGwROdqtGCuLB4+5ALNYUQ3lGO7P4lMILPlDkGrWLzBttjA3rONGOuDbAp2n
 LW4fyYWhzw58oR2V/4+GtUEC6oM8p7vJ8/MujIdAu6umu0KmNDxBTIJX0TVARg2V3SC0ye/9O9xpT
 fUj/mW9kGdfqub8+9cjZRK5awkzomkflsEo7i5XE6ioV/tDsq9KgjhOufDG+RJJZW8+HoCDPA70Jp
 yM/HPje4gBurVloeEA4g9TZZqVfYVd1p/B6mimkQkOIJ2mEUA7RNlEHJ7UCaYjKbs5bhAT6QfSqUp
 xZivxjWAT5XRPueqKs8L3jsWlhm3UzV8NHLeL/Lyf7i/14BwxsyASySCNiISKd+HXxoRe4z3N1sJs
 KRN7yQndbZeI/ekHuBStpb5FS4HqOgcPFQ26PqNJyixMcK4jMLoz8Mnql8pojk4qhQcd0J0j/Qa8/
 l6NYFdaIqDQX7TnqDe9pVWNe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1orOjE-007Mf9-En; Sat, 05 Nov 2022 19:21:17 +0000
Message-ID: <19170baa4c6e96304aa37e7df24de324a14b3fb5.camel@samba.org>
Subject: Re: building all targets in samba for install?
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Date: Sun, 06 Nov 2022 08:21:13 +1300
In-Reply-To: <07424568-38ce-8f3d-4bd4-b0e9bd0e6532@msgid.tls.msk.ru>
References: <07424568-38ce-8f3d-4bd4-b0e9bd0e6532@msgid.tls.msk.ru>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
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

On Sat, 2022-11-05 at 21:29 +0300, Michael Tokarev via samba-technical
wrote:
> Is there a way to build all targets needed for install?
>=20
> The problem is that `make build' or `make' (or waf build)
> doe not build stuff needed to install binaries, it builds
> stuff needed to run binaries in place.
>=20
> Usually, the build sequence of some software is:
>=20
>   ./configure
>   make
>   make install
>=20
> Where the last step does only copying of the already built
> files.
>=20
> But in samba, after doing regular build, it builds whole
> thing once again (so `make' step is almost useless).
>=20
> Is there something like `make install-targets' to perform
> all compilation necessary for installing things, but not
> the actual install procedure?  So that when `make install'
> is run, it will only copy files, without compiling.
>=20
> The problem at hand is that on debian, the install step is done
> as different user (root) than build (to be able to set file
> ownership right).  And the root does not have the same build
> environment as the build user, so when things are being
> compiled at the install time, it does not work right.
>=20
> In order to overcome this, I currently use `make install'
> twice: the first time, as the build user, to install things
> into a scratch throw-away place, - just to force all things
> to be built.  Next I remove the installed files, and perform
> install once again, now as root, into proper place with
> proper file ownership.
>=20
> Is there a way to eliminate this middle fake install step?

Not currently, but you could use the fake install step as your main
build step if you wanted to.

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

