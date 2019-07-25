Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74050751B5
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 16:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ipiA88xImHsMh+pJi/lPjhGGz/YXtvILFiBQ1+qmLrM=; b=QJQRKlnjnLO8L0QLY2Q7/DIY2g
	eF3ZOTAyi5TfGR6vTbXPFsr0uTwLbiWGX+2KOQNHae/EqBXfkcCoVMXsZtH5wxXVyAh57qwSpMrym
	MDaZRiA9ZYmC/qJNNNF0u30iRK1lpSnC4gpxp3BxjM//1n1giXyROG6K1HO/Sb7tdreWDxH8FPgIh
	vXXEhxULxK1tQhf4iWZzURdnOTcF4NBRMwX2+TRADGRwgu22RJrc7za9L7D/90vX+QipxmRHJVAZ/
	udwhq02jLgkiYSmMIsk+rL35mtgSuiFSTjUg/OFh5cr7NcKoWD/uwm5RpgYmrvMLPBtXz9kdI0WXQ
	YYH7OlBg==;
Received: from localhost ([::1]:18508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqf2G-000DRI-Ca; Thu, 25 Jul 2019 14:48:00 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:34766) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqf2B-000DR9-NA; Thu, 25 Jul 2019 14:47:58 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1564670870.04003@C958rzSSkH2wAjAmYT8l7g
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 8A26D11F2BC.AA4B7
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 8A26D11F2BC;
 Thu, 25 Jul 2019 16:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1564066068;
 bh=AsOMgNqAEwpQy8j0UlvLh3eGrBTdWwMfcZnK8g0rm/8=;
 h=Subject:From:To:Date:From;
 b=VPJG5yedie/Xtqv+Hxs0SwPiHtlM5pYYPoOm29dpagoPW0QJjI80c+i73OMc0iPgJ
 C6hDD1NGHLFexP9xh4f2wXOq34SzGy+VJZ3V2BFOHji/LQGesMAEVaNSAeX5SZWWBq
 yXQEPugnyY+PeTfvcTpx1v9sffTdGKZw05O4F2uxPJrSQ8+hP0khhCUgEU8eMiuD4h
 tIAJJkIbuHYeVwZJ0GUqLMNNcLxOdl8JCDjq3+te/VKn8nt6c7EDHgTW54GOTpsnQN
 3f9olpG6dDnKOcdk2Z703yXmzgTNgm8CkC4EAjvp0FZMUu96fpwc+8ijulVEUw8klQ
 boInliN8c8PyA==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 5504B3AF8C;
 Thu, 25 Jul 2019 16:47:48 +0200 (CEST)
Subject: NOTICE: Update Debian samba 4.10.6 (stretch)
To: =?windows-1252?Q?samba=40lists.samba.org?= <samba@lists.samba.org>, 
 =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Thu, 25 Jul 2019 16:47:48 +0200
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdVC9+ymsiwj+Zg7Q9qH5NYbOo4cOQ==
Message-Id: <vmime.5d39c114.b4f.28d2cf8c2837f054@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=gb2312
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

Hai,=20=0D=0A=3F=0D=0AWe have noticed a depency that was missing in the l=
atest 4.10.6 builds.=3F=0D=0AAffected are Debian Stretch and Buster.=20=0D=
=0A=3F=0D=0AIf you where running samba 4.10.5 and upgraded you might not=3F=
notice this problem.=20=0D=0AIf you did not use samba-tool, you might not=
 have noticed it.=0D=0ANew installs=3Fand people building from my sources=
 did noticed it.=20=0D=0A=3F=0D=0AThank you guys for the reports !=20=0D=0A=
@Marcio Demetrio Bacci=0D=0A@Yohann=A8=A8s=3F (Tranquil IT)=20=0D=0A=3F=0D=
=0A=0D=0AOne of the problem is, you see this=3F:=20=0D=0Asamba-tool drs s=
howrepl=0D=0AERROR(<class 'ImportError'>): uncaught exception - No module=
 named 'tdb'=0D=0A=3F=0D=0AYou dont see it if python-tdb and python3-tdb =
are both installed, that's a workaround.=3F=0D=0A=3F=0D=0ADebian Stretch =
Samba 4.10.6 ~2 is now released on my repo.=20=0D=0A=0D=0AI rebuilded the=
 4.10.6 ~2 with=3Fpython3 support now.=20=0D=0A=3F=0D=0Aplease run :=20=0D=
=0Aapt=3Fupdate=20=0D=0Aapt dist-upgrade --autoremove=0D=0A=3F=3F=3F=3F=3F=
=3F=3F=20=0D=0A=3F=0D=0AThis updates all needed packages and remove all u=
nneeded packages.=20=0D=0AAnd its=3Fok again, sorry for this, i check a l=
ot but i missed this one.=20=0D=0A=0D=0A=3F=0D=0ARepo Info : http://apt.v=
an-belle.nl/=3F=0D=0ABuildlogs : http://downloads.van-belle.nl/=0D=0A=3F=0D=
=0AChanges:=0D=0A=3Fsamba (2:4.10.6+nmu-1.1deb9~2) stretch; urgency=3Dmed=
ium=0D=0A=3F.=0D=0A=3F=3F * Non-maintainer upload.=0D=0A=3F=3F * Bugfix p=
ackage release=0D=0A=3F=3F * Fixed missed python3-tdb=0D=0A=3F=3F * Bump =
cmocka to 1.1.3=0D=0A=3F=3F * d/rules, setup builds for python3.=0D=0A=3F=
=3F * Added build depends: libaio-dev=3F libtasn1-6-dev libtasn1-bin=0D=0A=
=3F=3F=3F=3F=3F=3F=3F python3-crypto python3-gpg python3-iso8601 python3-=
pexpect=0D=0A=3F=3F=3F=3F Removed python2 version of the added above this=
 line.=0D=0A=3F=3F * Changes for python3=0D=0A=3F=3F=3F=3F=3F=3F=3F=3F Pa=
ckage samba: added recommends acl=0D=0A=3F=3F=3F=3F=3F=3F=3F=3F=3F added/=
Updates python3 Depends.=0D=0A=3F=3F=3F=3F=3F=3F=3F=3F=3F change ${python=
:Depends} to python3=0D=0A=3F=3F=3F=3F=3F=3F=3F=3F Package samba-common-b=
in:=0D=0A=3F=3F=3F=3F=3F=3F=3F=3F=3F added python and python3=0D=0A=3F=3F=
=3F=3F=3F=3F=3F=3F Package python-samba: changed to python3-samba=0D=0A=3F=
=3F=3F=3F=3F=3F=3F=3F=3F added/Updates python3- Depends.=0D=0A=3F=3F=3F=3F=
=3F=3F=3F=3F=3F change ${python:Depends} to python3=0D=0A=3F=3F=3F=3F=3F=3F=
=3F=3F Renamed d/python-samba.install and python-samba.lintian-overrides=0D=
=0A=3F=3F=3F=3F=3F=3F=3F=3F=3F to=3F d/python3-samba.install and python-s=
amba3.lintian-overrides=0D=0A=3F=3F=3F=3F - Package samba-dev: Bump libtd=
b-dev 1.3.18=0D=0A=3F=3F * d/samba-libs.lintian-overrides updated.=0D=0A=3F=
=3F * d/samba-dev.lintian-overrides updated.=0D=0A=0D=0A=3F=0D=0AGreetz,=20=
=0D=0A=3F=0D=0ALouis=0D=0A
