Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C3698E58
	for <lists+samba-technical@lfdr.de>; Thu, 16 Feb 2023 09:12:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xf8N6DmS76FW6Ati1/qsdlA3OlqAXmtIoWBliLek0CU=; b=YSzzvmBnB89J1OZvdNjFSWog1g
	3/aWI0MiPnlk+m1axuFhw8JZIfUfktC6rySkAMujYZ5HRvA1In/eHP47UvlcxzsErOMUwlWVpu+Ys
	oVKuSDMUFEw6MLSUcrCYdSLLyMup1N2e5Kgal7AzmUZbYRVGF7crTACBptmN/E7PDQ/p75VCaGHJV
	nCo6kC+0UeGlVPGEsAAOwE+bf37cFz1y1tFyI/+yKZSvYZE7FxZkKwb65YT0JtFFPp2lPoZ6EmIZy
	PB7uMelu86x9Cq4+D7st3fd7iPuE4aToJcIbK3T8ytlZYEnNyTThohZTvc9yS9ZvT/zHMNGS7hfUU
	3DDfc/vQ==;
Received: from ip6-localhost ([::1]:25728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pSZMv-00CgGB-El; Thu, 16 Feb 2023 08:11:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21852) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pSZMq-00CgG2-Bd
 for samba-technical@lists.samba.org; Thu, 16 Feb 2023 08:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=xf8N6DmS76FW6Ati1/qsdlA3OlqAXmtIoWBliLek0CU=; b=wTWGzdrE9gHERA0dGsZOJCEQF8
 3RGI8BaEWnOIafVJZLaH/yhDN4SK02KewlIcGdgMME7SPGp8vDfgwxGvht/GPI0zkLltPExV2VS0V
 6hmfNEFV4SNGV7g6ik1xL4g1/i8JB0LODmtyp5k0MDJvUZiIDh0iFVsga3L5B5L0WhCSBsKKr7ibf
 i43dH6nTrkGDEZVN2fTi1icD7ZrNOYiR89DSbXy39qNlbNghceNu0tq7nKEyeXIftDVGOLKUf6EGk
 8n+jO+edLnNprRrrwl7eJ+PShJLe9cc07y8AaSFJA6Br2pzSewjEM/qBqLh1LB4eoA266tkSSJqQY
 mBaChtBX3OJDyZkj9zgUzWsaTsBFQI46s1FqcmGjt6f0MMVC3yoBVhNjyk1CJqBi3gaQapUMI6KaW
 GFHPY95H2dgpXYn7CQJqStr/nH00WiyTdWN7oiqoalg73nawoPTGFYAq6EyKvdnHJJp0jptQJnXnZ
 NRTEEvhc8Vg5TE7DhBAAK+xo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pSZMo-00E3kH-MA; Thu, 16 Feb 2023 08:11:47 +0000
Message-ID: <3af805df2a359dcf695e91ced7ee0bfd9bba52a9.camel@samba.org>
Subject: Re: Failing tests on Fedora
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Thu, 16 Feb 2023 21:11:41 +1300
In-Reply-To: <4782393.GXAFRqVoOG@magrathea>
References: <4782393.GXAFRqVoOG@magrathea>
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

On Thu, 2023-02-16 at 09:04 +0100, Andreas Schneider via samba-
technical wrote:
> Hi,
>=20
> I'm currently trying to run 'make test' as part of the RPM build process=
=20
> (%check). So I'm trying to get everything working, but I'm seeing strange
> issues and I need some help to track them down.

> We create a test user with `samba-tool user add`, which succeeds! Note th=
at=20
> samba-tool directly operates on the database here!
>=20
> Next we try to do an operation via ldap:// and if you look at the error a=
bove=20
> it tells us the user we sucessfully createa a few moments agao doesn't ex=
ist.=20
>=20
> It looks like the samba process didn't recognize that that the database w=
as=20
> modified.
>=20
> I also see something like that with Kerberos tests, we create a user with=
=20
> `samba-tool add user` and then the KDC can't find it in the database =3D>=
 same=20
> pattern.
>=20
> I don't have deep knowledge of the AD server, so hints how to track this =
down=20
> are much appreciated.

This is very, very strange. =C2=A0Particularly if it works for a single tes=
t
but not a suite of tests. =C2=A0The KDC is just another tool reading that
same sam.ldb, there isn't any extra cache or anything involved.

Andrew Bartlett
--=20
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


