Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE673641D1
	for <lists+samba-technical@lfdr.de>; Mon, 19 Apr 2021 14:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=0mei2VJq7W33t8vCInztU/lVA1oel+RpwOm0J6Y8FnY=; b=41i8EoltFvaujchA9A23LqrlKO
	YivjW4/sM0QshclXLZT5Tsj1TIoEZjzOHoN3dezn+MK0HIalam7nxGCgS8DKSNCnPnwyiD+pM7rmC
	tq7AjkhmPGc+MpSMlq0rQXlHB71qlk48U1IYEao09lAsA1NxL2eEr4+Oyz9MIOc9v+sQljP51eGMj
	CMy9c7S1Oxm7+fm0hwjm5TWjhNNsalqfpRT8dpmaXDCqQBSDe5wJyYvtY+480o7RYj34lvMkqljCd
	4HpZ1dnJdSLfQTE0qvbBytENOqobHz4MAIqSsp5oSklTPEXd+9hqLh28zYn+SSLlx++4fAutuJVFY
	E24wniVQ==;
Received: from ip6-localhost ([::1]:40708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lYTAn-00BhIj-DZ; Mon, 19 Apr 2021 12:38:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26778) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lYTAd-00BhIc-1i
 for samba-technical@lists.samba.org; Mon, 19 Apr 2021 12:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=v7kWMT3lQnz7KijGZI1FMHzv9HdsA6dLxzmjkPVrW5A=; b=CZJKaHnKV/1TRdPHNCI5aTZ2zX
 a6K5ZMYVSke5NZq29FTY33y7Io+MbrJrdkT4581/vwlOanIcxvr7eIAIhuCGILXqjhUs3Q+cEQptS
 J3XwJDA0prJ4OC5DIgHyj+u5ObXzfcrEKFSd6wHX/fNidK3klT9iwJTj5F2isLI09jFYzWnTP+hyP
 t/7aEaF0aZWuGrIwnY8bfZYnhE+Ynb7R0lKpxegGbHhYU4BGoDOBpxgMhNaYu2b0IOp5fTga8FAjK
 4rdvEgg9LJQojfsOlPvFLPWoFVakFjyn+58RXBp6hddmEFaQLhqHjjD0FjSf39ajiEX50IkSVRM0L
 djEy0A8BoEhJPNLaEj8Er21dm8zykL8kdQpgVbqW9iTyUV5FIrv3LFB4zprNQWixxNJA2B0zkd4Y0
 x3FtGpTSC9ID6uhkWEMVFAxsY/xOrLoz1pZs0pHkEL42aIb6oWAuq9YqT/2QSMEofxuY8vLMre05c
 NY9wBktY8zspJahcmmXomUWU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lYTAR-0000ZN-BA; Mon, 19 Apr 2021 12:38:19 +0000
To: "'Andrew Walker'" <awalker@ixsystems.com>
References: <8B08460B0CDF4DB786D338094DF99F90@rotterdam.bazuin.nl>
 <CAB5c7xpXY8sTKVHLZKnZWHaqeao=g-=Ff7anceXoaWp8CvzHDA@mail.gmail.com>
In-Reply-To: <CAB5c7xpXY8sTKVHLZKnZWHaqeao=g-=Ff7anceXoaWp8CvzHDA@mail.gmail.com>
Subject: RE: FW: [Pkg-samba-maint] vfs_zfsacl module on Debian
Date: Mon, 19 Apr 2021 14:38:19 +0200
Message-ID: <690B8C353DAB494FA2B0BC5BF4234267@rotterdam.bazuin.nl>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
Thread-Index: Adc1E3tMqbQ6W8PPQj6BzzFpCF1EnAAA2awg
X-MimeOLE: Produced By Microsoft MimeOLE
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: 'samba-technical' <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>










Hai,=20









I was hopefull after reading..







https://wiki.debian.org/ZFS






=20





so i hoped that this would
work now with this patch.=20


" class=3DLink--secondary style=3D"BOX-SIZING: border-box; =
TEXT-DECORATION:
none; COLOR:  !important"
href=3D"https://github.com/truenas/zfs/commit/99705083d065ab34a14fc2a40cb=
c735f
c6c5ccc4" data-pjax=3D"true">
Implements zfs native NFSv4 ACL support by providing an xattr handler












=85



https://github.com/truenas/zfs/commit/99705083d065ab34a14fc2a40cbc735fc6c=
5cc
c4





i'll put it aside for now.


Thanks for the reply..
 :-)

it s

aves me time again.=20







Greetz,=20



Louis














 =20
 =20
 =20

Van:
 Andrew Walker   [mailto:awalker@ixsystems.com]=20


Verzonden:
 maandag 19 april 2021   13:59


Aan:
 belle@samba.org


CC:
   samba-technical


Onderwerp:
 Re: FW: [Pkg-samba-maint] vfs_zfsacl   module on Debian






 =20


 =20
ZoL does not currently support NFSv4 ACLs, hence the vfs_zfsacl   VFS =
module
does not work on Linux.



 =20
 =20
On Mon, Apr 19, 2021 at 6:13 AM L. van Belle via   samba-technical &lt;
samba-technical@lists.samba.org
&gt;   wrote:



 =20
Hai,    =20



Just a question here. I notice in the debian samba bugreports a     =
message
on

ZFSACL.=20

I thought i'll try to add this one to my packages     since i have had =
more

messages on ZFSACL.=20



Now, libzfslinux-dev is     included in build depends, but it keeps =
failing
at

this point.=20

I've     added the build log part of there its going wrong.=20

If anyone has a hint     why this is and what i might be missing, that =
would
be

nice.    =20




unknown type name 'ace_t'
 thats my key here in finding     why building

failes.=20



Logs below.=20



Thanks in advance.    =20



Louis



[3562/4228] Compiling     source3/modules/nfs4acl_xattr_nfs.c

07:44:27 runner     ['/usr/lib/ccache/gcc', '-D_SAMBA_BUILD_=3D4',

'-DHAVE_CONFIG_H=3D1', '-g',     '-O2',

'-fdebug-prefix-map=3D/build/samba-4.14.2+dfsg=3D.',
'-fstack-protector-strong',

'-Wformat', '-Werror=3Dformat-security',     '-MMD', =
'-D_GNU_SOURCE=3D1',

'-D_XOPEN_SOURCE_EXTENDED=3D1',     '-DHAVE_CONFIG_H=3D1', '-fPIC',

'-D__STDC_WANT_LIB_EXT1__=3D1',     '-D_REENTRANT',

'-DCTDB_HELPER_BINDIR=3D"/usr/lib/x86_64-linux-gnu/ctdb"',

'-DLOGDIR=3D"/var/log/ctdb"',     '-DCTDB_DATADIR=3D"/usr/share/ctdb"',

'-DCTDB_ETCDIR=3D"/etc/ctdb"',     '-DCTDB_VARDIR=3D"/var/lib/ctdb"',

'-DCTDB_RUNDIR=3D"/var/run/ctdb"',     '-fstack-protector-strong',

'-fstack-clash-protection',     =
'-DSTATIC_vfs_nfs4acl_xattr_MODULES=3DNULL',

'-DSTATIC_vfs_nfs4acl_xattr_MODULES_PROTO=3Dextern     void

__vfs_nfs4acl_xattr_dummy_module_proto(void)', '-pthread',     =
'-pthread',

'-Isource3/modules', '-I../../source3/modules',     '-Isource3',

'-I../../source3', '-Isource3/include',     '-I../../source3/include',

'-Isource3/lib', '-I../../source3/lib',     =
'-Isource4/heimdal/lib/com_err',

'-I../../source4/heimdal/lib/com_err',     '-Isource4/heimdal/lib/krb5',

'-I../../source4/heimdal/lib/krb5',     '-Isource4/heimdal/lib/gssapi',

'-I../../source4/heimdal/lib/gssapi',
'-Isource4/heimdal/lib/gssapi/gssapi',

'-I../../source4/heimdal/lib/gssapi/gssapi',

'-Isource4/heimdal_build/include',
'-I../../source4/heimdal_build/include',

'-Ibin/default/source4/heimdal/lib/asn1',     =
'-Isource4/heimdal/lib/asn1',

'-Iinclude/public',     '-I../../include/public', '-Isource4',

'-I../../source4', '-Ilib',     '-I../../lib', '-Isource4/lib',

'-I../../source4/lib',     '-Isource4/include', =
'-I../../source4/include',

'-Iinclude',     '-I../../include', '-Ilib/replace',
'-I../../lib/replace',

'-Ictdb/include', '-I../../ctdb/include',     '-Ictdb', '-I../../ctdb',
'-I.',

'-I../..', '-Isource3/auth',     '-I../../source3/auth', '-Ilib/param',

'-I../../lib/param',     '-Ilibcli/named_pipe_auth',

'-I../../libcli/named_pipe_auth',     '-Isource3/librpc',

'-I../../source3/librpc', '-Ilibrpc',     '-I../../librpc',
'-Isource4/cluster',

'-I../../source4/cluster',     '-Ilibcli/dns', '-I../../libcli/dns',

'-Isource3/rpc_server',     '-I../../source3/rpc_server', =
'-Iauth/gensec',

'-I../../auth/gensec',     '-Isource3/param', '-I../../source3/param',

'-Ilibcli/util',     '-I../../libcli/util',     =
'-Isource4/auth/kerberos',

'-I../../source4/auth/kerberos',     '-Isource4/heimdal/lib/hcrypto',

'-I../../source4/heimdal/lib/hcrypto',     '-Isource4/heimdal/lib',

'-I../../source4/heimdal/lib',     '-Isource4/heimdal/include',

'-I../../source4/heimdal/include',     '-Isource4/heimdal_build',

'-I../../source4/heimdal_build',     '-Iauth/ntlmssp',
'-I../../auth/ntlmssp',

'-Isource3/passdb',     '-I../../source3/passdb',
'-Isource4/libcli/smb2',

'-I../../source4/libcli/smb2',     '-Isource4/lib/socket',

'-I../../source4/lib/socket',     '-Isource4/heimdal/lib/roken',

'-I../../source4/heimdal/lib/roken',     '-Ilibcli/nbt',
'-I../../libcli/nbt',

'-Ilibcli/auth',     '-I../../libcli/auth', '-Ilibcli/http',

'-I../../libcli/http',     '-Ilib/audit_logging',
'-I../../lib/audit_logging',

'-Ilib/krb5_wrap',     '-I../../lib/krb5_wrap', '-Isource4/librpc',

'-I../../source4/librpc',     '-Ilibcli/lsarpc', =
'-I../../libcli/lsarpc',

'-Isource4/dsdb',     '-I../../source4/dsdb', '-Ilibcli/smb',

'-I../../libcli/smb',     '-Isource4/libcli', '-I../../source4/libcli',

'-Isource4/auth',     '-I../../source4/auth', '-Iauth/kerberos',

'-I../../auth/kerberos',     '-Isource4/heimdal/lib/asn1',

'-I../../source4/heimdal/lib/asn1',     '-Isource4/libcli/ldap',

'-I../../source4/libcli/ldap',     '-Isource3/smbd/notifyd',

'-I../../source3/smbd/notifyd',     '-Ilib/ldb-samba',
'-I../../lib/ldb-samba',

'-Ilibcli/ldap',     '-I../../libcli/ldap', '-Insswitch',
'-I../../nsswitch',

'-Iauth/credentials', '-I../../auth/credentials',     =
'-Isource4/lib/tls',

'-I../../source4/lib/tls',     '-Isource4/auth/gensec',

'-I../../source4/auth/gensec', '-Ilib/socket',     '-I../../lib/socket',

'-Isource4/lib/messaging',     '-I../../source4/lib/messaging',
'-Ilib/addns',

'-I../../lib/addns',     '-Ilibcli/cldap',     '-I../../libcli/cldap',

'-Isource4/heimdal/lib/hcrypto/libtommath',

'-I../../source4/heimdal/lib/hcrypto/libtommath',     '-Ilib/dbwrap',

'-I../../lib/dbwrap', '-Isource4/winbind',     =
'-I../../source4/winbind',

'-Ilibcli/security',     '-I../../libcli/security',

'-Isource4/heimdal/lib/wind',     '-I../../source4/heimdal/lib/wind',

'-Isource4/param',     '-I../../source4/param', '-Ilib/tsocket',

'-I../../lib/tsocket',     '-Isource4/lib/events',
'-I../../source4/lib/events',

'-Isource4/heimdal/lib/hx509',     '-I../../source4/heimdal/lib/hx509',

'-Insswitch/libwbclient',     '-I../../nsswitch/libwbclient',
'-Ilib/messaging',

'-I../../lib/messaging',     '-Isource4/heimdal/base',

'-I../../source4/heimdal/base',     '-Isource4/lib/stream',

'-I../../source4/lib/stream',     '-Ilib/util/charset',

'-I../../lib/util/charset', '-Idynconfig',     '-I../../dynconfig',
'-Iauth',

'-I../../auth', '-Ilib/afs',     '-I../../lib/afs',

'-Isource4/heimdal/lib/gssapi/spnego',

'-I../../source4/heimdal/lib/gssapi/spnego',

'-Isource4/heimdal/lib/gssapi/krb5',

'-I../../source4/heimdal/lib/gssapi/krb5',

'-Isource4/heimdal/lib/gssapi/mech',

'-I../../source4/heimdal/lib/gssapi/mech',     '-Ilibcli/registry',

'-I../../libcli/registry', '-Ilib/crypto',     '-I../../lib/crypto',

'-Ilib/smbconf', '-I../../lib/smbconf',     '-Ilib/async_req',

'-I../../lib/async_req',

'-Ilib/util/build/samba-4.14.2+dfsg/third_party/gpfs',

'-I../../lib/util/build/samba-4.14.2+dfsg/third_party/gpfs',

'-Ilibcli/drsuapi',     '-I../../libcli/drsuapi', '-Ilibds/common',

'-I../../libds/common',     '-Ilib/pthreadpool', =
'-I../../lib/pthreadpool',

'-Ilib/compression',     '-I../../lib/compression',     =
'-Ilibcli/netlogon',

'-I../../libcli/netlogon',     '-I/usr/include/p11-kit-1',

'-I/usr/include/glib-2.0',
'-I/usr/lib/x86_64-linux-gnu/glib-2.0/include',

'-I/usr/include/tracker-2.0',

'-I/usr/include/tracker-2.0/libtracker-sparql',
'-I/usr/include/libmount',

'-I/usr/include/blkid',     '-I/usr/include/uuid',

'../../source3/modules/nfs4acl_xattr_nfs.c',     '-c',

'-o/build/samba-4.14.2+dfsg/bin/default/source3/modules/nfs4acl_xattr_nfs=
.c.

47.o',     '-Wdate-time',     '-D_FORTIFY_SOURCE=3D2']

../../source3/modules/vfs_zfsacl.c:53:17: error:     unknown type name
'ace_t'


=20
=20
=20
=20
=20
const     ace_t *acebuf,


=20
=20
=20
=20
=20
=20
=20
    =20
^~~~~

../../source3/modules/vfs_zfsacl.c: In function     =
'zfs_get_nt_acl_common':

../../source3/modules/vfs_zfsacl.c:92:42: error:     request for member
'a_type'

in something not a structure or     union


=20
aceprop.aceType
 =3D (uint32_t)     acebuf[i].a_type;


=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
 ^

../../source3/modules/vfs_zfsacl.c:93:42: error: request     for member

'a_flags' in something not a structure or union


    =20
aceprop.aceFlags =3D (uint32_t) acebuf[i].a_flags;


=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
     ^

../../source3/modules/vfs_zfsacl.c:94:42: error: request for     member

'a_access_mask' in something not a structure or union


    =20
aceprop.aceMask
 =3D (uint32_t) acebuf[i].a_access_mask;


    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
     ^

../../source3/modules/vfs_zfsacl.c:95:42: error: request for member
'a_who'

in something not a structure or union


=20

aceprop.who.id

=20
=3D (uint32_t)     acebuf[i].a_who;


=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
 ^

../../source3/modules/vfs_zfsacl.c:99:27: error:     'ACE_EVERYONE'
undeclared

(first use in this function); did you mean     'ACL_EXECUTE'?


=20
=20
=20
(aceprop.aceFlags &amp;     ACE_EVERYONE) &amp;&amp;


=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
^~~~~~~~~~~~


    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
ACL_EXECUTE

../../source3/modules/vfs_zfsacl.c:99:27: note:     each undeclared
identifier

is reported only once for each function it     appears in

../../source3/modules/vfs_zfsacl.c:100:27: error:     =
'ACE_INHERITED_ACE'

undeclared (first use in this function); did you     mean

'SMB_ACE4_INHERITED_ACE'?


=20
=20
    =20
(aceprop.aceFlags &amp; ACE_INHERITED_ACE))


=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
^~~~~~~~~~~~~~~~~


=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
    =20
SMB_ACE4_INHERITED_ACE

../../source3/modules/vfs_zfsacl.c:113:22:     error: request for member

'a_flags' in something not a structure or     union


=20
special =3D acebuf[i].a_flags &amp;     =
(ACE_OWNER|ACE_GROUP|ACE_EVERYONE);


=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
     ^

../../source3/modules/vfs_zfsacl.c:113:34: error: 'ACE_OWNER'     =
undeclared

(first use in this function); did you mean     'ACL_OTHER'?


=20
special =3D acebuf[i].a_flags &amp;     =
(ACE_OWNER|ACE_GROUP|ACE_EVERYONE);


=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
 ^~~~~~~~~


=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
     ACL_OTHER

../../source3/modules/vfs_zfsacl.c:113:44: error: 'ACE_GROUP'     =
undeclared

(first use in this function); did you mean     'ACL_GROUP'?


=20
special =3D acebuf[i].a_flags &amp;     =
(ACE_OWNER|ACE_GROUP|ACE_EVERYONE);


=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
 ^~~~~~~~~


=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
     ACL_GROUP

../../source3/modules/vfs_zfsacl.c: In function     =
'zfs_process_smbacl':

../../source3/modules/vfs_zfsacl.c:166:2: error:     unknown type name
'ace_t';

did you mean 'acl_t'?


 ace_t     *acebuf;


 ^~~~~


     acl_t

../../source3/modules/vfs_zfsacl.c:183:12: error: 'ace_t'     undeclared
(first

use in this function); did you mean 'acl_t'?


     acebuf =3D (ace_t *) talloc_size(mem_ctx, sizeof(ace_t)*naces);


    =20
=20
=20
=20
=20
 ^~~~~


=20
=20
=20
    =20
=20
 acl_t

../../source3/modules/vfs_zfsacl.c:183:19: error:     expected =
expression
before

')' token


 acebuf =3D (ace_t *)     talloc_size(mem_ctx, sizeof(ace_t)*naces);


=20
=20
=20
    =20
=20
=20
=20
=20
    =20
^

../../source3/modules/vfs_zfsacl.c:194:12: error: request for     member

'a_type' in something not a structure or union


    =20
acebuf[i].a_type
=20
=20
=20
 =3D     aceprop-&gt;aceType;


=20
=20
=20
=20
=20
     ^

../../source3/modules/vfs_zfsacl.c:195:12: error: request for     member

'a_flags' in something not a structure or union


    =20
acebuf[i].a_flags
=20
=20
=20
=3D     aceprop-&gt;aceFlags;


=20
=20
=20
=20
=20
     ^

../../source3/modules/vfs_zfsacl.c:196:12: error: request for     member

'a_access_mask' in something not a structure or union


    =20
acebuf[i].a_access_mask =3D aceprop-&gt;aceMask;


=20
=20
    =20
=20
=20
 ^

../../source3/modules/vfs_zfsacl.c:199:12: error:     request for member

'a_access_mask' in something not a structure or     union


=20
acebuf[i].a_access_mask &amp;=3D     ~SMB_ACE4_SYNCHRONIZE;


=20
=20
=20
=20
=20
     ^

../../source3/modules/vfs_zfsacl.c:200:12: error: request for member
'a_who'

in something not a structure or union


    =20
acebuf[i].a_who
=20
=20
=20
=20
=3D aceprop-&gt;
who.id
;


    =20
=20
=20
=20
=20
     ^

../../source3/modules/vfs_zfsacl.c:204:14: error: request for     member

'a_flags' in something not a structure or union


=20
    =20
acebuf[i].a_flags |=3D ACE_EVERYONE;


=20
=20
=20
    =20
=20
=20
 ^

../../source3/modules/vfs_zfsacl.c:204:26: error:     'ACE_EVERYONE'
undeclared

(first use in this function); did you mean     'ACL_EXECUTE'?


=20
=20
acebuf[i].a_flags |=3D     ACE_EVERYONE;


=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
 ^~~~~~~~~~~~


=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
     ACL_EXECUTE

../../source3/modules/vfs_zfsacl.c:207:14: error: request for     member

'a_flags' in something not a structure or union


=20
    =20
acebuf[i].a_flags |=3D ACE_OWNER;


=20
=20
=20
=20
    =20
=20
 ^

../../source3/modules/vfs_zfsacl.c:207:26: error:     'ACE_OWNER' =
undeclared

(first use in this function); did you mean     'ACL_OTHER'?


=20
=20
acebuf[i].a_flags |=3D     ACE_OWNER;


=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
 ^~~~~~~~~


=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
     ACL_OTHER

../../source3/modules/vfs_zfsacl.c:210:14: error: request for     member

'a_flags' in something not a structure or union


=20
    =20
acebuf[i].a_flags |=3D ACE_GROUP|ACE_IDENTIFIER_GROUP;


=20
    =20
=20
=20
=20
=20
     ^

../../source3/modules/vfs_zfsacl.c:210:26: error: 'ACE_GROUP'     =
undeclared

(first use in this function); did you mean     'ACL_GROUP'?


=20
=20
acebuf[i].a_flags |=3D     ACE_GROUP|ACE_IDENTIFIER_GROUP;


=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
 ^~~~~~~~~


=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
     ACL_GROUP

../../source3/modules/vfs_zfsacl.c:210:36: error:     =
'ACE_IDENTIFIER_GROUP'

undeclared (first use in this function); did you     mean

'SMB_ACE4_IDENTIFIER_GROUP'?


=20
    =20
acebuf[i].a_flags |=3D ACE_GROUP|ACE_IDENTIFIER_GROUP;


=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
 ^~~~~~~~~~~~~~~~~~~~


=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
     SMB_ACE4_IDENTIFIER_GROUP

../../source3/modules/vfs_zfsacl.c:221:12:     error: request for member

'a_type' in something not a structure or     union


=20
acebuf[i].a_type =3D     SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;


=20
=20
=20
=20
    =20
 ^

../../source3/modules/vfs_zfsacl.c:222:12: error: request for     member

'a_flags' in something not a structure or union


    =20
acebuf[i].a_flags =3D SMB_ACE4_DIRECTORY_INHERIT_ACE |


=20
    =20
=20
=20
=20
 ^

../../source3/modules/vfs_zfsacl.c:225:4:     error: 'ACE_INHERITED_ACE'

undeclared (first use in this function); did     you mean

'SMB_ACE4_INHERITED_ACE'?


=20
     ACE_INHERITED_ACE;


=20
 ^~~~~~~~~~~~~~~~~


=20
     SMB_ACE4_INHERITED_ACE

../../source3/modules/vfs_zfsacl.c:226:12: error:     request for member

'a_access_mask' in something not a structure or     union


=20
acebuf[i].a_access_mask =3D 0;


=20
=20
    =20
=20
=20
 ^

../../source3/modules/vfs_zfsacl.c:238:13: error:     dereferencing =
pointer
to

incomplete type 'struct fd_handle'


 if     (fsp-&gt;fh-&gt;fd !=3D -1) {


=20
=20
=20
=20
=20
    =20
^~

../../source3/modules/vfs_zfsacl.c:239:8: warning: implicit     =
declaration
of

function 'facl'; did you mean 'ffsl'?     =
[-Wimplicit-function-declaration]


=20
rv =3D     facl(fsp-&gt;fh-&gt;fd, ACE_SETACL, naces, acebuf);


=20
=20
    =20
 ^~~~


=20
=20
=20
     ffsl

../../source3/modules/vfs_zfsacl.c:239:26: error: 'ACE_SETACL'
undeclared

(first use in this function); did you mean     'MNT_DETACH'?


=20
rv =3D facl(fsp-&gt;fh-&gt;fd, ACE_SETACL,     naces, acebuf);


=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
 ^~~~~~~~~~


=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
     MNT_DETACH

../../source3/modules/vfs_zfsacl.c:242:8: warning: implicit     =
declaration
of

function 'acl'; did you mean 'acct'?     =
[-Wimplicit-function-declaration]


=20
rv =3D     acl(fsp-&gt;fsp_name-&gt;base_name, ACE_SETACL, naces, =
acebuf);


    =20
=20
=20
 ^~~


=20
=20
=20
     acct

../../source3/modules/vfs_zfsacl.c: At top     level:

../../source3/modules/vfs_zfsacl.c:283:9: error: unknown type name
'ace_t';

did you mean 'acl_t'?


=20
=20
=20
=20
ace_t     **outbuf)


=20
=20
=20
=20
^~~~~


=20
=20
    =20
=20
acl_t

../../source3/modules/vfs_zfsacl.c:318:10: error:     unknown type name
'ace_t';

did you mean 'acl_t'?


=20
=20
    =20
=20
 ace_t **outbuf)


=20
=20
=20
=20
     ^~~~~


=20
=20
=20
=20
     acl_t

../../source3/modules/vfs_zfsacl.c: In function     =
'zfsacl_fget_nt_acl':

../../source3/modules/vfs_zfsacl.c:365:2: error:     unknown type name
'ace_t';

did you mean 'acl_t'?


 ace_t *acebuf     =3D NULL;


 ^~~~~


     acl_t

../../source3/modules/vfs_zfsacl.c:374:10: warning: implicit     =
declaration
of

function 'fget_zfsacl'; did you mean     'set_nt_acl'?

[-Wimplicit-function-declaration]


 naces =3D     fget_zfsacl(talloc_tos(), fsp, &amp;acebuf);


=20
=20
=20
    =20
 ^~~~~~~~~~~


=20
=20
=20
=20
     set_nt_acl

../../source3/modules/vfs_zfsacl.c: In function     =
'zfsacl_get_nt_acl_at':

../../source3/modules/vfs_zfsacl.c:424:2: error:     unknown type name
'ace_t';

did you mean 'acl_t'?


 ace_t *acebuf     =3D NULL;


 ^~~~~


     acl_t

../../source3/modules/vfs_zfsacl.c:435:10: warning: implicit     =
declaration
of

function 'get_zfsacl'; did you mean     'set_nt_acl'?

[-Wimplicit-function-declaration]


 naces =3D     get_zfsacl(frame, smb_fname, &amp;acebuf);


=20
=20
=20
    =20
 ^~~~~~~~~~


=20
=20
=20
=20
 set_nt_acl



*     Node

/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/sparql_par=
ser

.tab.c     is created more than once (full message on 'waf -v -v'). The
task

generators are:


 1. 'spotlight2sparql.objlist' in     /build/samba-4.14.2+dfsg/source3


 2. 'rpc_mdssvc_module' in     =
/build/samba-4.14.2+dfsg/source3/rpc_server

If you think that this is an     error, set no_errcheck_out on the task
instance

*     Node

/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/sparql_par=
ser

.tab.h     is created more than once (full message on 'waf -v -v'). The
task

generators are:


 1. 'spotlight2sparql.objlist' in     /build/samba-4.14.2+dfsg/source3


 2. 'rpc_mdssvc_module' in     =
/build/samba-4.14.2+dfsg/source3/rpc_server

If you think that this is an     error, set no_errcheck_out on the task
instance

*     Node

/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/sparql_lex=
er.

lex.c     is created more than once (full message on 'waf -v -v'). The
task

generators are:


 1. 'spotlight2sparql.objlist' in     /build/samba-4.14.2+dfsg/source3


 2. 'rpc_mdssvc_module' in     =
/build/samba-4.14.2+dfsg/source3/rpc_server

If you think that this is an     error, set no_errcheck_out on the task
instance

*     Node

/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/es_parser.=
tab

.c     is created more than once (full message on 'waf -v -v'). The     =
task

generators are:


 1. 'spotlight2es.objlist' in     /build/samba-4.14.2+dfsg/source3


 2. 'rpc_mdssvc_module' in     =
/build/samba-4.14.2+dfsg/source3/rpc_server

If you think that this is an     error, set no_errcheck_out on the task
instance

*     Node

/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/es_parser.=
tab

.h     is created more than once (full message on 'waf -v -v'). The     =
task

generators are:


 1. 'spotlight2es.objlist' in     /build/samba-4.14.2+dfsg/source3


 2. 'rpc_mdssvc_module' in     =
/build/samba-4.14.2+dfsg/source3/rpc_server

If you think that this is an     error, set no_errcheck_out on the task
instance

*     Node

/build/samba-4.14.2+dfsg/bin/default/source3/rpc_server/mdssvc/es_lexer.l=
ex.

c     is created more than once (full message on 'waf -v -v'). The     =
task

generators are:


 1. 'spotlight2es.objlist' in     /build/samba-4.14.2+dfsg/source3


 2. 'rpc_mdssvc_module' in     =
/build/samba-4.14.2+dfsg/source3/rpc_server

If you think that this is an     error, set no_errcheck_out on the task
instance

Waf: Leaving directory     `/build/samba-4.14.2+dfsg/bin/default'

Build failed


-&gt; task     in 'vfs_zfsacl.objlist' failed with exit status 1:


=20
=20
    =20
 {task 139646019732984: c vfs_zfsacl.c -&gt;     vfs_zfsacl.c.42.o}

['/usr/lib/ccache/gcc', '-D_SAMBA_BUILD_=3D4',     =
'-DHAVE_CONFIG_H=3D1', '-g',

'-O2',     '-fdebug-prefix-map=3D/build/samba-4.14.2+dfsg=3D.',

'-fstack-protector-strong',     '-Wformat', '-Werror=3Dformat-security',
'-MMD',

'-D_GNU_SOURCE=3D1',     '-D_XOPEN_SOURCE_EXTENDED=3D1', =
'-DHAVE_CONFIG_H=3D1',

'-fPIC',     '-D__STDC_WANT_LIB_EXT1__=3D1',     '-D_REENTRANT',

'-DCTDB_HELPER_BINDIR=3D"/usr/lib/x86_64-linux-gnu/ctdb"',

'-DLOGDIR=3D"/var/log/ctdb"',     '-DCTDB_DATADIR=3D"/usr/share/ctdb"',

'-DCTDB_ETCDIR=3D"/etc/ctdb"',     '-DCTDB_VARDIR=3D"/var/lib/ctdb"',

'-DCTDB_RUNDIR=3D"/var/run/ctdb"',     '-fstack-protector-strong',

'-fstack-clash-protection',     '-DSTATIC_vfs_zfsacl_MODULES=3DNULL',

'-DSTATIC_vfs_zfsacl_MODULES_PROTO=3Dextern     void

__vfs_zfsacl_dummy_module_proto(void)', '-pthread',     '-pthread',

'-Isource3/modules', '-I../../source3/modules',     '-Isource3',

'-I../../source3', '-Isource3/include',     '-I../../source3/include',

'-Isource3/lib', '-I../../source3/lib',     =
'-Isource4/heimdal/lib/com_err',

'-I../../source4/heimdal/lib/com_err',     '-Isource4/heimdal/lib/krb5',

'-I../../source4/heimdal/lib/krb5',     '-Isource4/heimdal/lib/gssapi',

'-I../../source4/heimdal/lib/gssapi',
'-Isource4/heimdal/lib/gssapi/gssapi',

'-I../../source4/heimdal/lib/gssapi/gssapi',

'-Isource4/heimdal_build/include',
'-I../../source4/heimdal_build/include',

'-Ibin/default/source4/heimdal/lib/asn1',     =
'-Isource4/heimdal/lib/asn1',

'-Iinclude/public',     '-I../../include/public', '-Isource4',

'-I../../source4', '-Ilib',     '-I../../lib', '-Isource4/lib',

'-I../../source4/lib',     '-Isource4/include', =
'-I../../source4/include',

'-Iinclude',     '-I../../include', '-Ilib/replace',
'-I../../lib/replace',

'-Ictdb/include', '-I../../ctdb/include',     '-Ictdb', '-I../../ctdb',
'-I.',

'-I../..', '-Isource3/auth',     '-I../../source3/auth', '-Ilib/param',

'-I../../lib/param',     '-Ilibcli/named_pipe_auth',

'-I../../libcli/named_pipe_auth',     '-Isource3/librpc',

'-I../../source3/librpc', '-Isource4/cluster',
'-I../../source4/cluster',

'-Ilibrpc', '-I../../librpc', '-Ilibcli/dns',     '-I../../libcli/dns',

'-Isource3/rpc_server',     '-I../../source3/rpc_server', =
'-Iauth/gensec',

'-I../../auth/gensec',     '-Isource3/param', '-I../../source3/param',

'-Ilibcli/util',     '-I../../libcli/util',     =
'-Isource4/auth/kerberos',

'-I../../source4/auth/kerberos',     '-Isource4/heimdal/lib/hcrypto',

'-I../../source4/heimdal/lib/hcrypto',     '-Isource4/heimdal/lib',

'-I../../source4/heimdal/lib',     '-Isource4/heimdal/include',

'-I../../source4/heimdal/include',     '-Isource4/heimdal_build',

'-I../../source4/heimdal_build',     '-Iauth/ntlmssp',
'-I../../auth/ntlmssp',

'-Isource3/passdb',     '-I../../source3/passdb',
'-Isource4/libcli/smb2',

'-I../../source4/libcli/smb2',     '-Isource4/lib/socket',

'-I../../source4/lib/socket',     '-Isource4/heimdal/lib/roken',

'-I../../source4/heimdal/lib/roken',     '-Ilibcli/nbt',
'-I../../libcli/nbt',

'-Ilibcli/auth',     '-I../../libcli/auth', '-Ilibcli/http',

'-I../../libcli/http',     '-Ilib/audit_logging',
'-I../../lib/audit_logging',

'-Ilib/krb5_wrap',     '-I../../lib/krb5_wrap', '-Isource4/librpc',

'-I../../source4/librpc',     '-Ilibcli/lsarpc', =
'-I../../libcli/lsarpc',

'-Isource4/dsdb',     '-I../../source4/dsdb', '-Ilibcli/smb',

'-I../../libcli/smb',     '-Isource4/libcli', '-I../../source4/libcli',

'-Isource4/auth',     '-I../../source4/auth', '-Iauth/kerberos',

'-I../../auth/kerberos',     '-Isource4/heimdal/lib/asn1',

'-I../../source4/heimdal/lib/asn1',     '-Isource4/libcli/ldap',

'-I../../source4/libcli/ldap',     '-Isource3/smbd/notifyd',

'-I../../source3/smbd/notifyd',     '-Ilib/ldb-samba',
'-I../../lib/ldb-samba',

'-Ilibcli/ldap',     '-I../../libcli/ldap', '-Insswitch',
'-I../../nsswitch',

'-Iauth/credentials', '-I../../auth/credentials',     =
'-Isource4/lib/tls',

'-I../../source4/lib/tls',     '-Isource4/auth/gensec',

'-I../../source4/auth/gensec', '-Ilib/socket',     '-I../../lib/socket',

'-Isource4/lib/messaging',     '-I../../source4/lib/messaging',
'-Ilib/addns',

'-I../../lib/addns',     '-Ilibcli/cldap',     '-I../../libcli/cldap',

'-Isource4/heimdal/lib/hcrypto/libtommath',

'-I../../source4/heimdal/lib/hcrypto/libtommath',     '-Ilib/dbwrap',

'-I../../lib/dbwrap', '-Isource4/winbind',     =
'-I../../source4/winbind',

'-Ilibcli/security',     '-I../../libcli/security',

'-Isource4/heimdal/lib/wind',     '-I../../source4/heimdal/lib/wind',

'-Isource4/param',     '-I../../source4/param', '-Ilib/tsocket',

'-I../../lib/tsocket',     '-Isource4/lib/events',
'-I../../source4/lib/events',

'-Isource4/heimdal/lib/hx509',     '-I../../source4/heimdal/lib/hx509',

'-Insswitch/libwbclient',     '-I../../nsswitch/libwbclient',
'-Ilib/messaging',

'-I../../lib/messaging',     '-Isource4/heimdal/base',

'-I../../source4/heimdal/base',     '-Isource4/lib/stream',

'-I../../source4/lib/stream',     '-Ilib/util/charset',

'-I../../lib/util/charset', '-Idynconfig',     '-I../../dynconfig',
'-Iauth',

'-I../../auth', '-Ilib/afs',     '-I../../lib/afs',

'-Isource4/heimdal/lib/gssapi/spnego',

'-I../../source4/heimdal/lib/gssapi/spnego',

'-Isource4/heimdal/lib/gssapi/krb5',

'-I../../source4/heimdal/lib/gssapi/krb5',

'-Isource4/heimdal/lib/gssapi/mech',

'-I../../source4/heimdal/lib/gssapi/mech',     '-Ilibcli/registry',

'-I../../libcli/registry', '-Ilib/crypto',     '-I../../lib/crypto',

'-Ilib/smbconf', '-I../../lib/smbconf',     '-Ilib/async_req',

'-I../../lib/async_req',

'-Ilib/util/build/samba-4.14.2+dfsg/third_party/gpfs',

'-I../../lib/util/build/samba-4.14.2+dfsg/third_party/gpfs',

'-Ilibcli/drsuapi',     '-I../../libcli/drsuapi', '-Ilibds/common',

'-I../../libds/common',     '-Ilib/pthreadpool', =
'-I../../lib/pthreadpool',

'-Ilib/compression',     '-I../../lib/compression',     =
'-Ilibcli/netlogon',

'-I../../libcli/netlogon',     '-I/usr/include/p11-kit-1',

'-I/usr/include/glib-2.0',
'-I/usr/lib/x86_64-linux-gnu/glib-2.0/include',

'-I/usr/include/tracker-2.0',

'-I/usr/include/tracker-2.0/libtracker-sparql',
'-I/usr/include/libmount',

'-I/usr/include/blkid',     '-I/usr/include/uuid',

'../../source3/modules/vfs_zfsacl.c',     '-c',

'-o/build/samba-4.14.2+dfsg/bin/default/source3/modules/vfs_zfsacl.c.42.o=
',

'-Wdate-time',     '-D_FORTIFY_SOURCE=3D2']

make[1]: *** [debian/rules:104:     override_dh_auto_build] Error 1

make[1]: Leaving directory     '/build/samba-4.14.2+dfsg'

make: *** [debian/rules:98: build] Error     2

dpkg-buildpackage: error: debian/rules build subprocess returned exit
status

2

I: copying local configuration

E: Failed autobuilding of     package







&gt; -----Oorspronkelijk bericht-----

&gt; Van:     Pkg-samba-maint=20

&gt; [mailto:
pkg-samba-maint-bounces+belle
=3Dbazuin.nl@alioth-lists.d


ebian.net
] Namens     Mathieu Parent

&gt; Verzonden: zaterdag 17 april 2021 18:53

&gt; Aan:     Fred Donck

&gt; CC: Debian Samba Maintainers

&gt; Onderwerp: Re:     [Pkg-samba-maint] vfs_zfsacl module on Debian

&gt;=20

&gt; Le ven. 16     avr. 2021 =E0 18:04, Fred Donck &lt;
fred@procolix.com
&gt; a =E9crit :

&gt; &gt;

&gt; &gt;     To whom this may concern,

&gt; &gt;

&gt; &gt; I am looking for     information on how to get the above =
module=20

&gt; to work on

&gt; &gt;     Debian Bulls Eye.

&gt; &gt;

&gt; &gt; I am trying to get a (ZFS)     client on Windows to be able to
hand out

&gt; &gt; privileges from     Windows. As far as I can tell the module =
to=20

&gt; cater for

&gt; &gt;     this is the one mentioned in the subject.

&gt; &gt;

&gt; &gt; I have     noticed that this module is by default not part of =
the

&gt; &gt;     distribution. I have some questions about this.

&gt; &gt;

&gt; &gt; -     Is this intentionally?

&gt;=20

&gt; libzfslinux-dev is in contrib, and     samba can't depend on it.

&gt;=20

&gt; &gt; - Will there be support in     the near future?

&gt; &gt; - Trying to solve my problem, made me run into
compilation-errors

&gt; &gt;
=20
 because it does not seem to     compile.

&gt; &gt;

&gt; &gt; A simple change in the rules     file:

&gt; &gt;

&gt; &gt; :~/work/samba-4.13.5+dfsg/debian$ diff -c     rules-20210319FD
rules

&gt; &gt; *** rules-20210319FD
=20
     2021-02-09 21:00:30.000000000 +0100

&gt; &gt; --- rules
=20
    =20
=20
2021-04-14 10:06:21.326931259 +0200

&gt; &gt;     ***************

&gt; &gt; *** 5,10 ****

&gt; &gt; --- 5,11     ----

&gt; &gt;

&gt; &gt;
=20
 export DEB_BUILD_MAINT_OPTIONS =3D     hardening=3D+all

&gt; &gt;
=20
 export DEB_LDFLAGS_MAINT_APPEND =3D     -Wl,--as-needed

&gt; &gt; +

&gt; &gt;
=20
     DPKG_EXPORT_BUILDFLAGS =3D 1

&gt; &gt;
=20
 include     /usr/share/dpkg/
buildflags.mk


&gt; &gt;
=20
 include     /usr/share/dpkg/
pkg-info.mk


&gt; &gt; ***************

&gt; &gt; ***     50,56 ****

&gt; &gt;
=20
=20
=20
=20
=20
=20
    =20
=20
 --with-utmp \

&gt; &gt;
=20
=20
=20
=20
    =20
=20
=20
=20
 --with-winbind \

&gt; &gt;
=20
    =20
=20
=20
=20
=20
=20
=20
 --with-quota \

&gt; &gt;     !

&gt; &gt;=20

&gt;     =
--with-shared-modules=3Didmap_rid,idmap_ad,idmap_adex,idmap_hash

,idmap_ldap,idmap_tdb2,vfs_dfs_samba4,auth_samba4,vfs_nfs4acl_xattr

&gt;     &gt; \

&gt; &gt;
=20
=20
=20
=20
=20
=20
=20
    =20
 --with-automount \

&gt; &gt;
=20
=20
=20
=20
    =20
=20
=20
=20
 --with-ldap \

&gt; &gt;
=20
=20
    =20
=20
=20
=20
=20
=20
 --with-ads \

&gt; &gt; ---     51,57 ----

&gt; &gt;
=20
=20
=20
=20
=20
=20
    =20
=20
 --with-utmp \

&gt; &gt;
=20
=20
=20
=20
    =20
=20
=20
=20
 --with-winbind \

&gt; &gt;
=20
    =20
=20
=20
=20
=20
=20
=20
 --with-quota \

&gt; &gt;     !

&gt; &gt;=20

&gt;     =
--with-shared-modules=3Didmap_rid,idmap_ad,idmap_adex,idmap_hash

,idmap_ldap,idmap_tdb2,vfs_dfs_samba4,auth_samba4,vfs_nfs4acl_xattr,vfs_&=
gt;

zfsacl

&gt;     &gt; \

&gt; &gt;
=20
=20
=20
=20
=20
=20
=20
    =20
 --with-automount \

&gt; &gt;
=20
=20
=20
=20
    =20
=20
=20
=20
 --with-ldap \

&gt; &gt;
=20
=20
    =20
=20
=20
=20
=20
=20
 --with-ads \

&gt; &gt;     :~/work/samba-4.13.5+dfsg/debian$

&gt; &gt;

&gt; &gt;

&gt; &gt;     :~/work/samba-4.13.5+dfsg/debian$ dpkg-buildpackage -us =
-uc

&gt;     &gt;

&gt; &gt; This fails.

&gt; &gt;

&gt; &gt;     ../../source3/modules/vfs_zfsacl.c:54:17: error: unknown=20

&gt; type name     =91ace_t=92

&gt; &gt;
=20
=20
54 |
=20
=20
=20
    =20
=20
const ace_t *acebuf,

&gt; &gt;
=20
=20
=20
     |
=20
=20
=20
=20
=20
=20
=20
=20
^~~~~

&gt;     &gt; ../../source3/modules/vfs_zfsacl.c: In function=20

&gt;     =91zfs_get_nt_acl_common=92:

&gt; &gt;     ../../source3/modules/vfs_zfsacl.c:93:42: error: request =
for
member

&gt;     &gt; =91a_type=92 in something not a structure or union

&gt; &gt;
    =20
=20
93 |
=20
aceprop.aceType
 =3D (uint32_t)     acebuf[i].a_type;

&gt; &gt;
=20
=20
=20
 |
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
 ^

&gt; &gt;     ../../source3/modules/vfs_zfsacl.c:94:42: error: request =
for
member

&gt;     &gt; =91a_flags=92 in something not a structure or union

&gt; &gt;
    =20
=20
94 |
=20
aceprop.aceFlags =3D (uint32_t)     acebuf[i].a_flags;

&gt; &gt;
=20
=20
=20
 |
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
 ^

&gt; &gt;     ../../source3/modules/vfs_zfsacl.c:95:42: error: request =
for
member

&gt;     &gt; =91a_access_mask=92 in something not a structure or union

&gt;     &gt;
=20
=20
95 |
=20
aceprop.aceMask
 =3D (uint32_t)     acebuf[i].a_access_mask;

&gt; &gt;
=20
=20
=20
 |
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
 ^

&gt;     &gt; ../../source3/modules/vfs_zfsacl.c:96:42: error: request =
for
member

&gt; &gt; =91a_who=92 in something not a structure or union

&gt;     &gt;
=20
=20
96 |
=20

aceprop.who.id

=20
=3D (uint32_t)     acebuf[i].a_who;

&gt; &gt;
=20
=20
=20
 |
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
 ^

&gt; &gt;     ../../source3/modules/vfs_zfsacl.c:100:27: error:
=91ACE_EVERYONE=92

&gt;     &gt; undeclared (first use in this function)

&gt; &gt;
=20
 100     |
=20
=20
=20
(aceprop.aceFlags &amp; ACE_EVERYONE)     &amp;&amp;

&gt; &gt;
=20
=20
=20
 |
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
^~~~~~~~~~~~

&gt; &gt; ../../source3/modules/vfs_zfsacl.c:100:27:     note: each
undeclared

&gt; &gt; identifier is reported only once for each     function it =
appears
in

&gt; &gt;     ../../source3/modules/vfs_zfsacl.c:101:27: error:=20

&gt;     =91ACE_INHERITED_ACE=92

&gt; &gt; undeclared (first use in this function);     did you mean

&gt; &gt; =91SMB_ACE4_INHERITED_ACE=92?

&gt; &gt;
    =20
 101 |
=20
=20
=20
(aceprop.aceFlags &amp;     ACE_INHERITED_ACE))

&gt; &gt;
=20
=20
=20
 |
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
^~~~~~~~~~~~~~~~~

&gt; &gt;
=20
=20
=20
 |
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
SMB_ACE4_INHERITED_ACE

&gt; &gt;     ../../source3/modules/vfs_zfsacl.c:114:22: error: request =
for
member

&gt;     &gt; =91a_flags=92 in something not a structure or union

&gt; &gt;
    =20
 114 |
=20
special =3D acebuf[i].a_flags &amp;=20

&gt;     (ACE_OWNER|ACE_GROUP|ACE_EVERYONE);

&gt; &gt;
=20
=20
=20
     |
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
 ^

&gt; &gt; ../../source3/modules/vfs_zfsacl.c:114:34: error:    =20

&gt; =91ACE_OWNER=92 undeclared

&gt; &gt; (first use in this function);     did you mean =
=91ACL_OTHER=92?

&gt; &gt;
=20
 114 |
    =20
special =3D acebuf[i].a_flags &amp;=20

&gt;     (ACE_OWNER|ACE_GROUP|ACE_EVERYONE);

&gt; &gt;
=20
=20
=20
     |
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
 ^~~~~~~~~

&gt;     &gt;
=20
=20
=20
 |
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
     ACL_OTHER

&gt; &gt; ../../source3/modules/vfs_zfsacl.c:114:44: error:    =20

&gt; =91ACE_GROUP=92 undeclared

&gt; &gt; (first use in this function);     did you mean =
=91ACL_GROUP=92?

&gt; &gt;
=20
 114 |
    =20
special =3D acebuf[i].a_flags &amp;=20

&gt;     (ACE_OWNER|ACE_GROUP|ACE_EVERYONE);

&gt; &gt;
=20
=20
=20
     |
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
 ^~~~~~~~~

&gt; &gt;
=20
=20
=20
 |
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
    =20
=20
=20
=20
=20
=20
=20
=20
=20
     ACL_GROUP

&gt; &gt;

&gt; &gt;

&gt; &gt;

&gt; &gt; ace_t is     defined in /usr/include/libspl/sys/acl.h.

&gt; &gt;

&gt; &gt; Is there     a way to get this fixed?

&gt;=20

&gt; Maybe add libzfslinux-dev to     Build-depends (in debian/control)?

&gt;=20

&gt;=20

&gt; &gt; Thanks for     any hint.

&gt; &gt;

&gt; &gt; Best regards

&gt; &gt; --

&gt;     &gt;

&gt; &gt; fred donck

&gt; &gt;

&gt; &gt;     _______________________________________________

&gt; &gt; Pkg-samba-maint     mailing list

&gt; &gt;=20
Pkg-samba-maint@alioth-lists.debian.net


&gt; &gt;    =20

&gt;=20
https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/pkg-s


&gt;     amba-maint

&gt;=20

&gt;=20

&gt; Regards

&gt; --=20

&gt; Mathieu     Parent

&gt;=20

&gt;     _______________________________________________

&gt; Pkg-samba-maint     mailing list

&gt;=20
Pkg-samba-maint@alioth-lists.debian.net


&gt;=20
https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/pkg-s


&gt;     amba-maint

&gt;=20












