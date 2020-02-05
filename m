Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9441534F6
	for <lists+samba-technical@lfdr.de>; Wed,  5 Feb 2020 17:06:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=uDoYe7gaTA/L71qXZGSiwiUIq2GU/wLIbMNHz4GPlzk=; b=Xu91E9WnzC6QgVwMsu1S5htBK9
	tMQKKTF/sfTsWVCWaP3v/FXHhNJaLsyxcDdDqJb93ZEbNGSeY7NYlF8MqTBizlq2DEJ3nWRZbvc2I
	12mCuh2r5+iUlpsgVoJoNU0bLCNrYnzKtbD6ExgdUijbHv/cwCKZVtHWl5hQQ3gstQDZwTncY/IDj
	5iJqMpGYR7RHA0cPNYUROnGKydkzq9rgQnA76D7laHt1LsAga7cu1dU8UTJnWEQlGAfPxtR+FK4GQ
	28CmkZL6UaMwpmDYwwkHnZKOFj1lLR0Tw4eBETMRdqjxpeRZG0pzZC/YvMiKLqlMjb4mwtsoyFSTH
	CVEBbAJQ==;
Received: from localhost ([::1]:25384 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1izNBr-008Lt5-ED; Wed, 05 Feb 2020 16:06:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43378) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1izNBn-008Lsy-9X
 for samba-technical@lists.samba.org; Wed, 05 Feb 2020 16:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=uDoYe7gaTA/L71qXZGSiwiUIq2GU/wLIbMNHz4GPlzk=; b=ykTI2W0lvOaB4tdtXqmP5MkQT+
 j7GD7fIdJrsZcY9RwxuZFo35ft/WFR4FStI4HN9fVPckVNUB4l9j60IYk+2gb6NDgTfaviQmUb16J
 ghHw61a/NCF9CNFhe45krWU5mBYbdJmFJ0pPdqHU1xMWi+FjZ9UDw7aOSKS9CGEYliP8FE415ejCG
 4U9IQ9FbxkHm4Y+W9g9TZA7gLkbahbd2L6EJ8gd69izCRLRzKkbYHCvZ4lTZmGaC/6HhXsfkJJr2K
 xR96xGVadIFKA73LQL8D4KLugeCtGgmD36c+DeM21Ja8GdybP8c2prNNy78+5v15HVrNzVYyaE2KF
 nh59rdo7N3PDBdHRrsgZlSzS9ciE01AsN0vH28jBioJks5/rZOpGKvEV6mEfS+aI3tFbgoDyAgG22
 FkLU+rucF9Cg3aVwgcq1hAZFAYfiujuhA0TZ0JaHyweJYRDDCARh+gAV8jYMls/DzR5X+41/fuJdm
 SUiK7S3bbSXXMUYUfce+J/5k;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1izNBm-0002hI-P2
 for samba-technical@lists.samba.org; Wed, 05 Feb 2020 16:06:06 +0000
To: <samba-technical@lists.samba.org>
Subject: Question with compiling 4.12rc2 and ceph. 
Date: Wed, 5 Feb 2020 17:06:06 +0100
Message-ID: <FA363CC88056472198851E19496FC799@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AdXcPiwjC5LQAG2AT7iJiwXLrCZ/mQ==
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

hai, 
 
I have a question, 
Im working on the 4.12.0rc2  packages for debian buster.
im having a few problems with these parts in source3/wscript mainly the ceph
part. 


I was thinking base on : 
  --with-libcephfs no longer supported, please use compiler
  flags instead, e.g. GCC LIBRARY_PATH and C_INCLUDE_PATH''') 

That this would be correct : 
  --with-libcephfs=/usr/lib/$(DEB_HOST_MULTIARCH) \  


From source3/wscript 

    opt.add_option('--with-libcephfs',
                   help=("Directory under which libcephfs is installed"),
                   action="store", dest='libcephfs_dir', default=None)
and 
 
    conf.env['CFLAGS_CEPHFS'] = "-D_FILE_OFFSET_BITS=64"
    if Options.options.libcephfs_dir:
        Logs.error('''--with-libcephfs no longer supported, please use
compiler
                   flags instead, e.g. GCC LIBRARY_PATH and
C_INCLUDE_PATH''')
        sys.exit(1)
 
    if (Options.options.with_cephfs and
        conf.CHECK_HEADERS('cephfs/libcephfs.h', False, False, 'cephfs') and
        conf.CHECK_LIB('cephfs', shlib=True)):
        if (Options.options.with_acl_support and
            conf.CHECK_FUNCS_IN('ceph_statx', 'cephfs',
                                headers='cephfs/libcephfs.h')):
            conf.DEFINE('HAVE_CEPH', '1')
        else:
            Logs.warn('''Ceph support disabled due to --without-acl-support
                      or lack of ceph_statx support''')
            conf.undefine('HAVE_CEPH')

 
which translates in debian/rules to : 
 
override_dh_shlibdeps:
 
LD_LIBRARY_PATH=$(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)/samba:$$LD_LIBRARY_
PATH \
          dh_shlibdeps -a -Xceph.so -Xglusterfs.so -Xsnapper.so
-Xctdb_mutex_ceph_rados_helper
ifneq (,$(filter amd64 arm64 armel armhf i386 mips64el mipsel ppc64el ppc64
s390x x32, $(DEB_HOST_ARCH)))
 
LD_LIBRARY_PATH=$(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)/samba:$$LD_LIBRARY_
PATH \
          dh_shlibdeps -a -- -pvfsceph -dRecommends \
            -e debian/samba-vfs-modules/usr/lib/*/samba/vfs/ceph.so
 
LD_LIBRARY_PATH=$(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)/samba:$$LD_LIBRARY_
PATH \
          dh_shlibdeps -a -- -prados -dRecommends \
            -e debian/ctdb/usr/lib/*/ctdb/ctdb_mutex_ceph_rados_helper
endif
ifeq ($(DEB_HOST_ARCH_OS), linux)
 
LD_LIBRARY_PATH=$(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)/samba:$$LD_LIBRARY_
PATH \
          dh_shlibdeps -a -- -pvfsglusterfs -dRecommends \
            -e debian/samba-vfs-modules/usr/lib/*/samba/vfs/glusterfs.so
endif
 
LD_LIBRARY_PATH=$(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)/samba:$$LD_LIBRARY_
PATH \
          dh_shlibdeps -a -- -pvfssnapper -dRecommends \
            -e debian/samba-vfs-modules/usr/lib/*/samba/vfs/snapper.so


Now, my problem here, i am at the point that most is build and looks good,
but im stopped at this part.

override_dh_shlibdeps:
 
LD_LIBRARY_PATH=$(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)/samba:$$LD_LIBRARY_
PATH \
          dh_shlibdeps -a -Xceph.so -Xglusterfs.so -Xsnapper.so
-Xctdb_mutex_ceph_rados_helper
ifneq (,$(filter amd64 arm64 armel armhf i386 mips64el mipsel ppc64el ppc64
s390x x32, $(DEB_HOST_ARCH)))
 
LD_LIBRARY_PATH=$(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)/samba:$$LD_LIBRARY_
PATH \
          dh_shlibdeps -a -- -pvfsceph -dRecommends \
            -e debian/samba-vfs-modules/usr/lib/*/samba/vfs/ceph.so

Because it cant find debian/samba-vfs-modules/usr/lib/*/samba/vfs/ceph.so

But i found these 2. ( from manualy .configure make .. ) 
samba-4.12.0rc2/bin/default/source3/modules/libvfs_module_ceph.so
samba-4.12.0rc2/bin/modules/vfs/ceph.so

So, if i just run : ./configure && make && make install, its all done
successfully. 
And ceph.so is created correctly, i dont see what i mis here. 

Im doing something wrong with the parameter 
                --with-libcephfs=/usr/lib/$(DEB_HOST_MULTIARCH) \
At least thats what im thinking, but i dont see what.

And this if the part of debian/rules that configures it. 
conf_args = \
                --prefix=/usr \
                --enable-fhs \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --libexecdir=/usr/lib/$(DEB_HOST_MULTIARCH) \
                --with-privatedir=/var/lib/samba/private \
                --with-smbpasswd-file=/etc/samba/smbpasswd \
                --with-piddir=/run/samba \
                --with-pammodulesdir=/lib/$(DEB_HOST_MULTIARCH)/security \
                --with-pam \
                --with-syslog \
                --with-utmp \
                --with-winbind \
                --with-quota \
 
--with-shared-modules=idmap_rid,idmap_ad,idmap_adex,idmap_hash,idmap_ldap,id
map_tdb2,vfs_dfs_samba4,auth_samba4,vfs_nfs4acl_xattr \
                --with-automount \
                --with-ldap \
                --with-ads \
                --with-dnsupdate \
                --with-gpgme \
                --libdir=/usr/lib/$(DEB_HOST_MULTIARCH) \
                --with-modulesdir=/usr/lib/$(DEB_HOST_MULTIARCH)/samba \
                --datadir=/usr/share \
                --with-lockdir=/run/samba \
                --with-statedir=/var/lib/samba \
                --with-cachedir=/var/cache/samba \
                --enable-avahi \
                --disable-rpath \
                --disable-rpath-install \
 
--bundled-libraries=NONE,pytevent,iniparser,roken,replace,wind,hx509,asn1,he
imbase,hcrypto,krb5,gssapi,heimntlm,hdb,kdc,com_err,compile_et,asn1_compile
\
                --builtin-libraries=ccan,samba-cluster-support \
                --minimum-library-version="$(shell ./debian/autodeps.py
--minimum-library-version)" \
                --with-cluster-support \
                --with-socketpath=/run/ctdb/ctdbd.socket \
                --with-logdir=/var/log/ctdb \
                --with-libcephfs=/usr/lib/$(DEB_HOST_MULTIARCH) \
                --enable-etcd-reclock \
                --enable-spotlight

ifneq (,$(filter amd64 arm64 armel armhf i386 mips64el mipsel ppc64el ppc64
s390x x32, $(DEB_HOST_ARCH)))
        conf_args += \
                --with-libcephfs=/usr/lib/$(DEB_HOST_MULTIARCH) \
                --enable-ceph-reclock
else
        conf_args += \
                --disable-cephfs
Endif


So if anyone has any suggestions? Very appriciated. 

Thanks in advance.. 


Greetz, 

Louis





