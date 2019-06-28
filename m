Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D617F59663
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 10:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IEVyzPUiFOrLmBnovNxLpFIIdV0gHrcx9mtyKkfoSiU=; b=KYhgXJfmiVv7ZrJWpl+IBR1FiH
	3Ed6MlyzZ2Rk3Gfo18uedMBLhR+nkT/xdTT4Ulb4lu/hVeEAaB1kQ7gLxYCHHBn9AzMobfV8RThMt
	QoXhkBVsYbtmMXyo1RUbmlO5yYDlj7UYPoSIj0YeE/wN7L6oL4itSkdtvBYnJWTv05W2YlGu08ry4
	ORdodTpBB8oAN+NZu038nQFHfygBh13899xXoaTmq3URLiE6YG3gGKihUnBAiuV/yYR1oWnlrTX1/
	/hO2lVXw7bsfiDwy/ZaD0j8lf2jITVPSDkrEHPUpqjmUO8ya/dQcQVoQv32pX/3/TeFQ8S5QHnBCr
	pvc4pwGA==;
Received: from localhost ([::1]:24768 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgmYf-002IVu-Te; Fri, 28 Jun 2019 08:48:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20658) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgmYc-002IVn-41
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 08:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=IEVyzPUiFOrLmBnovNxLpFIIdV0gHrcx9mtyKkfoSiU=; b=jHNcVihO/auVk7izMUeXWyxpoB
 9+kv/TqH+KalUc+9mwWAw+SS5fgxJ6RgzfLpFDoAGHIrn4AMoKthuab7DVkuOxJOTnEFk3MY55N6L
 qa9U4gIhfTOU2BF8A/pR75UaHjSjqVjWeGj7GneuNbQnO7ArZlGXIyF8ZBeG1Lm5GR5Y=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgmYb-000711-Os; Fri, 28 Jun 2019 08:48:33 +0000
Date: Fri, 28 Jun 2019 10:48:32 +0200
To: Amit Kumar <amitkuma@redhat.com>
Subject: Re: Pipeline failing on samba-ad-dc-backup
 [https://gitlab.com/amitkuma/samba/-/jobs/241734878]
Message-ID: <20190628084832.GE32415@samba.org>
References: <ce517e87-73cb-e018-5d66-9eb8b21a350c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="10jrOL3x2xqLmOsH"
Content-Disposition: inline
In-Reply-To: <ce517e87-73cb-e018-5d66-9eb8b21a350c@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
From: Michael Adam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Adam <obnox@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--10jrOL3x2xqLmOsH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-06-28 at 13:50 +0530, Amit Kumar via samba-technical wrote:
> Hello,
>=20
> Not able to find why pipeline is failing
>=20
> test failed in 42 minutes, while runner timeout is 3h.
>=20
> =3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
> make: *** [test] Error 1
> samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=3D1
> TESTS=3D'--include-env=3Dbackupfromdc --include-env=3Drestoredc
> --include-env=3Drenamedc --include-env=3Dofflinebackupdc --include-env=3D=
labdc
> --include-env=3Dad_dc_backup'' with status 2
> waiting for tail to flush
> Running: 'uname -a' in '.'
> Running: 'lsb_release -a' in '.'
> No LSB modules are available.
> Running: 'free' in '.'
> Running: 'mount' in '.'
> Running: 'cat /proc/cpuinfo' in '.'
> Running: 'cc --version' in '.'
> Running: 'df -m .' in '.'
> Running: 'df -m /tmp/samba-testbase/b22' in '.'

This is part of the teardown code. That is not the actual test.

I think you can see a hit for an error a little further up in the
logs:

>> Timed out (120 sec) waiting for dns_update_cache PID 22240 at /tmp/samba=
-testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm line 279.
>> Samba 22240 failed to start up at /tmp/samba-testbase/b22/samba-ad-dc-ba=
ckup/selftest/target/Samba4.pm line 161.
>> failed to start up environment 'labdc' at /tmp/samba-testbase/b22/samba-=
ad-dc-backup/selftest/target/Samba.pm line 88.
>> samba can't start up known environment 'labdc' at /tmp/samba-testbase/b2=
2/samba-ad-dc-backup/selftest/selftest.pl line 883.

Not sure if that's a flakey behavior..

Cheers - Michael

>
>=20
>=20
> ####################################################################
>=20
> AUTOBUILD FAILURE
>=20
> Your autobuild[master] on runner-fa6cab46-project-10891704-concurrent-0
> failed after 38.6 minutes
> when trying to test samba-ad-dc-backup with the following error:
>=20
> =A0=A0 samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=3D1
> TESTS=3D'--include-env=3Dbackupfromdc --include-env=3Drestoredc
> --include-env=3Drenamedc --include-env=3Dofflinebackupdc --include-env=3D=
labdc
> --include-env=3Dad_dc_backup'' with status 2
>=20
> the autobuild has been abandoned. Please fix the error and resubmit.
>=20
> ####################################################################
>=20
>=20
> Though this is a very simple addition of print statement only:
>=20
> if gplink.strip() =3D=3D '':
> + print("gpLink is empty")
> return ret
>=20
> Thanks
> Amit
>=20
>=20

--10jrOL3x2xqLmOsH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXRXUXQAKCRDJT0k4GE+Q
NE98AJwLnMrFRkPpsKP/X/flWQZyagNf1gCfdiRHSDNNG5xh6gRwGFfxejcfkvo=
=ri74
-----END PGP SIGNATURE-----

--10jrOL3x2xqLmOsH--

