Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 565244168D0
	for <lists+samba-technical@lfdr.de>; Fri, 24 Sep 2021 02:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=RCcja10SFVdtOiyzrCk0cciDdOc7qdrHC+TrP8HCrOI=; b=kWHQI1JcqhO+/9habysGSUNr6L
	9YGnv6jC23tsQczUfTw/W6Ek1mXnrGkXXi0El9OTjPxyLRe35ZZCw7Pa8wSJvvJnLECChYaRSfnVX
	wBQyZQT7Zy/r0Izo2o+xy5weTAuwEebCczVQsIrfQEJQ54Y/UswELzdo2sVo/Psj+wnGQPuPKbov7
	mo46dMhep+RXkMrp5xEgywhVinGoCluOruv9RKiG0q5Y3vUhMRRUWErUZLlAIna23bHS6EeVVVXDu
	9tihYPGoqIp8fBhel1cpI4O3dXiNZemOAnYKeFH1LSWaC9WRxtOr6rwH7k03Q0ELvy9TLnI+j9D3G
	DZ6Kp7dQ==;
Received: from ip6-localhost ([::1]:41196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mTYpe-00HId4-7U; Fri, 24 Sep 2021 00:12:50 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53]:44581) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mTYpW-00HIcs-Np; Fri, 24 Sep 2021 00:12:46 +0000
Received: by mail-ed1-f53.google.com with SMTP id v22so28590105edd.11;
 Thu, 23 Sep 2021 17:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=RCcja10SFVdtOiyzrCk0cciDdOc7qdrHC+TrP8HCrOI=;
 b=ml7NtaXRZwPbGrgR69spyrEPJKR7Xfwu7f8Xn9efYbl9h4G8pjPDa8LCnknUf/2ZeW
 j/ByqpduJsl5ONZjrKaxMVsGXUBQgGe2wqX73+JvLntwpglhLec1mwRsyFhpI3JZ5E8+
 gFG9GB4ncxIPa42chS3ywadsGHjoLW5Ftcvi06gm/7B7Rr2LurtrFSJlk5/C1oZMwwQD
 ODLfnNEdl5DVs9vy/Nn8bA2n2fbPyTZo8O9n1R7oTo54HUMOqLU8Rt2yj6pnnQfM8eQL
 3NblUDL8pg+16suwNDBpgkiiZFvKcwVgcRLQYuzyYZNNTaF6xFgbFAX2hxUb3sTX0T+V
 8aAw==
X-Gm-Message-State: AOAM530tKp5aUnUlkAYBUIiUpX6Hludj5apcweiyJj1XdNkS+2409tlG
 wyXSAASmt2LAUB45Lc5UwE2mqDXKIChrljw7HbgxkNps3Q==
X-Google-Smtp-Source: ABdhPJz3JjjUyhYPJIOW1z5xWcYpz78UIFLcF4VV88Yayaum7TNYIyxGtiUiqMs2DEeRTUK2B3FJBJmxcyng61fSIkg=
X-Received: by 2002:a17:907:2624:: with SMTP id
 aq4mr8311794ejc.448.1632442361513; 
 Thu, 23 Sep 2021 17:12:41 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 23 Sep 2021 17:12:30 -0700
Message-ID: <CAKywueRSG5NiomwOnR=8+bVgVTzMaZ-Atua1Csed+Af=Jq5xGw@mail.gmail.com>
Subject: [ANNOUNCE] cifs-utils release 6.14 ready for download
To: linux-cifs <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>, samba@lists.samba.org, 
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>, 
 "Paulo Alcantara (SUSE)" <pc@cjr.nz>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Boris Protopopov <pboris@amazon.com>, 
 Steve French <stfrench@microsoft.com>, Shyam Prasad N <nspmangalore@gmail.com>,
 Rohith Surabattula <rohiths.msft@gmail.com>, Alexander Bokovoy <ab@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

New version 6.14 of cifs-utils has been released today.

Highlighted changes:

- smbinfo is enhanced with capability to display alternate data streams
- setcifsacl is improved to optionally reorder ACEs in preferred order
- cifs.upcall regression in kerberos mount is fixed

webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
git: git://git.samba.org/cifs-utils.git
gitweb: http://git.samba.org/?p=3Dcifs-utils.git;a=3Dsummary

Detailed list of changes since 6.13 was released:

8c06dce cifs-utils: bump version to 6.14
e2e216c setcifsacl: fix formatting
1a70243 smbinfo: add support for new key dump ioctl
9ad46fc mount.cifs: fix crash when mount point does not exist
7f9711d cifs.upcall: fix regression in kerberos mount
02cd3aa smbinfo: Add command for displaying alternate data streams
4d5daf5 Reorder ACEs in preferred order during setcifsacl

Summary:

Aurelien Aptel (2):
  cifs.upcall: fix regression in kerberos mount
  smbinfo: add support for new key dump ioctl

Juan Pablo Gonz=C3=A1lez (1):
  smbinfo: Add command for displaying alternate data streams

Paulo Alcantara (1):
  mount.cifs: fix crash when mount point does not exist

Pavel Shilovsky (2):
  setcifsacl: fix formatting
  cifs-utils: bump version to 6.14

Rohith Surabattula (1):
  Reorder ACEs in preferred order during setcifsacl

 cifs.upcall.c     | 214 +++++++++++++++++++++++++++++++++++---------------=
----
 configure.ac      |   2 +-
 mount.cifs.c      |  13 ++--
 setcifsacl.c      | 129 +++++++++++++++++++++++++++++++-
 setcifsacl.rst.in |  20 ++++-
 smbinfo           | 120 ++++++++++++++++++++++++++----
 smbinfo.rst       |   2 +
 7 files changed, 399 insertions(+), 101 deletions(-)

Thanks to everyone who contributed to the release!

Best regards,
Pavel Shilovsky

