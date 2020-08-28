Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCED255A25
	for <lists+samba-technical@lfdr.de>; Fri, 28 Aug 2020 14:30:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=BcNRbFkf0wutI87XWzbRAWmCJzUMu3OW9UWoq57DS2s=; b=G8V4hPjQV7YPSEQugox/Wm2GH1
	Q4CAd5Xe7e0WkLU82z8uNHt70rgS0SSkBwyeBpe1FTTfVHZ01fSN/uncgxvWnj7mS8tYAuOvKgIKn
	jFaFprJLW+vQ8bIroCRkJ1tUy+RfB2M+yxoSi95ghNSBDk8Yh7YoGju2tkjYzYVRrEw9yAJMNhyri
	lI5e770DTwYilDM/Bjx7dMsq16uwi3tn4hfwpO/Zb0QrzPJU6wBh2/EUNhVQbAq2FhefJlCXyMfBx
	+YyOnuvpPD6H0aZzzV6hSwJ5NPZ6Xa3oRlXvwIA2yCBzcrBl4i+j5+MvOFMCFpAK4QUIaSCDWkAGy
	H84u8FcQ==;
Received: from localhost ([::1]:64578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBdW7-00190M-1W; Fri, 28 Aug 2020 12:30:03 +0000
Received: from a2-84.smtp-out.eu-west-1.amazonses.com ([54.240.2.84]:58888) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1kBdW1-00190F-MH
 for samba-technical@lists.samba.org; Fri, 28 Aug 2020 12:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gtiefq4aqa7w67wwqysvtccq4xrjnbj5; d=aaton.com; t=1598617794;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=K6srS+ifI5M1E55ao6rc1398QLAwS3T+gGIHqwMn5ZE=;
 b=Bwpaqq4uEIAWpPGbl8ljU1bhSd6rC9mkN57fpTnVAEzG19ndlWWPI4OGBoaMTp1Z
 0ZoRxNk/8Z/2uhZOWrI/pzVdDfqFwx2gPOkyPic9XDX0NJwp2xQ+4YZPq4pwveYWemH
 xCl8jpEF3EILKr16AFsxw6WdPWEE/r143Ceockvo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=shh3fegwg5fppqsuzphvschd53n6ihuv; d=amazonses.com; t=1598617794;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=K6srS+ifI5M1E55ao6rc1398QLAwS3T+gGIHqwMn5ZE=;
 b=y/z04NCtl08GPoKNJkQEq9gS6figFV5XAta/Ofx2nXDSI0HS+ZYLB8elQoFh0ncx
 JA0+FGGaS3sdxxPZr4MjtGqouwik75HFn4KlvFAgl4VNHvqAIPBD69msfkV82sxY7ef
 jtC4eIXSivarGd0Em7QM1FKfjkelo0qRgg6Scu+8=
Subject: Re: QNX6.6 cross-compilation problem
To: =?UTF-8?Q?samba-technical=40lists=2Esamba=2Eorg?=
 <samba-technical@lists.samba.org>
Date: Fri, 28 Aug 2020 12:29:53 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <010201743070df39-d4e000cf-0340-4aff-a07b-1febdd17e9f2-000000@eu-west-1.amazonses.com>
References: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com> 
 <51f6d175-d856-0d59-a19b-ee326066fae5@aaton.com> 
 <0102017053b6e994-c1f3f196-af94-47c2-914e-427291dbc480-000000@eu-west-1.amazonses.com>
 <0bfee16342064a00ce1b69edc9a1560f4f23e16e.camel@samba.org> 
 <1bce721f-c5d6-ab32-1e5a-167741775092@aaton.com> 
 <0102017058ba17bb-c855beaf-ff0f-4652-9716-c1c5c6995aa9-000000@eu-west-1.amazonses.com>
 <7dcdcb8bc691012aba2de432563586575de2d995.camel@samba.org> 
 <8c54e707-d0cd-7342-7133-045fb56f9b1a@aaton.com> 
 <010201705c80d555-ed94ec9c-da21-41d0-8ba2-6fcb9e59327b-000000@eu-west-1.amazonses.com>
 <0b796d7c-1523-9eb1-bd03-66f88e03178f@aaton.com> 
 <0102017430138f60-222b3721-39fa-40fd-b2e6-3ef4de5a942c-000000@eu-west-1.amazonses.com>
 <214f4f7e-104a-4739-61dd-573ed49f4c1e@aaton.com> 
 <0102017430180efb-657ca4b1-cf73-459b-a2fa-b728af5b2f79-000000@eu-west-1.amazonses.com>
 <017dcf2c-0945-963c-2480-1cd7f835f8ef@aaton.com> 
 <010201743070df39-d4e000cf-0340-4aff-a07b-1febdd17e9f2-000000@eu-west-1.amazonses.com>
 <b4f40371-9e32-1a4b-fd46-e31650f791dd@aaton.com>
X-Mailer: Amazon WorkMail
Thread-Index: =?us-ascii?Q?AQHV4xePtgTlttjWR2av2pbvb72egAAVIUorAKNXpGIAp1J?=
 =?us-ascii?Q?p9QDUSp1pANuccSIA+SuEQyZXUGqUJld8WTQmWt+tUCaH18MQ?=
Thread-Topic: QNX6.6 cross-compilation problem
X-Wm-Sent-Timestamp: 1598617793
Message-ID: <01020174350bb56d-792d89fa-d06a-4877-91f1-ca219fad2b2b-000000@eu-west-1.amazonses.com>
X-SES-Outgoing: 2020.08.28-54.240.2.84
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

Le 27/08/2020 =C3=A0 17:02, Nicolas Pinault via samba-technical a =C3=A9c=
rit=C2=A0:=0D=0A> I upgraded the samba sources to version 4.12.6 (I also =
applied asn1 patch).=0D=0A> I do not have the errors described in my 2 pr=
evious messages.=0D=0A>=0D=0A> It still do not compile but this is anothe=
r story.=0D=0AAfter fixing the problem introduced by upgrading samba sour=
ces, I'm back=20=0D=0Ato the original problem (without verbose option) :=0D=
=0A=0D=0A[ 721/3104] Compiling source4/heimdal/lib/asn1/der_length.c=0D=0A=
In file included from ../../source4/heimdal/lib/asn1/der_locl.h:53:0,=0D=0A=
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ../../source4/heimdal/lib/asn1/der_length.c=
:36:=0D=0Asource4/heimdal/lib/asn1/asn1_err.h:6:24: fatal error: et/com_e=
rr.h: No=20=0D=0Asuch file or directory=0D=0Acompilation terminated.=0D=0A=
=0D=0AWaf: Leaving directory `/home/nicolas/samba/samba-4.12.6/bin/defaul=
t'=0D=0ABuild failed=0D=0A =C2=A0-> task in 'HEIMDAL_HEIM_ASN1' failed wi=
th exit status 1 (run with -v=20=0D=0Ato display more information)=0D=0A=0D=
=0AAny pointer =3F=0D=0A=0D=0ANicolas=0D=0A=0D=0A>=0D=0A>=0D=0A> Le 27/08=
/2020 =C3=A0 15:25, Nicolas Pinault via samba-technical a =C3=A9crit=C2=A0=
:=0D=0A>> Le 27/08/2020 =C3=A0 15:20, Nicolas Pinault via samba-technical=
 a =C3=A9crit=C2=A0:=0D=0A>>> Hi,=0D=0A>>> Le 19/02/2020 =C3=A0 09:11, Ni=
colas Pinault via samba-technical a =C3=A9crit=C2=A0:=0D=0A>>>> Andrew,=0D=
=0A>>>>> It looks like I have to cross-compile gnutls for my system. Righ=
t =3F=0D=0A>>>>> Yes, GnuTLS is a requirement now:=0D=0A>>>> Another grea=
t challenge ;)=0D=0A>>> I've finally compiled gnuTLS successfully.=0D=0A>=
>>=0D=0A>>> I now have the following error :=0D=0A>>>=0D=0A>>> [ 564/3026=
] Compiling bin/default/source4/heimdal/lib/asn1/asn1_err.c=0D=0A>>> 15:1=
3:30 runner ['ntoarmv7-gcc', '-D_SAMBA_BUILD_=3D4',=0D=0A>>> '-DHAVE_CONF=
IG_H=3D1', '-I/home/nicolas/qnx660/target/qnx6/usr/include',=0D=0A>>> '-M=
MD', '-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1',=0D=0A>>> '-DHAV=
E_CONFIG_H=3D1', '-Wno-format-truncation', '-fPIC',=0D=0A>>> '-D__STDC_WA=
NT_LIB_EXT1__=3D1', '-D_REENTRANT',=0D=0A>>> '-fstack-protector-strong', =
'-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES=3DNULL',=0D=0A>>> '-DSTATIC_HEIMDAL_H=
EIM_ASN1_MODULES_PROTO=3Dextern void=0D=0A>>> __HEIMDAL_HEIM_ASN1_dummy_m=
odule_proto(void)',=0D=0A>>> '-Isource4/heimdal_build', '-I../../source4/=
heimdal_build',=0D=0A>>> '-Isource4/heimdal/lib/asn1', '-I../../source4/h=
eimdal/lib/asn1',=0D=0A>>> '-Iinclude/public', '-I../../include/public', =
'-Isource4',=0D=0A>>> '-I../../source4', '-Ilib', '-I../../lib', '-Isourc=
e4/lib',=0D=0A>>> '-I../../source4/lib', '-Isource4/include', '-I../../so=
urce4/include',=0D=0A>>> '-Iinclude', '-I../../include', '-Ilib/replace',=
 '-I../../lib/replace',=0D=0A>>> '-I.', '-I../..', '-Isource4/heimdal/lib=
/roken',=0D=0A>>> '-I../../source4/heimdal/lib/roken', '-Isource4/heimdal=
/include',=0D=0A>>> '-I../../source4/heimdal/include', '-Isource4/heimdal=
/lib/com_err',=0D=0A>>> '-I../../source4/heimdal/lib/com_err',=0D=0A>>> '=
source4/heimdal/lib/asn1/asn1_err.c', '-c',=0D=0A>>> '-o/home/nicolas/sam=
ba/samba-4.11.6/bin/default/source4/heimdal/lib/asn1/asn1_err.c.60.o']=0D=
=0A>>> source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclare=
d as=0D=0A>>> different kind of symbol=0D=0A>>> In file included from ../=
=2E./lib/replace/../replace/replace.h:172:0,=0D=0A>>>     =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 from ../../source4/heimdal_build/config.h:10,=0D=0A>>>     =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 from source4/heimdal/lib/asn1/asn1_err.c:1:=0D=0A>>> /home/n=
icolas/qnx660/target/qnx6/usr/include/unistd.h:426:12: note:=0D=0A>>> pre=
vious declaration of 'link' was here=0D=0A>>> cc1: warning: unrecognized =
command line option "-Wno-format-truncation"=0D=0A>>> [enabled by default=
]=0D=0A>>>=0D=0A>>> Waf: Leaving directory `/home/nicolas/samba/samba-4.1=
1.6/bin/default'=0D=0A>>> Build failed=0D=0A>>>     =C2=A0-> task in 'HEI=
MDAL_HEIM_ASN1' failed with exit status 1:=0D=0A>>>     =C2=A0=C2=A0=C2=A0=
 {task 3062501532: c asn1_err.c -> asn1_err.c.60.o}=0D=0A>>> ['ntoarmv7-g=
cc', '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1',=0D=0A>>> '-I/home/nico=
las/qnx660/target/qnx6/usr/include', '-MMD',=0D=0A>>> '-D_GNU_SOURCE=3D1'=
, '-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CONFIG_H=3D1',=0D=0A>>> '-Wno-f=
ormat-truncation', '-fPIC', '-D__STDC_WANT_LIB_EXT1__=3D1',=0D=0A>>> '-D_=
REENTRANT', '-fstack-protector-strong',=0D=0A>>> '-DSTATIC_HEIMDAL_HEIM_A=
SN1_MODULES=3DNULL',=0D=0A>>> '-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES_PROTO=3D=
extern void=0D=0A>>> __HEIMDAL_HEIM_ASN1_dummy_module_proto(void)',=0D=0A=
>>> '-Isource4/heimdal_build', '-I../../source4/heimdal_build',=0D=0A>>> =
'-Isource4/heimdal/lib/asn1', '-I../../source4/heimdal/lib/asn1',=0D=0A>>=
> '-Iinclude/public', '-I../../include/public', '-Isource4',=0D=0A>>> '-I=
=2E./../source4', '-Ilib', '-I../../lib', '-Isource4/lib',=0D=0A>>> '-I..=
/../source4/lib', '-Isource4/include', '-I../../source4/include',=0D=0A>>=
> '-Iinclude', '-I../../include', '-Ilib/replace', '-I../../lib/replace',=
=0D=0A>>> '-I.', '-I../..', '-Isource4/heimdal/lib/roken',=0D=0A>>> '-I..=
/../source4/heimdal/lib/roken', '-Isource4/heimdal/include',=0D=0A>>> '-I=
=2E./../source4/heimdal/include', '-Isource4/heimdal/lib/com_err',=0D=0A>=
>> '-I../../source4/heimdal/lib/com_err',=0D=0A>>> 'source4/heimdal/lib/a=
sn1/asn1_err.c', '-c',=0D=0A>>> '-o/home/nicolas/samba/samba-4.11.6/bin/d=
efault/source4/heimdal/lib/asn1/asn1_err.c.60.o']=0D=0A>>>=0D=0A>>> The c=
onfiguration command is the following :=0D=0A>>> waf configure --cross-co=
mpile --cross-execute=3D'python3.6=0D=0A>>> execute_on_cantar.py' --jobs=3D=
1 --prefix=3D$HOME/samba/build=0D=0A>>> --exec-prefix=3D$HOME/samba/bin -=
-disable-python --without-ad-dc=0D=0A>>> --python=3D/usr/bin/python3.6 --=
without-pie --disable-cups=0D=0A>>> --disable-iprint --with-configdir=3D/=
etc/samba=0D=0A>>> --with-logfilebase=3D/tmp/samba --with-lockdir=3D/tmp/=
samba=0D=0A>>> --with-piddir=3D/tmp/samba --with-privatedir=3D/etc/samba/=
private=0D=0A>>> --without-libarchive --localstatedir=3D/var --without-ge=
ttext=0D=0A>>> --without-ldb-lmdb --without-systemd --without-lttng=0D=0A=
>>> --without-ntvfs-fileserver --without-json --without-relro=0D=0A>>> --=
disable-tdb-mutex-locking --without-ldap --without-ads --without-pam=0D=0A=
>>> --disable-rpath --with-static-modules=3DALL=0D=0A>>> --bundled-librar=
ies=3D'!asn1_compile,!compile_et'=0D=0A>> Sometimes, relaunching the buil=
d process, I get another error :=0D=0A>>=0D=0A>> [ 564/3026] Compiling so=
urce4/heimdal/lib/asn1/der_length.c=0D=0A>> 15:23:58 runner ['ntoarmv7-gc=
c', '-D_SAMBA_BUILD_=3D4',=0D=0A>> '-DHAVE_CONFIG_H=3D1', '-I/home/nicola=
s/qnx660/target/qnx6/usr/include',=0D=0A>> '-MMD', '-D_GNU_SOURCE=3D1', '=
-D_XOPEN_SOURCE_EXTENDED=3D1',=0D=0A>> '-DHAVE_CONFIG_H=3D1', '-Wno-forma=
t-truncation', '-fPIC',=0D=0A>> '-D__STDC_WANT_LIB_EXT1__=3D1', '-D_REENT=
RANT',=0D=0A>> '-fstack-protector-strong', '-DSTATIC_HEIMDAL_HEIM_ASN1_MO=
DULES=3DNULL',=0D=0A>> '-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES_PROTO=3Dextern=
 void=0D=0A>> __HEIMDAL_HEIM_ASN1_dummy_module_proto(void)',=0D=0A>> '-Is=
ource4/heimdal_build', '-I../../source4/heimdal_build',=0D=0A>> '-Isource=
4/heimdal/lib/asn1', '-I../../source4/heimdal/lib/asn1',=0D=0A>> '-Iinclu=
de/public', '-I../../include/public', '-Isource4',=0D=0A>> '-I../../sourc=
e4', '-Ilib', '-I../../lib', '-Isource4/lib',=0D=0A>> '-I../../source4/li=
b', '-Isource4/include', '-I../../source4/include',=0D=0A>> '-Iinclude', =
'-I../../include', '-Ilib/replace', '-I../../lib/replace',=0D=0A>> '-I.',=
 '-I../..', '-Isource4/heimdal/lib/roken',=0D=0A>> '-I../../source4/heimd=
al/lib/roken', '-Isource4/heimdal/include',=0D=0A>> '-I../../source4/heim=
dal/include', '-Isource4/heimdal/lib/com_err',=0D=0A>> '-I../../source4/h=
eimdal/lib/com_err',=0D=0A>> '../../source4/heimdal/lib/asn1/der_length.c=
', '-c',=0D=0A>> '-o/home/nicolas/samba/samba-4.11.6/bin/default/source4/=
heimdal/lib/asn1/der_length.c.60.o']=0D=0A>> In file included from ../../=
source4/heimdal/lib/asn1/der_locl.h:53:0,=0D=0A>>    =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 from ../../source4/heimdal/lib/asn1/der_length.c:36:=0D=0A>> source4/hei=
mdal/lib/asn1/asn1_err.h:6:24: fatal error: et/com_err.h: No=0D=0A>> such=
 file or directory=0D=0A>> compilation terminated.=0D=0A>>=0D=0A>> Waf: L=
eaving directory `/home/nicolas/samba/samba-4.11.6/bin/default'=0D=0A>> B=
uild failed=0D=0A>>    =C2=A0-> task in 'HEIMDAL_HEIM_ASN1' failed with e=
xit status 1:=0D=0A>>    =C2=A0=C2=A0=C2=A0 {task 3068432084: c der_lengt=
h.c -> der_length.c.60.o}=0D=0A>> ['ntoarmv7-gcc', '-D_SAMBA_BUILD_=3D4',=
 '-DHAVE_CONFIG_H=3D1',=0D=0A>> '-I/home/nicolas/qnx660/target/qnx6/usr/i=
nclude', '-MMD',=0D=0A>> '-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D=
1', '-DHAVE_CONFIG_H=3D1',=0D=0A>> '-Wno-format-truncation', '-fPIC', '-D=
__STDC_WANT_LIB_EXT1__=3D1',=0D=0A>> '-D_REENTRANT', '-fstack-protector-s=
trong',=0D=0A>> '-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES=3DNULL',=0D=0A>> '-DS=
TATIC_HEIMDAL_HEIM_ASN1_MODULES_PROTO=3Dextern void=0D=0A>> __HEIMDAL_HEI=
M_ASN1_dummy_module_proto(void)',=0D=0A>> '-Isource4/heimdal_build', '-I.=
=2E/../source4/heimdal_build',=0D=0A>> '-Isource4/heimdal/lib/asn1', '-I.=
=2E/../source4/heimdal/lib/asn1',=0D=0A>> '-Iinclude/public', '-I../../in=
clude/public', '-Isource4',=0D=0A>> '-I../../source4', '-Ilib', '-I../../=
lib', '-Isource4/lib',=0D=0A>> '-I../../source4/lib', '-Isource4/include'=
, '-I../../source4/include',=0D=0A>> '-Iinclude', '-I../../include', '-Il=
ib/replace', '-I../../lib/replace',=0D=0A>> '-I.', '-I../..', '-Isource4/=
heimdal/lib/roken',=0D=0A>> '-I../../source4/heimdal/lib/roken', '-Isourc=
e4/heimdal/include',=0D=0A>> '-I../../source4/heimdal/include', '-Isource=
4/heimdal/lib/com_err',=0D=0A>> '-I../../source4/heimdal/lib/com_err',=0D=
=0A>> '../../source4/heimdal/lib/asn1/der_length.c', '-c',=0D=0A>> '-o/ho=
me/nicolas/samba/samba-4.11.6/bin/default/source4/heimdal/lib/asn1/der_le=
ngth.c.60.o']=0D=0A>>=0D=0A>>=0D=0A>>> I have not found any answer search=
ing the net.=0D=0A>>> Any pointer to solve this problem =3F=0D=0A>>>=0D=0A=
>>> Nicolas=0D=0A>>>=0D=0A>>>>> https://wiki.samba.org/index.php/Package_=
Dependencies_Required_to_Build_Samba#Mandatory=0D=0A>>>> Which ones are r=
equested on host and which one are requested on target=0D=0A>>>> when cro=
ss-compiling =3F=0D=0A>>>>=0D=0A>>>> Nicolas=0D=0A>>>>=0D=0A>>>>=0D=0A>>=0D=
=0A>=0D=0A>=0D=0A=0D=0A

