Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB969FA8D
	for <lists+samba-technical@lfdr.de>; Wed, 22 Feb 2023 18:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=73eA8kSuc4LVQqUun6ZMrAy9rwMuqH0jv8rYvh47Wng=; b=d1B0RzZ2hjC5fWUsfQCUah/Q+W
	WqPB4LhFl0SFEz7NFrAgEHV5kVPqtwZeKS97Yb/FtRFczPZEJVLZKFrh9JKAvq8+90ut3CNJWHthg
	+Qe0badw+HvUAyX2SJwI6M7GsJ5oqXptbEv00N3bOhWDKE8ED1aBsgjP9NbRPDH4Vz3HTC4KDG3l+
	zqEuhwO81JIa80eAslk4I8KmixmUO6JhZAoSDeEsERU/k/mL+3k+/738XaPrqv+Bzjbvaev4VZdx4
	d9Vt8mNWCZYslOdgBvl5hj1bHWVoOUmJdcYzCY48HO1QRLJmWU8x7aqe9qhlCm08G1Fuch58o98NL
	tNXOi9sg==;
Received: from ip6-localhost ([::1]:33224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pUtKB-00Derq-7l; Wed, 22 Feb 2023 17:54:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55410) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pUtK5-00Derg-W0
 for samba-technical@lists.samba.org; Wed, 22 Feb 2023 17:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=73eA8kSuc4LVQqUun6ZMrAy9rwMuqH0jv8rYvh47Wng=; b=cGImWr77HZBlKgfDwpYRvCUo7J
 zuxWJXyZps6khkMZXX0Phsu1CWbantInRAJ42d+MMmpfUgBDxAQ3BNyYllWpb5O7mvqsm6hoKR7wl
 ZdfDAUY8SAccK/K9Mr5s+9ZSDkKGh+md1Bo2/wKQNy68UkwoQE4KJCrG8zoRn2CqB+ziV6wgjGb0+
 sVWrPC/18LlC7lM9281t3yumRO7ieNwi/SolP6PkJHCv6+WQPYtwZwMqMrkAgIGfnijaNYoEkP86W
 CvrE6r/uS8AzFTb+3l5hqQbPbYs8JLegyH4utqKBPHybG9Se/SSsEUtf7rQqW/yWfUIjwttSAlBrV
 0FnPHj3V+No/+eJm1WEUddRRfdV81vwZ7a2X/I6aShTXh+yrdHBNclaOvJSKgTMsAttLh87cv45y9
 9NxArFV0Sz+jIFphq1hnMECe9OWoHQpuSNBhWjaihpnrq7In8eX7rkJl7RP5GM1bipLqKtbLajIuB
 mPmBKwsdsq2P7h25fAinQp63;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pUtK4-00FmEk-6h; Wed, 22 Feb 2023 17:54:32 +0000
Message-ID: <3d536755862e1ad96edc70bdd8562f1509ec9b82.camel@samba.org>
Subject: Re: Failing tests on Fedora
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Thu, 23 Feb 2023 06:54:28 +1300
In-Reply-To: <12159855.O9o76ZdvQC@magrathea>
References: <4782393.GXAFRqVoOG@magrathea>
 <3af805df2a359dcf695e91ced7ee0bfd9bba52a9.camel@samba.org>
 <12159855.O9o76ZdvQC@magrathea>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
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

On Wed, 2023-02-22 at 08:25 +0100, Andreas Schneider via samba-
technical wrote:
> On Thursday, 16 February 2023 09:11:41 CET Andrew Bartlett via samba-tech=
nical=20
> wrote:
> > On Thu, 2023-02-16 at 09:04 +0100, Andreas Schneider via samba-
> >=20
> > technical wrote:
> > > Hi,
> > >=20
> > > I'm currently trying to run 'make test' as part of the RPM build proc=
ess
> > > (%check). So I'm trying to get everything working, but I'm seeing str=
ange
> > > issues and I need some help to track them down.
> > >=20
> > > We create a test user with `samba-tool user add`, which succeeds! Not=
e
> > > that
> > > samba-tool directly operates on the database here!
> > >=20
> > > Next we try to do an operation via ldap:// and if you look at the err=
or
> > > above it tells us the user we sucessfully createa a few moments agao
> > > doesn't exist.
> > >=20
> > > It looks like the samba process didn't recognize that that the databa=
se
> > > was
> > > modified.
> > >=20
> > > I also see something like that with Kerberos tests, we create a user =
with
> > > `samba-tool add user` and then the KDC can't find it in the database =
=3D>
> > > same pattern.
> > >=20
> > > I don't have deep knowledge of the AD server, so hints how to track t=
his
> > > down are much appreciated.
> >=20
> > This is very, very strange.  Particularly if it works for a single test
> > but not a suite of tests.  The KDC is just another tool reading that
> > same sam.ldb, there isn't any extra cache or anything involved.
>=20
> I don't find how we define which ldb uses tdb as the backend or lmdb. I w=
ould=20
> like to try only with tdb databases.

This is decided at provision time with the command line options to
samba-tool domain provision. =C2=A0The default is tdb, but in selftest this
is overridden to be lmdb by default, with a selftest.pl parameter of .
--default-ldb-backend=3Dtdb forced in on 32 bit systems in
selftest/wscript

Andrew Bartlett

--=20
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


