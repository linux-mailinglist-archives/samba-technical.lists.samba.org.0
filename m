Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A98AB2545CF
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 15:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hthJy1FiELj5jdNWq3f4vEdWeWcQkronSN412w3OKHI=; b=vdeoPsTm+v5nxFt5BrvbLvVaAL
	mUaS4W9u52UBbkjN2fIFdkeOPqXenFkzNru9kU79BEIl5fj4ZLhuQlJDcX9YSDOJMGLe+1RbUwxU9
	zw6WO4nBz/2tfG6ssPmR87dLWYNit/962OME/cBF/BBUBkxS8g9ddbYyKARpamKxxVeXZowIIq6vX
	mN7suPmELHhKPljd7LtaFFyDul/My28LKdAcfPSR56/4aDseGOAzxXjbWUr96nlI+kYEWRMxCrpIo
	8jFzYfytJ/m6hD9GFEJ01N75qpSZVIufZ9ZRL7t1OBFD0flWwJ0VjQ4tGr4NUjQCOUwHxP9tAeG1T
	dVrBwPuA==;
Received: from localhost ([::1]:36698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBHpQ-000vh4-F5; Thu, 27 Aug 2020 13:20:32 +0000
Received: from a2-9.smtp-out.eu-west-1.amazonses.com ([54.240.2.9]:47110) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1kBHpK-000vgx-6V
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 13:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gtiefq4aqa7w67wwqysvtccq4xrjnbj5; d=aaton.com; t=1598534422;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=hthJy1FiELj5jdNWq3f4vEdWeWcQkronSN412w3OKHI=;
 b=bHX6faj9bTJw3jjRmOInFCarmCX+HYjKq6qZIpf1Rey0Ztmra3rKQot26x9AKk3U
 2tv5XoVPEy+mUTEE/C0uJFDthbSGK6pBE3DETiolV0a71s5VEad2K2tdudBEeAHZEXb
 zm25wj4PnqxkUpYaou4y/r1leBhK92NiWxESUImw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=shh3fegwg5fppqsuzphvschd53n6ihuv; d=amazonses.com; t=1598534422;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=hthJy1FiELj5jdNWq3f4vEdWeWcQkronSN412w3OKHI=;
 b=dT3J+3Tyd7BH6ycncQ2Ad3UmW65kfdJejfVNmxlFF/l7WkrEVSjlg1gfjLB0ccb3
 8cttEprRPSeBgaANkt1R3rON547Z9THy0GIJuuxhZ4e+fpXa2d5wKWd5PyzqbMxRYj2
 xjIw/UYkfbhESzBmQWWPj3Q99qAyKTkkVCDUAUJI=
Subject: Re: QNX6.6 cross-compilation problem
To: =?UTF-8?Q?samba-technical=40lists=2Esamba=2Eorg?=
 <samba-technical@lists.samba.org>
Date: Thu, 27 Aug 2020 13:20:22 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <010201705c80d555-ed94ec9c-da21-41d0-8ba2-6fcb9e59327b-000000@eu-west-1.amazonses.com>
References: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com> 
 <116a320e-62d5-b51e-0b0d-7c0709237d0c@samba.org> 
 <51f6d175-d856-0d59-a19b-ee326066fae5@aaton.com> 
 <0102017053b6e994-c1f3f196-af94-47c2-914e-427291dbc480-000000@eu-west-1.amazonses.com>
 <0bfee16342064a00ce1b69edc9a1560f4f23e16e.camel@samba.org> 
 <1bce721f-c5d6-ab32-1e5a-167741775092@aaton.com> 
 <0102017058ba17bb-c855beaf-ff0f-4652-9716-c1c5c6995aa9-000000@eu-west-1.amazonses.com>
 <7dcdcb8bc691012aba2de432563586575de2d995.camel@samba.org> 
 <8c54e707-d0cd-7342-7133-045fb56f9b1a@aaton.com> 
 <010201705c80d555-ed94ec9c-da21-41d0-8ba2-6fcb9e59327b-000000@eu-west-1.amazonses.com>
 <0b796d7c-1523-9eb1-bd03-66f88e03178f@aaton.com>
X-Mailer: Amazon WorkMail
Thread-Index: =?us-ascii?Q?AQHV4xePtgTlttjWR2av2pbvb72egAAVIUorAKNXpGIAp1J?=
 =?us-ascii?Q?p9QDUSp1pANuccSIA+SuEQyZXUGqU?=
Thread-Topic: QNX6.6 cross-compilation problem
X-Wm-Sent-Timestamp: 1598534421
Message-ID: <0102017430138f60-222b3721-39fa-40fd-b2e6-3ef4de5a942c-000000@eu-west-1.amazonses.com>
X-SES-Outgoing: 2020.08.27-54.240.2.9
Feedback-ID: 1.eu-west-1.b24dn6frgCi6dh20skzbuMRr7UL8M6Soir/3ogtEjHQ=:AmazonSES
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
From: Nicolas Pinault via samba-technical <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Nicolas_Pinault?= <nicolasp@aaton.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,=0D=0ALe 19/02/2020 =C3=A0 09:11, Nicolas Pinault via samba-technical =
a =C3=A9crit=C2=A0:=0D=0A> Andrew,=0D=0A>> It looks like I have to cross-=
compile gnutls for my system. Right =3F=0D=0A>> Yes, GnuTLS is a requirem=
ent now:=0D=0A> Another great challenge ;)=0D=0A=0D=0AI've finally compil=
ed gnuTLS successfully.=0D=0A=0D=0AI now have the following error :=0D=0A=
=0D=0A[ 564/3026] Compiling bin/default/source4/heimdal/lib/asn1/asn1_err=
=2Ec=0D=0A15:13:30 runner ['ntoarmv7-gcc', '-D_SAMBA_BUILD_=3D4',=20=0D=0A=
'-DHAVE_CONFIG_H=3D1', '-I/home/nicolas/qnx660/target/qnx6/usr/include',=20=
=0D=0A'-MMD', '-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1',=20=0D=0A=
'-DHAVE_CONFIG_H=3D1', '-Wno-format-truncation', '-fPIC',=20=0D=0A'-D__ST=
DC_WANT_LIB_EXT1__=3D1', '-D_REENTRANT',=20=0D=0A'-fstack-protector-stron=
g', '-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES=3DNULL',=20=0D=0A'-DSTATIC_HEIMDA=
L_HEIM_ASN1_MODULES_PROTO=3Dextern void=20=0D=0A__HEIMDAL_HEIM_ASN1_dummy=
_module_proto(void)',=20=0D=0A'-Isource4/heimdal_build', '-I../../source4=
/heimdal_build',=20=0D=0A'-Isource4/heimdal/lib/asn1', '-I../../source4/h=
eimdal/lib/asn1',=20=0D=0A'-Iinclude/public', '-I../../include/public', '=
-Isource4',=20=0D=0A'-I../../source4', '-Ilib', '-I../../lib', '-Isource4=
/lib',=20=0D=0A'-I../../source4/lib', '-Isource4/include', '-I../../sourc=
e4/include',=20=0D=0A'-Iinclude', '-I../../include', '-Ilib/replace', '-I=
=2E./../lib/replace',=20=0D=0A'-I.', '-I../..', '-Isource4/heimdal/lib/ro=
ken',=20=0D=0A'-I../../source4/heimdal/lib/roken', '-Isource4/heimdal/inc=
lude',=20=0D=0A'-I../../source4/heimdal/include', '-Isource4/heimdal/lib/=
com_err',=20=0D=0A'-I../../source4/heimdal/lib/com_err',=20=0D=0A'source4=
/heimdal/lib/asn1/asn1_err.c', '-c',=20=0D=0A'-o/home/nicolas/samba/samba=
-4.11.6/bin/default/source4/heimdal/lib/asn1/asn1_err.c.60.o']=0D=0Asourc=
e4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclared as=20=0D=0A=
different kind of symbol=0D=0AIn file included from ../../lib/replace/../=
replace/replace.h:172:0,=0D=0A =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../../source4=
/heimdal_build/config.h:10,=0D=0A =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from source4/he=
imdal/lib/asn1/asn1_err.c:1:=0D=0A/home/nicolas/qnx660/target/qnx6/usr/in=
clude/unistd.h:426:12: note:=20=0D=0Aprevious declaration of 'link' was h=
ere=0D=0Acc1: warning: unrecognized command line option "-Wno-format-trun=
cation"=20=0D=0A[enabled by default]=0D=0A=0D=0AWaf: Leaving directory `/=
home/nicolas/samba/samba-4.11.6/bin/default'=0D=0ABuild failed=0D=0A =C2=A0=
-> task in 'HEIMDAL_HEIM_ASN1' failed with exit status 1:=0D=0A =C2=A0=C2=
=A0=C2=A0 {task 3062501532: c asn1_err.c -> asn1_err.c.60.o}=0D=0A['ntoar=
mv7-gcc', '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1',=20=0D=0A'-I/home/=
nicolas/qnx660/target/qnx6/usr/include', '-MMD',=20=0D=0A'-D_GNU_SOURCE=3D=
1', '-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CONFIG_H=3D1',=20=0D=0A'-Wno-=
format-truncation', '-fPIC', '-D__STDC_WANT_LIB_EXT1__=3D1',=20=0D=0A'-D_=
REENTRANT', '-fstack-protector-strong',=20=0D=0A'-DSTATIC_HEIMDAL_HEIM_AS=
N1_MODULES=3DNULL',=20=0D=0A'-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES_PROTO=3De=
xtern void=20=0D=0A__HEIMDAL_HEIM_ASN1_dummy_module_proto(void)',=20=0D=0A=
'-Isource4/heimdal_build', '-I../../source4/heimdal_build',=20=0D=0A'-Iso=
urce4/heimdal/lib/asn1', '-I../../source4/heimdal/lib/asn1',=20=0D=0A'-Ii=
nclude/public', '-I../../include/public', '-Isource4',=20=0D=0A'-I../../s=
ource4', '-Ilib', '-I../../lib', '-Isource4/lib',=20=0D=0A'-I../../source=
4/lib', '-Isource4/include', '-I../../source4/include',=20=0D=0A'-Iinclud=
e', '-I../../include', '-Ilib/replace', '-I../../lib/replace',=20=0D=0A'-=
I.', '-I../..', '-Isource4/heimdal/lib/roken',=20=0D=0A'-I../../source4/h=
eimdal/lib/roken', '-Isource4/heimdal/include',=20=0D=0A'-I../../source4/=
heimdal/include', '-Isource4/heimdal/lib/com_err',=20=0D=0A'-I../../sourc=
e4/heimdal/lib/com_err',=20=0D=0A'source4/heimdal/lib/asn1/asn1_err.c', '=
-c',=20=0D=0A'-o/home/nicolas/samba/samba-4.11.6/bin/default/source4/heim=
dal/lib/asn1/asn1_err.c.60.o']=0D=0A=0D=0AThe configuration command is th=
e following :=0D=0Awaf configure --cross-compile --cross-execute=3D'pytho=
n3.6=20=0D=0Aexecute_on_cantar.py' --jobs=3D1 --prefix=3D$HOME/samba/buil=
d=20=0D=0A--exec-prefix=3D$HOME/samba/bin --disable-python --without-ad-d=
c=20=0D=0A--python=3D/usr/bin/python3.6 --without-pie --disable-cups=20=0D=
=0A--disable-iprint --with-configdir=3D/etc/samba=20=0D=0A--with-logfileb=
ase=3D/tmp/samba --with-lockdir=3D/tmp/samba=20=0D=0A--with-piddir=3D/tmp=
/samba --with-privatedir=3D/etc/samba/private=20=0D=0A--without-libarchiv=
e --localstatedir=3D/var --without-gettext=20=0D=0A--without-ldb-lmdb --w=
ithout-systemd --without-lttng=20=0D=0A--without-ntvfs-fileserver --witho=
ut-json --without-relro=20=0D=0A--disable-tdb-mutex-locking --without-lda=
p --without-ads --without-pam=20=0D=0A--disable-rpath --with-static-modul=
es=3DALL=20=0D=0A--bundled-libraries=3D'!asn1_compile,!compile_et'=0D=0A=0D=
=0AI have not found any answer searching the net.=0D=0AAny pointer to sol=
ve this problem =3F=0D=0A=0D=0ANicolas=0D=0A=0D=0A>> https://wiki.samba.o=
rg/index.php/Package_Dependencies_Required_to_Build_Samba#Mandatory=0D=0A=
> Which ones are requested on host and which one are requested on target=0D=
=0A> when cross-compiling =3F=0D=0A>=0D=0A> Nicolas=0D=0A>=0D=0A>=0D=0A=0D=
=0A

