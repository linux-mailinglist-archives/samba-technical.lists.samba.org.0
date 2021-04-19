Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD64363F5F
	for <lists+samba-technical@lfdr.de>; Mon, 19 Apr 2021 12:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=e5TKPswAl4zukI19VogEFtoghFWGgCqv7l8iHboAHfo=; b=Z7vZJIy+41QduAhfIYSMUFKDPR
	k2XFJI4rBWo+f6poi6SjDaNYSiukk9H95bsXlshTpLa++U20xWbUUKKooauEeYiAxWogjuRfmmYU8
	6FgTpfzSbmJCg6sz9i+X4d3eVDsvY4oNPZZMkQ6l2Li89SOmlTejxL/5YI+EuX+3oAD8JW3nFSLZs
	vxlJmf7lCRrqAvBV5tlZRP9rJurOBNdod1pmeYSSeuMbaifOq8CurB+Q3gHW//DNJ5d4giKOjbPyh
	x2chOAYYZfyF51Yy4vt0l2edpQiQR/sT/0bf40oPJ9gnvkp2Xqy2j4CNj36MFGrvsIhxhcgnLMrkw
	aGANGCuA==;
Received: from ip6-localhost ([::1]:38064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lYQtJ-00Bgf9-Mr; Mon, 19 Apr 2021 10:12:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35726) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lYQtC-00Bgf1-BE
 for samba-technical@lists.samba.org; Mon, 19 Apr 2021 10:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=e5TKPswAl4zukI19VogEFtoghFWGgCqv7l8iHboAHfo=; b=Cp7gvO7fWGTU1wGAo+gC80JGmX
 z6qbWgBfJKjSwYC0WrpYjWInIEpxiSxJuze/TMbg8mFp1ECWBH918YHn+m5Hr4VKQwa2cNg3mtiYu
 DlOmMGQhmDQ0ymM2xvC1RD90qAdp9e4N/2HIwkoSNAqpU+DIE8PR1BUeKl9BHXu8j4C9gJ+9I8znT
 X6XNOs5uWhFT3Tn8DbgJrP0w18o6YK3p1tOXx4Tn1tAPgMB23NBbKC8H6xzK/oQvfzmdb/GCCRME5
 8h10168I4279xw8StALaREvw3eT6pscSpYeqhE30AU25lu5exksMJy5CoDYoKBf7V9l6XyeIpkaPX
 FEX4TUgS4YtwUlXxKvTksB22Lf3mFZvuQ7vqVy9Al+5FYt4L8ObEB42xDOu8gBdfbdYbzUZN/GeqA
 fBK2erOBtyPsoZj25+3dwb74ItFsqQ5E0nAHXjPcGJ5NllSiY+9TORReCB6t1GhRuE1ioEBR9QTdh
 hwtBvkfiI8HLsXfWffsFVn49;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lYQtA-0007rz-P6
 for samba-technical@lists.samba.org; Mon, 19 Apr 2021 10:12:20 +0000
To: <samba-technical@lists.samba.org>
Subject: FW: [Pkg-samba-maint] vfs_zfsacl module on Debian
Date: Mon, 19 Apr 2021 12:12:20 +0200
Message-ID: <8B08460B0CDF4DB786D338094DF99F90@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 11
Thread-Index: Adc1BHrToHhb6kEDS3eA53KGbYZkNA==
X-MimeOLE: Produced By Microsoft MimeOLE
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai,=20

Just a question here. I notice in the debian samba bugreports a message =
on
ZFSACL.=20
I thought i'll try to add this one to my packages since i have had more
messages on ZFSACL.=20

Now, libzfslinux-dev is included in build depends, but it keeps failing =
at
this point.=20
I've added the build log part of there its going wrong.=20
If anyone has a hint why this is and what i might be missing, that would =
be
nice.=20

 unknown type name 'ace_t'  thats my key here in finding why building
failes.=20

Logs below.=20

Thanks in advance.=20

Louis

[3562/4228] Compiling source3/modules/nfs4acl_xattr_nfs.c
07:44:27 runner ['/usr/lib/ccache/gcc', '-D_SAMBA_BUILD_=3D4',
'-DHAVE_CONFIG_H=3D1', '-g', '-O2',
'-fdebug-prefix-map=3D/build/samba-4.14.2+dfsg=3D.', =
'-fstack-protector-strong',
'-Wformat', '-Werror=3Dformat-security', '-MMD', '-D_GNU_SOURCE=3D1',
'-D_XOPEN_SOURCE_EXTENDED=3D1', '-DHAVE_CONFIG_H=3D1', '-fPIC',
'-D__STDC_WANT_LIB_EXT1__=3D1', '-D_REENTRANT',
'-DCTDB_HELPER_BINDIR=3D"/usr/lib/x86_64-linux-gnu/ctdb"',
'-DLOGDIR=3D"/var/log/ctdb"', '-DCTDB_DATADIR=3D"/usr/share/ctdb"',
'-DCTDB_ETCDIR=3D"/etc/ctdb"', '-DCTDB_VARDIR=3D"/var/lib/ctdb"',
'-DCTDB_RUNDIR=3D"/var/run/ctdb"', '-fstack-protector-strong',
'-fstack-clash-protection', '-DSTATIC_vfs_nfs4acl_xattr_MODULES=3DNULL',
'-DSTATIC_vfs_nfs4acl_xattr_MODULES_PROTO=3Dextern void
__vfs_nfs4acl_xattr_dummy_module_proto(void)', '-pthread', '-pthread',
'-Isource3/modules', '-I../../source3/modules', '-Isource3',
'-I../../source3', '-Isource3/include', '-I../../source3/include',
'-Isource3/lib', '-I../../source3/lib', '-Isource4/heimdal/lib/com_err',
'-I../../source4/heimdal/lib/com_err', '-Isource4/heimdal/lib/krb5',
'-I../../source4/heimdal/lib/krb5', '-Isource4/heimdal/lib/gssapi',
'-I../../source4/heimdal/lib/gssapi', =
'-Isource4/heimdal/lib/gssapi/gssapi',
'-I../../source4/heimdal/lib/gssapi/gssapi',
'-Isource4/heimdal_build/include', =
'-I../../source4/heimdal_build/include',
'-Ibin/default/source4/heimdal/lib/asn1', '-Isource4/heimdal/lib/asn1',
'-Iinclude/public', '-I../../include/public', '-Isource4',
'-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
'-I../../source4/lib', '-Isource4/include', '-I../../source4/include',
'-Iinclude', '-I../../include', '-Ilib/replace', '-I../../lib/replace',
'-Ictdb/include', '-I../../ctdb/include', '-Ictdb', '-I../../ctdb', =
'-I.',
'-I../..', '-Isource3/auth', '-I../../source3/auth', '-Ilib/param',
'-I../../lib/param', '-Ilibcli/named_pipe_auth',
'-I../../libcli/named_pipe_auth', '-Isource3/librpc',
'-I../../source3/librpc', '-Ilibrpc', '-I../../librpc', =
'-Isource4/cluster',
'-I../../source4/cluster', '-Ilibcli/dns', '-I../../libcli/dns',
'-Isource3/rpc_server', '-I../../source3/rpc_server', '-Iauth/gensec',
'-I../../auth/gensec', '-Isource3/param', '-I../../source3/param',
'-Ilibcli/util', '-I../../libcli/util', '-Isource4/auth/kerberos',
'-I../../source4/auth/kerberos', '-Isource4/heimdal/lib/hcrypto',
'-I../../source4/heimdal/lib/hcrypto', '-Isource4/heimdal/lib',
'-I../../source4/heimdal/lib', '-Isource4/heimdal/include',
'-I../../source4/heimdal/include', '-Isource4/heimdal_build',
'-I../../source4/heimdal_build', '-Iauth/ntlmssp', =
'-I../../auth/ntlmssp',
'-Isource3/passdb', '-I../../source3/passdb', '-Isource4/libcli/smb2',
'-I../../source4/libcli/smb2', '-Isource4/lib/socket',
'-I../../source4/lib/socket', '-Isource4/heimdal/lib/roken',
'-I../../source4/heimdal/lib/roken', '-Ilibcli/nbt', =
'-I../../libcli/nbt',
'-Ilibcli/auth', '-I../../libcli/auth', '-Ilibcli/http',
'-I../../libcli/http', '-Ilib/audit_logging', =
'-I../../lib/audit_logging',
'-Ilib/krb5_wrap', '-I../../lib/krb5_wrap', '-Isource4/librpc',
'-I../../source4/librpc', '-Ilibcli/lsarpc', '-I../../libcli/lsarpc',
'-Isource4/dsdb', '-I../../source4/dsdb', '-Ilibcli/smb',
'-I../../libcli/smb', '-Isource4/libcli', '-I../../source4/libcli',
'-Isource4/auth', '-I../../source4/auth', '-Iauth/kerberos',
'-I../../auth/kerberos', '-Isource4/heimdal/lib/asn1',
'-I../../source4/heimdal/lib/asn1', '-Isource4/libcli/ldap',
'-I../../source4/libcli/ldap', '-Isource3/smbd/notifyd',
'-I../../source3/smbd/notifyd', '-Ilib/ldb-samba', =
'-I../../lib/ldb-samba',
'-Ilibcli/ldap', '-I../../libcli/ldap', '-Insswitch', =
'-I../../nsswitch',
'-Iauth/credentials', '-I../../auth/credentials', '-Isource4/lib/tls',
'-I../../source4/lib/tls', '-Isource4/auth/gensec',
'-I../../source4/auth/gensec', '-Ilib/socket', '-I../../lib/socket',
'-Isource4/lib/messaging', '-I../../source4/lib/messaging', =
'-Ilib/addns',
'-I../../lib/addns', '-Ilibcli/cldap', '-I../../libcli/cldap',
'-Isource4/heimdal/lib/hcrypto/libtommath',
'-I../../source4/heimdal/lib/hcrypto/libtommath', '-Ilib/dbwrap',
'-I../../lib/dbwrap', '-Isource4/winbind', '-I../../source4/winbind',
'-Ilibcli/security', '-I../../libcli/security',
'-Isource4/heimdal/lib/wind', '-I../../source4/heimdal/lib/wind',
'-Isource4/param', '-I../../source4/param', '-Ilib/tsocket',
'-I../../lib/tsocket', '-Isource4/lib/events', =
'-I../../source4/lib/events',
'-Isource4/heimdal/lib/hx509', '-I../../source4/heimdal/lib/hx509',
'-Insswitch/libwbclient', '-I../../nsswitch/libwbclient', =
'-Ilib/messaging',
'-I../../lib/messaging', '-Isource4/heimdal/base',
'-I../../source4/heimdal/base', '-Isource4/lib/stream',
'-I../../source4/lib/stream', '-Ilib/util/charset',
'-I../../lib/util/charset', '-Idynconfig', '-I../../dynconfig', =
'-Iauth',
'-I../../auth', '-Ilib/afs', '-I../../lib/afs',
'-Isource4/heimdal/lib/gssapi/spnego',
'-I../../source4/heimdal/lib/gssapi/spnego',
'-Isource4/heimdal/lib/gssapi/krb5',
'-I../../source4/heimdal/lib/gssapi/krb5',
'-Isource4/heimdal/lib/gssapi/mech',
'-I../../source4/heimdal/lib/gssapi/mech', '-Ilibcli/registry',
'-I../../libcli/registry', '-Ilib/crypto', '-I../../lib/crypto',
'-Ilib/smbconf', '-I../../lib/smbconf', '-Ilib/async_req',
'-I../../lib/async_req',
'-Ilib/util/build/samba-4.14.2+dfsg/third_party/gpfs',
'-I../../lib/util/build/samba-4.14.2+dfsg/third_party/gpfs',
'-Ilibcli/drsuapi', '-I../../libcli/drsuapi', '-Ilibds/common',
'-I../../libds/common', '-Ilib/pthreadpool', '-I../../lib/pthreadpool',
'-Ilib/compression', '-I../../lib/compression', '-Ilibcli/netlogon',
'-I../../libcli/netlogon', '-I/usr/include/p11-kit-1',
'-I/usr/include/glib-2.0', =
'-I/usr/lib/x86_64-linux-gnu/glib-2.0/include',
'-I/usr/include/tracker-2.0',
'-I/usr/include/tracker-2.0/libtracker-sparql', =
'-I/usr/include/libmount',
'-I/usr/include/blkid', '-I/usr/include/uuid',
'../../source3/modules/nfs4acl_xattr_nfs.c', '-c',
'-o/build/samba-4.14.2+dfsg/bin/default/source3/modules/nfs4acl_xattr_nfs=
.c.
47.o', '-Wdate-time', '-D_FORTIFY_SOURCE=3D2']
../../source3/modules/vfs_zfsacl.c:53:17: error: unknown type name =
'ace_t'
           const ace_t *acebuf,
                 ^~~~~
../../source3/modules/vfs_zfsacl.c: In function 'zfs_get_nt_acl_common':
../../source3/modules/vfs_zfsacl.c:92:42: error: request for member =
'a_type'
in something not a structure or union
   aceprop.aceType  =3D (uint32_t) acebuf[i].a_type;
                                          ^
../../source3/modules/vfs_zfsacl.c:93:42: error: request for member
'a_flags' in something not a structure or union
   aceprop.aceFlags =3D (uint32_t) acebuf[i].a_flags;
                                          ^
../../source3/modules/vfs_zfsacl.c:94:42: error: request for member
'a_access_mask' in something not a structure or union
   aceprop.aceMask  =3D (uint32_t) acebuf[i].a_access_mask;
                                          ^
../../source3/modules/vfs_zfsacl.c:95:42: error: request for member =
'a_who'
in something not a structure or union
   aceprop.who.id   =3D (uint32_t) acebuf[i].a_who;
                                          ^
../../source3/modules/vfs_zfsacl.c:99:27: error: 'ACE_EVERYONE' =
undeclared
(first use in this function); did you mean 'ACL_EXECUTE'?
       (aceprop.aceFlags & ACE_EVERYONE) &&
                           ^~~~~~~~~~~~
                           ACL_EXECUTE
../../source3/modules/vfs_zfsacl.c:99:27: note: each undeclared =
identifier
is reported only once for each function it appears in
../../source3/modules/vfs_zfsacl.c:100:27: error: 'ACE_INHERITED_ACE'
undeclared (first use in this function); did you mean
'SMB_ACE4_INHERITED_ACE'?
       (aceprop.aceFlags & ACE_INHERITED_ACE))
                           ^~~~~~~~~~~~~~~~~
                           SMB_ACE4_INHERITED_ACE
../../source3/modules/vfs_zfsacl.c:113:22: error: request for member
'a_flags' in something not a structure or union
   special =3D acebuf[i].a_flags & (ACE_OWNER|ACE_GROUP|ACE_EVERYONE);
                      ^
../../source3/modules/vfs_zfsacl.c:113:34: error: 'ACE_OWNER' undeclared
(first use in this function); did you mean 'ACL_OTHER'?
   special =3D acebuf[i].a_flags & (ACE_OWNER|ACE_GROUP|ACE_EVERYONE);
                                  ^~~~~~~~~
                                  ACL_OTHER
../../source3/modules/vfs_zfsacl.c:113:44: error: 'ACE_GROUP' undeclared
(first use in this function); did you mean 'ACL_GROUP'?
   special =3D acebuf[i].a_flags & (ACE_OWNER|ACE_GROUP|ACE_EVERYONE);
                                            ^~~~~~~~~
                                            ACL_GROUP
../../source3/modules/vfs_zfsacl.c: In function 'zfs_process_smbacl':
../../source3/modules/vfs_zfsacl.c:166:2: error: unknown type name =
'ace_t';
did you mean 'acl_t'?
  ace_t *acebuf;
  ^~~~~
  acl_t
../../source3/modules/vfs_zfsacl.c:183:12: error: 'ace_t' undeclared =
(first
use in this function); did you mean 'acl_t'?
  acebuf =3D (ace_t *) talloc_size(mem_ctx, sizeof(ace_t)*naces);
            ^~~~~
            acl_t
../../source3/modules/vfs_zfsacl.c:183:19: error: expected expression =
before
')' token
  acebuf =3D (ace_t *) talloc_size(mem_ctx, sizeof(ace_t)*naces);
                   ^
../../source3/modules/vfs_zfsacl.c:194:12: error: request for member
'a_type' in something not a structure or union
   acebuf[i].a_type        =3D aceprop->aceType;
            ^
../../source3/modules/vfs_zfsacl.c:195:12: error: request for member
'a_flags' in something not a structure or union
   acebuf[i].a_flags       =3D aceprop->aceFlags;
            ^
../../source3/modules/vfs_zfsacl.c:196:12: error: request for member
'a_access_mask' in something not a structure or union
   acebuf[i].a_access_mask =3D aceprop->aceMask;
            ^
../../source3/modules/vfs_zfsacl.c:199:12: error: request for member
'a_access_mask' in something not a structure or union
   acebuf[i].a_access_mask &=3D ~SMB_ACE4_SYNCHRONIZE;
            ^
../../source3/modules/vfs_zfsacl.c:200:12: error: request for member =
'a_who'
in something not a structure or union
   acebuf[i].a_who         =3D aceprop->who.id;
            ^
../../source3/modules/vfs_zfsacl.c:204:14: error: request for member
'a_flags' in something not a structure or union
     acebuf[i].a_flags |=3D ACE_EVERYONE;
              ^
../../source3/modules/vfs_zfsacl.c:204:26: error: 'ACE_EVERYONE' =
undeclared
(first use in this function); did you mean 'ACL_EXECUTE'?
     acebuf[i].a_flags |=3D ACE_EVERYONE;
                          ^~~~~~~~~~~~
                          ACL_EXECUTE
../../source3/modules/vfs_zfsacl.c:207:14: error: request for member
'a_flags' in something not a structure or union
     acebuf[i].a_flags |=3D ACE_OWNER;
              ^
../../source3/modules/vfs_zfsacl.c:207:26: error: 'ACE_OWNER' undeclared
(first use in this function); did you mean 'ACL_OTHER'?
     acebuf[i].a_flags |=3D ACE_OWNER;
                          ^~~~~~~~~
                          ACL_OTHER
../../source3/modules/vfs_zfsacl.c:210:14: error: request for member
'a_flags' in something not a structure or union
     acebuf[i].a_flags |=3D ACE_GROUP|ACE_IDENTIFIER_GROUP;
              ^
../../source3/modules/vfs_zfsacl.c:210:26: error: 'ACE_GROUP' undeclared
(first use in this function); did you mean 'ACL_GROUP'?
     acebuf[i].a_flags |=3D ACE_GROUP|ACE_IDENTIFIER_GROUP;
                          ^~~~~~~~~
                          ACL_GROUP
../../source3/modules/vfs_zfsacl.c:210:36: error: 'ACE_IDENTIFIER_GROUP'
undeclared (first use in this function); did you mean
'SMB_ACE4_IDENTIFIER_GROUP'?
     acebuf[i].a_flags |=3D ACE_GROUP|ACE_IDENTIFIER_GROUP;
                                    ^~~~~~~~~~~~~~~~~~~~
                                    SMB_ACE4_IDENTIFIER_GROUP
../../source3/modules/vfs_zfsacl.c:221:12: error: request for member
'a_type' in something not a structure or union
   acebuf[i].a_type =3D SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;
            ^
../../source3/modules/vfs_zfsacl.c:222:12: error: request for member
'a_flags' in something not a structure or union
   acebuf[i].a_flags =3D SMB_ACE4_DIRECTORY_INHERIT_ACE |
            ^
../../source3/modules/vfs_zfsacl.c:225:4: error: 'ACE_INHERITED_ACE'
undeclared (first use in this function); did you mean
'SMB_ACE4_INHERITED_ACE'?
    ACE_INHERITED_ACE;
    ^~~~~~~~~~~~~~~~~
    SMB_ACE4_INHERITED_ACE
../../source3/modules/vfs_zfsacl.c:226:12: error: request for member
'a_access_mask' in something not a structure or union
   acebuf[i].a_access_mask =3D 0;
            ^
../../source3/modules/vfs_zfsacl.c:238:13: error: dereferencing pointer =
to
incomplete type 'struct fd_handle'
  if (fsp->fh->fd !=3D -1) {
             ^~
../../source3/modules/vfs_zfsacl.c:239:8: warning: implicit declaration =
of
function 'facl'; did you mean 'ffsl'? [-Wimplicit-function-declaration]
   rv =3D facl(fsp->fh->fd, ACE_SETACL, naces, acebuf);
        ^~~~
        ffsl
../../source3/modules/vfs_zfsacl.c:239:26: error: 'ACE_SETACL' =
undeclared
(first use in this function); did you mean 'MNT_DETACH'?
   rv =3D facl(fsp->fh->fd, ACE_SETACL, naces, acebuf);
                          ^~~~~~~~~~
                          MNT_DETACH
../../source3/modules/vfs_zfsacl.c:242:8: warning: implicit declaration =
of
function 'acl'; did you mean 'acct'? [-Wimplicit-function-declaration]
   rv =3D acl(fsp->fsp_name->base_name, ACE_SETACL, naces, acebuf);
        ^~~
        acct
../../source3/modules/vfs_zfsacl.c: At top level:
../../source3/modules/vfs_zfsacl.c:283:9: error: unknown type name =
'ace_t';
did you mean 'acl_t'?
         ace_t **outbuf)
         ^~~~~
         acl_t
../../source3/modules/vfs_zfsacl.c:318:10: error: unknown type name =
'ace_t';
did you mean 'acl_t'?
          ace_t **outbuf)
          ^~~~~
          acl_t
../../source3/modules/vfs_zfsacl.c: In function 'zfsacl_fget_nt_acl':
../../source3/modules/vfs_zfsacl.c:365:2: error: unknown type name =
'ace_t';
did you mean 'acl_t'?
  ace_t *acebuf =3D NULL;
  ^~~~~
  acl_t
../../source3/modules/vfs_zfsacl.c:374:10: warning: implicit declaration =
of
function 'fget_zfsacl'; did you mean 'set_nt_acl'?
[-Wimplicit-function-declaration]
  naces =3D fget_zfsacl(talloc_tos(), fsp, &acebuf);
          ^~~~~~~~~~~
          set_nt_acl
../../source3/modules/vfs_zfsacl.c: In function 'zfsacl_get_nt_acl_at':
../../source3/modules/vfs_zfsacl.c:424:2: error: unknown type name =
'ace_t';
did you mean 'acl_t'?
  ace_t *acebuf =3D NULL;
  ^~~~~
  acl_t
../../source3/modules/vfs_zfsacl.c:435:10: warning: implicit declaration =
of
function 'get_zfsacl'; did you mean 'set_nt_acl'?
[-Wimplicit-function-declaration]
  naces =3D get_zfsacl(frame, smb_fname, &acebuf);
          ^~~~~~~~~~
          set_nt_acl

* Node
/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/sparql_par=
ser
.tab.c is created more than once (full message on 'waf -v -v'). The task
generators are:
  1. 'spotlight2sparql.objlist' in /build/samba-4.14.2+dfsg/source3
  2. 'rpc_mdssvc_module' in /build/samba-4.14.2+dfsg/source3/rpc_server
If you think that this is an error, set no_errcheck_out on the task =
instance
* Node
/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/sparql_par=
ser
.tab.h is created more than once (full message on 'waf -v -v'). The task
generators are:
  1. 'spotlight2sparql.objlist' in /build/samba-4.14.2+dfsg/source3
  2. 'rpc_mdssvc_module' in /build/samba-4.14.2+dfsg/source3/rpc_server
If you think that this is an error, set no_errcheck_out on the task =
instance
* Node
/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/sparql_lex=
er.
lex.c is created more than once (full message on 'waf -v -v'). The task
generators are:
  1. 'spotlight2sparql.objlist' in /build/samba-4.14.2+dfsg/source3
  2. 'rpc_mdssvc_module' in /build/samba-4.14.2+dfsg/source3/rpc_server
If you think that this is an error, set no_errcheck_out on the task =
instance
* Node
/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/es_parser.=
tab
.c is created more than once (full message on 'waf -v -v'). The task
generators are:
  1. 'spotlight2es.objlist' in /build/samba-4.14.2+dfsg/source3
  2. 'rpc_mdssvc_module' in /build/samba-4.14.2+dfsg/source3/rpc_server
If you think that this is an error, set no_errcheck_out on the task =
instance
* Node
/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/es_parser.=
tab
.h is created more than once (full message on 'waf -v -v'). The task
generators are:
  1. 'spotlight2es.objlist' in /build/samba-4.14.2+dfsg/source3
  2. 'rpc_mdssvc_module' in /build/samba-4.14.2+dfsg/source3/rpc_server
If you think that this is an error, set no_errcheck_out on the task =
instance
* Node
/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/es_lexer.l=
ex.
c is created more than once (full message on 'waf -v -v'). The task
generators are:
  1. 'spotlight2es.objlist' in /build/samba-4.14.2+dfsg/source3
  2. 'rpc_mdssvc_module' in /build/samba-4.14.2+dfsg/source3/rpc_server
If you think that this is an error, set no_errcheck_out on the task =
instance
Waf: Leaving directory `/build/samba-4.14.2+dfsg/bin/default'
Build failed
 -> task in 'vfs_zfsacl.objlist' failed with exit status 1:
        {task 139646019732984: c vfs_zfsacl.c -> vfs_zfsacl.c.42.o}
['/usr/lib/ccache/gcc', '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1', =
'-g',
'-O2', '-fdebug-prefix-map=3D/build/samba-4.14.2+dfsg=3D.',
'-fstack-protector-strong', '-Wformat', '-Werror=3Dformat-security', =
'-MMD',
'-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1', =
'-DHAVE_CONFIG_H=3D1',
'-fPIC', '-D__STDC_WANT_LIB_EXT1__=3D1', '-D_REENTRANT',
'-DCTDB_HELPER_BINDIR=3D"/usr/lib/x86_64-linux-gnu/ctdb"',
'-DLOGDIR=3D"/var/log/ctdb"', '-DCTDB_DATADIR=3D"/usr/share/ctdb"',
'-DCTDB_ETCDIR=3D"/etc/ctdb"', '-DCTDB_VARDIR=3D"/var/lib/ctdb"',
'-DCTDB_RUNDIR=3D"/var/run/ctdb"', '-fstack-protector-strong',
'-fstack-clash-protection', '-DSTATIC_vfs_zfsacl_MODULES=3DNULL',
'-DSTATIC_vfs_zfsacl_MODULES_PROTO=3Dextern void
__vfs_zfsacl_dummy_module_proto(void)', '-pthread', '-pthread',
'-Isource3/modules', '-I../../source3/modules', '-Isource3',
'-I../../source3', '-Isource3/include', '-I../../source3/include',
'-Isource3/lib', '-I../../source3/lib', '-Isource4/heimdal/lib/com_err',
'-I../../source4/heimdal/lib/com_err', '-Isource4/heimdal/lib/krb5',
'-I../../source4/heimdal/lib/krb5', '-Isource4/heimdal/lib/gssapi',
'-I../../source4/heimdal/lib/gssapi', =
'-Isource4/heimdal/lib/gssapi/gssapi',
'-I../../source4/heimdal/lib/gssapi/gssapi',
'-Isource4/heimdal_build/include', =
'-I../../source4/heimdal_build/include',
'-Ibin/default/source4/heimdal/lib/asn1', '-Isource4/heimdal/lib/asn1',
'-Iinclude/public', '-I../../include/public', '-Isource4',
'-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
'-I../../source4/lib', '-Isource4/include', '-I../../source4/include',
'-Iinclude', '-I../../include', '-Ilib/replace', '-I../../lib/replace',
'-Ictdb/include', '-I../../ctdb/include', '-Ictdb', '-I../../ctdb', =
'-I.',
'-I../..', '-Isource3/auth', '-I../../source3/auth', '-Ilib/param',
'-I../../lib/param', '-Ilibcli/named_pipe_auth',
'-I../../libcli/named_pipe_auth', '-Isource3/librpc',
'-I../../source3/librpc', '-Isource4/cluster', =
'-I../../source4/cluster',
'-Ilibrpc', '-I../../librpc', '-Ilibcli/dns', '-I../../libcli/dns',
'-Isource3/rpc_server', '-I../../source3/rpc_server', '-Iauth/gensec',
'-I../../auth/gensec', '-Isource3/param', '-I../../source3/param',
'-Ilibcli/util', '-I../../libcli/util', '-Isource4/auth/kerberos',
'-I../../source4/auth/kerberos', '-Isource4/heimdal/lib/hcrypto',
'-I../../source4/heimdal/lib/hcrypto', '-Isource4/heimdal/lib',
'-I../../source4/heimdal/lib', '-Isource4/heimdal/include',
'-I../../source4/heimdal/include', '-Isource4/heimdal_build',
'-I../../source4/heimdal_build', '-Iauth/ntlmssp', =
'-I../../auth/ntlmssp',
'-Isource3/passdb', '-I../../source3/passdb', '-Isource4/libcli/smb2',
'-I../../source4/libcli/smb2', '-Isource4/lib/socket',
'-I../../source4/lib/socket', '-Isource4/heimdal/lib/roken',
'-I../../source4/heimdal/lib/roken', '-Ilibcli/nbt', =
'-I../../libcli/nbt',
'-Ilibcli/auth', '-I../../libcli/auth', '-Ilibcli/http',
'-I../../libcli/http', '-Ilib/audit_logging', =
'-I../../lib/audit_logging',
'-Ilib/krb5_wrap', '-I../../lib/krb5_wrap', '-Isource4/librpc',
'-I../../source4/librpc', '-Ilibcli/lsarpc', '-I../../libcli/lsarpc',
'-Isource4/dsdb', '-I../../source4/dsdb', '-Ilibcli/smb',
'-I../../libcli/smb', '-Isource4/libcli', '-I../../source4/libcli',
'-Isource4/auth', '-I../../source4/auth', '-Iauth/kerberos',
'-I../../auth/kerberos', '-Isource4/heimdal/lib/asn1',
'-I../../source4/heimdal/lib/asn1', '-Isource4/libcli/ldap',
'-I../../source4/libcli/ldap', '-Isource3/smbd/notifyd',
'-I../../source3/smbd/notifyd', '-Ilib/ldb-samba', =
'-I../../lib/ldb-samba',
'-Ilibcli/ldap', '-I../../libcli/ldap', '-Insswitch', =
'-I../../nsswitch',
'-Iauth/credentials', '-I../../auth/credentials', '-Isource4/lib/tls',
'-I../../source4/lib/tls', '-Isource4/auth/gensec',
'-I../../source4/auth/gensec', '-Ilib/socket', '-I../../lib/socket',
'-Isource4/lib/messaging', '-I../../source4/lib/messaging', =
'-Ilib/addns',
'-I../../lib/addns', '-Ilibcli/cldap', '-I../../libcli/cldap',
'-Isource4/heimdal/lib/hcrypto/libtommath',
'-I../../source4/heimdal/lib/hcrypto/libtommath', '-Ilib/dbwrap',
'-I../../lib/dbwrap', '-Isource4/winbind', '-I../../source4/winbind',
'-Ilibcli/security', '-I../../libcli/security',
'-Isource4/heimdal/lib/wind', '-I../../source4/heimdal/lib/wind',
'-Isource4/param', '-I../../source4/param', '-Ilib/tsocket',
'-I../../lib/tsocket', '-Isource4/lib/events', =
'-I../../source4/lib/events',
'-Isource4/heimdal/lib/hx509', '-I../../source4/heimdal/lib/hx509',
'-Insswitch/libwbclient', '-I../../nsswitch/libwbclient', =
'-Ilib/messaging',
'-I../../lib/messaging', '-Isource4/heimdal/base',
'-I../../source4/heimdal/base', '-Isource4/lib/stream',
'-I../../source4/lib/stream', '-Ilib/util/charset',
'-I../../lib/util/charset', '-Idynconfig', '-I../../dynconfig', =
'-Iauth',
'-I../../auth', '-Ilib/afs', '-I../../lib/afs',
'-Isource4/heimdal/lib/gssapi/spnego',
'-I../../source4/heimdal/lib/gssapi/spnego',
'-Isource4/heimdal/lib/gssapi/krb5',
'-I../../source4/heimdal/lib/gssapi/krb5',
'-Isource4/heimdal/lib/gssapi/mech',
'-I../../source4/heimdal/lib/gssapi/mech', '-Ilibcli/registry',
'-I../../libcli/registry', '-Ilib/crypto', '-I../../lib/crypto',
'-Ilib/smbconf', '-I../../lib/smbconf', '-Ilib/async_req',
'-I../../lib/async_req',
'-Ilib/util/build/samba-4.14.2+dfsg/third_party/gpfs',
'-I../../lib/util/build/samba-4.14.2+dfsg/third_party/gpfs',
'-Ilibcli/drsuapi', '-I../../libcli/drsuapi', '-Ilibds/common',
'-I../../libds/common', '-Ilib/pthreadpool', '-I../../lib/pthreadpool',
'-Ilib/compression', '-I../../lib/compression', '-Ilibcli/netlogon',
'-I../../libcli/netlogon', '-I/usr/include/p11-kit-1',
'-I/usr/include/glib-2.0', =
'-I/usr/lib/x86_64-linux-gnu/glib-2.0/include',
'-I/usr/include/tracker-2.0',
'-I/usr/include/tracker-2.0/libtracker-sparql', =
'-I/usr/include/libmount',
'-I/usr/include/blkid', '-I/usr/include/uuid',
'../../source3/modules/vfs_zfsacl.c', '-c',
'-o/build/samba-4.14.2+dfsg/bin/default/source3/modules/vfs_zfsacl.c.42.o=
',
'-Wdate-time', '-D_FORTIFY_SOURCE=3D2']
make[1]: *** [debian/rules:104: override_dh_auto_build] Error 1
make[1]: Leaving directory '/build/samba-4.14.2+dfsg'
make: *** [debian/rules:98: build] Error 2
dpkg-buildpackage: error: debian/rules build subprocess returned exit =
status
2
I: copying local configuration
E: Failed autobuilding of package

=20

> -----Oorspronkelijk bericht-----
> Van: Pkg-samba-maint=20
> [mailto:pkg-samba-maint-bounces+belle=3Dbazuin.nl@alioth-lists.d
ebian.net] Namens Mathieu Parent
> Verzonden: zaterdag 17 april 2021 18:53
> Aan: Fred Donck
> CC: Debian Samba Maintainers
> Onderwerp: Re: [Pkg-samba-maint] vfs_zfsacl module on Debian
>=20
> Le ven. 16 avr. 2021 =E0 18:04, Fred Donck <fred@procolix.com> a =
=E9crit :
> >
> > To whom this may concern,
> >
> > I am looking for information on how to get the above module=20
> to work on
> > Debian Bulls Eye.
> >
> > I am trying to get a (ZFS) client on Windows to be able to hand out
> > privileges from Windows. As far as I can tell the module to=20
> cater for
> > this is the one mentioned in the subject.
> >
> > I have noticed that this module is by default not part of the
> > distribution. I have some questions about this.
> >
> > - Is this intentionally?
>=20
> libzfslinux-dev is in contrib, and samba can't depend on it.
>=20
> > - Will there be support in the near future?
> > - Trying to solve my problem, made me run into compilation-errors
> >    because it does not seem to compile.
> >
> > A simple change in the rules file:
> >
> > :~/work/samba-4.13.5+dfsg/debian$ diff -c rules-20210319FD rules
> > *** rules-20210319FD    2021-02-09 21:00:30.000000000 +0100
> > --- rules       2021-04-14 10:06:21.326931259 +0200
> > ***************
> > *** 5,10 ****
> > --- 5,11 ----
> >
> >    export DEB_BUILD_MAINT_OPTIONS =3D hardening=3D+all
> >    export DEB_LDFLAGS_MAINT_APPEND =3D -Wl,--as-needed
> > +
> >    DPKG_EXPORT_BUILDFLAGS =3D 1
> >    include /usr/share/dpkg/buildflags.mk
> >    include /usr/share/dpkg/pkg-info.mk
> > ***************
> > *** 50,56 ****
> >                  --with-utmp \
> >                  --with-winbind \
> >                  --with-quota \
> > !
> >=20
> --with-shared-modules=3Didmap_rid,idmap_ad,idmap_adex,idmap_hash
,idmap_ldap,idmap_tdb2,vfs_dfs_samba4,auth_samba4,vfs_nfs4acl_xattr
> > \
> >                  --with-automount \
> >                  --with-ldap \
> >                  --with-ads \
> > --- 51,57 ----
> >                  --with-utmp \
> >                  --with-winbind \
> >                  --with-quota \
> > !
> >=20
> --with-shared-modules=3Didmap_rid,idmap_ad,idmap_adex,idmap_hash
,idmap_ldap,idmap_tdb2,vfs_dfs_samba4,auth_samba4,vfs_nfs4acl_xattr,vfs_>=

zfsacl
> > \
> >                  --with-automount \
> >                  --with-ldap \
> >                  --with-ads \
> > :~/work/samba-4.13.5+dfsg/debian$
> >
> >
> > :~/work/samba-4.13.5+dfsg/debian$ dpkg-buildpackage -us -uc
> >
> > This fails.
> >
> > ../../source3/modules/vfs_zfsacl.c:54:17: error: unknown=20
> type name =91ace_t=92
> >     54 |           const ace_t *acebuf,
> >        |                 ^~~~~
> > ../../source3/modules/vfs_zfsacl.c: In function=20
> =91zfs_get_nt_acl_common=92:
> > ../../source3/modules/vfs_zfsacl.c:93:42: error: request for member
> > =91a_type=92 in something not a structure or union
> >     93 |   aceprop.aceType  =3D (uint32_t) acebuf[i].a_type;
> >        |                                          ^
> > ../../source3/modules/vfs_zfsacl.c:94:42: error: request for member
> > =91a_flags=92 in something not a structure or union
> >     94 |   aceprop.aceFlags =3D (uint32_t) acebuf[i].a_flags;
> >        |                                          ^
> > ../../source3/modules/vfs_zfsacl.c:95:42: error: request for member
> > =91a_access_mask=92 in something not a structure or union
> >     95 |   aceprop.aceMask  =3D (uint32_t) acebuf[i].a_access_mask;
> >        |                                          ^
> > ../../source3/modules/vfs_zfsacl.c:96:42: error: request for member
> > =91a_who=92 in something not a structure or union
> >     96 |   aceprop.who.id   =3D (uint32_t) acebuf[i].a_who;
> >        |                                          ^
> > ../../source3/modules/vfs_zfsacl.c:100:27: error: =91ACE_EVERYONE=92
> > undeclared (first use in this function)
> >    100 |       (aceprop.aceFlags & ACE_EVERYONE) &&
> >        |                           ^~~~~~~~~~~~
> > ../../source3/modules/vfs_zfsacl.c:100:27: note: each undeclared
> > identifier is reported only once for each function it appears in
> > ../../source3/modules/vfs_zfsacl.c:101:27: error:=20
> =91ACE_INHERITED_ACE=92
> > undeclared (first use in this function); did you mean
> > =91SMB_ACE4_INHERITED_ACE=92?
> >    101 |       (aceprop.aceFlags & ACE_INHERITED_ACE))
> >        |                           ^~~~~~~~~~~~~~~~~
> >        |                           SMB_ACE4_INHERITED_ACE
> > ../../source3/modules/vfs_zfsacl.c:114:22: error: request for member
> > =91a_flags=92 in something not a structure or union
> >    114 |   special =3D acebuf[i].a_flags &=20
> (ACE_OWNER|ACE_GROUP|ACE_EVERYONE);
> >        |                      ^
> > ../../source3/modules/vfs_zfsacl.c:114:34: error:=20
> =91ACE_OWNER=92 undeclared
> > (first use in this function); did you mean =91ACL_OTHER=92?
> >    114 |   special =3D acebuf[i].a_flags &=20
> (ACE_OWNER|ACE_GROUP|ACE_EVERYONE);
> >        |                                  ^~~~~~~~~
> >        |                                  ACL_OTHER
> > ../../source3/modules/vfs_zfsacl.c:114:44: error:=20
> =91ACE_GROUP=92 undeclared
> > (first use in this function); did you mean =91ACL_GROUP=92?
> >    114 |   special =3D acebuf[i].a_flags &=20
> (ACE_OWNER|ACE_GROUP|ACE_EVERYONE);
> >        |                                            ^~~~~~~~~
> >        |                                            ACL_GROUP
> >
> >
> >
> > ace_t is defined in /usr/include/libspl/sys/acl.h.
> >
> > Is there a way to get this fixed?
>=20
> Maybe add libzfslinux-dev to Build-depends (in debian/control)?
>=20
>=20
> > Thanks for any hint.
> >
> > Best regards
> > --
> >
> > fred donck
> >
> > _______________________________________________
> > Pkg-samba-maint mailing list
> > Pkg-samba-maint@alioth-lists.debian.net
> >=20
> https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/pkg-s
> amba-maint
>=20
>=20
> Regards
> --=20
> Mathieu Parent
>=20
> _______________________________________________
> Pkg-samba-maint mailing list
> Pkg-samba-maint@alioth-lists.debian.net
> https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/pkg-s
> amba-maint
>=20


