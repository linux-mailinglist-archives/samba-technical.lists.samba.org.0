Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86952EAA6
	for <lists+samba-technical@lfdr.de>; Fri, 20 May 2022 13:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DABSzJk4HyRW8eCzqcUCZjfx9NdqOmuGolEpshpJFqg=; b=CHsSIt5VQvb38EJ6YliwKM0jXh
	IMf9hiPkD5HZxQ8bEvbDOqZ74Ns0e+FVSpPMY9mNAl+jg7pI5w9XxDB/3zR7ZJRyo70edAXpTuqL3
	1GYwzc1z3Pmx+QptSuRPmwE4uoXXlp1i0nkdPi1B/2EkVwxcF0m0aKmN8+RYtVCql38x/WHN26qY0
	pYcImQTEVruYZA6IMpJDcw3fxBJuR2PJr4ecT6I94C2EOfJETpzyr5fWnZ0J1nV4072xfcIQreZjp
	k9z3Q04VjExyF0F8dmOzwjj7Paytl8Mw1pSozNkchcUD1Gm/s6h7DUfYqPfoVjoaex5w+qNFFqltX
	nB4wZQPg==;
Received: from ip6-localhost ([::1]:22092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ns0gT-002Dym-1k; Fri, 20 May 2022 11:20:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61708) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ns0gO-002Dyd-Ku
 for samba-technical@lists.samba.org; Fri, 20 May 2022 11:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=DABSzJk4HyRW8eCzqcUCZjfx9NdqOmuGolEpshpJFqg=; b=jr87ssGx8H+BzCWv9yKqh5qvFi
 ijwGPkbvJ3Wtk0pdojmVtvGP8RwkPhZEGEnEHr0OxL+YFE927IGJbzNLoiOfMNkKtRHO1MuUAX/Y2
 MPgbFRXHhi0otE9x9yNZn1spxm/FuN85Mfv5oHciouYuaIDA6Z+iQmeGNq0SiE1x0KkrZvukYal7I
 oSYm7z11gnpylP1I9Ww8WX9oe54/KNroazlN+sn99kOuDcRpUVo8uZA612gme/Y2OVA412kggEg5T
 TSRhQmkdtu4cec60xgx7G9NjjX8afVPfXsrwUwRIjuKgrnPp6OeYtWHIsAmyIAci32SSR3UWI09Dm
 pMJzsHyDMtBPcy/yTr5uOnPUtfx+WM3mWQ4sFYsHu2ukehFoJVB8f37xdoR2Qspq4CJdpft97Ee9x
 XEnPOjJ6bgG4sfCM0RQQGcDzE2BeVGOH4/u5f5I246BOThrJmspvrnzOQunQ2abimbo4hhZcQW+ra
 87x6Axj3MXAST5JS9zy88Q7e;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ns0gN-001mQo-PJ; Fri, 20 May 2022 11:20:35 +0000
Date: Fri, 20 May 2022 14:20:33 +0300
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: Q: RUNPATH missing in libsmbldap.so but not other
 executables/libraries?
Message-ID: <Yod5gfKm2Hn4do1P@pinega.vda.li>
References: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
 <c5500558-829f-c737-278e-45f4da2b5ab1@msgid.tls.msk.ru>
 <YoaJUS5Gn0MqIl+L@pinega.vda.li>
 <c5e2be16-bd32-a758-3293-2a1c149a1b9c@msgid.tls.msk.ru>
 <4d5700cf-e39c-e387-439d-d404bc0221e7@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4d5700cf-e39c-e387-439d-d404bc0221e7@msgid.tls.msk.ru>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 20 touko 2022, Michael Tokarev wrote:
> 19.05.2022 23:15, Michael Tokarev via samba-technical wrote:
> ..
> > ....=A0 Maybe there can
> > be some automated way to detect these things. Again, maybe wafsamba
> > can help there.
>=20
> Actually it should stop listing all dependencies of dependencies in
> the link command when using shared libraries. Only static libs needs
> their dependencies in the linker command line, not the shared libs.
> This way the deps will be much more accurate because it will be
> obvious when the dep becomes missing.
>=20
> At the same time it should be possible to fix the random order of
> the link-line arguments too.
>=20
> Alexander, do you know maybe just a little bit how wafsamba works?
> In particular, where does it expand dependencies recursively, and
> how to tell it to stop the recursion if the given dependency is
> a shared library?

See buildtools/wafsamba/samba_deps.py for build_dependencies(),
expand_subsystem_deps(), build_direct_deps(). They are called in
buildtools/wafsamba/samba_deps.py:check_project_rules() among with other
generators and sets up attributes on the targets to build.

There are enough debug() statements there so that if you'd run waf in
debug mode, you'll see their output:

 MAKEFLAGS=3DV=3D3 PYTHONHASHSEED=3D1 WAF_MAKE=3D1 python buildtools/bin/waf

I'd recommend redirect this output somewhere and process it separately.

Unfortunately, it is currently broken due to how test for spotlight
integration is implemented: it links directly es_parser which is
autogenerated and is also linked by the mdssvc RPC binary. This means
there are two places which implicitly create es_parser.tab.c file:

* Node /src/samba/bin/default/source3/rpc_server/mdssvc/es_parser.tab.c is =
created more than once. The task generators are:
  File '/src/samba/./buildtools/bin/waf', line 166, in <module>

Additionally, you should not use configure.developer as that will break
WAF in V=3D3.

Anyway, you'd get something like this:

$ grep 'target smbldap' samba.log
14:13:03 deps target smbldaphelper.objlist: does not require builtin depend=
encies...
14:13:03 deps target smbldaphelper: does not require builtin dependencies...
14:13:03 deps target smbldap.objlist: does not require builtin dependencies=
=2E..
14:13:03 deps target smbldap.objlist: keep SYSLIB dependency ldap
14:13:03 deps target smbldap.objlist: keep SYSLIB dependency lber
14:13:03 deps target smbldap: does not require builtin dependencies...
14:13:03 deps target smbldap: keep SYSLIB dependency ldap
14:13:03 deps target smbldap: keep SYSLIB dependency lber
14:13:03 deps Expanded target smbldaphelper.objlist includes of type SUBSYS=
TEM from loop ldbsamba by {'ldbsamba.objlist', 'SAMDB_SCHEMA'}
14:13:03 deps Expanded target smbldaphelper includes of type LIBRARY from l=
oop ldbsamba by {'ldbsamba.objlist', 'SAMDB_SCHEMA'}
14:13:03 deps computed dependencies for target smbldaphelper: uselib=3D['ld=
ap', 'lber'] uselib_local=3D['smbldap', 'secrets3'] add_objects=3D['smbldap=
helper.objlist']
14:13:03 deps computed dependencies for target smbldap: uselib=3D['ldap', '=
lber', 'cap', 'talloc'] uselib_local=3D['samba-util', 'smbconf'] add_object=
s=3D['smbldap.objlist']
14:13:04 deps includes for target smbldaphelper.objlist: includes=3D['#sour=
ce3', '#source3/include', '#source3/lib', '#third_party/heimdal/lib/com_err=
', '#third_party/heimdal/lib/base', '#third_party/heimdal/lib/krb5', '#thir=
d_party/heimdal/lib/gssapi/gssapi', '#third_party/heimdal_build/include', '=
#bin/default/third_party/heimdal/lib/asn1', '#lib/tevent', '#include/public=
', '#source4', '#lib', '#source4/lib', '#source4/include', '#include', '#li=
b/replace', '#', '#librpc', '#libcli/registry', '#third_party/heimdal/lib/a=
sn1', '#third_party/heimdal_build', '#source3/param', '#lib/util/home/aboko=
voy/src/samba/third_party/gpfs', '#libcli/auth', '#lib/messaging', '#lib/db=
wrap', '#source4/auth/kerberos', '#libcli/security', '#third_party/heimdal/=
lib/wind', '#third_party/heimdal/lib/roken', '#third_party/heimdal/include'=
, '#lib/pthreadpool', '#dynconfig', '#auth/credentials', '#lib/param', '#th=
ird_party/heimdal/lib/hx509', '#third_party/heimdal/lib/hcrypto', '#third_p=
arty/heimdal/lib', '#libcli/lsarpc', '#source4/lib/socket', '#libcli/util',=
 '#source4/lib/messaging', '#third_party/heimdal/lib/ipc', '#lib/socket', '=
#lib/crypto', '#source4/dsdb', '#source4/lib/tls', '#libds/common', '#sourc=
e4/libcli', '#source3/librpc', '#lib/krb5_wrap', '#lib/ldb-samba', '#third_=
party/heimdal/lib/gssapi/spnego', '#third_party/heimdal/lib/gssapi/krb5', '=
#third_party/heimdal/lib/gssapi/mech', '#third_party/heimdal/lib/ntlm', '#s=
ource4/lib/events', '#libcli/ldap', '#lib/smbconf', '#lib/ldb/include', '#l=
ib/ldb', '#third_party/heimdal/lib/gssapi', '#auth', '#lib/util/charset', '=
#source4/cluster', '#auth/kerberos', '#source4/lib/stream', '#source4/param=
', '#lib/tsocket', '#libcli/nbt', '#lib/audit_logging', '#lib/compression',=
 '#lib/async_req', '#third_party/heimdal/lib/hcrypto/libtommath']
14:13:04 deps includes for target smbldaphelper: includes=3D['#source3', '#=
source3/include', '#source3/lib', '#third_party/heimdal/lib/com_err', '#thi=
rd_party/heimdal/lib/base', '#third_party/heimdal/lib/krb5', '#third_party/=
heimdal/lib/gssapi/gssapi', '#third_party/heimdal_build/include', '#bin/def=
ault/third_party/heimdal/lib/asn1', '#lib/tevent', '#include/public', '#sou=
rce4', '#lib', '#source4/lib', '#source4/include', '#include', '#lib/replac=
e', '#', '#librpc', '#libcli/registry', '#third_party/heimdal/lib/asn1', '#=
third_party/heimdal_build', '#source3/param', '#lib/util/home/abokovoy/src/=
samba/third_party/gpfs', '#libcli/auth', '#lib/messaging', '#lib/dbwrap', '=
#source4/auth/kerberos', '#libcli/security', '#third_party/heimdal/lib/wind=
', '#third_party/heimdal/lib/roken', '#third_party/heimdal/include', '#lib/=
pthreadpool', '#dynconfig', '#auth/credentials', '#lib/param', '#third_part=
y/heimdal/lib/hx509', '#third_party/heimdal/lib/hcrypto', '#third_party/hei=
mdal/lib', '#libcli/lsarpc', '#source4/lib/socket', '#libcli/util', '#sourc=
e4/lib/messaging', '#third_party/heimdal/lib/ipc', '#lib/socket', '#lib/cry=
pto', '#source4/dsdb', '#source4/lib/tls', '#libds/common', '#source4/libcl=
i', '#source3/librpc', '#lib/krb5_wrap', '#lib/ldb-samba', '#third_party/he=
imdal/lib/gssapi/spnego', '#third_party/heimdal/lib/gssapi/krb5', '#third_p=
arty/heimdal/lib/gssapi/mech', '#third_party/heimdal/lib/ntlm', '#source4/l=
ib/events', '#libcli/ldap', '#lib/smbconf', '#lib/ldb/include', '#lib/ldb',=
 '#third_party/heimdal/lib/gssapi', '#auth', '#lib/util/charset', '#source4=
/cluster', '#auth/kerberos', '#source4/lib/stream', '#source4/param', '#lib=
/tsocket', '#libcli/nbt', '#lib/audit_logging', '#lib/compression', '#lib/a=
sync_req', '#third_party/heimdal/lib/hcrypto/libtommath']
14:13:04 deps includes for target smbldap.objlist: includes=3D['#source3', =
'#source3/include', '#source3/lib', '#third_party/heimdal/lib/com_err', '#t=
hird_party/heimdal/lib/base', '#third_party/heimdal/lib/krb5', '#third_part=
y/heimdal/lib/gssapi/gssapi', '#third_party/heimdal_build/include', '#bin/d=
efault/third_party/heimdal/lib/asn1', '#lib/tevent', '#include/public', '#s=
ource4', '#lib', '#source4/lib', '#source4/include', '#include', '#lib/repl=
ace', '#', '#librpc', '#libcli/registry', '#source3/param', '#lib/util/home=
/abokovoy/src/samba/third_party/gpfs', '#lib/messaging', '#lib/dbwrap', '#l=
ibcli/security', '#lib/pthreadpool', '#third_party/heimdal/lib/roken', '#th=
ird_party/heimdal/include', '#third_party/heimdal_build', '#dynconfig', '#l=
ib/param', '#source4/lib/socket', '#libcli/util', '#lib/socket', '#lib/cryp=
to', '#source4/libcli', '#source4/lib/events', '#lib/smbconf', '#lib/util/c=
harset', '#lib/tsocket', '#libcli/nbt', '#lib/async_req']
14:13:04 deps includes for target smbldap: includes=3D['#source3', '#source=
3/include', '#source3/lib', '#third_party/heimdal/lib/com_err', '#third_par=
ty/heimdal/lib/base', '#third_party/heimdal/lib/krb5', '#third_party/heimda=
l/lib/gssapi/gssapi', '#third_party/heimdal_build/include', '#bin/default/t=
hird_party/heimdal/lib/asn1', '#lib/tevent', '#include/public', '#source4',=
 '#lib', '#source4/lib', '#source4/include', '#include', '#lib/replace', '#=
', '#librpc', '#libcli/registry', '#source3/param', '#lib/util/home/abokovo=
y/src/samba/third_party/gpfs', '#lib/messaging', '#lib/dbwrap', '#libcli/se=
curity', '#lib/pthreadpool', '#third_party/heimdal/lib/roken', '#third_part=
y/heimdal/include', '#third_party/heimdal_build', '#dynconfig', '#lib/param=
', '#source4/lib/socket', '#libcli/util', '#lib/socket', '#lib/crypto', '#s=
ource4/libcli', '#source4/lib/events', '#lib/smbconf', '#lib/util/charset',=
 '#lib/tsocket', '#libcli/nbt', '#lib/async_req']
14:13:06 deps final dependencies for target smbldaphelper.objlist: uselib=
=3D['LDAP', 'LBER', 'CAP', 'TALLOC', 'TDB'] uselib_local=3D[] add_objects=
=3D[]
14:13:06 deps final dependencies for target smbldaphelper: uselib=3D['LDAP'=
, 'LBER'] uselib_local=3D['smbldap', 'secrets3'] add_objects=3D['smbldaphel=
per.objlist']
14:13:06 deps final dependencies for target smbldap.objlist: uselib=3D['CAP=
', 'TALLOC', 'LDAP', 'LBER', 'ICUI18N', 'LIBUNWIND', 'SYSTEMD', 'ICUDATA', =
'GNUTLS', 'ICUUC', 'TDB', 'CUPS', 'Z'] uselib_local=3D[] add_objects=3D[]
14:13:06 deps final dependencies for target smbldap: uselib=3D['LDAP', 'LBE=
R', 'CAP', 'TALLOC'] uselib_local=3D['samba-util', 'smbconf'] add_objects=
=3D['smbldap.objlist']


--=20
/ Alexander Bokovoy

