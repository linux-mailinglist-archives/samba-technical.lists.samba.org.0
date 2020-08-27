Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA87254844
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 17:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=G/P2SRZGtgC8jaCoPdAbWifZA7qCIV4hyT86j4NbnJM=; b=t9fyzLWHgVBEZRqmrH0KdDAdQY
	7qh7MzuFlCoJUoCgf4Y27lFwBsefZHrcPXx3w1EzVkDX0mMgfTZSeWq//ZT/DCICvmJjcSL1sKfWC
	wvZJDsqUqlIgKdJTe9/7LYmpzBXZ2lqBM5aeey9A5ShBTz2jlEHQFDkkNfTqUKE3F6bnAaLBom+TQ
	WU9GLbi8SB/GZVpSXGZiCi8JfxS2txM3AaFwAKnCE0y6R6eqktII8DILnmS1RFxnVb23NuWZ5RuxB
	SohEi1nJI3LivcMLEEQCHJ0lYMDbAo0Q7B7SfOu/JKX/TYFejpjybX4AgL0aSvPIP7ODgl6ohCqeS
	dtYvTW3g==;
Received: from localhost ([::1]:53582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBJQ1-000yJG-Tn; Thu, 27 Aug 2020 15:02:25 +0000
Received: from a2-29.smtp-out.eu-west-1.amazonses.com ([54.240.2.29]:52414) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1kBJPx-000yJ4-Da
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 15:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gtiefq4aqa7w67wwqysvtccq4xrjnbj5; d=aaton.com; t=1598540537;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=qzcujXAxyWguza+cpQFOZ2NzlHXYWyOMb09mx4G4ztk=;
 b=h+XYqS1P+5lJV3A7QABrM3XbEmVFNiKNQ5FpI89nBJHFakragQ33HzP9yWp/kell
 fYbIxqt/0+LMy71PfHHm7RHZ2vpn5GUKd2DRgbTKgkX7BVLwjfNdyOaBZC+IzSEW7jU
 02ue4pBDsXq71xys+7sZ9LUlfoHv2dOTWxd9eQf4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=shh3fegwg5fppqsuzphvschd53n6ihuv; d=amazonses.com; t=1598540537;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=qzcujXAxyWguza+cpQFOZ2NzlHXYWyOMb09mx4G4ztk=;
 b=Bs/xNcJZPaTBiGE70LRhp2wqgx9yjqGi/qMjJx/eKbPqimmpE0pHdJXlPJ0NTcYB
 Fo0HOqMZP4RQ6ejxcLdiulIssngA1NlxHILO7RDlCWYDMkKTKePpjIsK8ijL198pJAt
 oWEy6Q0gkZ8iBUtM9AocKqKDI79VQHqxc0uKf2Zo=
Subject: Re: QNX6.6 cross-compilation problem
To: =?UTF-8?Q?samba-technical=40lists=2Esamba=2Eorg?=
 <samba-technical@lists.samba.org>
Date: Thu, 27 Aug 2020 15:02:17 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0102017430180efb-657ca4b1-cf73-459b-a2fa-b728af5b2f79-000000@eu-west-1.amazonses.com>
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
 <0102017430138f60-222b3721-39fa-40fd-b2e6-3ef4de5a942c-000000@eu-west-1.amazonses.com>
 <214f4f7e-104a-4739-61dd-573ed49f4c1e@aaton.com> 
 <0102017430180efb-657ca4b1-cf73-459b-a2fa-b728af5b2f79-000000@eu-west-1.amazonses.com>
 <017dcf2c-0945-963c-2480-1cd7f835f8ef@aaton.com>
X-Mailer: Amazon WorkMail
Thread-Index: =?us-ascii?Q?AQHV4xePtgTlttjWR2av2pbvb72egAAVIUorAKNXpGIAp1J?=
 =?us-ascii?Q?p9QDUSp1pANuccSIA+SuEQyZXUGqUJld8WTQmWt+tUA=3D=3D?=
Thread-Topic: QNX6.6 cross-compilation problem
X-Wm-Sent-Timestamp: 1598540537
Message-ID: <010201743070df39-d4e000cf-0340-4aff-a07b-1febdd17e9f2-000000@eu-west-1.amazonses.com>
X-SES-Outgoing: 2020.08.27-54.240.2.29
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

I upgraded the samba sources to version 4.12.6 (I also applied asn1 patch=
).=0D=0AI do not have the errors described in my 2 previous messages.=0D=0A=
=0D=0AIt still do not compile but this is another story.=0D=0A=0D=0A=0D=0A=
Le 27/08/2020 =C3=A0 15:25, Nicolas Pinault via samba-technical a =C3=A9c=
rit=C2=A0:=0D=0A> Le 27/08/2020 =C3=A0 15:20, Nicolas Pinault via samba-t=
echnical a =C3=A9crit=C2=A0:=0D=0A>> Hi,=0D=0A>> Le 19/02/2020 =C3=A0 09:=
11, Nicolas Pinault via samba-technical a =C3=A9crit=C2=A0:=0D=0A>>> Andr=
ew,=0D=0A>>>> It looks like I have to cross-compile gnutls for my system.=
 Right =3F=0D=0A>>>> Yes, GnuTLS is a requirement now:=0D=0A>>> Another g=
reat challenge ;)=0D=0A>> I've finally compiled gnuTLS successfully.=0D=0A=
>>=0D=0A>> I now have the following error :=0D=0A>>=0D=0A>> [ 564/3026] C=
ompiling bin/default/source4/heimdal/lib/asn1/asn1_err.c=0D=0A>> 15:13:30=
 runner ['ntoarmv7-gcc', '-D_SAMBA_BUILD_=3D4',=0D=0A>> '-DHAVE_CONFIG_H=3D=
1', '-I/home/nicolas/qnx660/target/qnx6/usr/include',=0D=0A>> '-MMD', '-D=
_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1',=0D=0A>> '-DHAVE_CONFIG_=
H=3D1', '-Wno-format-truncation', '-fPIC',=0D=0A>> '-D__STDC_WANT_LIB_EXT=
1__=3D1', '-D_REENTRANT',=0D=0A>> '-fstack-protector-strong', '-DSTATIC_H=
EIMDAL_HEIM_ASN1_MODULES=3DNULL',=0D=0A>> '-DSTATIC_HEIMDAL_HEIM_ASN1_MOD=
ULES_PROTO=3Dextern void=0D=0A>> __HEIMDAL_HEIM_ASN1_dummy_module_proto(v=
oid)',=0D=0A>> '-Isource4/heimdal_build', '-I../../source4/heimdal_build'=
,=0D=0A>> '-Isource4/heimdal/lib/asn1', '-I../../source4/heimdal/lib/asn1=
',=0D=0A>> '-Iinclude/public', '-I../../include/public', '-Isource4',=0D=0A=
>> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',=0D=0A>> '-=
I../../source4/lib', '-Isource4/include', '-I../../source4/include',=0D=0A=
>> '-Iinclude', '-I../../include', '-Ilib/replace', '-I../../lib/replace'=
,=0D=0A>> '-I.', '-I../..', '-Isource4/heimdal/lib/roken',=0D=0A>> '-I../=
=2E./source4/heimdal/lib/roken', '-Isource4/heimdal/include',=0D=0A>> '-I=
=2E./../source4/heimdal/include', '-Isource4/heimdal/lib/com_err',=0D=0A>=
> '-I../../source4/heimdal/lib/com_err',=0D=0A>> 'source4/heimdal/lib/asn=
1/asn1_err.c', '-c',=0D=0A>> '-o/home/nicolas/samba/samba-4.11.6/bin/defa=
ult/source4/heimdal/lib/asn1/asn1_err.c.60.o']=0D=0A>> source4/heimdal/li=
b/asn1/asn1_err.c:47:23: error: 'link' redeclared as=0D=0A>> different ki=
nd of symbol=0D=0A>> In file included from ../../lib/replace/../replace/r=
eplace.h:172:0,=0D=0A>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../../source4/heimd=
al_build/config.h:10,=0D=0A>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from source4/heimd=
al/lib/asn1/asn1_err.c:1:=0D=0A>> /home/nicolas/qnx660/target/qnx6/usr/in=
clude/unistd.h:426:12: note:=0D=0A>> previous declaration of 'link' was h=
ere=0D=0A>> cc1: warning: unrecognized command line option "-Wno-format-t=
runcation"=0D=0A>> [enabled by default]=0D=0A>>=0D=0A>> Waf: Leaving dire=
ctory `/home/nicolas/samba/samba-4.11.6/bin/default'=0D=0A>> Build failed=
=0D=0A>>    =C2=A0-> task in 'HEIMDAL_HEIM_ASN1' failed with exit status =
1:=0D=0A>>    =C2=A0=C2=A0=C2=A0 {task 3062501532: c asn1_err.c -> asn1_e=
rr.c.60.o}=0D=0A>> ['ntoarmv7-gcc', '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG=
_H=3D1',=0D=0A>> '-I/home/nicolas/qnx660/target/qnx6/usr/include', '-MMD'=
,=0D=0A>> '-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CO=
NFIG_H=3D1',=0D=0A>> '-Wno-format-truncation', '-fPIC', '-D__STDC_WANT_LI=
B_EXT1__=3D1',=0D=0A>> '-D_REENTRANT', '-fstack-protector-strong',=0D=0A>=
> '-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES=3DNULL',=0D=0A>> '-DSTATIC_HEIMDAL_=
HEIM_ASN1_MODULES_PROTO=3Dextern void=0D=0A>> __HEIMDAL_HEIM_ASN1_dummy_m=
odule_proto(void)',=0D=0A>> '-Isource4/heimdal_build', '-I../../source4/h=
eimdal_build',=0D=0A>> '-Isource4/heimdal/lib/asn1', '-I../../source4/hei=
mdal/lib/asn1',=0D=0A>> '-Iinclude/public', '-I../../include/public', '-I=
source4',=0D=0A>> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/l=
ib',=0D=0A>> '-I../../source4/lib', '-Isource4/include', '-I../../source4=
/include',=0D=0A>> '-Iinclude', '-I../../include', '-Ilib/replace', '-I..=
/../lib/replace',=0D=0A>> '-I.', '-I../..', '-Isource4/heimdal/lib/roken'=
,=0D=0A>> '-I../../source4/heimdal/lib/roken', '-Isource4/heimdal/include=
',=0D=0A>> '-I../../source4/heimdal/include', '-Isource4/heimdal/lib/com_=
err',=0D=0A>> '-I../../source4/heimdal/lib/com_err',=0D=0A>> 'source4/hei=
mdal/lib/asn1/asn1_err.c', '-c',=0D=0A>> '-o/home/nicolas/samba/samba-4.1=
1.6/bin/default/source4/heimdal/lib/asn1/asn1_err.c.60.o']=0D=0A>>=0D=0A>=
> The configuration command is the following :=0D=0A>> waf configure --cr=
oss-compile --cross-execute=3D'python3.6=0D=0A>> execute_on_cantar.py' --=
jobs=3D1 --prefix=3D$HOME/samba/build=0D=0A>> --exec-prefix=3D$HOME/samba=
/bin --disable-python --without-ad-dc=0D=0A>> --python=3D/usr/bin/python3=
=2E6 --without-pie --disable-cups=0D=0A>> --disable-iprint --with-configd=
ir=3D/etc/samba=0D=0A>> --with-logfilebase=3D/tmp/samba --with-lockdir=3D=
/tmp/samba=0D=0A>> --with-piddir=3D/tmp/samba --with-privatedir=3D/etc/sa=
mba/private=0D=0A>> --without-libarchive --localstatedir=3D/var --without=
-gettext=0D=0A>> --without-ldb-lmdb --without-systemd --without-lttng=0D=0A=
>> --without-ntvfs-fileserver --without-json --without-relro=0D=0A>> --di=
sable-tdb-mutex-locking --without-ldap --without-ads --without-pam=0D=0A>=
> --disable-rpath --with-static-modules=3DALL=0D=0A>> --bundled-libraries=
=3D'!asn1_compile,!compile_et'=0D=0A> Sometimes, relaunching the build pr=
ocess, I get another error :=0D=0A>=0D=0A> [ 564/3026] Compiling source4/=
heimdal/lib/asn1/der_length.c=0D=0A> 15:23:58 runner ['ntoarmv7-gcc', '-D=
_SAMBA_BUILD_=3D4',=0D=0A> '-DHAVE_CONFIG_H=3D1', '-I/home/nicolas/qnx660=
/target/qnx6/usr/include',=0D=0A> '-MMD', '-D_GNU_SOURCE=3D1', '-D_XOPEN_=
SOURCE_EXTENDED=3D1',=0D=0A> '-DHAVE_CONFIG_H=3D1', '-Wno-format-truncati=
on', '-fPIC',=0D=0A> '-D__STDC_WANT_LIB_EXT1__=3D1', '-D_REENTRANT',=0D=0A=
> '-fstack-protector-strong', '-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES=3DNULL'=
,=0D=0A> '-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES_PROTO=3Dextern void=0D=0A> _=
_HEIMDAL_HEIM_ASN1_dummy_module_proto(void)',=0D=0A> '-Isource4/heimdal_b=
uild', '-I../../source4/heimdal_build',=0D=0A> '-Isource4/heimdal/lib/asn=
1', '-I../../source4/heimdal/lib/asn1',=0D=0A> '-Iinclude/public', '-I../=
=2E./include/public', '-Isource4',=0D=0A> '-I../../source4', '-Ilib', '-I=
=2E./../lib', '-Isource4/lib',=0D=0A> '-I../../source4/lib', '-Isource4/i=
nclude', '-I../../source4/include',=0D=0A> '-Iinclude', '-I../../include'=
, '-Ilib/replace', '-I../../lib/replace',=0D=0A> '-I.', '-I../..', '-Isou=
rce4/heimdal/lib/roken',=0D=0A> '-I../../source4/heimdal/lib/roken', '-Is=
ource4/heimdal/include',=0D=0A> '-I../../source4/heimdal/include', '-Isou=
rce4/heimdal/lib/com_err',=0D=0A> '-I../../source4/heimdal/lib/com_err',=0D=
=0A> '../../source4/heimdal/lib/asn1/der_length.c', '-c',=0D=0A> '-o/home=
/nicolas/samba/samba-4.11.6/bin/default/source4/heimdal/lib/asn1/der_leng=
th.c.60.o']=0D=0A> In file included from ../../source4/heimdal/lib/asn1/d=
er_locl.h:53:0,=0D=0A>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../../source4/heimd=
al/lib/asn1/der_length.c:36:=0D=0A> source4/heimdal/lib/asn1/asn1_err.h:6=
:24: fatal error: et/com_err.h: No=0D=0A> such file or directory=0D=0A> c=
ompilation terminated.=0D=0A>=0D=0A> Waf: Leaving directory `/home/nicola=
s/samba/samba-4.11.6/bin/default'=0D=0A> Build failed=0D=0A>   =C2=A0-> t=
ask in 'HEIMDAL_HEIM_ASN1' failed with exit status 1:=0D=0A>   =C2=A0=C2=A0=
=C2=A0 {task 3068432084: c der_length.c -> der_length.c.60.o}=0D=0A> ['nt=
oarmv7-gcc', '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1',=0D=0A> '-I/hom=
e/nicolas/qnx660/target/qnx6/usr/include', '-MMD',=0D=0A> '-D_GNU_SOURCE=3D=
1', '-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CONFIG_H=3D1',=0D=0A> '-Wno-f=
ormat-truncation', '-fPIC', '-D__STDC_WANT_LIB_EXT1__=3D1',=0D=0A> '-D_RE=
ENTRANT', '-fstack-protector-strong',=0D=0A> '-DSTATIC_HEIMDAL_HEIM_ASN1_=
MODULES=3DNULL',=0D=0A> '-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES_PROTO=3Dexter=
n void=0D=0A> __HEIMDAL_HEIM_ASN1_dummy_module_proto(void)',=0D=0A> '-Iso=
urce4/heimdal_build', '-I../../source4/heimdal_build',=0D=0A> '-Isource4/=
heimdal/lib/asn1', '-I../../source4/heimdal/lib/asn1',=0D=0A> '-Iinclude/=
public', '-I../../include/public', '-Isource4',=0D=0A> '-I../../source4',=
 '-Ilib', '-I../../lib', '-Isource4/lib',=0D=0A> '-I../../source4/lib', '=
-Isource4/include', '-I../../source4/include',=0D=0A> '-Iinclude', '-I../=
=2E./include', '-Ilib/replace', '-I../../lib/replace',=0D=0A> '-I.', '-I.=
=2E/..', '-Isource4/heimdal/lib/roken',=0D=0A> '-I../../source4/heimdal/l=
ib/roken', '-Isource4/heimdal/include',=0D=0A> '-I../../source4/heimdal/i=
nclude', '-Isource4/heimdal/lib/com_err',=0D=0A> '-I../../source4/heimdal=
/lib/com_err',=0D=0A> '../../source4/heimdal/lib/asn1/der_length.c', '-c'=
,=0D=0A> '-o/home/nicolas/samba/samba-4.11.6/bin/default/source4/heimdal/=
lib/asn1/der_length.c.60.o']=0D=0A>=0D=0A>=0D=0A>> I have not found any a=
nswer searching the net.=0D=0A>> Any pointer to solve this problem =3F=0D=
=0A>>=0D=0A>> Nicolas=0D=0A>>=0D=0A>>>> https://wiki.samba.org/index.php/=
Package_Dependencies_Required_to_Build_Samba#Mandatory=0D=0A>>> Which one=
s are requested on host and which one are requested on target=0D=0A>>> wh=
en cross-compiling =3F=0D=0A>>>=0D=0A>>> Nicolas=0D=0A>>>=0D=0A>>>=0D=0A>=
>=0D=0A>=0D=0A>=0D=0A=0D=0A

