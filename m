Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04857369496
	for <lists+samba-technical@lfdr.de>; Fri, 23 Apr 2021 16:26:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=y4cr3zaid9h2CNDOeoRoFntETaVSuWSbJTW8rLFejzA=; b=6UJs7rSjVDqjzG14M/USNKw4Zm
	bqkzxg69xM4jIi+ag3wUk2DlV+tThqlzf4jOZC3f2Qj2PO4Z59RxTL4K86Cvsw8kaJ+ucW1Nvf4uX
	S1UC+lEjSjBuYivHU+0/6uQWccTv8LAEvfQzq9v750vkcYC/bd+x/6fuCmrKGzemvZ3IHeiGd1aAK
	byeTJO1T1M/uzjzHCo73nCKf+YktbxFDh6da5dJjyBghI+h/oTHkNzhntMwKYuOT9QswknbgBF9bw
	s11Nnx/Vt0Sf1G1pIDqgnm+WUfagKDNUVyxF1HtlZv6ZaI13c3FTTD9lcgYyl7f+jfZAWDG4/UQul
	DRBvkmsA==;
Received: from ip6-localhost ([::1]:58344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lZwk5-00CEK2-IC; Fri, 23 Apr 2021 14:25:13 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:44448) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lZwjv-00CEJn-2E
 for samba-technical@lists.samba.org; Fri, 23 Apr 2021 14:25:11 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1619792676.86284@juWqavwTO9yhE2M4HOSkKQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 3D8DA11F361.AA22B
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 3D8DA11F361;
 Fri, 23 Apr 2021 16:24:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1619187876;
 bh=1tkH48zrh4tQ7ogymi5JC8Gn585ZT7/W4T9q6By092c=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=mgzkxohnKlxEiMVkUvs1w4n6cWM1aO0XxG1ML6mmgtFtvHrHV61oW4aIWxaEfwsXQ
 GcGOSX67fN/7DtWklK4c2Q+/opVKWh8P2qsvv78EsVokXCdKaoOa1Iix8dgZY9DdNl
 tZSEUDxrnyWyuW+Of3gl6R+7NuzrBkps7tQC8OFvtHGJ+UMRVoT4wlpyC4VbDXIv3/
 O1Aj2hOx++A4LyR9I+oILtwN1if5++5Vt7WRdVrIcl/qLG90zc7Xkus8cOLKcodUnr
 NNDhDGSiiYQCeUdiBP6JRhjZ+mmBifBaWLb7JbrmcbK3Mz3hXhThLdEx0B3wb+WruW
 3RmcogGM8OkyQ==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 5799218C247A;
 Fri, 23 Apr 2021 16:24:40 +0200 (CEST)
Subject: RE: ctdb/utils/etcd/ctdb_etcd_lock python => python3
To: =?windows-1252?Q?Surender_Ameelpur?= <Surender.Ameelpur@ibm.com>
Date: Fri, 23 Apr 2021 16:24:40 +0200
Mime-Version: 1.0
In-Reply-To: <OF696AADD9.DD1E4B8D-ON002586C0.004C813E-002586C0.004CA7F0@notes.na.collabserv.com>
References: <vmime.6082be4c.4114.8306c142307950c@ms249-lin-003.rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: Adc4TGUI8XDacytzQc2nXkW0Zek4HA==
Message-Id: <vmime.6082d8a8.3ecc.25a9fc983b065f28@ms249-lin-003.rotterdam.bazuin.nl>
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
Cc: "=?windows-1252?Q?samba-technical=40lists.samba.org?="
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Surender,=20=0D=0A=0D=0AThanks for the reply.=20=0D=0A=0D=0Ai've chec=
ked the Build-Depends that already contains python3 (and some others).=A0=
=0D=0AI now also noticed that my last debian and build worked out. ( just=
 finished 1 min ago )=0D=0A=0D=0AArchitecture: any=0D=0AMulti-Arch: forei=
gn=0D=0ADepends: iproute2 [linux-any],=0D=0A=A0=A0=A0=A0=A0=A0=A0=A0 lsb-=
base (>=3D 3.0-6),=0D=0A=A0=A0=A0=A0=A0=A0=A0=A0 psmisc,=0D=0A=A0=A0=A0=A0=
=A0=A0=A0=A0 samba-libs (=3D ${binary:Version}),=0D=0A=A0=A0=A0=A0=A0=A0=A0=
=A0 sudo,=0D=0A=A0=A0=A0=A0=A0=A0=A0=A0 tdb-tools,=0D=0A=A0=A0=A0=A0=A0=A0=
=A0=A0 time,=0D=0A=A0=A0=A0=A0=A0=A0=A0=A0 ${misc:Depends},=0D=0A=A0=A0=A0=
=A0=A0=A0=A0=A0 ${python3:Depends},=A0=A0=A0=A0=A0=A0=A0=A0<< the one i a=
dded as last.=20=0D=0A=A0=A0=A0=A0=A0=A0=A0=A0 ${shlibs:Depends}=0D=0ARec=
ommends: ethtool [linux-any], python3-etcd, ${rados:Recommends}=0D=0ASugg=
ests: logrotate, lsof=0D=0A=0D=0ASo.. that was a search for me to get all=
 right.=20=0D=0A=0D=0AThanks for the replies guys.=20=0D=0A=0D=0AHave a g=
reat weekend, stay safe but go out, go bird watching something.. ;-)=20=0D=
=0Afresh air.=20=0D=0A=0D=0AGreetz,=20=0D=0A=0D=0ALouis=0D=0A=0D=0AVan: S=
urender Ameelpur [mailto:Surender.Ameelpur@ibm.com]=20=0D=0AVerzonden: vr=
ijdag 23 april 2021 15:57=0D=0AAan: L.P.H. van Belle=0D=0ACC: samba-techn=
ical@lists.samba.org=0D=0AOnderwerp: RE: ctdb/utils/etcd/ctdb_etcd_lock p=
ython =3D> python3=0D=0A=0D=0A=0D=0A=0D=0AHi,=0D=0A=0D=0A=0D=0Acan you tr=
y updating the Build-Depends field with=A0python3-minimal in the debian/c=
ontrol file.=0D=0A=0D=0A=0D=0AI had come across not exactly the same buil=
d error but similar build issue, for SMB 4.14 on Rhel8.3.=0D=0A=0D=0A=0D=0A=
Thank you,=0D=0ASurender. A=0D=0A=0D=0A=0D=0A-----"samba-technical" <samb=
a-technical-bounces@lists.samba.org> wrote: ----- To: "samba-technical@li=
sts.samba.org" <samba-technical@lists.samba.org>=0D=0AFrom: "L.P.H. van B=
elle via samba-technical"=20=0D=0ASent by: "samba-technical"=20=0D=0ADate=
: 04/23/2021 06:03PM=0D=0ASubject: [EXTERNAL] RE: ctdb/utils/etcd/ctdb_et=
cd_lock python =3D> python3=0D=0A=0D=0A=0D=0AHai Martin,=20=0D=0A=0D=0A=0D=
=0A> How exactly does the build fail=3F=0D=0AWell, i use cowbuild/pbuilde=
r in Debian 10 and in the end lintian checks the packages and errors with=
=2E=0D=0A=0D=0AE: ctdb: python-script-but-no-python-dep usr/lib/x86_64-li=
nux-gnu/ctdb/ctdb_etcd_lock #!python3=20=0D=0AEven after i added in debia=
n/control=0D=0A${python3:Depends} for CTDB package=0D=0A=0D=0A=0D=0A>=20=0D=
=0A> > I dont know if its really needed but all python references are use=
d=0D=0A> > with /usr/bin/env python3.=20=0D=0A> >=20=0D=0A> > Just to bes=
ure im not breaking something in ctdb here.=20=0D=0A> > Can someone confi=
rm this=3F=20=0D=0A> >=20=0D=0A> > My fix.=0D=0A> >=20=0D=0A> > --- a/ctd=
b/utils/etcd/ctdb_etcd_lock=0D=0A> > +++ b/ctdb/utils/etcd/ctdb_etcd_lock=
=0D=0A> > @@ -1,4 +1,4 @@=0D=0A> > -#!/usr/bin/python=0D=0A> > +#!/usr/bi=
n/env python3=0D=0A>=20=0D=0A> I'd like to be able to give a better answe=
r but I'm not entirely sure=0D=0A> that the script works with python3 wit=
hout any other changes.=20=0D=0A> =A0It looks=0D=0A> like it should but I=
 don't have a trivial way of testing it=20=0D=0A> (or time to setup a tes=
t environment).=0D=0A>=20=0D=0A> Given that /usr/bin/python isn't support=
ed anymore, we might as well=0D=0A> change it as above see what bug repor=
ts get generated.=0D=0A>=20=0D=0A> If you're keen to improve the script t=
hen you could try to clean it up=0D=0A> and get rid of warnings from pyli=
nt and flake8. =A0getting rid of the=0D=0A> obvious whitespace issues mig=
ht make any python3 issues more obvious.=0D=0A> Perhaps yapf3 would be us=
eful=3F=0D=0A=0D=0AI really wished i had these skills todo that, i would =
then..=20=0D=0A:-(=20=0D=0A=0D=0A>=20=0D=0A> peace & happiness,=0D=0A> ma=
rtin=0D=0A>=20=0D=0A=0D=0AThanks for the reply so far.=20=0D=0A=0D=0AGree=
tz,=20=0D=0A=0D=0ALouis=0D=0A=0D=0A=0D=0A=0D=0A=0D=0A=0D=0A=0D=0A
