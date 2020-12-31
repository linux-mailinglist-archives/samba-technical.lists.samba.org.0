Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 083292E81E0
	for <lists+samba-technical@lfdr.de>; Thu, 31 Dec 2020 21:08:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3qjojYqJjWiq2QQdPJtZl0cxzUMaT76U9P8AUbsxFeE=; b=chJpUF0WPlp3Yl4IxwB2rQrsg8
	Ot6IVXqWeaVXkZ4H/u2Ace997qotzDA8yVQKgqle7BD1m1zAwOwE4KgTMmWbfMB2dmNmtBtmj/GHN
	CAPnYpn1AFEiO8liO/It1W/V+2+5UAhtD0B4/P9nzA/l82s0RPeMFLECVn9qO3OS1xkqPHu3y7rwu
	AmHhT33j7UN8iZlSLGY5Trm7Zl4XNGtSaLVKBELGQajeEb+3k9P17jIeYURDnIPvFIYRIFyZI2EBL
	PNWVUUOjvkOlx51Cpp5yuh2g/RmbYjE/NEHfgAcH3N7foaHHT3Pq9iDcRq/Z6wrzVEHUuAy1BX/D5
	ql01AwDQ==;
Received: from ip6-localhost ([::1]:31718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kv4FP-002hTt-Hy; Thu, 31 Dec 2020 20:08:35 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52]:46713) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kv4FJ-002hTk-6J; Thu, 31 Dec 2020 20:08:32 +0000
Received: by mail-ed1-f52.google.com with SMTP id b73so18978522edf.13;
 Thu, 31 Dec 2020 12:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3qjojYqJjWiq2QQdPJtZl0cxzUMaT76U9P8AUbsxFeE=;
 b=tyOxJzH9DxqAy1OqPg0cKi4JGXAVp7/cAFk7Vn8mCw8IMrzg6HbnpAIXTvKr43sV7b
 2KB5ircVnU/CbsykwbN5LJb/tgLp60WriaUr8osrWKMGrI1Nho6IayQivjVQFQw4Syvo
 eq1wGKKHojAen3nMWfCsx4NnrSpIX/UFhbqlD8QP9zY7/bPao2xB3L3TT6OQym2JBDX+
 TieU55ZXzQmOnkArQQUmCH7rkJKLnFp/dFSp+7dfNqvX2aw+0e7B/Qh70kpo33zk63uq
 jl/lMHdSaDp9eMDvCeiudGjzh5K2C0+1aHTL/zegP38Z6uBneLoR41uO0+RGAWFyVSWN
 NTgw==
X-Gm-Message-State: AOAM531u4G15CbSyTs+sUbIghneayFPyW2ADD9IJodzQrLROIwvDovLO
 GnJ8sA68r3VMika+NgjMlckQlqbmcrlzXA6FDA==
X-Google-Smtp-Source: ABdhPJyQNfgXeiOBFoEBO6DsQpvA3LPa99vz1fymtEV2grZIOk8mCfzMiKU+bdAdC7K/axpLzigqPrNwuAD2mSd5Wb0=
X-Received: by 2002:a50:8b66:: with SMTP id l93mr55163346edl.384.1609445306785; 
 Thu, 31 Dec 2020 12:08:26 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 31 Dec 2020 12:08:15 -0800
Message-ID: <CAKywueSZyJtH_V8MVa5bznPN=RdjbphY7xo74ABWn=bMAud+ZQ@mail.gmail.com>
Subject: [ANNOUNCE] cifs-utils release 6.12 ready for download
To: linux-cifs <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>, samba@lists.samba.org, 
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>, 
 "Paulo Alcantara (SUSE)" <pc@cjr.nz>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Boris Protopopov <pboris@amazon.com>, 
 Steve French <stfrench@microsoft.com>, Shyam Prasad N <nspmangalore@gmail.com>,
 Rohith Surabattula <rohiths.msft@gmail.com>,
 Pavel Shilovskiy <pshilov@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pshilovsky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

New version 6.12 of cifs-utils has been released today.

Highlighted changes:

- get/setcifsacl tools are improved to support changing owner, group and SACLs
- mount.cifs is enhanced to use SUDO_UID env variable for cruid
- smbinfo is re-written in Python language

webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
git: git://git.samba.org/cifs-utils.git
gitweb: http://git.samba.org/?p=cifs-utils.git;a=summary

Detailed list of changes since 6.11 was released:

73008e3 cifs-utils: bump version to 6.12
16af2c4 smbinfo: fix fsctl-getobjid output
85a7865 smbinfo: fix list-snapshots output and installation
207f192 cifs.upcall: drop bounding capabilities only if CAP_SETPCAP is given
1a15076 mount.cifs: use SUDO_UID env variable for cruid
7156c6e mount.cifs: fix max buffer size when parsing snapshot option
8f46aaa Add missing position handling to mount parameters
gid/backup_gid/snapshot
4205fdc cifs.upcall: update the cap bounding set only when CAP_SETPCAP is given
e406fb1 mount.cifs: update the cap bounding set only when CAP_SETPCAP is given
c3f8e81 Extend cifs acl utilities to handle SACLs
6da2dd3 getcifsacl: return error if input path doesn't exist
1f37d9c Fix mount error when mount point has an extra trailing slash.
1252355 mount.cifs: ignore comment mount option
ff54e6f setcifsacl: fix quoting of backslash in man page
c6507ce Separate binary names using comma in mount.cifs.rst
aeaa786 cifs-utils: fix probabilistic compiling error
c608a7f cifs-utils: Don't create symlinks for mans if mans are disabled
a00e843 cifs-utils: Respect DESTDIR when installing smb3 stuff
b9d94cd mount.cifs.rst: add nolease mount option
3d399e4 Add support for setting owner and group in ntsd
a138fd1 Convert owner and group SID offsets to LE format
9bd8c8d smbinfo: remove invalid arguments to ioctl method
422f0e9 smbinfo: rewrite in python

Summary:

Alexander Koch (1):
      cifs.upcall: drop bounding capabilities only if CAP_SETPCAP is given

Aurelien Aptel (1):
      smbinfo: rewrite in python

Bjoern Jacke (1):
      setcifsacl: fix quoting of backslash in man page

Boris Protopopov (3):
      Convert owner and group SID offsets to LE format
      Add support for setting owner and group in ntsd
      Extend cifs acl utilities to handle SACLs

Jonas Witschel (2):
      mount.cifs: update the cap bounding set only when CAP_SETPCAP is given
      cifs.upcall: update the cap bounding set only when CAP_SETPCAP is given

Martin Schwenke (1):
      mount.cifs: ignore comment mount option

Mikhail Novosyolov (2):
      cifs-utils: Respect DESTDIR when installing smb3 stuff
      cifs-utils: Don't create symlinks for mans if mans are disabled

Pavel Shilovsky (6):
      mount.cifs.rst: add nolease mount option
      getcifsacl: return error if input path doesn't exist
      mount.cifs: fix max buffer size when parsing snapshot option
      smbinfo: fix list-snapshots output and installation
      smbinfo: fix fsctl-getobjid output
      cifs-utils: bump version to 6.12

Rohith Surabattula (1):
      Fix mount error when mount point has an extra trailing slash.

Ronnie Sahlberg (1):
      smbinfo: remove invalid arguments to ioctl method

Sergio Durigan Junior (1):
      Separate binary names using comma in mount.cifs.rst

Shyam Prasad N (1):
      mount.cifs: use SUDO_UID env variable for cruid

Simon Arlott (1):
      Add missing position handling to mount parameters gid/backup_gid/snapshot

lizhe (1):
      cifs-utils: fix probabilistic compiling error

 Makefile.am       |   15 +-
 cifs.upcall.c     |   14 +-
 cifsacl.h         |   55 +++++--
 configure.ac      |    2 +-
 getcifsacl.c      |  239 +++++++++++++++++++++---------
 getcifsacl.rst.in |    4 +-
 mount.cifs.c      |  106 +++++++++++---
 mount.cifs.rst    |   12 +-
 setcifsacl.c      |  848
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------
 setcifsacl.rst.in |   58 ++++++--
 smbinfo           |  792
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 smbinfo.c         | 1296
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 12 files changed, 1827 insertions(+), 1614 deletions(-)
 create mode 100755 smbinfo
 delete mode 100644 smbinfo.c

Thanks to everyone who contributed to the release!

Best regards,
Pavel Shilovsky

