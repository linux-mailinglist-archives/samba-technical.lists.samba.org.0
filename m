Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAA76E075E
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 09:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fXX3lYnaif/iglVuG8xXZmDS4EmbcYOPabDPwb0t6o0=; b=ojGpMvAhopS4aGzi6q2rz/5tbg
	KKIy2X4kKVoJVs6YdTkRyfQPRQuMvBQloME4PhLBGPuZO60i3DZUQNwSDZEjCsj39lFP52MJr3wIW
	g0qA8EQPagGD2muKoUt9eHJpIHVHgxgWt+JCLUt8nJqqjD1IUwrLt83wCUuFyfsORHxgxr4wnMAOR
	7GhhQENnWhoJiQJzFbrTYuetC0pS5vKu413oH2Nr9BbnqeAd3RCmMps2Zz5hMLv5iqWps7gLGcqVI
	GycFmNTjXebh1cbFMJoUpVAQaizAWbaMTToWN1kOkQhHSjXh6NrcSaT41jISIypiChrCOp0+X0Xe6
	/luRFGtg==;
Received: from ip6-localhost ([::1]:39458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmr61-00120Y-6b; Thu, 13 Apr 2023 07:10:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50694) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmr5h-00120O-7v
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 07:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=fXX3lYnaif/iglVuG8xXZmDS4EmbcYOPabDPwb0t6o0=; b=QHaqqdmMwHgUA7om48IzDDiBzJ
 KdadFeIUZttpflYzsdJVY6V8ZjlVEgKf+mrM0nFhfGgIfXAufjkJ/0PlHzTPWjGDnBDxe+QxV6H2V
 lbfvlRZJPOrs3+VTBkM36K0oWqA1/rdODo5ARlDI5bee2x0EKy4fLHdaGtyVIwJkHahKtrvl0o6xZ
 0LI/CcZpkIg4D3mdiVhKRWlTYbN/YpMSpDAwSMUe0ctHne0//4Joyhs8mLApFDPIf+s9dFDVLubzw
 tN7zh7YePHLC7cccalGXv67z0RALa3qZscGrDay/30jVBFtBM1DWGq78j/oGb2Wc3A0Z6NhNeEeVD
 Hl/4DGyoWKpjVLczvKXadichclwqjsASWtPczfWOlxPNVwh9FCo73oV/U8ym8itei8D4DjCFxNs8t
 U3JYkQGzBNc8eMxPxh6nhxrbrN95cs5M9ffWOyXkfYYmyoQ9OoikXIvdVgORkghn9bpzpKYxs6ETY
 ZINpSVlHPjqlOpYzi1Wcb8yU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmr5e-000sxc-1U; Thu, 13 Apr 2023 07:09:54 +0000
To: samba-technical@lists.samba.org
Subject: Re: Recent Samba (4.18.0+) winbind configuration ?
Date: Thu, 13 Apr 2023 09:09:53 +0200
Message-ID: <4797373.GXAFRqVoOG@magrathea>
In-Reply-To: <1d47d63c-854a-0622-c6de-3965dbeb3804@samba.org>
References: <4203dcdd-5e9b-6708-5cdf-aec961f5f6a1@oracle.com>
 <ZDWVzOaPP7SNIxOf@jeremy-acer>
 <1d47d63c-854a-0622-c6de-3965dbeb3804@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 11 April 2023 19:47:45 CEST Rowland Penny via samba-technical=20
wrote:
> On 11/04/2023 18:15, Jeremy Allison via samba-technical wrote:
> > On Tue, Apr 11, 2023 at 02:32:27PM +0200, Ji=C5=99=C3=AD =C5=A0a=C5=A1e=
k - Solaris Prague
> >=20
> > via samba-technical wrote:
> >> Story begins when Samba 4.14.0 changed its VFS so we decided to skip
> >> 4.14.x and also 4.15.x releases to bundle it on Solaris but various
> >> problems were also with later releases and we were only fixing issues
> >> in 4.13.0 . Currently (4.18.0) the situation can called be critical so
> >> I focused on recent release.
> >>=20
> >> winbindd is giving up and I think the key could be in log message:
> >>=20
> >> [2023/04/11 11:28:53.090661,  5, pid=3D1525, effective(0, 0), real(0,
> >> 0), class=3Dwinbind] ../../source3/winbindd/wb_lookupname.c:
> >> 52(wb_lookupname_send)
> >>  WB command lookupname start.
> >>  Search namespace 'smbsetup' and domain 'smbsetup' for name ''.
> >>=20
> >> ...where "smbsetup" is my domain  ...and I have added core-dump here
> >> to freeze the stack:
> >>=20
> >> [2023/04/11 11:28:53.090780,  0, pid=3D1525, effective(0, 0), real(0,
> >> 0)] ../../source3/lib/dumpcore.c:315(dump_core)
> >>  dumping core in /var/samba/log/cores/winbindd
> >=20
> > Ji=C5=99=C3=AD, please open a bug and upload the full backtrace.
> >=20
> > Thanks,
> >=20
> > Jeremy.
>=20
> Damn, I missed that, focussed on how wrong chatGPT had got it wrong,
> anyone heard of 'autorid_compat'  ?
>=20
> I still think that Yura needs to post their smb.conf etc.

Not the smb.conf but the output of "testparm -s"! Always ask for testparm=20
output including the errors and warnings it prints ;-)

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



