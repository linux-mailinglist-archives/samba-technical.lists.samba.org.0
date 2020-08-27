Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A1B2545DB
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 15:25:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JP4R5g9rKEjfvwQyqiHd0Zaddl8nH19xkZM4w+zV/B8=; b=cx/8f92IGO99Da/skRfzKMzHIN
	cYkkj8+Ek+Tcsq7Ufi+0uyp5uZDlFj9mKNmBYchrrij/WS54U0UgWqT0MV4289Ovu07IYfMn1nRkC
	5i90a1UywJQUdGVblx3gxk5Rn/jW4rj7lLjRZFsMR8xRm0b1V1oy5Hodwv3JFfjvnsIGtipHe/I23
	rks4qt4IFrl4Sko7kuEfFYjdVP15b8ebigGxbihmUyqLvhzBvvSWsx+kl9tw0owKRvQhyy9+ecxAU
	EMbqijlLBNtTxCYMCoX1024vMMkjG220CPI/2hAqAMlZMv44DZxUnxztJ53OKEgBYTu28IYOfE71l
	OBSiRPww==;
Received: from localhost ([::1]:37452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBHuA-000vsC-5z; Thu, 27 Aug 2020 13:25:26 +0000
Received: from a3-40.smtp-out.eu-west-1.amazonses.com ([54.240.3.40]:56182) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1kBHu4-000vs5-Nk
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 13:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gtiefq4aqa7w67wwqysvtccq4xrjnbj5; d=aaton.com; t=1598534717;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=LnBXzRIQ1NJCncnASjGN53wBrgbR/djYbXeR4wEyUN8=;
 b=e+rR+IDWRw1kk/2tU21dtr6s6PtTzGvI1uXE82ZndftZiYqNI9TT140XBaWTUrhe
 wsIDqXiSp901jVY+e/QSHOdUHBVi45J+BURVckwpX1By6wznnh/6o/Iq5BW2YAqp07+
 rfrYxX672EFrvy+z9f0jCDYyyMsqm9TZK37iyoec=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=shh3fegwg5fppqsuzphvschd53n6ihuv; d=amazonses.com; t=1598534717;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=LnBXzRIQ1NJCncnASjGN53wBrgbR/djYbXeR4wEyUN8=;
 b=Zchkapx12QV4sgd0/Vo1U2iaLogI+BwBOBQ1wXXMc/qenFuhqHS0aCnpH+lt8DTT
 dzIQc5BWB+xJCxURA5Mi9j9f3YehpH77WXfFk4RJ44myg2jSrLNtmugGgpCoE9w+3yN
 UahD0Pn7mhSuji1u9/eRVPIGLAle4quXmr8GEy9s=
Subject: Re: QNX6.6 cross-compilation problem
To: =?UTF-8?Q?samba-technical=40lists=2Esamba=2Eorg?=
 <samba-technical@lists.samba.org>
Date: Thu, 27 Aug 2020 13:25:17 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0102017430138f60-222b3721-39fa-40fd-b2e6-3ef4de5a942c-000000@eu-west-1.amazonses.com>
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
X-Mailer: Amazon WorkMail
Thread-Index: =?us-ascii?Q?AQHV4xePtgTlttjWR2av2pbvb72egAAVIUorAKNXpGIAp1J?=
 =?us-ascii?Q?p9QDUSp1pANuccSIA+SuEQyZXUGqUJld8WTQ=3D?=
Thread-Topic: QNX6.6 cross-compilation problem
X-Wm-Sent-Timestamp: 1598534716
Message-ID: <0102017430180efb-657ca4b1-cf73-459b-a2fa-b728af5b2f79-000000@eu-west-1.amazonses.com>
X-SES-Outgoing: 2020.08.27-54.240.3.40
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

Le 27/08/2020 =C3=A0 15:20, Nicolas Pinault via samba-technical a =C3=A9c=
rit=C2=A0:=0D=0A> Hi,=0D=0A> Le 19/02/2020 =C3=A0 09:11, Nicolas Pinault =
via samba-technical a =C3=A9crit=C2=A0:=0D=0A>> Andrew,=0D=0A>>> It looks=
 like I have to cross-compile gnutls for my system. Right =3F=0D=0A>>> Ye=
s, GnuTLS is a requirement now:=0D=0A>> Another great challenge ;)=0D=0A>=
 I've finally compiled gnuTLS successfully.=0D=0A>=0D=0A> I now have the =
following error :=0D=0A>=0D=0A> [ 564/3026] Compiling bin/default/source4=
/heimdal/lib/asn1/asn1_err.c=0D=0A> 15:13:30 runner ['ntoarmv7-gcc', '-D_=
SAMBA_BUILD_=3D4',=0D=0A> '-DHAVE_CONFIG_H=3D1', '-I/home/nicolas/qnx660/=
target/qnx6/usr/include',=0D=0A> '-MMD', '-D_GNU_SOURCE=3D1', '-D_XOPEN_S=
OURCE_EXTENDED=3D1',=0D=0A> '-DHAVE_CONFIG_H=3D1', '-Wno-format-truncatio=
n', '-fPIC',=0D=0A> '-D__STDC_WANT_LIB_EXT1__=3D1', '-D_REENTRANT',=0D=0A=
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
=0A> 'source4/heimdal/lib/asn1/asn1_err.c', '-c',=0D=0A> '-o/home/nicolas=
/samba/samba-4.11.6/bin/default/source4/heimdal/lib/asn1/asn1_err.c.60.o'=
]=0D=0A> source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redecla=
red as=0D=0A> different kind of symbol=0D=0A> In file included from ../..=
/lib/replace/../replace/replace.h:172:0,=0D=0A>   =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
from ../../source4/heimdal_build/config.h:10,=0D=0A>   =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 from source4/heimdal/lib/asn1/asn1_err.c:1:=0D=0A> /home/nicolas/qnx6=
60/target/qnx6/usr/include/unistd.h:426:12: note:=0D=0A> previous declara=
tion of 'link' was here=0D=0A> cc1: warning: unrecognized command line op=
tion "-Wno-format-truncation"=0D=0A> [enabled by default]=0D=0A>=0D=0A> W=
af: Leaving directory `/home/nicolas/samba/samba-4.11.6/bin/default'=0D=0A=
> Build failed=0D=0A>   =C2=A0-> task in 'HEIMDAL_HEIM_ASN1' failed with =
exit status 1:=0D=0A>   =C2=A0=C2=A0=C2=A0 {task 3062501532: c asn1_err.c=
 -> asn1_err.c.60.o}=0D=0A> ['ntoarmv7-gcc', '-D_SAMBA_BUILD_=3D4', '-DHA=
VE_CONFIG_H=3D1',=0D=0A> '-I/home/nicolas/qnx660/target/qnx6/usr/include'=
, '-MMD',=0D=0A> '-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1', '-D=
HAVE_CONFIG_H=3D1',=0D=0A> '-Wno-format-truncation', '-fPIC', '-D__STDC_W=
ANT_LIB_EXT1__=3D1',=0D=0A> '-D_REENTRANT', '-fstack-protector-strong',=0D=
=0A> '-DSTATIC_HEIMDAL_HEIM_ASN1_MODULES=3DNULL',=0D=0A> '-DSTATIC_HEIMDA=
L_HEIM_ASN1_MODULES_PROTO=3Dextern void=0D=0A> __HEIMDAL_HEIM_ASN1_dummy_=
module_proto(void)',=0D=0A> '-Isource4/heimdal_build', '-I../../source4/h=
eimdal_build',=0D=0A> '-Isource4/heimdal/lib/asn1', '-I../../source4/heim=
dal/lib/asn1',=0D=0A> '-Iinclude/public', '-I../../include/public', '-Iso=
urce4',=0D=0A> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib'=
,=0D=0A> '-I../../source4/lib', '-Isource4/include', '-I../../source4/inc=
lude',=0D=0A> '-Iinclude', '-I../../include', '-Ilib/replace', '-I../../l=
ib/replace',=0D=0A> '-I.', '-I../..', '-Isource4/heimdal/lib/roken',=0D=0A=
> '-I../../source4/heimdal/lib/roken', '-Isource4/heimdal/include',=0D=0A=
> '-I../../source4/heimdal/include', '-Isource4/heimdal/lib/com_err',=0D=0A=
> '-I../../source4/heimdal/lib/com_err',=0D=0A> 'source4/heimdal/lib/asn1=
/asn1_err.c', '-c',=0D=0A> '-o/home/nicolas/samba/samba-4.11.6/bin/defaul=
t/source4/heimdal/lib/asn1/asn1_err.c.60.o']=0D=0A>=0D=0A> The configurat=
ion command is the following :=0D=0A> waf configure --cross-compile --cro=
ss-execute=3D'python3.6=0D=0A> execute_on_cantar.py' --jobs=3D1 --prefix=3D=
$HOME/samba/build=0D=0A> --exec-prefix=3D$HOME/samba/bin --disable-python=
 --without-ad-dc=0D=0A> --python=3D/usr/bin/python3.6 --without-pie --dis=
able-cups=0D=0A> --disable-iprint --with-configdir=3D/etc/samba=0D=0A> --=
with-logfilebase=3D/tmp/samba --with-lockdir=3D/tmp/samba=0D=0A> --with-p=
iddir=3D/tmp/samba --with-privatedir=3D/etc/samba/private=0D=0A> --withou=
t-libarchive --localstatedir=3D/var --without-gettext=0D=0A> --without-ld=
b-lmdb --without-systemd --without-lttng=0D=0A> --without-ntvfs-fileserve=
r --without-json --without-relro=0D=0A> --disable-tdb-mutex-locking --wit=
hout-ldap --without-ads --without-pam=0D=0A> --disable-rpath --with-stati=
c-modules=3DALL=0D=0A> --bundled-libraries=3D'!asn1_compile,!compile_et'=0D=
=0ASometimes, relaunching the build process, I get another error :=0D=0A=0D=
=0A[ 564/3026] Compiling source4/heimdal/lib/asn1/der_length.c=0D=0A15:23=
:58 runner ['ntoarmv7-gcc', '-D_SAMBA_BUILD_=3D4',=20=0D=0A'-DHAVE_CONFIG=
_H=3D1', '-I/home/nicolas/qnx660/target/qnx6/usr/include',=20=0D=0A'-MMD'=
, '-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1',=20=0D=0A'-DHAVE_CO=
NFIG_H=3D1', '-Wno-format-truncation', '-fPIC',=20=0D=0A'-D__STDC_WANT_LI=
B_EXT1__=3D1', '-D_REENTRANT',=20=0D=0A'-fstack-protector-strong', '-DSTA=
TIC_HEIMDAL_HEIM_ASN1_MODULES=3DNULL',=20=0D=0A'-DSTATIC_HEIMDAL_HEIM_ASN=
1_MODULES_PROTO=3Dextern void=20=0D=0A__HEIMDAL_HEIM_ASN1_dummy_module_pr=
oto(void)',=20=0D=0A'-Isource4/heimdal_build', '-I../../source4/heimdal_b=
uild',=20=0D=0A'-Isource4/heimdal/lib/asn1', '-I../../source4/heimdal/lib=
/asn1',=20=0D=0A'-Iinclude/public', '-I../../include/public', '-Isource4'=
,=20=0D=0A'-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',=20=0D=
=0A'-I../../source4/lib', '-Isource4/include', '-I../../source4/include',=
=20=0D=0A'-Iinclude', '-I../../include', '-Ilib/replace', '-I../../lib/re=
place',=20=0D=0A'-I.', '-I../..', '-Isource4/heimdal/lib/roken',=20=0D=0A=
'-I../../source4/heimdal/lib/roken', '-Isource4/heimdal/include',=20=0D=0A=
'-I../../source4/heimdal/include', '-Isource4/heimdal/lib/com_err',=20=0D=
=0A'-I../../source4/heimdal/lib/com_err',=20=0D=0A'../../source4/heimdal/=
lib/asn1/der_length.c', '-c',=20=0D=0A'-o/home/nicolas/samba/samba-4.11.6=
/bin/default/source4/heimdal/lib/asn1/der_length.c.60.o']=0D=0AIn file in=
cluded from ../../source4/heimdal/lib/asn1/der_locl.h:53:0,=0D=0A =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 from ../../source4/heimdal/lib/asn1/der_length.c:36:=0D=0Aso=
urce4/heimdal/lib/asn1/asn1_err.h:6:24: fatal error: et/com_err.h: No=20=0D=
=0Asuch file or directory=0D=0Acompilation terminated.=0D=0A=0D=0AWaf: Le=
aving directory `/home/nicolas/samba/samba-4.11.6/bin/default'=0D=0ABuild=
 failed=0D=0A =C2=A0-> task in 'HEIMDAL_HEIM_ASN1' failed with exit statu=
s 1:=0D=0A =C2=A0=C2=A0=C2=A0 {task 3068432084: c der_length.c -> der_len=
gth.c.60.o}=0D=0A['ntoarmv7-gcc', '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=
=3D1',=20=0D=0A'-I/home/nicolas/qnx660/target/qnx6/usr/include', '-MMD',=20=
=0D=0A'-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CONFIG=
_H=3D1',=20=0D=0A'-Wno-format-truncation', '-fPIC', '-D__STDC_WANT_LIB_EX=
T1__=3D1',=20=0D=0A'-D_REENTRANT', '-fstack-protector-strong',=20=0D=0A'-=
DSTATIC_HEIMDAL_HEIM_ASN1_MODULES=3DNULL',=20=0D=0A'-DSTATIC_HEIMDAL_HEIM=
_ASN1_MODULES_PROTO=3Dextern void=20=0D=0A__HEIMDAL_HEIM_ASN1_dummy_modul=
e_proto(void)',=20=0D=0A'-Isource4/heimdal_build', '-I../../source4/heimd=
al_build',=20=0D=0A'-Isource4/heimdal/lib/asn1', '-I../../source4/heimdal=
/lib/asn1',=20=0D=0A'-Iinclude/public', '-I../../include/public', '-Isour=
ce4',=20=0D=0A'-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',=
=20=0D=0A'-I../../source4/lib', '-Isource4/include', '-I../../source4/inc=
lude',=20=0D=0A'-Iinclude', '-I../../include', '-Ilib/replace', '-I../../=
lib/replace',=20=0D=0A'-I.', '-I../..', '-Isource4/heimdal/lib/roken',=20=
=0D=0A'-I../../source4/heimdal/lib/roken', '-Isource4/heimdal/include',=20=
=0D=0A'-I../../source4/heimdal/include', '-Isource4/heimdal/lib/com_err',=
=20=0D=0A'-I../../source4/heimdal/lib/com_err',=20=0D=0A'../../source4/he=
imdal/lib/asn1/der_length.c', '-c',=20=0D=0A'-o/home/nicolas/samba/samba-=
4.11.6/bin/default/source4/heimdal/lib/asn1/der_length.c.60.o']=0D=0A=0D=0A=
=0D=0A> I have not found any answer searching the net.=0D=0A> Any pointer=
 to solve this problem =3F=0D=0A>=0D=0A> Nicolas=0D=0A>=0D=0A>>> https://=
wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Samba#Man=
datory=0D=0A>> Which ones are requested on host and which one are request=
ed on target=0D=0A>> when cross-compiling =3F=0D=0A>>=0D=0A>> Nicolas=0D=0A=
>>=0D=0A>>=0D=0A>=0D=0A>=0D=0A=0D=0A

