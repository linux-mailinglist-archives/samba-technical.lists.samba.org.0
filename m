Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D861496E0
	for <lists+samba-technical@lfdr.de>; Sat, 25 Jan 2020 18:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=48zEOf1LQtgNYdr1T0QgkFuVTcT57+parqyoXciLcVM=; b=EyKqXJCg+iy9hMSh83p+9or8Bs
	c3oPc01sTnOmHG0ReDeVax5fnCZbatmhB0Ce7uUlD3tTb0Dw2Bi9zhl/s1N7UKdlAzBDvLCK0PJm2
	MCym+kJi8YK7hx2TetpMmJdY/JUUaPJG4HnFGHqSGRIfAsozFjIodcmTZS6upm1nFIkROVL0+7wbZ
	UqHmyot+VWO8PrUAaqk01xyF/VwcBPMwk7Bu88StgeQrTEqQNUADC4r8MxW5CWxg4HuIa9CuvPp1q
	2JYJ03NFebwzZTzDzwaogSADMFac7wo1nMyaJri0XnmkgQFBEqBpzTNRdcNZCrXTMPKr84gG2yUiM
	OAHAqogQ==;
Received: from localhost ([::1]:30116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ivPDb-004jUv-Is; Sat, 25 Jan 2020 17:27:35 +0000
Received: from mout.gmx.net ([212.227.17.21]:37709) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ivPDW-004jUo-Aw
 for samba-technical@lists.samba.org; Sat, 25 Jan 2020 17:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1579973247;
 bh=48zEOf1LQtgNYdr1T0QgkFuVTcT57+parqyoXciLcVM=;
 h=X-UI-Sender-Class:From:Subject:Date:To;
 b=blLIxXyMMGEoqPt6EBMnvReYfwySvGXS7JXC+ve/55fUJ5Ow1eXq5/vVCVkh/EOMU
 w/WSeAsVdonol0aasiNaNG2gh+Bu+lJ57b4N6DKOteCWRxBurVKtOcL4Zbleo1CELY
 A8FySGIBMG/snPi/2ElVFIa5Aid+0Xpjxw5dqHiQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.47.100] ([217.254.213.125]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1jiMef0G2s-014hUE
 for
 <samba-technical@lists.samba.org>; Sat, 25 Jan 2020 18:14:27 +0100
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: regshell.c: compiler uses -m32 as well as -m64
Message-Id: <F2128FA3-16EC-428F-8E37-447C96E99F90@gmx.net>
Date: Sat, 25 Jan 2020 18:14:26 +0100
To: samba-technical <samba-technical@lists.samba.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Provags-ID: V03:K1:FBDg2sR1C3jdb09UujT6JpwX8+TrrImFPjit8Q9xDMxbIoHMA5s
 I/7NchkgsZgQ6T5nQ2Q+GruPYQd+noVyHa3DEMZgQXYhYN/9LJS/mbLChyefiVh3YWuAJ/A
 u2fHoyckVPTGhldtZiYZbDR0tWlrGdfEwPk9/M0PFq1miyYqHElTECcEe0MIaWYGVjXOy4t
 klKrh4JFTGmBjw+k4IFLA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wLFHzLURyqw=:ZBysd7Zb9yD8z0DkF8psNE
 r0cJu/v9s6eQSskNVR44X52VmVuU5dftroYzovvZS9vN2fLBFzLJlaZVeepVYq6MJe1SE9p5Z
 /+Hg60/h6LMJeukwHsVL42UhAvyWp2S6NNv+0MdZZ3tAgGRdZUbR64bFKQjg+NMKd0Q1zZ8sJ
 mon2iShu2WEd4dlyPkJxuFO1OwhpojuMFEVgbnD9ax7xTui2UqnH358rpyYdWGLTpofVajCOL
 8Og3iDa2p06WCOm2EgnGGN9Zg/HONHYb29HMpbTdWvIUXt/FmklW1lmERGKloFhCMBdV/YVRc
 qF/98Z6R1Gfly/93mFlrC/8MG1sfNdybapQ0PELYExNPbITIdfYUMw1DfwqRqC1tK81NTSZFf
 2wbNseCw3E6kaeHko8/fBJE+NRBCWhmOvU0bHeBe+QLu0XsIQgmMmBQb9ueVl35W+sR4fax62
 yem4bmmnFRRaWKyN35XwUgSPfNw3VW0CpJwO+w7i7dFbUsHSwz6rYtcxIG20/eFxyCcPi9t77
 CUlPjotwOBBzg39xIPJH+erx4RKYI7dii/09v6VaK7OQWH337E3iALI02tEQ/u981i6kdrpQ1
 O8yYvGtpcpS1sw4ziWUOHVArwdzSzOZypheIFI3T84DOJ7dYw6JK3MtzeiZNHDuITCVjAotFx
 RCm4qYCUSn824eIAmys7l0/Cmg2f0bgM/9Bw0h9akDuoW62SDNSJQssZLA0zG8vGlIjv75GQk
 wkwyFroDqelnuAvey70iQyFW7vHHz7uvVDd7VhOtsAD9wNOZ133wKfOfsaRKmA0MzvKiEmew/
 8lfh3byI1e9vq0DJ0RI0ouhq/15vupA9AgknyFBhLWTWqZ3zjQtQzwxAbGf8McIB5Vi3vydlk
 W/DBIqgAjoncFw+d4EWmn5bQHQR6kkBdF8+FG2w5fZr/luWiMA9vCV6JpVHfTJIhrm919tJyv
 erR6ijiUscvf5hroeXc49bfGk7hBJRvxcD1gv/cNveLoxhZ6+6OyQwDmOKYzT86MVUikLZ+fU
 jAwiclHCp0Hy3T7xC7cOczB2PLKsVntfEvqdpdhgjWRdCKgnndtHvGJUlETy3l/lisvEtZjQY
 MmOk2DO8bKCpz+93064RqbWpbk7BMY7fRPeGxQabxuX1l+BzF1TrloAjhC6obG/GtC0qb1cwz
 bZfbceUWkKgIpvNEq8NwRo6k6JjYn+C5iQMhmkzhO7JX6PGKJUHoljTM8qkhplwlkggFz4M03
 rzUAWQM7LphhUT5fe
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
From: Rouven WEILER via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rouven WEILER <Rouven_Weiler@gmx.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I tried to compile samba-4.11.5 using "-m64=E2=80=9C since it is a 64bit =
system.
The most parts compile and link well.

regshell.c does not. In the compiler command I find a "-m64" as well as =
a "-m32=E2=80=9C.

Can someone help me to dig that down so that I can get that compiled? I =
do not find the respective code lines.

Here the code (I tried to point out the two statements:

[2770/3882] Compiling source4/lib/registry/tools/regshell.c
17:19:42 runner ['/usr/gcc/6/bin/gcc', '-m64', '-D_SAMBA_BUILD_=3D4', =
'-DHAVE_CONFIG_H=3D1=E2=80=98,
 '-m64=E2=80=98,
 '-O3', '-std=3Dc99', '-D_POSIX_PTHREAD_SEMANTICS', '-MMD', =
'-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1', =
'-DHAVE_CONFIG_H=3D1', '-fPIC', '-D__STDC_WANT_LIB_EXT1__=3D1', =
'-D_LARGEFILE_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-D_REENTRANT', =
'-DSTATIC_regshell_MODULES=3DNULL', =
'-DSTATIC_regshell_MODULES_PROTO=3Dextern void =
__regshell_dummy_module_proto(void)=E2=80=98,
'-m32=E2=80=98,
 '-Isource4/lib/registry', '-I../../source4/lib/registry', =
'-Iinclude/public', '-I../../include/public', '-Isource4', =
'-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib', =
'-I../../source4/lib', '-Isource4/include', '-I../../source4/include', =
'-Iinclude', '-I../../include', '-Ilib/replace', '-I../../lib/replace', =
'-I.', '-I../..', '-Ilib/crypto', '-I../../lib/crypto', '-Ilibrpc', =
'-I../../librpc', '-Isource4/param', '-I../../source4/param', =
'-Isource4/heimdal/lib/asn1', '-I../../source4/heimdal/lib/asn1', =
'-Isource4/heimdal_build', '-I../../source4/heimdal_build', =
'-Isource4/lib/cmdline', '-I../../source4/lib/cmdline', '-Isource3', =
'-I../../source3', '-Isource3/include', '-I../../source3/include', =
'-Isource3/lib', '-I../../source3/lib', '-Isource4/heimdal/lib/com_err', =
'-I../../source4/heimdal/lib/com_err', '-Isource4/heimdal/lib/krb5', =
'-I../../source4/heimdal/lib/krb5', '-Isource4/heimdal/lib/gssapi', =
'-I../../source4/heimdal/lib/gssapi', =
'-Ibin/default/source4/heimdal/lib/asn1', '-Isource4/heimdal/lib/asn1', =
'-Ilib/tdb/include', '-I../../lib/tdb/include', '-Ilib/tevent', =
'-I../../lib/tevent', '-Ilib/talloc', '-I../../lib/talloc', =
'-Ilib/popt', '-I../../lib/popt', '-Ilibcli/netlogon', =
'-I../../libcli/netlogon', '-Isource4/libcli', '-I../../source4/libcli', =
'-Ilib/util/charset', '-I../../lib/util/charset', '-Isource4/auth', =
'-I../../source4/auth', '-Ilibcli/auth', '-I../../libcli/auth', =
'-Isource4/heimdal/lib/hcrypto', '-I../../source4/heimdal/lib/hcrypto', =
'-Isource4/heimdal/lib', '-I../../source4/heimdal/lib', =
'-Isource4/heimdal/include', '-I../../source4/heimdal/include', =
'-Ilib/ldb/include', '-I../../lib/ldb/include', '-Ilib/ldb', =
'-I../../lib/ldb', '-Ilib/dbwrap', '-I../../lib/dbwrap', =
'-Ilibds/common', '-I../../libds/common', '-Isource4/auth/kerberos', =
'-I../../source4/auth/kerberos', '-Iauth/credentials', =
'-I../../auth/credentials', '-Isource4/lib/socket', =
'-I../../source4/lib/socket', '-Isource4/auth/gensec', =
'-I../../source4/auth/gensec', '-Isource4/cluster', =
'-I../../source4/cluster', '-Isource4/heimdal/lib/wind', =
'-I../../source4/heimdal/lib/wind', '-Ilib/async_req', =
'-I../../lib/async_req', '-Isource4/dsdb', '-I../../source4/dsdb', =
'-Iauth', '-I../../auth', '-Isource4/heimdal/lib/hx509', =
'-I../../source4/heimdal/lib/hx509', '-Ilibcli/util', =
'-I../../libcli/util', '-Isource4/lib/http', '-I../../source4/lib/http', =
'-Ilib/param', '-I../../lib/param', '-Ilibcli/smb', =
'-I../../libcli/smb', '-Ithird_party/popt', '-I../../third_party/popt', =
'-Ilibcli/smbreadline', '-I../../libcli/smbreadline', '-Ilib/ldb-samba', =
'-I../../lib/ldb-samba', '-Ithird_party/zlib', =
'-I../../third_party/zlib', '-Ilibcli/security', =
'-I../../libcli/security', '-Ilib/socket', '-I../../lib/socket', =
'-Ilibcli/nbt', '-I../../libcli/nbt', '-Isource3/librpc', =
'-I../../source3/librpc', '-Isource4/lib/messaging', =
'-I../../source4/lib/messaging', '-Isource3/param', =
'-I../../source3/param', '-Iauth/gensec', '-I../../auth/gensec', =
'-Ilib/tdr', '-I../../lib/tdr', '-Isource4/heimdal/lib/gssapi/gssapi', =
'-I../../source4/heimdal/lib/gssapi/gssapi', =
'-Isource4/heimdal/lib/gssapi/spnego', =
'-I../../source4/heimdal/lib/gssapi/spnego', =
'-Isource4/heimdal/lib/gssapi/krb5', =
'-I../../source4/heimdal/lib/gssapi/krb5', =
'-Isource4/heimdal/lib/gssapi/mech', =
'-I../../source4/heimdal/lib/gssapi/mech', '-Ilibcli/cldap', =
'-I../../libcli/cldap', '-Isource4/heimdal/lib/roken', =
'-I../../source4/heimdal/lib/roken', '-Isource4/libcli/ldap', =
'-I../../source4/libcli/ldap', '-Ilib/smbconf', '-I../../lib/smbconf', =
'-Insswitch/libwbclient', '-I../../nsswitch/libwbclient', '-Insswitch', =
'-I../../nsswitch', '-Ilib/audit_logging', '-I../../lib/audit_logging', =
'-Ilib/tsocket', '-I../../lib/tsocket', '-Ilib/compression', =
'-I../../lib/compression', '-Isource4/lib/stream', =
'-I../../source4/lib/stream', '-Ilibcli/registry', =
'-I../../libcli/registry', '-Iauth/kerberos', '-I../../auth/kerberos', =
'-Ilib/addns', '-I../../lib/addns', '-Ilibcli/drsuapi', =
'-I../../libcli/drsuapi', '-Isource4/lib/tls', =
'-I../../source4/lib/tls', '-Isource4/lib/events', =
'-I../../source4/lib/events', =
'-Isource4/heimdal/lib/hcrypto/libtommath', =
'-I../../source4/heimdal/lib/hcrypto/libtommath', '-Ilibcli/dns', =
'-I../../libcli/dns', '-Isource4/heimdal/base', =
'-I../../source4/heimdal/base', '-Iauth/ntlmssp', =
'-I../../auth/ntlmssp', '-Ilibcli/ldap', '-I../../libcli/ldap', =
'-Ilib/krb5_wrap', '-I../../lib/krb5_wrap', '-Ilib/tdb', =
'-I../../lib/tdb', '-Isource4/librpc', '-I../../source4/librpc', =
'-Ilibcli/lsarpc', '-I../../libcli/lsarpc', '-Ilib/pthreadpool', =
'-I../../lib/pthreadpool', '-Isource4/libcli/smb2', =
'-I../../source4/libcli/smb2', '-Idynconfig', '-I../../dynconfig', =
'-I/usr/include/p11-kit-1', '-I/usr/include/ncurses/ncurses', =
'-I/usr/include/ncurses', '-I/usr/include/jansson', '-D__EXTENSIONS__', =
'-D_XPG6', '../../source4/lib/registry/tools/regshell.c', '-c', =
'-o/export/home/github.com/oi-userland.git/components/network/samba/build/=
amd64/bin/default/source4/lib/registry/tools/regshell.c.15.o', =
'-D_LARGEFILE64_SOURCE', '-D_XOPEN_SOURCE=3D600', '-D__EXTENSIONS__=3D1', =
'-D_XPG6', '-I/usr/include/openldap']


