Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AFA16842
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2025 09:34:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=VmVliCySNwygdFHpoMys/Zfp2O8pdI1pV94nh8/ksCg=; b=ag15FT2CVh2GIGfNQBZgHyVkBU
	ZWj5jcIn3DZNJdDS7ZqaFClFVtlUELqcfMjqVyF8r/x5n//Bb8WuolAPzgx8+hIxGwaBPypwNbGgU
	ZKMeP2v+5S9X/5vBN+yVTRgoWKlBwY8DKgGXVOeX6UiwqQqS3q1PS7iWKal3hKKLFnHnHlJM+Ulnl
	FRuUUzJjItGegnEZNnIJt0i4GfjjPMLzwqrOWWnR6PjkyN6Q4S9Bau885BXiIXpelo9TifrJ8Sybr
	yW2+ZNFnnpUHg6m0K+nm4d2ZqUXaFqK1aAJwzMuYqv4HLenwRJMkm50p2Fu+hRPrqodfnZ/WZjd7k
	cncey/aA==;
Received: from ip6-localhost ([::1]:59168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tZnEC-008hNA-2w; Mon, 20 Jan 2025 08:33:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49214) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tZnE7-008hN3-LU
 for samba-technical@lists.samba.org; Mon, 20 Jan 2025 08:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=VmVliCySNwygdFHpoMys/Zfp2O8pdI1pV94nh8/ksCg=; b=gNVLIsEIaqK4heb4IxWUC1RSMp
 Yrex7RJQL0CLh9rGOX4kg/rBmvRaR2GAFiPsBrpVikCLxvDoeIum9Y01oLdkxgdGUykF97cqxCLnV
 RGSkFkQSRm7WsRNt1s9x1OU+WSCoKlKyacDnOPjUB9hl1HiswARpirItlQpbe1fYug4/ufc6RpxO+
 Zf1aQu+uNdZf5wlx5DzBp2I+facKB73KvUlfWTd1r1mg3IUSND04i+rV3uZDDOpUPB6LvqAkmRHnY
 RGgc0dw2C1Ce21mMM4BHbGIaRWCu5K1Wlm1lFYUKjmori/AkXLhpFYI+kzi+fbgyGp9FZ1AWUMsj/
 m1InQ2YO/MV9U90Nuz+7l/HJGpTJJmjp2G1jTMYeZqneBWSWtAhSy28QerWZT2z4rPoe2JN8H8h6W
 lJ2HTXxAiNRmz8kzYu4WqCSoyDTl2ii/XVY8CZ8fNxub0x3XjmI6rZS3OGUyo46E84TUuxLxRB1W2
 ROaDwJGXQMTUzSRp/wITUx+D;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tZnE6-0011zk-25; Mon, 20 Jan 2025 08:33:42 +0000
To: Steve French <smfrench@gmail.com>, samba-technical@lists.samba.org
Subject: Re: Local KDC and Samba
Date: Mon, 20 Jan 2025 09:33:41 +0100
Message-ID: <4942506.OV4Wx5bFTl@magrathea>
In-Reply-To: <Z43pEk7WDs6dTQ1M@toolbox>
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <Z43pEk7WDs6dTQ1M@toolbox>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Alexander Bokovoy <ab@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 20 January 2025 07:11:30 CET Alexander Bokovoy via samba-technic=
al=20
wrote:
> On =D0=9D=D1=8F=D0=B4, 19 =D1=81=D1=82=D1=83 2025, Steve French wrote:
> > Is there documentation (or example howto, walkthrough etc.) on how to
> > setup the new Local KDC features of Samba server?
> >=20
> > I wanted to try some experiments with the Linux client to make sure
> > the new type of krb5 mounts work fine.  For the server I am using
> > current Samba master branch on Ubuntu.
>=20
> There are bits and pieces which aren't merged yet in both MIT Kerberos
> and Samba.
>=20
> Your best way of testing is by using COPR repository Andreas created for
> Fedora as it includes prepared packages.
>=20
> See https://gitlab.com/cryptomilk/localkdc and
> https://copr.fedorainfracloud.org/coprs/asn/localkdc/
>=20
> Andreas gave some insstructions in this comment:
> https://github.com/SSSD/sssd/issues/7723#issuecomment-2597864370

=46or using IAKerb you need smbd and smbclient built from:

https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads/asn-ia=
kerb


Edit the smb.conf and add:

include /etc/samba/localkdc.conf

at the end of the [global] section after you ran localkdc-setup!

You can then connect to smbd using the mdns name of the machine=20
(<hostname>.local).

Example:

smbclient //samba-iakerb.local//share -Uasn@SAMBA-IAKERB.LOCALKDC.SITE --us=
e-
kerberos=3Drequired


Best regards


	Andreas

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



