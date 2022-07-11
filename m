Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D84856D277
	for <lists+samba-technical@lfdr.de>; Mon, 11 Jul 2022 03:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=r7+SILlltsfWzcbNKgJdyuND2SasHZKHuaR7oa0dFuE=; b=uq5GsmhdqAjNEv3gJnUMBhK1yP
	XliV+YxgrprT3FhOef67MSgZrz8EFV6onbujhMhlYkRP6UEkly4H8chXqDb1bEYsESgWZql8lZLbZ
	hfGUNCEK4Ao8NfVrP9kgPlIFyO4aBJDJ8sEVCMATtYofU1Kz/aD0Mp/Vrmnp+MLkpKyKehW3pJFX1
	gazcfOQsk/L2rV2aMHiiAVhBRJVHEK80ydgaCDTzloTj75U1v1EwJ9yswaCZ4S8+PUnfpAG+SI5yL
	eHYtGRD+IuSDXzd4QqlKG4caLab0H1zts/ONX1P6rt/C3XKouACbXvV7u2/nNvBotIEMHGj34IpLz
	IgrVi6eQ==;
Received: from ip6-localhost ([::1]:53732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oAi82-00GtYb-Ve; Mon, 11 Jul 2022 01:22:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63582) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oAi7y-00GtYS-0b
 for samba-technical@lists.samba.org; Mon, 11 Jul 2022 01:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=r7+SILlltsfWzcbNKgJdyuND2SasHZKHuaR7oa0dFuE=; b=zjAySePMi0DE1G62XZHhPQXYBo
 sYwPGrgeGxpSYz6M3HI8PUzXeInQGUQBeKGN9HqiWU8O4dau+X/eJ3oOpNeOJH7UGwS21J9+aGsyc
 sBhdDQHcGuhPaqH++Z1/7enaLT1nXMLhqMhS5iSE+dC9cUgVMV9aDobq4WA/8ba2r/Abwi2XtdQ/e
 O2ijkGVgPv6THodVI68GZpgNzSTmZgm7z+SH51Bmd2hu28fzZ745mv1BdeaH1RC0M5k89yvf+7SVr
 Uh0HOo9vO+RR6dnMbGHgQssiMAgUG91YFxwyq5nj6z8DNFV8qLZHSCw/izeuszuq36/JSILiC96wg
 AcSb80w8NixToYMsGYzzXw3x4C8x5i3X7Srbf0KrsUZXEhqC/45c3k2V3jkjuiy4HVbkhDiKsmhZO
 BOmoD6NNVbvJ4zRotDKFUAX55MgmeECQjc3m1JkbbegbsBP9tIgwbHaKD70ywtDxOw3s32XiaaFm5
 sWRPG/FmD2oHPvD53Tw7ZAcQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oAi7k-0044Cj-32; Mon, 11 Jul 2022 01:22:08 +0000
Message-ID: <ace59e5ae596201e0626cda0fd96fa264f8ddebe.camel@samba.org>
Subject: Re: Video of my Kawaiicon talk: The "Dollar Ticket Attack" on AD
 and Linux Kerberos clients
To: samba-technical@lists.samba.org, krbdev@mit.edu
Date: Mon, 11 Jul 2022 13:22:04 +1200
In-Reply-To: <04cd9526caa11ac094fe6b276113639e46177aa4.camel@samba.org>
References: <04cd9526caa11ac094fe6b276113639e46177aa4.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
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
Cc: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2022-07-09 at 18:46 +1200, Andrew Bartlett via krbdev wrote:
> I was going to wait until a per-talk video was hosted by the organisers
> of the conference, but in the meantime this link into the live stream
> works.
>=20
> I'm sharing this as I wanted to share the video as folks have been
> interested.=20
>=20
> https://youtu.be/4hBLf2vQc8k?t=3D30560
>=20
> It would be great if the linux side could become harder to exploit at
> some point, I have some suggestions at the end of the talk, and Sumit
> has had some suggestions around disabling an 'a2ln' plugin.=20
>=20
> It would be good if someone could write up some good guidance for users
> on how best to defend against it on the Linux side, both with a 'simple
> keytab on server', or 'samba publishing keytab' or other similar
> configurations.
>=20
> I also tell the tale of how I broke into Windows AD last November,
> similar to but more punchy than SambaXP talk, which I think was pretty
> cool.=20
>=20
> Anyway, enjoy and be worried!

I've started to put together a wiki page mostly with links.  It is
probably still at the stage of being confusing even to this audience
(and is totally missing a 'how do I protect myself' section), but
perhaps someone can help fill that out. =20

In the meantime at least it links some of the various documents, talks,
exploit steps etc:
https://wiki.samba.org/index.php/Security/Dollar_Ticket_Attack

I would appreciate it being extended.  (Please don't be put off by
needing to get an account, it just a spam prevention barrier).=20

Andrew Bartlett
--=20
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


