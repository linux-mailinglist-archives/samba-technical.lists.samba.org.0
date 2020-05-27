Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAD21E36C0
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 05:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=3uUI/OGWEF1bLpq8uAtGWYJhTjNZuuT7jJyyQootRRw=; b=YjSa8vaze+XYjtsAetUqDRSGCg
	NN92qGx7TAAh+ENHg5Ml533lfG/lu9Zt0v2W5I2LB+IrloZg7f8A/XtnhtcyyMK24x/KpRc3lukzJ
	O0ASxzNj6RPi386AKQevbcnilKOsE/HX5zpkfF7a5diAbOfiyC9pie36mndsAC7VHlzomT9GejHRL
	c5b7a0Cqwv4LbJZKqeJe4kRDSS5F9h/nzackrkZiBokG2cUKiRdD9VvsToxMCUjNHyOmWmhWhyPLI
	9411Hltxi+fYKAB2nY91tzIL5aD6V3glgKYrZgEif+2LmWRj/3N85lEigMK7GPVWyVdQB0N4v9Szm
	HSjublkQ==;
Received: from localhost ([::1]:45728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jdn8M-0061gJ-Dr; Wed, 27 May 2020 03:53:38 +0000
Received: from mx2.suse.de ([195.135.220.15]:45372) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jdn8G-0061gC-CY
 for samba-technical@lists.samba.org; Wed, 27 May 2020 03:53:35 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B8BCAD57;
 Wed, 27 May 2020 03:53:32 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Schema updates and modern Samba AD
In-Reply-To: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
Date: Wed, 27 May 2020 13:53:23 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <E89015B7-BFCD-4731-82F9-AE09FE73C52A@suse.de>
References: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
From: William Brown via samba-technical <samba-technical@lists.samba.org>
Reply-To: William Brown <wbrown@suse.de>
Cc: Stefan Metzmacher <metze@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On 26 May 2020, at 18:37, Andrew Bartlett via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
> (resend from samba.org address)
>=20
> G'Day Metze!
>=20
> A long time ago I remember asking if we could change the default for
> "dsdb:schema updates allowed" to true, so that this is no longer
> guarded in Samba.
>=20
> At the time you said, from memory, that while schema loading was much
> better than it has been in the past, there are still ways to break =
your
> directory with new schema, so we can't change it quite yet.
>=20
> What I can't remember (or find in the list archive) is what those
> issues are!
>=20
> Can you remind me?
>=20
> I ask because I'm updating=20
> https://wiki.samba.org/index.php/Samba_AD_schema_extensions and I want
> to include a practical guide to adding new schema, and make specific,
> rather than generic 'here be dragons' warnings.
>=20
> My hope is that this way we can encourage the use of appropriate =
schema
> extensions, rather than ad-hoc re-use of other arbitrary attributes by
> our administrators.=20

https://docs.microsoft.com/en-us/windows/win32/ad/extending-the-schema

Generally, I'd say the biggest thing is that it's a one way street - you =
can add, but never remove, so that means your changes have to be very =
carefully considered, because a mistake can't easily be undone.

For example, if the ssh public key schema shipped in AD, the fact is has =
a "must" not "may" on the ldapPublicKey attribute makes it extremely =
hard to use in a self management scenario.

So my input (for what it's worth) is that schema changes should be =
considered carefully, and the consequences understood, as well as the =
ergonomics of how those changes will interface with access controls and =
that human interaction.=20

Hope that helps,


>=20
> Thanks!
>=20
> Andrew Bartlett
> --=20
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT         =20
> https://catalyst.net.nz/services/samba
>=20
>=20
>=20
>=20

=E2=80=94
Sincerely,

William Brown

Senior Software Engineer, 389 Directory Server
SUSE Labs


