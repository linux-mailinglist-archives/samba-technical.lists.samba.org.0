Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0EB99227B
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2024 02:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=zTSb+6kF5YnLk0c43LMq5gPoNbkooDf5vo/3cbdFwcM=; b=VNhxmXOT+ADq7M+2RQz0Lam8VX
	KuocY9XjW62x5b3hk/bikG+TfmVtuxM9+/3Mudi7JGHr7EqET9Wj6E+NaCGJzCgXuQ1c/rEul21I0
	jgqfIilF8R8ufgQ/v/6ZL2p6QSxA+suxIECT5l/bcz+Oyx6ija1Hah8T8oMUVWh1qx6HXUGwaWvks
	1DeKex6HW8J2VrMkjq8V8AEMmA52MWHrgz/BRhqhMJztFSCBux9jjsemp1pQ0P1mwgWh1va85V0Xu
	0FwznInBmMR+Iqjn6JYUloZFnz6dwGm2K2yrkmyfMHLR879WkAnXO2KEustYsIUOWiz2iKP8V8Vkb
	Wx4FlICQ==;
Received: from ip6-localhost ([::1]:28270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sxbiH-003BOH-BU; Mon, 07 Oct 2024 00:35:01 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42]:55303) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sxbiC-003BOA-Cu
 for samba-technical@lists.samba.org; Mon, 07 Oct 2024 00:34:58 +0000
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso662204566b.2
 for <samba-technical@lists.samba.org>; Sun, 06 Oct 2024 17:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728261295; x=1728866095;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zTSb+6kF5YnLk0c43LMq5gPoNbkooDf5vo/3cbdFwcM=;
 b=QC5eHqCSf9Al1Vuo2USdo7aacnoGt69CjeCSG0/7BwPfCpljQ8PaFk238U8yt0SKsD
 9P8G0VaShZmkiYwrCbM2pZC6sYgHdtNKat5zLVvZUo9vCP2rsvpr6lcOS5DZk27OQKPF
 uSuUpLJUVlJwYzFi3x2lkTirWu011cpen2PMx8W2u0q8ET+i4H6SJBSsJ37OluOig/J0
 QGlqCk6YgFQ5DE9ZU6Rf+FdblbfN4UZWa0PRAezT9hO86xAS6GAiY8EVGcLOWx0Hk3/R
 vobxuKf9bvp3ORkP48eC1uLHB2lp2aDHcTFMG1hJRB6Xh1+Bf00yZKIuNfpsn8gRK/44
 ALZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcKKvyynivl9CpVSqO8NUAaTFHoYuPbVwZlDe3o0a0+MzBUuAYp1JObZb3gEANpUdHtNap0eWkIiozSp8+WUE=@lists.samba.org
X-Gm-Message-State: AOJu0YyiwpB9U7jAPtikcJWKBIHxTELJGQ2aZN4Rh9wd4LDNl2u9Cv8S
 STJiCJDSVFR8pNzmYuiH3p8Xpz2tmXvr4vdaybwE8CFV3IzZBSsxc5ycpPcDPA2kOG/F1q+bmCz
 GOSRJB7JjfKoO2wZ0Y5n9KqIf1Q==
X-Google-Smtp-Source: AGHT+IF97Rl33dJlZXO+eywiE4wgdx8hkOH5l3f32qTBueUyMwnQ9oddo24f3pSQm1OMIFRDlOY/vv1JsNpsETGW8Bs=
X-Received: by 2002:a17:907:7206:b0:a99:3dbf:648d with SMTP id
 a640c23a62f3a-a993dbf6715mr507220866b.45.1728261294503; Sun, 06 Oct 2024
 17:34:54 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 6 Oct 2024 17:34:42 -0700
Message-ID: <CAKywueS5Qqgz62xjjJh08n2tQaFPhbi-B1a9JiSvZjDsiP=ciw@mail.gmail.com>
Subject: [ANNOUNCE] cifs-utils release 7.1 ready for download
To: linux-cifs <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>, 
 Bharath S M <bharathsm@microsoft.com>, David Voit <david.voit@gmail.com>, 
 Paulo Alcantara <pc@manguebit.com>, Anthony Nandaa <profnandaa@gmail.com>, 
 =?UTF-8?Q?Pavel_Filipensk=C3=BD?= <pfilipensky@samba.org>, 
 Sam James <sam@gentoo.org>, Daniel Parks <danielrparks@ti.com>, 
 Henrique Carvalho <henrique.carvalho@suse.com>,
 Pavel Shilovsky <piastryyy@gmail.com>
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

New version 7.1 of cifs-utils has been released today.

It brings LDAP Ping capability, smbinfo gettconinfo command and
various improvements to documentation.

Links

webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
git: git://git.samba.org/cifs-utils.git
gitweb: http://git.samba.org/?p=cifs-utils.git;a=summary

Detailed list of changes since 7.0 was released:

0fae4c7 cifs-utils: bump version to 7.1
2cd7b1f cifs: update documentation for sloppy mount option
9918019 docs: add closetimeo description
c4c30b5 docs: add compress description
454870a checkopts: update it to work with latest kernel version
465f213 cifs-utils: add documentation for multichannel and max_channels
b3fe25c cifs-utils: smbinfo: add gettconinfo command
c6bf4d9 Implement CLDAP Ping to find the closest site
4718e09 (for-next) mount.cifs.rst: update section about xattr/acl support
e7ec003 mount.cifs.rst: add missing reference for sssd
3870f5b getcifsacl, setcifsacl: add missing <endian.h> include for le32toh
c8ec7d1 getcifsacl, setcifsacl: add missing <linux/limits.h> include
for XATTR_SIZE_MAX
25d6552 cifs-utils: Make automake treat /sbin as exec, not data
dac3301 pam_cifscreds: fix warning on NULL arg passed to %s in pam_syslog()
7314638 cifs.upcall: fix UAF in get_cachename_from_process_env()
ef0d95e cifs-utils: add documentation for acregmax and acdirmax
2260c0d setcifsacl: Fix uninitialized value.
1eee8e8 Use explicit "#!/usr/bin/python3"

Thanks to everyone who contributed to the release!

Best regards,
Pavel Shilovsky

