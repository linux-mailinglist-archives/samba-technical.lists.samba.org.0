Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DCA196C6E
	for <lists+samba-technical@lfdr.de>; Sun, 29 Mar 2020 12:30:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=H1Dlf+97MyIHCHZURJu1UtT+wSJ0l9X4SEjwcnQdfPM=; b=gzr6JghN99Dmq+JT6ebLyHzgL+
	rc9dqXEqbz2umfbHTGaDgevH3G/vnI4qLMAbJf+p0B2hjxgvlAi4NEZH3nXug8y6o7yHwZ+TQcCVB
	n4MdlgpaX1ofNlMQ+MdlJ274GmWhM4POb9P70qs8ViXglhkw6WLlpkpyl3lIiu7zeXI1WJPvGtw3G
	9NfMsW7yGc/G0f5pW4NMrDefvo6fgESFj8BBRCldoklH4qZH1SoPsqZrlce4hRpLA+dmcd5KJQLVU
	T/MkvRiAd/QC7BmoX5IM9VOMGz7hLbdr5+5oRpMp5GVbxqwINNfDg87eO9H4hjlJqQ0KzxnLJZINi
	Yjowc4Fg==;
Received: from localhost ([::1]:62368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jIVBI-000wig-1q; Sun, 29 Mar 2020 10:28:40 +0000
Received: from st43p00im-ztbu10073701.me.com ([17.58.63.183]:59385) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jIVBB-000wiZ-6V
 for samba-technical@lists.samba.org; Sun, 29 Mar 2020 10:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1585476796; bh=H1Dlf+97MyIHCHZURJu1UtT+wSJ0l9X4SEjwcnQdfPM=;
 h=Content-Type:Subject:From:Date:Message-Id:To;
 b=KpeG0K+a1ma42Y+o0UgJCupNNAJJ+auH8dbGqbflH19OZ/8sVSUMzJRMizbbPNrpj
 R/gWLhnEkTPJl24Dzrcg7GaWOzdwgtX7F/nc+SLTEAqPMsuaAOoyazsbmnL1qSEkAX
 asKPNFN222BvtZwnLh48e+Jw9e2ulU4Q43Ip8+3S3fRJs1hso7RPvBEB7Har+JHgvL
 wx90J9X8PF6sfJXQTIWVsPLohRqqzIp2u4hGvpDNnEob6zC1mRx5V37UKKpapfKKUo
 kqk7intWquutgHiaAFWYVW12RsqCOkOJttv6NkE37/lTh3lQr0mkpNCwt7hidiAmgz
 NbS/rxNhF2srg==
Received: from [10.11.0.38] (unknown [185.217.117.11])
 by st43p00im-ztbu10073701.me.com (Postfix) with ESMTPSA id 79D354C04BE;
 Sun, 29 Mar 2020 10:13:14 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [Samba] Make/Build Error on armhf
In-Reply-To: <af43e77b-49ac-63d0-b959-63603fe1c718@gmx.ch>
Date: Sun, 29 Mar 2020 11:13:12 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <06B7E46B-432F-4766-93C0-3E4037EABACE@me.com>
References: <0a4f01d4e99b$791af700$6b50e500$@laurenz.ws>
 <vmime.5ca5f235.56c2.3109a1736f468505@ms249-lin-003.rotterdam.bazuin.nl>
 <0feb01d4eb7a$cffa4590$6feed0b0$@laurenz.ws>
 <af43e77b-49ac-63d0-b959-63603fe1c718@gmx.ch>
To: Norbert Hanke <norbert.hanke@gmx.ch>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
From: Dariusz Bogdanski via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dariusz Bogdanski <dariuszb@me.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yes I can confirm that with Samba 4.12.0 builds pass without any issues. =
 I have tried Raspberry 2B and 3B+ with fully updated Raspbian Stretch =
and Buster,

> On 17 Mar 2020, at 09:28, Norbert Hanke <norbert.hanke@gmx.ch> wrote:
>=20
> Hi,
>=20
> The problem has disappeared with Samba 4.12.0 .
>=20
> @dariuszb@me.com : can you confirm?
>=20
> I think that https://bugzilla.samba.org/show_bug.cgi?id=3D13754 can be =
closed.
>=20
> regards,
> Norbert
>=20
> On 05.04.2019 08:43, Dirk Laurenz via samba-technical wrote:
>> 4.10.1 works...
>>=20
>> [4230/4245] Compiling source4/lib/registry/man/regpatch.1.xml
>> Note: Writing regpatch.1
>>=20
>> [4231/4245] Compiling source4/lib/registry/man/regshell.1.xml
>> Note: Writing regshell.1
>>=20
>> [4232/4245] Compiling source4/lib/registry/man/regtree.1.xml
>> Note: Writing regtree.1
>>=20
>> [4233/4245] Compiling source4/utils/man/oLschema2ldif.1.xml
>> Note: Writing oLschema2ldif.1
>>=20
>> [4234/4245] Compiling source4/torture/man/smbtorture.1.xml
>> Note: Writing smbtorture.1
>>=20
>> [4235/4245] Compiling source4/torture/man/gentest.1.xml
>> Note: Writing gentest.1
>>=20
>> [4236/4245] Compiling source4/torture/man/masktest.1.xml
>> Note: Writing masktest.1
>>=20
>> [4237/4245] Compiling source4/torture/man/locktest.1.xml
>> Note: Writing locktest.1
>>=20
>> [4238/4245] Compiling libcli/nbt/man/nmblookup4.1.xml
>> Note: Writing nmblookup4.1
>>=20
>> [4239/4245] Compiling source4/scripting/man/samba-gpupdate.8.xml
>> Note: Writing samba-gpupdate.8
>>=20
>> [4240/4245] Compiling pidl/pidl
>> [4241/4245] Compiling pidl/lib/Parse/Pidl/Util.pm
>> [4242/4245] Compiling pidl/lib/Parse/Pidl/Dump.pm
>> [4243/4245] Compiling pidl/lib/Parse/Pidl/Wireshark/Conformance.pm
>> [4244/4245] Compiling pidl/lib/Parse/Pidl/Wireshark/NDR.pm
>> [4245/4245] Compiling pidl/lib/Parse/Pidl/NDR.pm
>> Waf: Leaving directory `/install/samba-4.10.1/bin/default'
>> 'build' finished successfully (1h8m54.012s)
>> root@bh01:/install/samba-4.10.1#
>>=20
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: L.P.H. van Belle <belle@bazuin.nl>
>> Gesendet: Donnerstag, 4. April 2019 14:02
>> An: Dirk Laurenz <samba@laurenz.ws>; samba-technical@lists.samba.org
>> Betreff: RE: [Samba] Make/Build Error on armhf
>>=20
>> Hai Dirk,
>>=20
>> Can you be more precise?
>>=20
>> You use the backported build packages? ( as in -t stretch-backports ) =
as
>> shown.
>> Or did you only use the 4.10.1 package which you backported?
>>=20
>> Can you update the bug report, that would be nice.
>>=20
>> Greetz,
>>=20
>> Louis
>>=20
>>=20
>>=20
>>> -----Oorspronkelijk bericht-----
>>> Van: samba [mailto:samba-bounces@lists.samba.org] Namens Dirk =
Laurenz
>>> via samba
>>> Verzonden: donderdag 4 april 2019 13:33
>>> Aan: samba@lists.samba.org; samba-technical@lists.samba.org
>>> Onderwerp: Re: [Samba] Make/Build Error on armhf
>>>=20
>>> I tried the backports tip from
>>> https://bugzilla.samba.org/show_bug.cgi?id=3D13754 and samba
>>> 4.10.1 this works... compile finishes without an error...
>>>=20
>>> -----Urspr=C3=BCngliche Nachricht-----
>>> Von: samba <samba-bounces@lists.samba.org> Im Auftrag von Dirk =
Laurenz
>>> via samba
>>> Gesendet: Dienstag, 2. April 2019 23:32
>>> An: samba@lists.samba.org
>>> Cc: 'Norbert Hanke' <norbert.hanke@gmx.ch>
>>> Betreff: Re: [Samba] Make/Build Error on armhf
>>>=20
>>> Hello Norbert,
>>>=20
>>> thanks for your reply. Does that mean that the rpi build environment
>>> is not uptodate?
>>>=20
>>> -----Urspr=C3=BCngliche Nachricht-----
>>> Von: samba <samba-bounces@lists.samba.org> Im Auftrag von Norbert
>>> Hanke via samba
>>> Gesendet: Dienstag, 2. April 2019 21:28
>>> An: samba@lists.samba.org
>>> Betreff: Re: [Samba] Make/Build Error on armhf
>>>=20
>>> Hi,
>>>=20
>>> I noticed the same, actually with many more shared libraries.
>>> It already has been filed as bug
>>> https://bugzilla.samba.org/show_bug.cgi?id=3D13754
>>> with version 4.10.0rc4 .
>>>=20
>>> Looking at what actually happens in detail no exotic build options =
are
>>> used so at first sight it looks more like a problem of the build =
tools
>>> on the RPi than a Samba problem.
>>>=20
>>> The simplest situation I could find was *messaging_send.c.1.o and
>>> *unix_privs.c.73.o linked into *libMESSAGING-SEND-samba4.so***, and =
as
>>> soon as something is linked against that .so against something else =
it
>>> always results in
>>>=20
>>> invalid string offset 1222 >=3D 1174 for section `.strtab******
>>>=20
>>> See below how these three objects are build and when it fails the
>>> first time.
>>>=20
>>> regards,
>>> Norbert
>>>=20
>>> [1456/4250] Compiling source4/lib/messaging/messaging_send.c
>>> 13:16:15 runner ['/usr/bin/gcc',
>>> '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1', '-MMD', =
'-D_GNU_SOURCE=3D1',
>>> '-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CONFIG_H=3D1', '-fPIC',
>>> '-D_LARGEFILE_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-D_REENTRANT',
>>> '-D_POSIX_PTHREAD_SEMANTICS',
>>> '-DCTDB_HELPER_BINDIR=3D"/usr/local/samba/libexec/ctdb"',
>>> '-DLOGDIR=3D"/usr/local/samba/var/log"',
>>> '-DCTDB_DATADIR=3D"/usr/local/samba/share/ctdb"',
>>> '-DCTDB_ETCDIR=3D"/usr/local/samba/etc/ctdb"',
>>> '-DCTDB_VARDIR=3D"/usr/local/samba/var/lib/ctdb"',
>>> '-DCTDB_RUNDIR=3D"/usr/local/samba/var/run/ctdb"',
>>> '-fstack-protector-strong',
>>> '-g',
>>> '-DSTATIC_MESSAGING_SEND_MODULES=3DNULL',
>>> '-DSTATIC_MESSAGING_SEND_MODULES_PROTO=3Dextern void
>>> __MESSAGING_SEND_dummy_module_proto(void)',
>>> '-Isource4/lib/messaging', '-I../../source4/lib/messaging',
>>> '-Iinclude/public', '-I../../include/public', '-Isource4',
>>> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
>>> '-I../../source4/lib', '-Isource4/include', =
'-I../../source4/include',
>>> '-Iinclude', '-I../../include', '-Ilib/replace',
>>> '-I../../lib/replace', '-Ictdb/include', '-I../../ctdb/include',
>>> '-Ictdb', '-I../../ctdb', '-I.', '-I../..', '-Ilib/tevent',
>>> '-I../../lib/tevent', '-Ilib/util/charset',
>>> '-I../../lib/util/charset', '-Isource3', '-I../../source3',
>>> '-Isource3/include', '-I../../source3/include', '-Isource3/lib',
>>> '-I../../source3/lib', '-Isource4/heimdal/lib/com_err',
>>> '-I../../source4/heimdal/lib/com_err',
>>> '-Isource4/heimdal/lib/krb5',
>>> '-I../../source4/heimdal/lib/krb5',
>>> '-Isource4/heimdal/lib/gssapi',
>>> '-I../../source4/heimdal/lib/gssapi',
>>> '-Isource4/heimdal_build', '-I../../source4/heimdal_build',
>>> '-Ibin/default/source4/heimdal/lib/asn1',
>>> '-Isource4/heimdal/lib/asn1', '-Ilib/tdb/include',
>>> '-I../../lib/tdb/incl  ude', '-Ilib/talloc', '-I../../lib/talloc',
>>> '-Ilib/dbwrap', '-I../../lib/dbwrap', '-Ilib/pthreadpool',
>>> '-I../../lib/pthreadpool', '-Ilib/param', '-I../../lib/param',
>>> '-Idynconfig', '-I../../dynconfig', '-Isource4/cluster',
>>> '-I../../source4/cluster', '-Ilibcli/util', '-I../../libcli/util',
>>> '-Ilib/crypto', '-I../../lib/crypto', '-Ilib/tdb', =
'-I../../lib/tdb',
>>> '../../source4/lib/messaging/messaging_send.c',
>>> '-c',
>>> '-o/home/pi/samba-4.10.0P1/bin/default/source4/lib/messaging/*
>>> messaging_send.c.1.o*']
>>>=20
>>> [1457/4250] Compiling lib/util/unix_privs.c
>>> 13:16:16 runner ['/usr/bin/gcc',
>>> '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1', '-MMD', =
'-D_GNU_SOURCE=3D1',
>>> '-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CONFIG_H=3D1', '-fPIC',
>>> '-D_LARGEFILE_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-D_REENTRANT',
>>> '-D_POSIX_PTHREAD_SEMANTICS',
>>> '-DCTDB_HELPER_BINDIR=3D"/usr/local/samba/libexec/ctdb"',
>>> '-DLOGDIR=3D"/usr/local/samba/var/log"',
>>> '-DCTDB_DATADIR=3D"/usr/local/samba/share/ctdb"',
>>> '-DCTDB_ETCDIR=3D"/usr/local/samba/etc/ctdb"',
>>> '-DCTDB_VARDIR=3D"/usr/local/samba/var/lib/ctdb"',
>>> '-DCTDB_RUNDIR=3D"/usr/local/samba/var/run/ctdb"',
>>> '-fstack-protector-strong',
>>> '-g',
>>> '-DSTATIC_UNIX_PRIVS_MODULES=3DNULL',
>>> '-DSTATIC_UNIX_PRIVS_MODULES_PROTO=3Dextern void
>>> __UNIX_PRIVS_dummy_module_proto(void)',
>>> '-Iinclude/public', '-I../../include/public', '-Isource4',
>>> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
>>> '-I../../source4/lib', '-Isource4/include', =
'-I../../source4/include',
>>> '-Iinclude', '-I../../include', '-Ilib/replace',
>>> '-I../../lib/replace', '-Ictdb/include', '-I../../ctdb/include',
>>> '-Ictdb', '-I../../ctdb', '-I.', '-I../..', '-Ilib/talloc',
>>> '-I../../lib/talloc', '../../lib/util/unix_privs.c', '-c',
>>> =
'-o/home/pi/samba-4.10.0P1/bin/default/lib/util/*unix_privs.c.73.o*']
>>>=20
>>> [1462/4250] Linking
>>> bin/default/source4/lib/messaging/*libMESSAGING-SEND-samba4.so*
>>> 13:16:21 runner ['/usr/bin/gcc',
>>> '-Wl,--version-script=3D/home/pi/samba-4.10.0P1/bin/default/sour
>>> ce4/lib/messaging/MESSAGING_SEND.vscript',
>>>=20
>>> '-shared',
>>> 'lib/util/*unix_privs.c.73.o*',
>>> 'source4/lib/messaging/*messaging_send.c.1.o*',
>>> '-o/home/pi/samba-4.10.0P1/bin/default/source4/lib/messaging/*
>>> libMESSAGING-SEND-samba4.so*',
>>>=20
>>> '-Wl,-rpath,/home/pi/samba-4.10.0P1/bin/shared',
>>> '-Wl,-rpath,/home/pi/samba-4.10.0P1/bin/shared/private',
>>> '-Wl,-Bstatic',
>>> '-Wl,-Bdynamic',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/libcli/util',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tevent',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/dbwrap',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/param',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tdb_wrap',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tdb',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/replace',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/cluster',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/talloc',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/util',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/source3',
>>> '-L/usr/local/lib', '-L/usr/local/lib', '-lmessages-dgm-samba4',
>>> '-lmessages-util-samba4', '-lserver-id-db-samba4', '-ltalloc',
>>> '-lcluster-samba4', '-lreplace-samba4', '-lgenrand-samba4',
>>> '-lmsghdr-samba4', '-lsamba-debug-samba4', '-ltevent-util',
>>> '-lsamba-util', '-ltdb', '-ltdb-wrap-samba4', '-lutil-tdb-samba4',
>>> '-lsamba-hostconfig', '-ldbwrap-samba4', '-lsocket-blocking-samba4',
>>> '-lsys-rw-samba4', '-liov-buf-samba4', '-ltime-basic-samba4',
>>> '-ltevent', '-lsamba-errors', '-lutil-setid-samba4',
>>> '-lserver-role-samba4', '-lpthread', '-lrt', '-lcrypt', '-lbsd',
>>> '-ldl', '-lnsl', '-Wl,-z,relro,-z,now', '-lpthread',
>>> '-Wl,-no-undefined', '-Wl,--export-dynamic', '-Wl,--as-needed']
>>>=20
>>> and when linking against that:
>>>=20
>>> 13:16:31 runner ['/usr/bin/gcc',
>>>=20
>>> '-Wl,--version-script=3D/home/pi/samba-4.10.0P1/bin/default/auth
>>> /common_auth.vscript',
>>>=20
>>>=20
>>> '-shared',
>>>=20
>>> 'lib/audit_logging/audit_logging.c.1.o',
>>> 'lib/util/util_str_escape.c.99.o',
>>> 'auth/auth_sam_reply.c.1.o', 'auth/wbc_auth_util.c.1.o',
>>> 'auth/auth_log.c.1.o', 'auth/auth_util.c.1.o',
>>> =
'-o/home/pi/samba-4.10.0P1/bin/default/auth/libcommon-auth-samba4.so',
>>>=20
>>> '-Wl,-rpath,/home/pi/samba-4.10.0P1/bin/shared',
>>>=20
>>> '-Wl,-rpath,/home/pi/samba-4.10.0P1/bin/shared/private',
>>>=20
>>> '-Wl,-Bstatic',
>>>=20
>>> '-Wl,-Bdynamic',
>>>=20
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/dbwrap',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/param',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tdb_wrap',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tdb',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/cluster',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/source3',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/replace',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tevent',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/socket',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/lib/events',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/libcli/util',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/heimdal_build',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/librpc',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/talloc',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/libcli/security',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/lib/messaging',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/util',
>>> '-L/home/pi/samba-4.10.0P1/bin/default/lib',
>>> '-L/usr/local/lib', '-L/usr/local/lib',
>>>=20
>>> '-lsamba-sockets-samba4', '-lsamba-debug-samba4',
>>> '-l*MESSAGING-SEND-samba4*', '-lserver-id-db-samba4',
>>> '-lsamba-security-samba4', '-ltalloc', '-lndr-samba-samba4',
>>> '-lsamba-util', '-lroken-samba4', '-lsocket-blocking-samba4',
>>> '-lsamba-errors', '-levents-samba4', '-linterfaces-samba4',
>>> '-ltevent', '-lndr-nbt', '-ltevent-util', '-liov-buf-samba4',
>>> '-ltime-basic-samba4', '-lreplace-samba4', '-lmessages-dgm-samba4',
>>> '-lmessages-util-samba4', '-lcluster-samba4', '-ltdb',
>>> '-ltdb-wrap-samba4', '-lutil-tdb-samba4', '-lndr',
>>> '-lasn1util-samba4', '-lndr-standard', '-lndr-krb5pac',
>>> '-lgenrand-samba4', '-lutil-setid-samba4', '-lmsghdr-samba4',
>>> '-lsamba-hostconfig', '-ldbwrap-samba4', '-lsys-rw-samba4',
>>> '-lserver-role-samba4', '-lz', '-lresolv', '-lutil', '-lnsl', =
'-lrt',
>>> '-lbsd', '-lcrypt', '-ldl', '-lpthread', '-ljansson',
>>>=20
>>> '-Wl,-z,relro,-z,now',
>>>=20
>>> '-lpthread',
>>>=20
>>> '-Wl,-no-undefined',
>>>=20
>>> '-Wl,--export-dynamic',
>>>=20
>>> '-Wl,--as-needed']
>>>=20
>>> /usr/bin/ld:
>>> /home/pi/samba-4.10.0P1/bin/default/source4/lib/messaging/*lib
>>> MESSAGING-SEND-samba4.so*:
>>> invalid string offset 1222 >=3D 1174 for section `.strtab'
>>>=20
>>>=20
>>> On 02.04.2019 21:05, Dirk Laurenz via samba wrote:
>>>> Hello $List,
>>>>=20
>>>>=20
>>>>=20
>>>> just downloaded and tried to compile samba 4.10.0 an
>>> raspbian stretch
>>>> which ends in an error:
>>>>=20
>>>>=20
>>>>=20
>>>> [1924/4121] Compiling source3/rpc_client/rpc_transport_np.c
>>>>=20
>>>> [1925/4121] Linking bin/default/source3/libmsrpc3-samba4.so
>>>>=20
>>>> /usr/bin/ld:
>>>>=20
>>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>>> invalid string offset 3888 >=3D 3489 for section `.strtab'
>>>>=20
>>>> /usr/bin/ld:
>>>>=20
>>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>>> invalid string offset 4007 >=3D 3489 for section `.strtab'
>>>>=20
>>>> /usr/bin/ld:
>>>>=20
>>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>>> invalid string offset 3899 >=3D 3489 for section `.strtab'
>>>>=20
>>>> /usr/bin/ld:
>>>>=20
>>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>>> invalid string offset 3887 >=3D 3489 for section `.strtab'
>>>>=20
>>>> /usr/bin/ld:
>>>>=20
>>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>>> invalid string offset 3873 >=3D 3489 for section `.strtab'
>>>>=20
>>>> /usr/bin/ld:
>>>>=20
>>> =
/install/samba-4.10.0/bin/default/source4/lib/messaging/libMESSAGING-S
>>>> END-sa
>>>> mba4.so: invalid string offset 1218 >=3D 1174 for section `.strtab'
>>>>=20
>>>>=20
>>>>=20
>>>> [1926/4121] Compiling source3/passdb/pdb_ldap_util.c
>>>>=20
>>>> [1927/4121] Compiling source3/passdb/pdb_ldap_schema.c
>>>>=20
>>>> [1928/4121] Compiling source4/lib/messaging/messaging_handlers.c
>>>>=20
>>>> [1929/4121] Linking bin/default/source3/libsmbldaphelper-samba4.so
>>>>=20
>>>> /usr/bin/ld:
>>>>=20
>>> =
/install/samba-4.10.0/bin/default/source4/lib/messaging/libMESSAGING-S
>>>> END-sa
>>>> mba4.so: invalid string offset 1218 >=3D 1174 for section `.strtab'
>>>>=20
>>>>=20
>>>>=20
>>>> [1930/4121] Compiling source4/lib/messaging/messaging.c
>>>>=20
>>>> [1931/4121] Compiling
>>> bin/default/source4/librpc/dcerpc-samba4.empty.c
>>>> [1932/4121] Compiling bin/default/librpc/gen_ndr/ndr_winbind_c.c
>>>>=20
>>>> [1933/4121] Compiling source4/winbind/idmap.c
>>>>=20
>>>> [1934/4121] Linking
>>>> bin/default/source4/lib/messaging/libMESSAGING-samba4.so
>>>>=20
>>>> /usr/bin/ld:
>>>>=20
>>> =
/install/samba-4.10.0/bin/default/source4/lib/messaging/libMESSAGING-S
>>>> END-sa
>>>> mba4.so: invalid string offset 1218 >=3D 1174 for section `.strtab'
>>>>=20
>>>> source4/lib/messaging/messaging.c.4.o: In function
>>> `imessaging_init':
>>>> messaging.c:(.text+0x1bf4): undefined reference to
>>>> `imessaging_register_extra_handlers'
>>>>=20
>>>> collect2: error: ld returned 1 exit status
>>>>=20
>>>>=20
>>>>=20
>>>> Waf: Leaving directory `/install/samba-4.10.0/bin/default'
>>>>=20
>>>> Build failed
>>>>=20
>>>> -> task in 'MESSAGING' failed with exit status 1 (run with -v to
>>>> -> display
>>>> more information)
>>>>=20
>>>> Makefile:7: recipe for target 'all' failed
>>>>=20
>>>> make: *** [all] Error 1
>>>>=20
>>>>=20
>>>>=20
>>>> samba 4.9.4 compiled fine on the same host..
>>>>=20
>>>>=20
>>>>=20
>>>> here's my configure statement
>>>>=20
>>>>=20
>>>>=20
>>>> ./configure --prefix=3D/usr --sysconfdir=3D/etc =
--localstatedir=3D/var
>>>> --enable-fhs --enable-selftest --systemd-install-services
>>>>=20
>>>>=20
>>>>=20
>>>> Nothing changed on that host. What am I missing?
>>>>=20
>>>>=20
>>>>=20
>>>> Regards,
>>>>=20
>>>>=20
>>>>=20
>>>> Dirk
>>>>=20
>>> --
>>> To unsubscribe from this list go to the following URL and read the
>>> instructions:  https://lists.samba.org/mailman/options/samba
>>>=20
>>>=20
>>> --
>>> To unsubscribe from this list go to the following URL and read the
>>> instructions:  https://lists.samba.org/mailman/options/samba
>>>=20
>>>=20
>>> --
>>> To unsubscribe from this list go to the following URL and read the
>>> instructions:  https://lists.samba.org/mailman/options/samba
>>>=20
>>>=20
>>=20
>>=20
>>=20


