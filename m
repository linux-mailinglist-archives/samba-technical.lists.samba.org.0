Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76498123449
	for <lists+samba-technical@lfdr.de>; Tue, 17 Dec 2019 19:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=eR7hH7e1+A41saiufOcY2Fe0QJqgAJElsGPj2Ebh++c=; b=KauLc6Q7R9s/WRPJlFXCHiwC83
	WhtZFOOwZnRQGnd6MIVvGng2jbKuAJEvg/Oj3b0Sv0j5+/NkOuB/+UK022+ZDpePmL4+5QaHGi0h+
	tC9VL0X2EfcbchKmNMG6gLiBJWSEQRuFnuU/eIAsKQqySl3AYGIjAWD2477xY5zjTPNvEGYSRmcNO
	U9AR4K/AiC0tNLk3csRAqs3wUyVISoQeGHAA8r2S16kxGgL0aYWcdvaYpJR2hZv1wPm0KdjbA2kus
	njubM7VqjCLEKGfJTCpVNce5dk33wTU0h4sqn+Jt6XS5pRffqtQXdUojcUB1uV+EBTi5nLNpyznZe
	xDEEOZIw==;
Received: from localhost ([::1]:18066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ihHBL-007XJH-TL; Tue, 17 Dec 2019 18:02:52 +0000
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37040) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihHBC-007XJ8-B8; Tue, 17 Dec 2019 18:02:46 +0000
Received: by mail-lj1-f196.google.com with SMTP id u17so12005099lja.4;
 Tue, 17 Dec 2019 10:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=eR7hH7e1+A41saiufOcY2Fe0QJqgAJElsGPj2Ebh++c=;
 b=GYfL/m9REtwEpSZQ3dkJpx2iqmALP7/Ycp6X9Xc2g+iWJF7VwO37O58ZX7N968ePZI
 3gdU2cKWAarGy49BWW7tPFaa/B2EtN/d6a34Jsw6HY0KGxbrnzFseO+SRXjb4eVQvoO6
 DKoBVIu+zMVyS1K0gSgKKY/X+5BDsgdj894NH9WieO2+Ej9bXpMzPm1nMaGliGbsPwhF
 hreNWY6vYGfdxLhLq22L7KqVQW9cUbdJwI0SlRu51H4cTOwMEfkXkjuYqgA2kM7uGiUx
 SBwE7fopQfom+scwyQzw8fL5K1hxmku62uhj31iVQddxOmdlV+Pk1wyTpyFKtHf9djFW
 bElg==
X-Gm-Message-State: APjAAAUO1Likl2UpS5fEsq5ZMmd0NdG3YSvXGkscyrzsa3tnplWZ8zxa
 b3AD1Y2gag5mD2wAGw6p21QOMxQ0glbLV+CXFHpM
X-Google-Smtp-Source: APXvYqydgpVokeo2s9tEH+JFJ4Rf0I8A/ZSIxIrZAm6CGnCCA0RMxyv6qxo73DTfailIx1ILbChet4pdVrLU5vQFS90=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr4276735ljg.168.1576605759951; 
 Tue, 17 Dec 2019 10:02:39 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 17 Dec 2019 10:02:28 -0800
Message-ID: <CAKywueT2dwCaaA4J9n1aC5kT4NHC1j0hcVEuvttPo5ZcX_PWcQ@mail.gmail.com>
Subject: cifs-utils release 6.10 ready for download
To: samba-technical <samba-technical@lists.samba.org>, samba@lists.samba.org, 
 linux-cifs <linux-cifs@vger.kernel.org>
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
Cc: Kenneth Dsouza <kdsouza@redhat.com>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 Pavel Shilovsky <pshilovsky@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <smfrench@gmail.com>, Pavel Shilovskiy <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

New version 6.10 of cifs-utils has been released.

Highlighted changes:

- smb3 alias/fstype is added
- smb2-quota tool is added to display quota information
- smb2-secdesc UI tool to view security descriptors is added
- smbinfo is enhanced with capabilities to dump session keys and
get/set compression of files
- smbinfo bash completion is supported
- getcifsacl tool is improved to support multiple files

webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
git: git://git.samba.org/cifs-utils.git
gitweb: http://git.samba.org/?p=cifs-utils.git;a=summary

Detailed list of changes since 6.9 was released:

5ff5fc2 cifs-utils: bump version to 6.10
2b426e5 Rename secdesc-ui.py to smb2-secdesc
eba990a Properly install mount.smb3 helper files
f64814b Install smb2-quota and its manpage
b10aaef smb2-quota: Simplify code logic for quota entries.
be37d3d Add program name to error output instead of static mount.cifs
67b0fe3 Add support for smb3 alias/fstype in mount.cifs.c
74a1ced smbinfo.rst: document new `keys` command
f9085c4 mount.cifs.rst: remove prefixpath mount option.
9f7dd4e smb2quota.rst: Add man page for smb2quota.py
49fd975 smb2quota.py: Userspace helper to display quota information
b9e63c4 smbinfo: add bash completion support for setcompression
07c5812 smbinfo: Add SETCOMPRESSION support
6df98da smbinfo: print the security information needed to decrypt
wireshark trace
d563a0e mount.cifs: Fix invalid free
d7d78d7 mount.cifs: Fix double-free issue when mounting with setuid root
5a468f3 Zero fill the allocated memory for new `struct cifs_ntsd`
cb3dc2f Zero fill the allocated memory for a new ACE
bf7f48f mount.cifs.c: fix memory leaks in main func
13c3704 smbinfo: add bash completion support for getcompression
43f389b getcifsacl: Add support for -R(recursive) option.
1e4fca2 smbinfo: add GETCOMPRESSION support
f2955af getcifsacl: Fix usage message to include multiple files
dfe497f smbinfo: Add bash completion support for smbinfo.
9beaa8c getcifsacl: Add support to accept more paths
12c2f08 smbinfo: Improve help usage and add -h option.
0009157 secdesc-ui.py: a UI to view the security descriptors on SMB2+ shares
7c0af93 Update authors list

Summary:

Aurelien Aptel (1):
      smbinfo.rst: document new `keys` command

Jiawen Liu (1):
      mount.cifs.c: fix memory leaks in main func

Kenneth D'souza (10):
      smbinfo: Improve help usage and add -h option.
      getcifsacl: Add support to accept more paths
      smbinfo: Add bash completion support for smbinfo.
      getcifsacl: Add support for -R(recursive) option.
      smb2quota.py: Userspace helper to display quota information
      smb2quota.rst: Add man page for smb2quota.py
      mount.cifs.rst: remove prefixpath mount option.
      Add support for smb3 alias/fstype in mount.cifs.c
      Add program name to error output instead of static mount.cifs
      smb2-quota: Simplify code logic for quota entries.

Paulo Alcantara (SUSE) (2):
      mount.cifs: Fix double-free issue when mounting with setuid root
      mount.cifs: Fix invalid free

Pavel Shilovsky (7):
      Update authors list
      getcifsacl: Fix usage message to include multiple files
      smbinfo: add bash completion support for getcompression
      smbinfo: add bash completion support for setcompression
      Properly install mount.smb3 helper files
      Rename secdesc-ui.py to smb2-secdesc
      cifs-utils: bump version to 6.10

Ronnie Sahlberg (4):
      secdesc-ui.py: a UI to view the security descriptors on SMB2+ shares
      smbinfo: add GETCOMPRESSION support
      smbinfo: Add SETCOMPRESSION support
      Install smb2-quota and its manpage

Steve French (1):
      smbinfo: print the security information needed to decrypt wireshark trace

misku (2):
      Zero fill the allocated memory for a new ACE
      Zero fill the allocated memory for new `struct cifs_ntsd`

 AUTHORS                 |   1 +
 Makefile.am             |  16 +++
 bash-completion/smbinfo |  44 +++++++++
 configure.ac            |   8 +-
 getcifsacl.c            | 106 +++++++++++++-------
 getcifsacl.rst.in       |   3 +
 mount.cifs.c            |  76 ++++++++------
 mount.cifs.rst          |  18 ++--
 setcifsacl.c            |   4 +-
 smb2-quota              | 190 +++++++++++++++++++++++++++++++++++
 smb2-quota.rst          |  70 +++++++++++++
 smb2-secdesc            | 436
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 smbinfo.c               | 174 ++++++++++++++++++++++++++++++--
 smbinfo.rst             |  13 ++-
 14 files changed, 1072 insertions(+), 87 deletions(-)
 create mode 100644 bash-completion/smbinfo
 create mode 100755 smb2-quota
 create mode 100644 smb2-quota.rst
 create mode 100755 smb2-secdesc

Thanks to everyone who contributed to the release!

Best regards,
Pavel Shilovsky

