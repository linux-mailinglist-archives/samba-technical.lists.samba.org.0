Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2C179EFE
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 06:14:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ERDCb+gYZwnIIEiZCH1udONNjz19F8h5SF5jc1rdeXY=; b=cbITCDhdFWkTTpE2RetoRXR4hU
	jCg1YluNUudFRdWJEkj3VIPowkfB0z7X5kXy76/t4mn1EcvGoYwX9jLlDih4O2Xl6wXic1jmHowQq
	7rsFlq727s30NKRishRkWtsBWPrOQQd0XkobTUhp5/tUwWBKGXrKjtaZlJ5MOALv8a0Q9FW9NjV8b
	1kMgrXc+cCiN1haYt6VyxcbxtncKQ5ZcuBjNn+URhnHbf+bjNEk3u2NqaaJsZcftpfcSF6+Yzq2cv
	T71M8FrSVdbLcoI/S2SznWU0LqWLoDhUvXA61yhZbuihM11JVxcSw6qQN5DWelz6Bn2CX5GSgcwyp
	0CHlE0Sw==;
Received: from localhost ([::1]:65488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9ipR-00EzyR-6j; Thu, 05 Mar 2020 05:13:49 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:35406) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j9ipK-00EzyK-C7
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 05:13:45 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 0C702C484D9A5
 for <samba-technical@lists.samba.org>; Thu,  5 Mar 2020 08:13:38 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NJgW-Bzrj5DD for <samba-technical@lists.samba.org>;
 Thu,  5 Mar 2020 08:13:22 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 6E6ECD18E15FB
 for <samba-technical@lists.samba.org>; Thu,  5 Mar 2020 08:13:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 6E6ECD18E15FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1583385202;
 bh=GH4hMb8GjoGdxT5dwPcp1dQBzVv1hJCT7zEvLcjGWDE=;
 h=Date:MIME-Version:To:From:Message-ID;
 b=V3+LKmnZ4we522RES7ZAIhmKpvWgYm0ITeUvrBMz0yLa/edLNi7NfDLNTlRMaO92e
 IPE/kOmDE8k1d1lWrsZd5kIDVB8wWtrTLOnjGuqR9EbXqhc7tTZR6p+rE2n4Qc7uRr
 Ks/NVUyB+5vm5qx4j2Rn2E6rutqIV5Vy1Zdgv2VhNPDm7qFuOoFSACyJg+ig+SJGCU
 PXsF9a9Np9p/hJJLsvVsUbV/Vc1Ok7AHPIw21EPJCH2gZ0b4wz5FnGTIE2sJXyyaR+
 xJhglN1+UZCMYBHyntmC7Vi1dmhLca9MT8MbGyCp9lgVTvUGmkVyERFvCHbzlTelXJ
 X566qgvmoGIAg==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id iO0nLugHyDDz for <samba-technical@lists.samba.org>;
 Thu,  5 Mar 2020 08:13:22 +0300 (MSK)
Received: from [10.147.77.51] (unknown [176.59.38.226])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id E0D5EC484D9A5
 for <samba-technical@lists.samba.org>; Thu,  5 Mar 2020 08:13:21 +0300 (MSK)
Date: Thu, 05 Mar 2020 08:13:18 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <20200303104715.GA11956@carrie2>
References: <20200303104715.GA11956@carrie2>
MIME-Version: 1.0
Subject: Re: [Announce] Samba 4.12.0 Available for Download
To: samba-technical@lists.samba.org
Message-ID: <F5AB518A-4210-4A4F-B6E7-3FED4A78F7E6@rosalinux.ru>
Content-Type: text/plain;
 charset=utf-8
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

What is the status of SMBv1 in Samba 4=2E12?

3 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2020 =D0=B3=2E 13:47:17 GMT+03:00, Karoli=
n Seeger via samba-technical <samba-technical@lists=2Esamba=2Eorg> =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
>Release Announcements
>---------------------
>
>This is the first stable release of the Samba 4=2E12 release series=2E
>Please read the release notes carefully before upgrading=2E
>
>
>NEW FEATURES/CHANGES
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>Python 3=2E5 Required
>-------------------
>
>Samba's minimum runtime requirement for python was raised to Python
>3=2E4 with samba 4=2E11=2E  Samba 4=2E12 raises this minimum version to P=
ython
>3=2E5 both to access new features and because this is the oldest version
>we test with in our CI infrastructure=2E
>
>(Build time support for the file server with Python 2=2E6 has not
>changed)
>
>Removing in-tree cryptography: GnuTLS 3=2E4=2E7 required
>----------------------------------------------------
>
>Samba is making efforts to remove in-tree cryptographic functionality,
>and to instead rely on externally maintained libraries=2E  To this end,
>Samba has chosen GnuTLS as our standard cryptographic provider=2E
>
>Samba now requires GnuTLS 3=2E4=2E7 to be installed (including developmen=
t
>headers at build time) for all configurations, not just the Samba AD
>DC=2E
>
>Thanks to this work Samba no longer ships an in-tree DES
>implementation and on GnuTLS 3=2E6=2E5 or later Samba will include no
>in-tree cryptography other than the MD4 hash and that
>implemented in our copy of Heimdal=2E
>
>Using GnuTLS for SMB3 encryption you will notice huge performance and
>copy
>speed improvements=2E Tests with the CIFS Kernel client from Linux Kernel
>5=2E3
>show a 3x speed improvement for writing and a 2=2E5x speed improvement
>for reads!
>
>NOTE WELL: The use of GnuTLS means that Samba will honour the
>system-wide 'FIPS mode' (a reference to the US FIPS-140 cryptographic
>standard) and so will not operate in many still common situations if
>this system-wide parameter is in effect, as many of our protocols rely
>on outdated cryptography=2E
>
>A future Samba version will mitigate this to some extent where good
>cryptography effectively wraps bad cryptography, but for now that above
>applies=2E
>
>zlib library is now required to build Samba
>-------------------------------------------
>
>Samba no longer includes a local copy of zlib in our source tarball=2E
>By removing this we do not need to ship (even where we did not
>build) the old, broken zip encryption code found there=2E
>
>New Spotlight backend for Elasticsearch
>---------------------------------------
>
>Support for the macOS specific Spotlight search protocol has been
>enhanced
>significantly=2E Starting with 4=2E12 Samba supports using Elasticsearch =
as
>search
>backend=2E Various new parameters have been added to configure this:
>
>  spotlight backend =3D noindex | elasticsearch | tracker
>  elasticsearch:address =3D ADDRESS
>  elasticsearch:port =3D PORT
>  elasticsearch:use tls =3D BOOLEAN
>  elasticsearch:index =3D INDEXNAME
>  elasticsearch:mappings =3D PATH
>  elasticsearch:max results =3D NUMBER
>
>Samba also ships a Spotlight client command "mdfind" which can be used
>to search
>any SMB server that runs the Spotlight RPC service=2E See the manpage of
>mdfind
>for details=2E
>
>Note that when upgrading existing installations that are using the
>previous
>default Spotlight backend Gnome Tracker must explicitly set "spotlight
>backend =3D
>tracker" as the new default is "noindex"=2E
>
>'net ads kerberos pac save' and 'net eventlog export'
>-----------------------------------------------------
>
>The 'net ads kerberos pac save' and 'net eventlog export' tools will
>no longer silently overwrite an existing file during data export=2E  If
>the filename given exits, an error will be shown=2E
>
>Fuzzing
>-------
>
>A large number of fuzz targets have been added to Samba, and Samba has
>been registered in Google's oss-fuzz cloud fuzzing service=2E  In
>particular, we now have good fuzzing coverage of our generated NDR
>parsing code=2E
>
>A large number of issues have been found and fixed thanks to this
>effort=2E
>
>'samba-tool' improvements add contacts as member to groups
>----------------------------------------------------------
>
>Previously 'samba-tool group addmemers' can just add users, groups and
>computers as members to groups=2E But also contacts can be members of
>groups=2E Samba 4=2E12 adds the functionality to add contacts to
>groups=2E Since contacts have no sAMAccountName, it's possible that
>there are more than one contact with the same name in different
>organizational units=2E Therefore it's necessary to have an option to
>handle group members by their DN=2E
>
>To get the DN of an object there is now the "--full-dn" option
>available
>for all necessary commands=2E
>
>The MS Windows UI allows to search for specific types of group members
>when searching for new members for a group=2E This feature is included
>here with the new samba-tool group addmembers "--object-type=3DOBJECTYPE"
>option=2E The different types are selected accordingly to the Windows
>UI=2E The default samba-toole behaviour shouldn't be changed=2E
>
>Allow filtering by OU or subtree in samba-tool
>----------------------------------------------
>
>A new "--base-dn" and "--member-base-dn" option is added to relevant
>samba-tool user, group and ou management commands to allow operation
>on just one part of the AD tree, such as a single OU=2E
>
>VFS
>=3D=3D=3D
>
>SMB_VFS_NTIMES
>--------------
>
>Samba now uses a sentinel value based on utimensat(2) UTIME_OMIT to
>denote
>to-be-ignored timestamp variables passed to the SMB_VFS_NTIMES() VFS
>function=2E
>
>VFS modules can check whether any of the time values inside a struct
>smb_file_time is to be ignored by calling is_omit_timespec() on the
>value=2E
>
>'io_uring' vfs module
>---------------------
>
>The module makes use of the new io_uring infrastructure
>(intruduced in Linux 5=2E1), see https://lwn=2Enet/Articles/776703/
>
>Currently this implements SMB_VFS_{PREAD,PWRITE,FSYNC}_SEND/RECV
>and avoids the overhead of the userspace threadpool in the default
>vfs backend=2E See also vfs_io_uring(8)=2E
>
>In order to build the module you need the liburing userspace library
>and its developement headers installed, see
>https://git=2Ekernel=2Edk/cgit/liburing/
>
>At runtime you'll need a Linux kernel with version 5=2E1 or higher=2E
>Note that 5=2E4=2E14 and 5=2E4=2E15 have a regression that breaks the Sam=
ba
>module! The regression was fixed in Linux 5=2E4=2E16 again=2E
>
>MS-DFS changes in the VFS
>-------------------------
>
>This release changes set getting and setting of MS-DFS redirects
>on the filesystem to go through two new VFS functions:
>
>SMB_VFS_CREATE_DFS_PATHAT()
>SMB_VFS_READ_DFS_PATHAT()
>
>instead of smbd explicitly storing MS-DFS redirects inside
>symbolic links on the filesystem=2E The underlying default
>implementations of this has not changed, the redirects are
>still stored inside symbolic links on the filesystem, but
>moving the creation and reading of these links into the VFS
>as first-class functions now allows alternate methods of
>storing them (maybe in extended attributes) for OEMs who
>don't want to mis-use filesystem symbolic links in this
>way=2E
>
>
>CTDB changes
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>* The ctdb_mutex_fcntl_helper periodically re-checks the lock file
>
>  The re-check period is specified using a 2nd argument to this
>  helper=2E  The default re-check period is 5s=2E
>
>  If the file no longer exists or the inode number changes then the
>  helper exits=2E  This triggers an election=2E
>
>
>REMOVED FEATURES
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>The smb=2Econf parameter "write cache size" has been removed=2E
>
>Since the in-memory write caching code was written, our write path has
>changed significantly=2E In particular we have gained very flexible
>support for async I/O, with the new linux io_uring interface in
>development=2E  The old write cache concept which cached data in main
>memory followed by a blocking pwrite no longer gives any improvement
>on modern systems, and may make performance worse on memory-contrained
>systems, so this functionality should not be enabled in core smbd
>code=2E
>
>In addition, it complicated the write code, which is a performance
>critical code path=2E
>
>If required for specialist purposes, it can be recreated as a VFS
>module=2E
>
>Retiring DES encryption types in Kerberos=2E
>------------------------------------------
>With this release, support for DES encryption types has been removed
>from
>Samba, and setting DES_ONLY flag for an account will cause Kerberos
>authentication to fail for that account (see RFC-6649)=2E
>
>Samba-DC: DES keys no longer saved in DB=2E
>-----------------------------------------
>When a new password is set for an account, Samba DC will store random
>keys
>in DB instead of DES keys derived from the password=2E  If the account is
>being
>migrated to Windbows or to an older version of Samba in order to use
>DES keys,
>the password must be reset to make it work=2E
>
>Heimdal-DC: removal of weak-crypto=2E
>-----------------------------------
>Following removal of DES encryption types from Samba, the embedded
>Heimdal
>build has been updated to not compile weak crypto code
>(HEIM_WEAK_CRYPTO)=2E
>
>vfs_netatalk: The netatalk VFS module has been removed=2E
>-------------------------------------------------------
>
>The netatalk VFS module has been removed=2E It was unmaintained and is
>not needed
>any more=2E
>
>BIND9_FLATFILE deprecated
>-------------------------
>
>The BIND9_FLATFILE DNS backend is deprecated in this release and will
>be removed in the future=2E  This was only practically useful on a single
>domain controller or under expert care and supervision=2E
>
>This release removes the 'rndc command' smb=2Econf parameter, which
>supported this configuration by writing out a list of DCs permitted to
>make changes to the DNS Zone and nudging the 'named' server if a new
>DC was added to the domain=2E  Administrators using BIND9_FLATFILE will
>need to maintain this manually from now on=2E
>
>
>smb=2Econf changes
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  Parameter Name                     Description                Default
>  --------------                     -----------                -------
>
>elasticsearch:address              New                        localhost
>  elasticsearch:port                 New                        9200
>  elasticsearch:use tls              New                        No
>  elasticsearch:index                New                        _all
>elasticsearch:mappings             New                      =20
>DATADIR/elasticsearch_mappings=2Ejson
>  elasticsearch:max results          New                        100
>  nfs4:acedup                        Changed default            merge
>  rndc command                       Removed
>  write cache size                   Removed
>  spotlight backend		     New			noindex
>
>
>CHANGES SINCE 4=2E12=2E0rc4
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>o  Andrew Bartlett <abartlet@samba=2Eorg>
>   * BUG 14258: dsdb: Correctly handle memory in objectclass_attrs=2E
>
>
>CHANGES SINCE 4=2E12=2E0rc3
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>o  Jeremy Allison <jra@samba=2Eorg>
>  * BUG 14269: s3: DFS: Don't allow link deletion on a read-only share=2E
>
>o  Douglas Bagnall <douglas=2Ebagnall@catalyst=2Enet=2Enz>
>* BUG 14284: pidl/wscript: configure should insist on
>Parse::Yapp::Driver=2E
>
>o  Andrew Bartlett <abartlet@samba=2Eorg>
>   * BUG 14270: ldb: Fix search with scope ONE and small result sets=2E=
=20
>* BUG 14284: build: Do not check if system perl modules should be
>bundled=2E
>
>o  Volker Lendecke <vl@samba=2Eorg>
>   * BUG 14285: smbd fails to handle EINTR from open(2) properly=2E
>
>o  Stefan Metzmacher <metze@samba=2Eorg>
>   * BUG 14270: ldb: version 2=2E1=2E1=2E
>
>
>CHANGES SINCE 4=2E12=2E0rc2
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>o  Jeremy Allison <jra@samba=2Eorg>
>* BUG 14282: Set getting and setting of MS-DFS redirects on the
>filesystem
>    to go through two new VFS functions SMB_VFS_CREATE_DFS_PATHAT() and
>     SMB_VFS_READ_DFS_PATHAT()=2E
>
>o  Andrew Bartlett <abartlet@samba=2Eorg>
>   * BUG 14255: bootstrap: Remove un-used dependency python3-crypto=2E
>
>o  Volker Lendecke <vl@samba=2Eorg>
>   * BUG 14247: Fix CID 1458418 and 1458420=2E
>   * BUG 14281: lib: Fix a shutdown crash with "clustering =3D yes"=2E
>
>o  Stefan Metzmacher <metze@samba=2Eorg>
>* BUG 14247: Winbind member (source3) fails local SAM auth with empty
>domain
>     name=2E
>   * BUG 14265: winbindd: Handle missing idmap in getgrgid()=2E
>   * BUG 14271: Don't use forward declaration for GnuTLS typedefs=2E
>   * BUG 14280: Add io_uring vfs module=2E
>
>o  Andreas Schneider <asn@samba=2Eorg>
>* BUG 14250: libcli:smb: Improve check for
>gnutls_aead_cipher_(en|de)cryptv2=2E
>
>
>CHANGES SINCE 4=2E12=2E0rc1
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>o  Jeremy Allison <jra@samba=2Eorg>
>* BUG 14239: s3: lib: nmblib=2E Clean up and harden nmb packet
>processing=2E
>
>o  Andreas Schneider <asn@samba=2Eorg>
>   * BUG 14253: lib:util: Log mkdir error on correct debug levels=2E
>
>
>KNOWN ISSUES
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>https://wiki=2Esamba=2Eorg/index=2Ephp/Release_Planning_for_Samba_4=2E12#=
Release_blocking_bugs
>
>
>#######################################
>Reporting bugs & Development Discussion
>#######################################
>
>Please discuss this release on the samba-technical mailing list or by
>joining the #samba-technical IRC channel on irc=2Efreenode=2Enet=2E
>
>If you do report problems then please try to send high quality
>feedback=2E If you don't provide vital information to help us track down
>the problem then you will probably be ignored=2E  All bug reports should
>be filed under the Samba 4=2E1 and newer product in the project's
>Bugzilla
>database (https://bugzilla=2Esamba=2Eorg/)=2E
>
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=3D=3D Our Code, Our Bugs, Our Responsibility=2E
>=3D=3D The Samba Team
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>Download Details
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>The uncompressed tarballs and patch files have been signed
>using GnuPG (ID 6F33915B6568B7EA)=2E  The source code can be downloaded
>from:
>
>        https://download=2Esamba=2Eorg/pub/samba/stable/
>
>The release notes are available online at:
>
>        https://www=2Esamba=2Eorg/samba/history/samba-4=2E12=2E0=2Ehtml
>
>Our Code, Our Bugs, Our Responsibility=2E
>(https://bugzilla=2Esamba=2Eorg/)
>
>                        --Enjoy
>                        The Samba Team

--=20
=D0=9F=D1=80=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5 =D0=B7=D0=B0 =D0=BA=D1=80=
=D0=B0=D1=82=D0=BA=D0=BE=D1=81=D1=82=D1=8C, =D1=81=D0=BE=D0=B7=D0=B4=D0=B0=
=D0=BD=D0=BE =D0=B2 K-9 Mail=2E
