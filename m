Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 727B45668A
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 12:20:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=+hdGkg0tuYFTZEm/wEqanIqUFJzEZe2pvOdB8W4Fwjg=; b=LCcF444XRb14TKF+5jQNv1Uy/l
	lmz0g1CnyHDtiS8cJni+zNa4H+QLmx8SjV/dS9PyZPVs4kosk6+AVHSYc+tjqbRGgS/8g6WgxquIC
	JxonP5caT8YKn125PwtS/TxxwWJ3jFhDZEJCkFs3agrHn5idrTBBQt6ciF+W290NMlh3Ps95tFYe9
	EwMJk3FaeHpNtoAPS5MYNfulpL1YLXoWeQPOLwcqkoenWn/eog6GWkFgiEBilz42rSZVCYRrh9/Da
	255VhlnuzuufsLDVVE5E60rHxUINpDo86pMxT+lzfIzwTgDh/Wq2e/64JIb3b2PMOdk+gbDIhBYL1
	LH3Frs2g==;
Received: from localhost ([::1]:54064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hg51z-001r17-1u; Wed, 26 Jun 2019 10:19:59 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:43786) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hg51v-001r10-7R
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 10:19:57 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1562149190.0711@hN0wiMwhgkbJ+Qh7bI6Ymw
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 95D2E12188F.A86E2
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 95D2E12188F
 for <samba-technical@lists.samba.org>; Wed, 26 Jun 2019 12:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1561544386;
 bh=KSFKdOZ6JgladhyfccKMZywqt2S90rb/wjJP8EqKac8=;
 h=Subject:From:To:Date:From;
 b=Sp+0MzyuWNEazR3/ulSfWKgoRmsWBJjHdPWoxE6q1gfDygK/QDsFtPxwssxBK3ajv
 4y+CaGcbesY3+029Nf/vq+6KgXnxKX9u0Fvn+CJql8sFwT+6nQhTbdVyPGI1eAOrZF
 S5Qlrs/6glYM/Ob8j2BjXk2WeFsSYM1G8q2LBhj30MYAmfBxtDWuWvXLDs7WBy3kI7
 xXsF8ZpSoNMqVzGURdRRVVS6ZNOmsbqRgEpMLbdiD2ZkFxAyLTesHKS88sfCwhhr3d
 AxvDejy1bX75QwuEFpnOQ1XLZdeScfMlBfq42EzPiNDT66lpOY9UqyKguB06IJHvzv
 X980grwPQjixQ==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 8C1A53AF8C
 for <samba-technical@lists.samba.org>; Wed, 26 Jun 2019 12:19:45 +0200 (CEST)
Subject: Bug reports and misconfigured/missing smb.conf or system setup
 (resolving) 
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Wed, 26 Jun 2019 12:19:45 +0200
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdUsCK0TlvouZ6PlQHCCfbQJItTpMA==
Message-Id: <vmime.5d1346c1.7b12.46aea94774eb7451@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=windows-1252
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai guys,=20=0D=0A=A0=0D=0ANow, i went through some bugreports and same a=
s on the samba list, i noticed lots of report with incorrect smb.conf or =
system setup's.=0D=0A=A0=0D=0ASince the basic resolving settings/setup ar=
e soo important, we need to have some better checks on that.=20=0D=0AWhat=
 i suggest,=A0Rowland=A0and I made this script. :=20=0D=0Ahttps://github.=
com/thctlo/samba4/blob/master/samba-collect-debug-info.sh=A0=0D=0A=A0=0D=0A=
I started with it because to many people have wrong settings and you guys=
 really can use your time much beter on real bugs.=20=0D=0A=A0=0D=0ASo wh=
at i suggest, the above script is made/tested on debian and related.=20=0D=
=0AI=A0still have things to add, but if we can improve this so it works f=
or RH/Centos, Arch linux, maybe few others also, this will really help in=
 finding incorrect settings.=20=0D=0Awe could/should use something like t=
his, it standarize the debug info more, and that really helps debugging.=20=
=0D=0A=A0=0D=0AFor the list, where i use it most, it helped multiple peop=
le that where struggeling weeks in there settings and where killing samba=
's its AD-DB.=20=0D=0AI also suggest, every bugreport should have this, u=
nless you guys are really=A0sure its a bug in samba.=20=0D=0A=A0=0D=0AWha=
t do you guys =A0think=3F=20=0D=0A=A0=0D=0A=A0=0D=0AGreetz,=20=0D=0A=A0=0D=
=0ALouis=0D=0A=A0=0D=0A=A0=0D=0A=A0=0D=0A=A0=0D=0A
