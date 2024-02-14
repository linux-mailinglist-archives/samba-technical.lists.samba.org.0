Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 010948553E1
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 21:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xJnDA0yzk35tVRuBBViX3dUz5MdwQjh78f/0+ts7kok=; b=iYzcjFxxplxqzow898Jduy5Nvo
	ElMdAMiax9tCLqh/wZj7Lv/9Sn9VpGu6lgNsQ54oTOt+3iQKusY8lS1oibYnm+4WUTWXNa4Wjx/PX
	2iRy6x7WgWV0iY1U3KVI9NATTmui2Tz8GO03dVtED6KqO/pJa3X3PoB5UYoXFmygT0kv3r+orJ9yr
	9Kd89HcTgYmLq9NsKiIn9CxMPWOaSpCksnJ4wsa/Al+t+/FYRQoRNN5bwTvgOptk7LncmtG45qYFh
	Gf7u0mlFMQRVzBOa1zga+FCqAvUk0paWfTEEi4ArrlNYZOeF8KL7z3EMN71VA267/oOKA0ycta7G4
	drG4asjw==;
Received: from ip6-localhost ([::1]:37568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raLjY-008Utl-IZ; Wed, 14 Feb 2024 20:19:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64628) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raLjT-008Ute-Ts
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 20:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=xJnDA0yzk35tVRuBBViX3dUz5MdwQjh78f/0+ts7kok=; b=Xr6Xuhe6IzkeMgAsjvYxBZ5jKJ
 4QGwwbN+8h87hbGtzSeGeS/LMjdDF3mPrGbJJxCtF7Ik6kj8L0wkEPb33CzWo+ZUg4N01I2szirt0
 8Rr7ejktt61LeFtJ9NlS1Jgd9v5U2iQzGIptadtChaXDIc716E3Rhv0Ilhu50119P3CWheczBf/ze
 qN3qCIoZesOVKJo2Knq2972LFo6jkHH9mq9AaZ6B+YJgCkwz8THMkxM0yBU+EEjJHhPKI7rr1eLYN
 Nm0ch7eUazKPVufNvo+8xHkbh2oAFjgLGKL+TWask5kuWHx6BaSyf6MTkP2XEOA210zTRTBOdnlIr
 klYbZh8HFT7HDEJ7wmmyGp5m/uNDoPwRwj05im4D1bNQTvwjdMiXZ+HwOgPR2EZScJVRddW43B1+t
 ZTE29KvSXNS5bXLF9hC/jGNzqzx4eRSW8d+v25t0W2sZSopsWVAJGd4CB3/E2/p9pI4nY0wE8a7vt
 9ctbR5dcVnJnlHxa47TsIaz2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raLjT-00D5Gq-16 for samba-technical@lists.samba.org;
 Wed, 14 Feb 2024 20:19:51 +0000
Date: Wed, 14 Feb 2024 20:19:49 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: Looking to once again re-bundle LDB
Message-ID: <20240214201949.328f5cf4@devstation.samdom.example.com>
In-Reply-To: <Zc0W3hMABO/gCdvC@toolbox>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
 <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru>
 <Zcz2oHdkRyYgJK6E@toolbox>
 <dc921798-03f9-4045-957a-dadedc51993f@tls.msk.ru>
 <Zc0LAN08B3wPY8pr@toolbox>
 <20240214191249.727ce60d@devstation.samdom.example.com>
 <Zc0W3hMABO/gCdvC@toolbox>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 14 Feb 2024 21:39:10 +0200
Alexander Bokovoy <ab@samba.org> wrote:

> On =D0=A1=D1=80=D0=B4, 14 =D0=BB=D1=8E=D1=82 2024, Rowland Penny via samb=
a-technical wrote:
> > On Wed, 14 Feb 2024 20:48:32 +0200
> > Alexander Bokovoy via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >=20
> > > On =D0=A1=D1=80=D0=B4, 14 =D0=BB=D1=8E=D1=82 2024, Michael Tokarev vi=
a samba-technical wrote:
> > > > 14.02.2024 20:21, Alexander Bokovoy via samba-technical:
> > > > > On =D0=A1=D1=80=D0=B4, 14 =D0=BB=D1=8E=D1=82 2024, Michael Tokare=
v wrote:
> > > > > > 14.02.2024 17:46, Alexander Bokovoy wrote:
> > > > > > ..
> > > > > > > We do rebuilds of the whole stack in Fedora if bots detect
> > > > > > > samba ABI had changed. So for us it is not a problem.
> > > > > >=20
> > > > > > It's easy to do with "current" Fedora release.  It's
> > > > > > entirely different question when you want to provide
> > > > > > current samba to a previous Fedora release.  And that's
> > > > > > where the problem is, - providing "backports" of current
> > > > > > samba to previous releases of distributions.
> > > > >=20
> > > > > If you are building packages on top of RHEL by replacing
> > > > > existing packages there, you are responsible in fixing all
> > > > > breakage that new packages would introduce. It is maintenance
> > > > > work that one needs to consider when providing alternative
> > > > > builds, regardless of a distribution.
> > > >=20
> > > > Exactly.  Ditto for debian. Even debian backports, while being
> > > > part of official debian and using debian infrastructure, needs
> > > > additional work. It is good if a new version does not introduce
> > > > incompatibilities, - this way it can be provided at less work to
> > > > previous releases.
> > > >=20
> > > > ..
> > > > > > Yeah, it would be best to build samba against mit krb5, if
> > > > > > it were a supported way.
> > > > >=20
> > > > > It is supported. It just provides a bit different set of
> > > > > features compared to Heimdal-enabled Samba builds. See our
> > > > > talk at SambaXP'23 for details.
> > > >=20
> > > > I know it works, and it's kind of supported, with
> > > > --enable-experimental-mitkrb5-kdc or something.
> > > >=20
> > > > The thing is: personally I don't have resources to support it
> > > > by my own in debian. Everything I do there, I do at my "free
> > > > from work" time, I don't know how all this AD-DC thing work.
> > > > After all, my only intention when I come here was to fix a bug
> > > > in samba form which I suffered in my work (had to restore lots
> > > > of user profiles lost due to samba data corruption), and am
> > > > still there because it was not "just flip this one bit and it
> > > > all works" thing :)  So I entirely rely on upstream samba for
> > > > almost all support work.  And there, MIT-Krb5 AD-DC is "not
> > > > supported".  Hence that's what I mean above :)
> > >=20
> > > I think that statement of 'not supported' added more damage than
> > > helped. I hope we can move forward from that by acknowledging
> > > there are different use cases for Samba AD that involve
> > > configurations where one or the other Kerberos implementation is
> > > better suited. For example, not everyone needs read-only domain
> > > controllers in all environments. Or not everyone even need to use
> > > Windows (shocking, right?) as domain members. ;)
> > >=20
> > > There are still issues at how to present two separate builds in a
> > > distribution but that's a different story, not an upstream
> > > problem. At some point we have to bite a bullet and move forward.
> > >=20
> >=20
> > Hi Alexander, I have nothing against using MIT on a Samba, in fact I
> > would welcome it, but according to this wiki page:
> >=20
> > https://wiki.samba.org/index.php/Roadmap_MIT_KDC
> >=20
> > These are things that Heimdal does but MIT doesn't:
> >=20
> > Add auth logging support
> > Allow starting the MIT KDC with multiple worker processes
> > Define API for a libkdc in MIT Kerberos
> > Running as a Read only domain controller (RODC)
> > Support for Claims
> >=20
> > Now the page was last updated on the 18 July 2023, so some of the
> > above may now work.
>=20
> Audit logging is possible on MIT Kerberos side for years, it is not
> implemented fully on Samba side. libkdc is needed for RODC support but
> is unlikely to come without a serious investment from a party
> interested in it. Support for claims needs a small fix on MIT side
> and a minor effort on Samba side, it is in our plans.
>=20
> Overall, it is better to define a focus for the specific use cases and
> admit they are being covered by these different implementations.
>=20
> Samba AD/MIT Kerberos combination is far from being 'unsupported' and
> being 'experimental'. What was agressively enforced over mailing lists
> as an unsupported claim made more damage than helped, in my opinion.
>=20
>=20
> > It is my opinion that Samba has enough on its plate trying to get
> > the Heimdal version to the full 2016 functional level without
> > having to get the MIT version to the same level.=20
> >=20
> > If all the work is done to the MIT version and it comes up to the
> > same level as the Heimdal version, will RHEL ship a version of
> > Samba that can be provisioned as an AD DC ? (I think I know the
> > answer to that one) If this answer is no, then what is the point of
> > carrying out any work on the MIT version ?
>=20
> In my opinion you are mixing completely different questions (and
> possible answers) together for no good reason. This does not help at
> all.
>=20
> As an upstream contributor, I do not see a request for RHEL to ship
> (or not) Samba AD as a definitive reason to make (or not) Samba AD/MIT
> Kerberos 'supported' or 'unsupported' upstream. I am together with
> other fellow developers providing this support already: we do support
> Samba AD/MIT Kerberos in Fedora for years. As a major Linux
> distribution's package maintainer, I do have enough data to consider a
> distribution-wide context for this configuration being useful to be
> supported.
>=20
> Heimdal is missing quite a few other features that make MIT Kerberos
> attractive for a distribution wide integration of Kerberos features
> in a modern world as well. Granted, most of that is not used or cannot
> currently be used directly by Windows and by extension of that might
> not be interested for Samba AD consumers willing to integrated with
> Windows systems directly. However, it does not mean Samba integration
> is not important in a pure Linux world.

As far as I understand it, the whole idea behind running Samba as an AD
DC is to be Microsoft AD compatible, so having the extra MIT
capabilities might be nice, but are not really necessary if AD cannot
use them. Can I also point out that Samba 4 was released 11 years ago
and, in all that time, MIT has been the coming thing, it still hasn't
arrived, there has to be a reason for this, could it be that people are
happy enough with Heimdal ?

I still think that Samba does not have the resources to use two
different KDCs and Heimdal seems to have the edge over MIT, if only
because it has been used for the last 11 years.

Rowland



