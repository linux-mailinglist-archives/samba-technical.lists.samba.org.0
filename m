Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D8C187D53
	for <lists+samba-technical@lfdr.de>; Tue, 17 Mar 2020 10:43:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=DHTAUvLaek75h+guLwYLEKjf6oqC9WyenoXkwxaXLB8=; b=BrvuNEsLKY73B8QIAhaf7JYItz
	RZav3axK+LGHM62mzGhkGT5TZS2c7ndYyhnYjZUkFUS7wwolHM7TUjbU4AcesRKslnUibrHMNSrKp
	hhn0lCQn9NZEoFK720zn2yIqywKAGaQlAQEO8yBu16MHA9mXVykUxBk6D7Gta/OdzQcg1pqvm6tjG
	JLSXz1ejB/LutkzHSciETn43byBWkT3ZGLOAGppfSyFU0Jejogax8AgL3p2fnJKRPsv8SptgoWedh
	e+gQCd7swCQGSbZxSgwhZp0ZAVcv3w5GvGRHoRkSdTdp5X4H7Hv8hBySg76W7kqe2NY5ua87ERaJw
	5c7M6k/A==;
Received: from localhost ([::1]:19806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jE8jk-000Ett-0W; Tue, 17 Mar 2020 09:42:12 +0000
Received: from mout.gmx.net ([212.227.17.22]:60837) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jE8jd-000Etm-Ra
 for samba-technical@lists.samba.org; Tue, 17 Mar 2020 09:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1584438123;
 bh=UlRn8foqSNo7fqZWIvfzshfaMIeKp9hdiZiqIanYrxY=;
 h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
 b=Y7jKYeKaTTkWGefue8F1ZAGmo5wSAajCBs5GlJEPKlez1rfMgpFLauZ2cwUChiZdp
 nvATYNCU7F0r9H5p4oyJUmRJaA63AZwlOrLqgNKu6OJ5SYYqy28KajisBcGnILnhIz
 6QMAO6LLlF1ymUYrdjIyD0GJ5mXW6J2dS7OsLCG4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.201] ([178.199.117.207]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatRT-1jqDVJ08ct-00cMoO; Tue, 17
 Mar 2020 10:28:50 +0100
Subject: Re: AW: [Samba] Make/Build Error on armhf
To: samba-technical@lists.samba.org
References: <0a4f01d4e99b$791af700$6b50e500$@laurenz.ws>
 <vmime.5ca5f235.56c2.3109a1736f468505@ms249-lin-003.rotterdam.bazuin.nl>
 <0feb01d4eb7a$cffa4590$6feed0b0$@laurenz.ws>
Message-ID: <af43e77b-49ac-63d0-b959-63603fe1c718@gmx.ch>
Date: Tue, 17 Mar 2020 10:28:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0feb01d4eb7a$cffa4590$6feed0b0$@laurenz.ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:zWe03eJIC4VoXKq5eVxcvmWtk0t7vXK77jUSQcp4x1XqWGfTnZv
 +J14vKcckeRffxuPPrwHSt5K3kw4EhKCGeO67lEbwdQ4kNOjCBVSdcT49uZaGRUnwXfEI6u
 4jGPQpVUjmSu8wcg5GIrH1Utk8PFd75wRz/GVAqsZ0o5lSZClEFJpafC0Vi99tv6X6VnyES
 AArWLyzulpIlX6ABkwiZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FWdBgKGwNtw=:B2H1sCjw+VLwIlbPdiz2l4
 6zlvAdgBs7rGFL3AiSSfJLWydDZpFpoIRz/7c50ytOFTCdknKXdfrZA8UGkDYYSWjX/MGPfWn
 lfMjXazAP+oQ+Te3/PgI9oZFX+0tghxvIobxbvxPyfJcPGHZ5GOPDOtoTn9gGwHKs7js0A6eZ
 q+AoGF83aAK8yhbgiJxfV6Juiexjfll5JhEhfME4jNynfXfDr6k1UxkfyK+DGFq2IGbrFaXZ7
 W6cCE2EfjPHBWkemiRlF/U6cvpKYqEyPl0vCYrfn9/KmleRkkXGgT/wLXv+8TbHzlqqfBXQHx
 rzoFIoMU9bUMyV1c46+9Al8sORL0AyhFh0uMCAFz7CUyjRZdiiRs8z5mOXtwFTxFOnOa5tMXQ
 6jhlYD6oLaH3QbqrutijZCE2dILKBR0RtafBdmip61ivRivs2CTdCMv9yNSt4xSil43PxOKIC
 QWPw0D5XDcguGw6fXBAwDZqUUpNYp3ESqaecK9iuxv8YGmlH1xl4vZAHA24rX54D0X+EthSri
 2PECm/9B1aTUt3gPpa4iWQ0fUIIVT3YHrenNrYicp/rzg0Do5yZ+kbuORY6mF8QB6HALff5Cr
 TdF5goWytRVkP9+j1GW1ajF79gAtldWF0/Ut71wAbs0Osq4aun3/ky9Je08zYB6ifHNyZHLjF
 3chdgOJwNZIzOHMP4a/NRS3ubeMUdGnV/PSEoXCMx1eOt6w7kOP909rhCAdabJONm5ChVwwu0
 ilS/KtMpJm2ZhSjE2RqkVx/fxvYwMk26K4ZcT796QyAtex8leOJfzyl4qr21vusaZ2Gsd5qp5
 kVUJUuByrByuaiqNUWGBUuHRfw1JaQMlWe/K+/1LpzE/ekBF2p2OBH3XNVTRW3FQ+V4KqN8gg
 d6gpz/HVny2qShLXYWMCJIoyIVY/Ksghwn5/S2EWEWdzwpe0vEYiA0GrxYJSXIlc0/oVk5Mxj
 NbOE0ld11S0RinctQg5MrZBFcvG/GahdCUfoIGPheN1czumDCu1CGm0DDEnCFGVTqw9nSvEgJ
 qu0rVeoAaDmTOkLozfiOAA0PaPnDRdlYWgszfSWXNgvWkeZMyYXNIKrH3o9XFBSHptJvaceU5
 7QXi89g6dliN1h1/fOUtcuvu+G/Nx8E40Cxg7d0LemeeA43wuqfz5Xa13E706h8u/2c0DQP27
 jgjxfcn9caPHyJb39eQijrvoDfumiz/mu4d+tPd6VHZdffqiW/7c9fjhBgh3YNsHPuViTEXMc
 sMOsBxOZqBc1jQUIo
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
From: Norbert Hanke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Norbert Hanke <norbert.hanke@gmx.ch>
Cc: dariuszb@me.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

The problem has disappeared with Samba 4.12.0 .

@dariuszb@me.com : can you confirm?

I think that https://bugzilla.samba.org/show_bug.cgi?id=3D13754 can be clo=
sed.

regards,
Norbert

On 05.04.2019 08:43, Dirk Laurenz via samba-technical wrote:
> 4.10.1 works...
>
> [4230/4245] Compiling source4/lib/registry/man/regpatch.1.xml
> Note: Writing regpatch.1
>
> [4231/4245] Compiling source4/lib/registry/man/regshell.1.xml
> Note: Writing regshell.1
>
> [4232/4245] Compiling source4/lib/registry/man/regtree.1.xml
> Note: Writing regtree.1
>
> [4233/4245] Compiling source4/utils/man/oLschema2ldif.1.xml
> Note: Writing oLschema2ldif.1
>
> [4234/4245] Compiling source4/torture/man/smbtorture.1.xml
> Note: Writing smbtorture.1
>
> [4235/4245] Compiling source4/torture/man/gentest.1.xml
> Note: Writing gentest.1
>
> [4236/4245] Compiling source4/torture/man/masktest.1.xml
> Note: Writing masktest.1
>
> [4237/4245] Compiling source4/torture/man/locktest.1.xml
> Note: Writing locktest.1
>
> [4238/4245] Compiling libcli/nbt/man/nmblookup4.1.xml
> Note: Writing nmblookup4.1
>
> [4239/4245] Compiling source4/scripting/man/samba-gpupdate.8.xml
> Note: Writing samba-gpupdate.8
>
> [4240/4245] Compiling pidl/pidl
> [4241/4245] Compiling pidl/lib/Parse/Pidl/Util.pm
> [4242/4245] Compiling pidl/lib/Parse/Pidl/Dump.pm
> [4243/4245] Compiling pidl/lib/Parse/Pidl/Wireshark/Conformance.pm
> [4244/4245] Compiling pidl/lib/Parse/Pidl/Wireshark/NDR.pm
> [4245/4245] Compiling pidl/lib/Parse/Pidl/NDR.pm
> Waf: Leaving directory `/install/samba-4.10.1/bin/default'
> 'build' finished successfully (1h8m54.012s)
> root@bh01:/install/samba-4.10.1#
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: L.P.H. van Belle <belle@bazuin.nl>
> Gesendet: Donnerstag, 4. April 2019 14:02
> An: Dirk Laurenz <samba@laurenz.ws>; samba-technical@lists.samba.org
> Betreff: RE: [Samba] Make/Build Error on armhf
>
> Hai Dirk,
>
> Can you be more precise?
>
> You use the backported build packages? ( as in -t stretch-backports ) as
> shown.
> Or did you only use the 4.10.1 package which you backported?
>
> Can you update the bug report, that would be nice.
>
> Greetz,
>
> Louis
>
>
>
>> -----Oorspronkelijk bericht-----
>> Van: samba [mailto:samba-bounces@lists.samba.org] Namens Dirk Laurenz
>> via samba
>> Verzonden: donderdag 4 april 2019 13:33
>> Aan: samba@lists.samba.org; samba-technical@lists.samba.org
>> Onderwerp: Re: [Samba] Make/Build Error on armhf
>>
>> I tried the backports tip from
>> https://bugzilla.samba.org/show_bug.cgi?id=3D13754 and samba
>> 4.10.1 this works... compile finishes without an error...
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: samba <samba-bounces@lists.samba.org> Im Auftrag von Dirk Laurenz
>> via samba
>> Gesendet: Dienstag, 2. April 2019 23:32
>> An: samba@lists.samba.org
>> Cc: 'Norbert Hanke' <norbert.hanke@gmx.ch>
>> Betreff: Re: [Samba] Make/Build Error on armhf
>>
>> Hello Norbert,
>>
>> thanks for your reply. Does that mean that the rpi build environment
>> is not uptodate?
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: samba <samba-bounces@lists.samba.org> Im Auftrag von Norbert
>> Hanke via samba
>> Gesendet: Dienstag, 2. April 2019 21:28
>> An: samba@lists.samba.org
>> Betreff: Re: [Samba] Make/Build Error on armhf
>>
>> Hi,
>>
>> I noticed the same, actually with many more shared libraries.
>> It already has been filed as bug
>> https://bugzilla.samba.org/show_bug.cgi?id=3D13754
>> with version 4.10.0rc4 .
>>
>> Looking at what actually happens in detail no exotic build options are
>> used so at first sight it looks more like a problem of the build tools
>> on the RPi than a Samba problem.
>>
>> The simplest situation I could find was *messaging_send.c.1.o and
>> *unix_privs.c.73.o linked into *libMESSAGING-SEND-samba4.so***, and as
>> soon as something is linked against that .so against something else it
>> always results in
>>
>> invalid string offset 1222 >=3D 1174 for section `.strtab******
>>
>> See below how these three objects are build and when it fails the
>> first time.
>>
>> regards,
>> Norbert
>>
>> [1456/4250] Compiling source4/lib/messaging/messaging_send.c
>> 13:16:15 runner ['/usr/bin/gcc',
>> '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1', '-MMD', '-D_GNU_SOURCE=3D=
1',
>> '-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CONFIG_H=3D1', '-fPIC',
>> '-D_LARGEFILE_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-D_REENTRANT',
>> '-D_POSIX_PTHREAD_SEMANTICS',
>> '-DCTDB_HELPER_BINDIR=3D"/usr/local/samba/libexec/ctdb"',
>> '-DLOGDIR=3D"/usr/local/samba/var/log"',
>> '-DCTDB_DATADIR=3D"/usr/local/samba/share/ctdb"',
>> '-DCTDB_ETCDIR=3D"/usr/local/samba/etc/ctdb"',
>> '-DCTDB_VARDIR=3D"/usr/local/samba/var/lib/ctdb"',
>> '-DCTDB_RUNDIR=3D"/usr/local/samba/var/run/ctdb"',
>> '-fstack-protector-strong',
>> '-g',
>> '-DSTATIC_MESSAGING_SEND_MODULES=3DNULL',
>> '-DSTATIC_MESSAGING_SEND_MODULES_PROTO=3Dextern void
>> __MESSAGING_SEND_dummy_module_proto(void)',
>> '-Isource4/lib/messaging', '-I../../source4/lib/messaging',
>> '-Iinclude/public', '-I../../include/public', '-Isource4',
>> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
>> '-I../../source4/lib', '-Isource4/include', '-I../../source4/include',
>> '-Iinclude', '-I../../include', '-Ilib/replace',
>> '-I../../lib/replace', '-Ictdb/include', '-I../../ctdb/include',
>> '-Ictdb', '-I../../ctdb', '-I.', '-I../..', '-Ilib/tevent',
>> '-I../../lib/tevent', '-Ilib/util/charset',
>> '-I../../lib/util/charset', '-Isource3', '-I../../source3',
>> '-Isource3/include', '-I../../source3/include', '-Isource3/lib',
>> '-I../../source3/lib', '-Isource4/heimdal/lib/com_err',
>> '-I../../source4/heimdal/lib/com_err',
>> '-Isource4/heimdal/lib/krb5',
>> '-I../../source4/heimdal/lib/krb5',
>> '-Isource4/heimdal/lib/gssapi',
>> '-I../../source4/heimdal/lib/gssapi',
>> '-Isource4/heimdal_build', '-I../../source4/heimdal_build',
>> '-Ibin/default/source4/heimdal/lib/asn1',
>> '-Isource4/heimdal/lib/asn1', '-Ilib/tdb/include',
>> '-I../../lib/tdb/incl  ude', '-Ilib/talloc', '-I../../lib/talloc',
>> '-Ilib/dbwrap', '-I../../lib/dbwrap', '-Ilib/pthreadpool',
>> '-I../../lib/pthreadpool', '-Ilib/param', '-I../../lib/param',
>> '-Idynconfig', '-I../../dynconfig', '-Isource4/cluster',
>> '-I../../source4/cluster', '-Ilibcli/util', '-I../../libcli/util',
>> '-Ilib/crypto', '-I../../lib/crypto', '-Ilib/tdb', '-I../../lib/tdb',
>> '../../source4/lib/messaging/messaging_send.c',
>> '-c',
>> '-o/home/pi/samba-4.10.0P1/bin/default/source4/lib/messaging/*
>> messaging_send.c.1.o*']
>>
>> [1457/4250] Compiling lib/util/unix_privs.c
>> 13:16:16 runner ['/usr/bin/gcc',
>> '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1', '-MMD', '-D_GNU_SOURCE=3D=
1',
>> '-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CONFIG_H=3D1', '-fPIC',
>> '-D_LARGEFILE_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-D_REENTRANT',
>> '-D_POSIX_PTHREAD_SEMANTICS',
>> '-DCTDB_HELPER_BINDIR=3D"/usr/local/samba/libexec/ctdb"',
>> '-DLOGDIR=3D"/usr/local/samba/var/log"',
>> '-DCTDB_DATADIR=3D"/usr/local/samba/share/ctdb"',
>> '-DCTDB_ETCDIR=3D"/usr/local/samba/etc/ctdb"',
>> '-DCTDB_VARDIR=3D"/usr/local/samba/var/lib/ctdb"',
>> '-DCTDB_RUNDIR=3D"/usr/local/samba/var/run/ctdb"',
>> '-fstack-protector-strong',
>> '-g',
>> '-DSTATIC_UNIX_PRIVS_MODULES=3DNULL',
>> '-DSTATIC_UNIX_PRIVS_MODULES_PROTO=3Dextern void
>> __UNIX_PRIVS_dummy_module_proto(void)',
>> '-Iinclude/public', '-I../../include/public', '-Isource4',
>> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
>> '-I../../source4/lib', '-Isource4/include', '-I../../source4/include',
>> '-Iinclude', '-I../../include', '-Ilib/replace',
>> '-I../../lib/replace', '-Ictdb/include', '-I../../ctdb/include',
>> '-Ictdb', '-I../../ctdb', '-I.', '-I../..', '-Ilib/talloc',
>> '-I../../lib/talloc', '../../lib/util/unix_privs.c', '-c',
>> '-o/home/pi/samba-4.10.0P1/bin/default/lib/util/*unix_privs.c.73.o*']
>>
>> [1462/4250] Linking
>> bin/default/source4/lib/messaging/*libMESSAGING-SEND-samba4.so*
>> 13:16:21 runner ['/usr/bin/gcc',
>> '-Wl,--version-script=3D/home/pi/samba-4.10.0P1/bin/default/sour
>> ce4/lib/messaging/MESSAGING_SEND.vscript',
>>
>> '-shared',
>> 'lib/util/*unix_privs.c.73.o*',
>> 'source4/lib/messaging/*messaging_send.c.1.o*',
>> '-o/home/pi/samba-4.10.0P1/bin/default/source4/lib/messaging/*
>> libMESSAGING-SEND-samba4.so*',
>>
>> '-Wl,-rpath,/home/pi/samba-4.10.0P1/bin/shared',
>> '-Wl,-rpath,/home/pi/samba-4.10.0P1/bin/shared/private',
>> '-Wl,-Bstatic',
>> '-Wl,-Bdynamic',
>> '-L/home/pi/samba-4.10.0P1/bin/default/libcli/util',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tevent',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/dbwrap',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/param',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tdb_wrap',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tdb',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/replace',
>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/cluster',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/talloc',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/util',
>> '-L/home/pi/samba-4.10.0P1/bin/default/source3',
>> '-L/usr/local/lib', '-L/usr/local/lib', '-lmessages-dgm-samba4',
>> '-lmessages-util-samba4', '-lserver-id-db-samba4', '-ltalloc',
>> '-lcluster-samba4', '-lreplace-samba4', '-lgenrand-samba4',
>> '-lmsghdr-samba4', '-lsamba-debug-samba4', '-ltevent-util',
>> '-lsamba-util', '-ltdb', '-ltdb-wrap-samba4', '-lutil-tdb-samba4',
>> '-lsamba-hostconfig', '-ldbwrap-samba4', '-lsocket-blocking-samba4',
>> '-lsys-rw-samba4', '-liov-buf-samba4', '-ltime-basic-samba4',
>> '-ltevent', '-lsamba-errors', '-lutil-setid-samba4',
>> '-lserver-role-samba4', '-lpthread', '-lrt', '-lcrypt', '-lbsd',
>> '-ldl', '-lnsl', '-Wl,-z,relro,-z,now', '-lpthread',
>> '-Wl,-no-undefined', '-Wl,--export-dynamic', '-Wl,--as-needed']
>>
>> and when linking against that:
>>
>> 13:16:31 runner ['/usr/bin/gcc',
>>
>> '-Wl,--version-script=3D/home/pi/samba-4.10.0P1/bin/default/auth
>> /common_auth.vscript',
>>
>>
>> '-shared',
>>
>> 'lib/audit_logging/audit_logging.c.1.o',
>> 'lib/util/util_str_escape.c.99.o',
>> 'auth/auth_sam_reply.c.1.o', 'auth/wbc_auth_util.c.1.o',
>> 'auth/auth_log.c.1.o', 'auth/auth_util.c.1.o',
>> '-o/home/pi/samba-4.10.0P1/bin/default/auth/libcommon-auth-samba4.so',
>>
>> '-Wl,-rpath,/home/pi/samba-4.10.0P1/bin/shared',
>>
>> '-Wl,-rpath,/home/pi/samba-4.10.0P1/bin/shared/private',
>>
>> '-Wl,-Bstatic',
>>
>> '-Wl,-Bdynamic',
>>
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/dbwrap',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/param',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tdb_wrap',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tdb',
>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/cluster',
>> '-L/home/pi/samba-4.10.0P1/bin/default/source3',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/replace',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/tevent',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/socket',
>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/lib/events',
>> '-L/home/pi/samba-4.10.0P1/bin/default/libcli/util',
>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/heimdal_build',
>> '-L/home/pi/samba-4.10.0P1/bin/default/librpc',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/talloc',
>> '-L/home/pi/samba-4.10.0P1/bin/default/libcli/security',
>> '-L/home/pi/samba-4.10.0P1/bin/default/source4/lib/messaging',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib/util',
>> '-L/home/pi/samba-4.10.0P1/bin/default/lib',
>> '-L/usr/local/lib', '-L/usr/local/lib',
>>
>> '-lsamba-sockets-samba4', '-lsamba-debug-samba4',
>> '-l*MESSAGING-SEND-samba4*', '-lserver-id-db-samba4',
>> '-lsamba-security-samba4', '-ltalloc', '-lndr-samba-samba4',
>> '-lsamba-util', '-lroken-samba4', '-lsocket-blocking-samba4',
>> '-lsamba-errors', '-levents-samba4', '-linterfaces-samba4',
>> '-ltevent', '-lndr-nbt', '-ltevent-util', '-liov-buf-samba4',
>> '-ltime-basic-samba4', '-lreplace-samba4', '-lmessages-dgm-samba4',
>> '-lmessages-util-samba4', '-lcluster-samba4', '-ltdb',
>> '-ltdb-wrap-samba4', '-lutil-tdb-samba4', '-lndr',
>> '-lasn1util-samba4', '-lndr-standard', '-lndr-krb5pac',
>> '-lgenrand-samba4', '-lutil-setid-samba4', '-lmsghdr-samba4',
>> '-lsamba-hostconfig', '-ldbwrap-samba4', '-lsys-rw-samba4',
>> '-lserver-role-samba4', '-lz', '-lresolv', '-lutil', '-lnsl', '-lrt',
>> '-lbsd', '-lcrypt', '-ldl', '-lpthread', '-ljansson',
>>
>> '-Wl,-z,relro,-z,now',
>>
>> '-lpthread',
>>
>> '-Wl,-no-undefined',
>>
>> '-Wl,--export-dynamic',
>>
>> '-Wl,--as-needed']
>>
>> /usr/bin/ld:
>> /home/pi/samba-4.10.0P1/bin/default/source4/lib/messaging/*lib
>> MESSAGING-SEND-samba4.so*:
>> invalid string offset 1222 >=3D 1174 for section `.strtab'
>>
>>
>> On 02.04.2019 21:05, Dirk Laurenz via samba wrote:
>>> Hello $List,
>>>
>>>
>>>
>>> just downloaded and tried to compile samba 4.10.0 an
>> raspbian stretch
>>> which ends in an error:
>>>
>>>
>>>
>>> [1924/4121] Compiling source3/rpc_client/rpc_transport_np.c
>>>
>>> [1925/4121] Linking bin/default/source3/libmsrpc3-samba4.so
>>>
>>> /usr/bin/ld:
>>>
>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>> invalid string offset 3888 >=3D 3489 for section `.strtab'
>>>
>>> /usr/bin/ld:
>>>
>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>> invalid string offset 4007 >=3D 3489 for section `.strtab'
>>>
>>> /usr/bin/ld:
>>>
>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>> invalid string offset 3899 >=3D 3489 for section `.strtab'
>>>
>>> /usr/bin/ld:
>>>
>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>> invalid string offset 3887 >=3D 3489 for section `.strtab'
>>>
>>> /usr/bin/ld:
>>>
>> /install/samba-4.10.0/bin/default/source3/libutil-cmdline-samba4.so:
>>> invalid string offset 3873 >=3D 3489 for section `.strtab'
>>>
>>> /usr/bin/ld:
>>>
>> /install/samba-4.10.0/bin/default/source4/lib/messaging/libMESSAGING-S
>>> END-sa
>>> mba4.so: invalid string offset 1218 >=3D 1174 for section `.strtab'
>>>
>>>
>>>
>>> [1926/4121] Compiling source3/passdb/pdb_ldap_util.c
>>>
>>> [1927/4121] Compiling source3/passdb/pdb_ldap_schema.c
>>>
>>> [1928/4121] Compiling source4/lib/messaging/messaging_handlers.c
>>>
>>> [1929/4121] Linking bin/default/source3/libsmbldaphelper-samba4.so
>>>
>>> /usr/bin/ld:
>>>
>> /install/samba-4.10.0/bin/default/source4/lib/messaging/libMESSAGING-S
>>> END-sa
>>> mba4.so: invalid string offset 1218 >=3D 1174 for section `.strtab'
>>>
>>>
>>>
>>> [1930/4121] Compiling source4/lib/messaging/messaging.c
>>>
>>> [1931/4121] Compiling
>> bin/default/source4/librpc/dcerpc-samba4.empty.c
>>> [1932/4121] Compiling bin/default/librpc/gen_ndr/ndr_winbind_c.c
>>>
>>> [1933/4121] Compiling source4/winbind/idmap.c
>>>
>>> [1934/4121] Linking
>>> bin/default/source4/lib/messaging/libMESSAGING-samba4.so
>>>
>>> /usr/bin/ld:
>>>
>> /install/samba-4.10.0/bin/default/source4/lib/messaging/libMESSAGING-S
>>> END-sa
>>> mba4.so: invalid string offset 1218 >=3D 1174 for section `.strtab'
>>>
>>> source4/lib/messaging/messaging.c.4.o: In function
>> `imessaging_init':
>>> messaging.c:(.text+0x1bf4): undefined reference to
>>> `imessaging_register_extra_handlers'
>>>
>>> collect2: error: ld returned 1 exit status
>>>
>>>
>>>
>>> Waf: Leaving directory `/install/samba-4.10.0/bin/default'
>>>
>>> Build failed
>>>
>>> -> task in 'MESSAGING' failed with exit status 1 (run with -v to
>>> -> display
>>> more information)
>>>
>>> Makefile:7: recipe for target 'all' failed
>>>
>>> make: *** [all] Error 1
>>>
>>>
>>>
>>> samba 4.9.4 compiled fine on the same host..
>>>
>>>
>>>
>>> here's my configure statement
>>>
>>>
>>>
>>> ./configure --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var
>>> --enable-fhs --enable-selftest --systemd-install-services
>>>
>>>
>>>
>>> Nothing changed on that host. What am I missing?
>>>
>>>
>>>
>>> Regards,
>>>
>>>
>>>
>>> Dirk
>>>
>> --
>> To unsubscribe from this list go to the following URL and read the
>> instructions:  https://lists.samba.org/mailman/options/samba
>>
>>
>> --
>> To unsubscribe from this list go to the following URL and read the
>> instructions:  https://lists.samba.org/mailman/options/samba
>>
>>
>> --
>> To unsubscribe from this list go to the following URL and read the
>> instructions:  https://lists.samba.org/mailman/options/samba
>>
>>
>
>
>

