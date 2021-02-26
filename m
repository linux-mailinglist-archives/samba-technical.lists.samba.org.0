Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9F325C3E
	for <lists+samba-technical@lfdr.de>; Fri, 26 Feb 2021 04:59:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5OOSheTsmDvajvnzVf2OuZkhdqPcwZLI0c92ZbmYUrU=; b=t9cM+bZeIfDwlNHpvDOU6+JkaM
	BKVqB3uvPtWEVD/I61KZgfPiAQ+4Mck1STT9Jd1Rfu15Qmc02YswaNFnLfEj/ejiKfd91U395OxoQ
	v8UvrJmjB7wl2YCA+boc10aJsylrHFTdHoMZe9vOC8z9E6OKkcBb/FxGJB1e9UN0v5p+tU+aq5mjM
	Hgln2fiJeM186CXqoGjwD5HARUOEo/HUPOodDDVoJLHfmuol9igQpFK1c97j+GHLs98nC35HIv0R8
	pUGe+hG9QC48lRATz0qgq2JeI/6mNd/0EE0O2aTH0C5KHwftogRfkuKIujwYNwE5Sasz3CvUIDh+a
	LH6/7NYA==;
Received: from ip6-localhost ([::1]:62222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFUGZ-001VHb-3v; Fri, 26 Feb 2021 03:58:11 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47655 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFUGS-001VHR-3o
 for samba-technical@lists.samba.org; Fri, 26 Feb 2021 03:58:07 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dmwpy2CWRz9rx6;
 Fri, 26 Feb 2021 14:57:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1614311868; bh=NmCTmM3LTuvU9yeW9636xIGd2WGwjXSNyBx9Bjf0V6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H3ey8r+l2kBnFvda1WH61l9cuhWVg1N1hvzTZ0w5cvhE29Z7NQeZ9o7Q21Npd9/a4
 I3AOyTXKHZ/5PxSVbgrAs8R9XXz1sKq+zQmnJmr//JwmMt0y07Bd3qsSo5yYfxsWs2
 242uwxNAM4H5ZzwiwEJC94HxXyb/5keGbyIgm2BK2q88y9ZMLzksVmas3oqRYFl+dD
 4WzEvcNCKT74sEU3iBf8I3Buo9pIxfK06cwBZpOKrRWBQkI4DJciB3ol+211+DZvJw
 XrzBl/OAsuhaZSp2o7wnnOXOjeStAMfeaieUU2eM7g6rScOcUPDjdCdAQIe2/5/um/
 RbWJ683OGgA3g==
Date: Fri, 26 Feb 2021 14:57:36 +1100
To: Ralph Boehme <slow@samba.org>
Subject: Re: Possible bug in ctdb
Message-ID: <20210226145736.316f50b7@martins.ozlabs.org>
In-Reply-To: <4ff83f49-9c37-4067-7ce4-c21ac2a34b0a@samba.org>
References: <4ff83f49-9c37-4067-7ce4-c21ac2a34b0a@samba.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dgMEC24+MBrWx/jgL88PchH";
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

--Sig_/dgMEC24+MBrWx/jgL88PchH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ralph,

On Thu, 25 Feb 2021 13:05:52 +0100, Ralph Boehme <slow@samba.org> wrote:

> I noticed the following if condition in check_static_boolean_change()=20
> (defined twice):
>=20
>      if (mode =3D=3D CONF_MODE_RELOAD || CONF_MODE_API)
>=20
> This will always evaluate to true, I guess that is not intended and the=20
> fix would be
>=20
>      if (mode =3D=3D CONF_MODE_RELOAD || mode =3D=3D CONF_MODE_API)
>=20
> (WIP attached, lacking bugnumber).

Yes, obviously a bug.  My bug.  Fix looks sane.

Note that this code is actually a no-op and it just logs a warning.
CTDB doesn't currently support reloading the configuration at run
time... but the config system does. When reloading is implemented it
will flag that after a config reload we don't look at the new value of
the variable that points to that config value, so there is no change the
daemon's behaviour even if that config setting is changed.  There are
just some things that you can't (or don't want to ;-) change at
run-time.

For consistency I'd almost like to see that condition coded as:

  if (conf_maybe_updating(mode)) {

although perhaps we should just write it as:

  if (mode !=3D CONF_MODE_LOAD) {

since that catches the other cases consistently.

Let's see what Amitay says.  :-)

> I'm currently debugging a ctdb issue where I wondered whether tdb=20
> mutexes are actually enabled (I was seeing "tdb_chain*un*lock() took=20
> +-10 ms" many times in the logs).
>=20
> "tdb mutexes" defaults to true, so I wonder whether this bug can cause=20
> the default to not become effective, still wrapping my hear around the=20
> ctdb config code...

Since it is just a warning, that can't happen.  2 simple
checks to do.

* Check the logs for the attach:

  2021/01/30 17:40:32.096676 ctdbd[1440545]: Attached to database
  'yip/node.0/db/volatile/foo.tdb.0' with flags 0x1c41

  That's logged at NOTICE level.

  #define TDB_MUTEX_LOCKING 4096 /** ... */  so that's the leading 1.

  I see this consistently for volatile databases.

* Check the logs for the warning "Ignoring update of ..."

  This is just to see if the warning is triggered.

  I don't see it when I try it out, so I started looking at the conf
  code to try to figure out why we don't see this logged when the
  config is initially loaded.

  However, the config is initially loaded before logging is setup
  (standard chicken/egg situation), so warnings/errors from initial
  configuration load probably go to stderr?  Perhaps systemd has caught
  them and put them in the journal?  We should do something about
  that... not sure what.

How's that?

peace & happiness,
martin

--Sig_/dgMEC24+MBrWx/jgL88PchH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEpl+9WVt0RsCS8yPD7qs4B6MivQgFAmA4cbAACgkQ7qs4B6Mi
vQgNaw/9EMiyFwwkmyDSI5iBl4UnNJC1tqayIsyCyQGRxOr9EBPjhU7szwM8/Qav
w7oyDS2sEn5So/g0oAOPdLm+yqERsqQxoEBM7Rgi5It4jhPN7zeKYauKwzB3iA0V
c5xtbqcxk0hk9RwEQ2I+Sb/YKZVuW+e80WjmzXlYTgGflDKzo2zEHDwwgLm/BvbN
7XnmAH+xG6QC9QXC20aAsqsTwlfHYaH+YyrV2YLiMAbVtedGSE5HgH3u5/LuBbak
myJXOkEvw8WarkZjfgSLHHqqI6hnDZW4wNKx/2cLjji0gpQq9j8Bd6WXLZIVwVEw
qO/3SQMALXW05ggJvZRl+MvK1npDhNYZvMA+yX8ZPGMRKEEDd1C/c2NyQ841SG1d
cbKMxEIs5pkPeUQzBDht+YcufWDdH7s0MHt0b1kK2w2T46CDB46RGoJ8tp3asQFT
r/GTCdVGszVMctPmFUOiRKT4M35LnJ0dmdw6Ee5rKLqvBlznun9Ck8CZtoj4tNSf
dEBjDT6dqtv3djMVjJBKG7Kpj1G9E3zGwWpTnI9W/MgKblswElSvHRBasB3Z3yQx
bspCXuJLME+sTjx3o99xgwRgqY7kphPS41DmAFo0SKyRQlSntBz2MJV34EojG0WN
0qyAMJoEpOHcXg16bYQXZUP5TAhFbRl0pEMjgG36z9Yu+Hs35fA=
=v4Cn
-----END PGP SIGNATURE-----

--Sig_/dgMEC24+MBrWx/jgL88PchH--

