Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B644161637
	for <lists+samba-technical@lfdr.de>; Mon, 17 Feb 2020 16:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Zr24kYZFA0m8rFcSZVG2xKFL62G8t9R9L+XE2xfhktk=; b=JGBsaGAtsdbAlQM+x06QJhiXUc
	pYg1RKHzmHZNohBuy4jgqOV/MZAM57no2rga50IenhC7oQIqZWkTW7+/o5tqANSOp38ODaPvxDknU
	9zkzBNTIS8xWbYaTTjyP5qWedu9iyyHcAfGsWr/HrVBMt33WcZwZgOScMH9qcEFpvFXmnjUbLus4U
	hEFU3McRPLHabWzD63ZdAGM14iT046KBdPBpa9EjyXobap4mIrhIkmY1UdrTBZIivT/EXERK+LnXG
	/S9IjjyUhaiabnrDCgDMc5EwB3IHX/X8HMsgS9xK9tgPz8OFSyrZMJFGuR/Jy+hQWsSPGD12jTtsP
	mPocAHmg==;
Received: from localhost ([::1]:57114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j3iM3-00AFvS-V3; Mon, 17 Feb 2020 15:30:40 +0000
Received: from a50-74.smtp-out.eu-west-1.amazonses.com ([54.240.50.74]:34852) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1j3iLy-00AFvL-UA
 for samba-technical@lists.samba.org; Mon, 17 Feb 2020 15:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gtiefq4aqa7w67wwqysvtccq4xrjnbj5; d=aaton.com; t=1581952461;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=Vxs/59FgA6prNgRjtoaTOz9EOVWbQvFilElBXwAVUFg=;
 b=FR2kOlX9Faa+MOypnIzRxAarhAqzkTYcNBbNmHr+LZNbk6ldxhSZ7ttcIqTd/u5w
 iKvbPV9qlWI8y4iudTKwz4voc0mZwbHbmBm/jcYIr3vAIAErvOOlsbK3L7UQ1X4pizl
 8PdNAqi7unHmO6qIa8Y3LvKzwDZqeEESQ7ZNxA1E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1581952461;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=Vxs/59FgA6prNgRjtoaTOz9EOVWbQvFilElBXwAVUFg=;
 b=OHDeh/uCrQFvIIgHH6ae9hkqBnnHI0tGFKp0ACT6GcxJFYGuKJuf6+2emiud/5sB
 n7Xc55iwCTQh2/+VS0G6ZkzRpl/52S5B2/EgPZ2y4fETPC+iPMoOU4shymjmfp+yzC4
 wSca/PibW63Wzlppve5lvK88wiNVmmHny3v4mSSw=
Subject: Re: QNX6.6 cross-compilation problem
To: =?UTF-8?Q?samba-technical=40lists=2Esamba=2Eorg?=
 <samba-technical@lists.samba.org>
Date: Mon, 17 Feb 2020 15:14:21 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <116a320e-62d5-b51e-0b0d-7c0709237d0c@samba.org>
References: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com> 
 <116a320e-62d5-b51e-0b0d-7c0709237d0c@samba.org> 
 <51f6d175-d856-0d59-a19b-ee326066fae5@aaton.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHV4xePtgTlttjWR2av2pbvb72egAAVIUorAKNXpGI=
Thread-Topic: QNX6.6 cross-compilation problem
Message-ID: <0102017053b6e994-c1f3f196-af94-47c2-914e-427291dbc480-000000@eu-west-1.amazonses.com>
X-SES-Outgoing: 2020.02.17-54.240.50.74
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

Hi Uri,=0D=0A=0D=0AI'm using Ubuntu 18.04.4 LTS (32-bit).=0D=0AI use vani=
lla Samba sources (4.11.6) downloaded directly from Samba WEB=20=0D=0Asit=
e. No patch applied.=0D=0AI was using Python 3.5. However, I was not conf=
ident with this Python=20=0D=0Ainstallation (I had problems with other to=
ols using Python3). So I=20=0D=0Ainstalled Python3.6.=0D=0AOf course, whi=
le I thought I was using Python3.6, I was in fact using=20=0D=0APython3.5=
 in some places. Following your request, I triple checked and=20=0D=0Acor=
rected this problem.=0D=0A=0D=0ASo :=0D=0AWith Python3.6, I get the same =
problem with --jobs >=C2=A0 1.=0D=0AWith Python3.6 and --jobs=3D1, the co=
nfiguration does not hangs anymore.=0D=0A=0D=0AAfter fighting many hours =
with my system, configuration step ends=20=0D=0Awithout error.=0D=0A=0D=0A=
My configure cmd is :=0D=0ACC=3Dntoarmv7-gcc AR=3Dntoarmv7-ar LD=3Darmv7n=
to-ld GDB=3Darmv7nto-gdb=20=0D=0ACFLAGS=3D-I/home/nicolas/qnx660/target/q=
nx6/usr/include waf configure=20=0D=0A--cross-compile --cross-execute=3D'=
python3.6 execute_on_target.py'=20=0D=0A--jobs=3D1 --disable-python --wit=
hout-ad-dc --python=3D/usr/bin/python3.6=20=0D=0A--without-pie --disable-=
cups --disable-iprint=20=0D=0A--with-configdir=3D/etc/samba --with-logfil=
ebase=3D/tmp/samba=20=0D=0A--with-lockdir=3D/tmp/samba --with-piddir=3D/t=
mp/samba=20=0D=0A--with-privatedir=3D/etc/samba/private --without-libarch=
ive=20=0D=0A--localstatedir=3D/var --without-gettext --without-ldb-lmdb=20=
=0D=0A--without-systemd --without-lttng --without-ntvfs-fileserver=20=0D=0A=
--without-json --without-relro --disable-tdb-mutex-locking=20=0D=0A--with=
out-ldap --without-ads --without-pam --disable-rpath=0D=0A=0D=0ABut build=
 fails...=0D=0AWhen running "waf -vv", I get :=0D=0AWaf: Entering directo=
ry `/home/nicolas/samba/samba-4.11.6/bin/default'=0D=0A =C2=A0=C2=A0=C2=A0=
 Selected embedded Heimdal build=0D=0A[116/287] Processing source4/heimda=
l/lib/asn1/kx509.asn1=0D=0A15:39:11 runner ' cd=20=0D=0A"/home/nicolas/sa=
mba/samba-4.11.6/bin/default/source4/heimdal/lib/asn1"=20=0D=0A&& "/home/=
nicolas/samba/samba-4.11.6/bin/asn1_compile" --one-code-file=20=0D=0A"/ho=
me/nicolas/samba/samba-4.11.6/source4/heimdal/lib/asn1/kx509.asn1"=20=0D=0A=
kx509_asn1 '=0D=0A/bin/sh: 1: /home/nicolas/samba/samba-4.11.6/bin/asn1_c=
ompile: Exec=20=0D=0Aformat error=0D=0A=0D=0AWaf: Leaving directory `/hom=
e/nicolas/samba/samba-4.11.6/bin/default'=0D=0A =C2=A0 File "/home/nicola=
s/samba/samba-4.11.6/buildtools/bin/waf", line 166,=20=0D=0Ain <module>=0D=
=0A =C2=A0=C2=A0=C2=A0 Scripting.waf_entry_point(cwd, VERSION, wafdir[0])=
=0D=0A =C2=A0 File=20=0D=0A"/home/nicolas/samba/samba-4.11.6/third_party/=
waf/waflib/Scripting.py",=20=0D=0Aline 159, in waf_entry_point=0D=0A =C2=A0=
=C2=A0=C2=A0 run_commands()=0D=0A =C2=A0 File=20=0D=0A"/home/nicolas/samb=
a/samba-4.11.6/third_party/waf/waflib/Scripting.py",=20=0D=0Aline 255, in=
 run_commands=0D=0A =C2=A0=C2=A0=C2=A0 ctx =3D run_command(cmd_name)=0D=0A=
 =C2=A0 File=20=0D=0A"/home/nicolas/samba/samba-4.11.6/third_party/waf/wa=
flib/Scripting.py",=20=0D=0Aline 239, in run_command=0D=0A =C2=A0=C2=A0=C2=
=A0 ctx.execute()=0D=0A =C2=A0 File=20=0D=0A"/home/nicolas/samba/samba-4.=
11.6/third_party/waf/waflib/Scripting.py",=20=0D=0Aline 582, in execute=0D=
=0A =C2=A0=C2=A0=C2=A0 return execute_method(self)=0D=0A =C2=A0 File=20=0D=
=0A"/home/nicolas/samba/samba-4.11.6/third_party/waf/waflib/Build.py", li=
ne=20=0D=0A231, in execute=0D=0A =C2=A0=C2=A0=C2=A0 self.execute_build()=0D=
=0A =C2=A0 File=20=0D=0A"/home/nicolas/samba/samba-4.11.6/third_party/waf=
/waflib/Build.py", line=20=0D=0A251, in execute_build=0D=0A =C2=A0=C2=A0=C2=
=A0 self.compile()=0D=0A =C2=A0 File=20=0D=0A"/home/nicolas/samba/samba-4=
=2E11.6/third_party/waf/waflib/Tools/errcheck.py",=20=0D=0Aline 192, in c=
heck_compile=0D=0A =C2=A0=C2=A0=C2=A0 ret =3D self.orig_compile()=0D=0A =C2=
=A0 File=20=0D=0A"/home/nicolas/samba/samba-4.11.6/third_party/waf/waflib=
/Build.py", line=20=0D=0A355, in compile=0D=0A =C2=A0=C2=A0=C2=A0 raise E=
rrors.BuildError(self.producer.error)=0D=0A =C2=A0 File=20=0D=0A"/home/ni=
colas/samba/samba-4.11.6/third_party/waf/waflib/Errors.py",=20=0D=0Aline =
46, in __init__=0D=0A =C2=A0=C2=A0=C2=A0 WafError.__init__(self, self.for=
mat_error())=0D=0A=0D=0ABuild failed=0D=0A =C2=A0-> task in 'HEIMDAL_KX50=
9_ASN1_ASN1' failed with exit status 2:=0D=0A =C2=A0=C2=A0=C2=A0 {task 30=
67614852: HEIMDAL_KX509_ASN1_ASN1 kx509.asn1 ->=20=0D=0Aasn1_kx509_asn1.x=
,kx509_asn1.hx,kx509_asn1-priv.hx}=0D=0A' cd=20=0D=0A"/home/nicolas/samba=
/samba-4.11.6/bin/default/source4/heimdal/lib/asn1"=20=0D=0A&& "/home/nic=
olas/samba/samba-4.11.6/bin/asn1_compile" --one-code-file=20=0D=0A"/home/=
nicolas/samba/samba-4.11.6/source4/heimdal/lib/asn1/kx509.asn1"=20=0D=0Ak=
x509_asn1 '=0D=0A=0D=0ALooks like asn1_compile is a target executable, no=
t a host executable.=0D=0ADo I have to run waf with special options when =
cross-compiling =3F=0D=0A=0D=0ARegards,=0D=0ANicolas=0D=0A=0D=0ALe 14/02/=
2020 =C3=A0 20:22, Uri Simchoni via samba-technical a =C3=A9crit=C2=A0:=0D=
=0A> That looks like something in Waf or in the Samba configuration scrip=
ts=0D=0A> that Waf runs. Waf 2.0.x which is used by Samba 4.11.x has a wo=
rker=0D=0A> process pool to carry out build / test jobs, and this pool se=
ems to be=0D=0A> stuck - won't execute a simple compilation command to ru=
n a=0D=0A> configuration test.=0D=0A>=0D=0A> Which version of Ubuntu are =
you using exactly=3F What version of Python=3F=0D=0A> is it vanilla Samba=
 or did you use patches=3F=0D=0A>=0D=0A> I don't have access to QNX toolc=
hain, but if the problem is with the=0D=0A> Samba build system and the bu=
ild machine (as it appears to be), then=0D=0A> perhaps we can reproduce t=
his without the specific toolchain.=0D=0A>=0D=0A> Thanks,=0D=0A> Uri.=0D=0A=
>=0D=0A> On 14/02/2020 11:17, Nicolas Pinault via samba-technical wrote:=0D=
=0A>> Hi,=0D=0A>>=0D=0A>> I'm trying to cross-compile Samba (V4.11.6) for=
 QNX6.6.0.=0D=0A>> For this, I've installed QNX dev tools on Ubuntu in a =
VMWare virtual=0D=0A>> machine (My PC runs Windows10).=0D=0A>>=0D=0A>> To=
 cross-compile Samba, the command I run is :=0D=0A>> CC=3Dntoarmv7-gcc AR=
=3Dntoarmv7-ar LD=3Darmv7nto-ld GDB=3Darmv7nto-gdb=0D=0A>> CFLAGS=3D-I/ho=
me/nicolas/qnx660/target/qnx6/usr/include waf configure=0D=0A>> --cross-c=
ompile --cross-anwsers=3Dqnx.txt=0D=0A>>=0D=0A>> I filled the unknown fie=
lds in the qnx.txt as requested.=0D=0A>>=0D=0A>> The configuration runs t=
ill it hangs at this step :=0D=0A>> ...=0D=0A>> Checking for pthread_mute=
xattr_setrobust_np : not found=0D=0A>> Checking for library=0D=0A>> pthre=
ad=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 : no=0D=0A>> Checking for pthread_mutexattr_setrobu=
st_np : not found=0D=0A>> Checking for declaration of=0D=0A>> PTHREAD_MUT=
EX_ROBUST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : not found=0D=0A=
>> Checking for declaration of PTHREAD_MUTEX_ROBUST (as=0D=0A>> enum)=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=0D=0A>>=0D=0A=
>> Sometimes, configuration hangs one or two steps earlier.=0D=0A>>=0D=0A=
>> bin/config.log shows :=0D=0A>> ...=0D=0A>> #include <pthread.h>=0D=0A>=
>=0D=0A>>  =C2=A0int main(void) {=0D=0A>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return (int)PTHREAD_MUTEX_ROBUST;=0D=0A>>  =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; return 0; }=0D=0A>>=0D=0A>> =
<=3D=3D=0D=0A>> [1/1] Compiling=0D=0A>> =1B[32mbin/.conf_check_c3306603f9=
96021a8dd585a3c7167deb/test.c=1B[0m=0D=0A>>=0D=0A>>=0D=0A>> While the con=
figurafion is hung, ps-ax shows the following :=0D=0A>>  =C2=A08302 pts/0=
=C2=A0=C2=A0=C2=A0 Sl+=C2=A0=C2=A0=C2=A0 0:08 python3=0D=0A>> /home/nicol=
as/samba/samba-4.11.6/buildtools/bin/waf configure=0D=0A>> --cross-compil=
e --cross-answers=3Dqnx.txt --jobs=3D4=0D=0A>>  =C2=A08304 pts/0=C2=A0=C2=
=A0=C2=A0 S+=C2=A0=C2=A0=C2=A0=C2=A0 0:00 /usr/local/bin/python3 -c #! /u=
sr/bin/env=0D=0A>> python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita=
) log_base_path =3D=0D=0A>> "/home/nicolas/samba/"=C2=A0 import ...=0D=0A=
>>  =C2=A08305 pts/0=C2=A0=C2=A0=C2=A0 S+=C2=A0=C2=A0=C2=A0=C2=A0 0:00 /u=
sr/local/bin/python3 -c #! /usr/bin/env=0D=0A>> python # encoding: utf-8 =
# Thomas Nagy, 2016-2018 (ita) log_base_path =3D=0D=0A>> "/home/nicolas/s=
amba/"=C2=A0 import ...=0D=0A>>  =C2=A08306 pts/0=C2=A0=C2=A0=C2=A0 S+=C2=
=A0=C2=A0=C2=A0=C2=A0 0:00 /usr/local/bin/python3 -c #! /usr/bin/env=0D=0A=
>> python # encoding: utf-8 # Thomas Nagy, 2016-2018 (ita) log_base_path =
=3D=0D=0A>> "/home/nicolas/samba/"=C2=A0 import ...=0D=0A>>  =C2=A08307 p=
ts/0=C2=A0=C2=A0=C2=A0 S+=C2=A0=C2=A0=C2=A0=C2=A0 0:00 /usr/local/bin/pyt=
hon3 -c #! /usr/bin/env=0D=0A>> python # encoding: utf-8 # Thomas Nagy, 2=
016-2018 (ita) log_base_path =3D=0D=0A>> "/home/nicolas/samba/"=C2=A0 imp=
ort ...=0D=0A>>=0D=0A>>=0D=0A>> When I comment out "Mutext Robust" tests,=
 the configuration hangs much=0D=0A>> further. But it hangs.=0D=0A>>=0D=0A=
>> As I thought it might be a concurrency problem, I tried with --jobs=3D=
1=0D=0A>> option.=0D=0A>> This does not work at all. Exceptions are gener=
ated at the very=0D=0A>> beginning of the process.=0D=0A>>=0D=0A>>=0D=0A>=
> I also tried using --cross-execute option. Same problem.=0D=0A>>=0D=0A>=
>=0D=0A>> I spent days on this problem, trying different things but I'm s=
tuck at=0D=0A>> this problem.=0D=0A>>=0D=0A>> Any pointers =3F=0D=0A>>=0D=
=0A>> Regards,=0D=0A>> Nicolas=0D=0A>>=0D=0A>=0D=0A=0D=0A

