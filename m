Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5126AC6D5D
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 18:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zH8YBsvV1hICAGAzX1LdL/LRTV58yov6883I8zebeJI=; b=j8otRwJezuBj3S4VOtjchYxNGJ
	KvnZMrAcLYjifE3QMQwLyVnybJpwTIpLVDF3JwKTndiBbEPXm0Ou/tsxhZ7t9EQeEaAkfysapxQVc
	Zl1lHqoTa/LEtl7XlfNRMHFYlNANEroADWEnVsCGNRWwiuRkE0e3cH7IGSy0ILI16MJQ+A+jPXfir
	2EYCe7BxiyLGBl/pK8GnBZoGvneNGIQwsDt64rLhkm3YNKGXuLxlx2lmMdurweBGMgj377OvM5Bk7
	YeRrv8oAAs/Fioh+M4WLcp2+B0BqUQQVx6FDpa9xREiS1ZesYH97S992k0aBNy2v4/+ZG9E5YUEDU
	sKBZ+AVQ==;
Received: from ip6-localhost ([::1]:29546 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKJE5-004LoU-G6; Wed, 28 May 2025 16:01:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51094) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJE1-004LoN-4m
 for samba-technical@lists.samba.org; Wed, 28 May 2025 16:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=zH8YBsvV1hICAGAzX1LdL/LRTV58yov6883I8zebeJI=; b=YmVVKcp4o9ZvcOSb9FfERcjQut
 7Dzng8cg5Xfw0lYNvo88OSrHs90zrDkNn0/0U7B1h2SGzeZY2RAduOW5xE8MH+vOkDUFJK0dvEn0r
 cSJJllitNy+aOWSgvRvD03xQPolu+cpiIPa27dfUp6xIl9u72V+w055I1z7ms6i/QpSV5KXFQ+Tjj
 JRzwhir3pmBRe9Nyz0+HkrPIa/5wYUrc9pxC/uieXmnv+ikVWOxMvKlyOiwBd7BDi0Y60xC/2GGHu
 d9uTfXnIQC+jeZYf2LS9L/UzgZaQVYjLYAkFEjZmAAws+12j+0A2gJj1KgT5ZhjGbLr3/hCjMdUgz
 jWJiL5oxpmAawwajoVGCGlyeizC//e9qQYaDVSE0i4mOMqLr8pWlU/RXBXk56m3MgTTzCbDf+vM7k
 AovG5zXk5DaSbeElPrBOdT7Gg3Os3R6TC3/BE/UQw5uNxy8KhkHWpiUbe59sJDhKsMTSU8WLtgkBc
 iK8zF67e6OjjkPM/jo9Vg/JR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJDz-007hGi-0x; Wed, 28 May 2025 16:01:51 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH v2 00/12] smb:common: introduce and use common smbdirect
 headers/structures (step1)
Date: Wed, 28 May 2025 18:01:29 +0200
Message-Id: <cover.1748446473.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

in preparation of a having a common smb_direct layer I started
to move things into common header files and added the first
step in using shared structues like struct smbdirect_socket.

Currently only simple things are shared and there is no
intended behaviour change (even if I found some things
I'd like to change, but I'll defer them in order to
make the review easier).

I'll work on this the next few months in order to
unify the in kernel client and server layers
and expose the result to userspace too.
So that Samba can also use it.

v2:
  - change smb_direct into smbdirect
  - make usage of header files just as needed
  - also introduce struct smbdirect_socket[_parameters]
    as shared structures

Stefan Metzmacher (12):
  smb: smbdirect: add smbdirect_pdu.h with protocol definitions
  smb: client: make use of common smbdirect_pdu.h
  smb: server: make use of common smbdirect_pdu.h
  smb: smbdirect: add smbdirect.h with public structures
  smb: client: make use of common smbdirect.h
  smb: server: make use of common smbdirect.h
  smb: smbdirect: add smbdirect_socket.h
  smb: client: make use of common smbdirect_socket
  smb: server: make use of common smbdirect_socket
  smb: smbdirect: introduce smbdirect_socket_parameters
  smb: client: make use of common smbdirect_socket_parameters
  smb: server: make use of common smbdirect_socket_parameters

 fs/smb/client/cifs_debug.c                 |  23 +-
 fs/smb/client/smb2ops.c                    |  14 +-
 fs/smb/client/smb2pdu.c                    |  17 +-
 fs/smb/client/smbdirect.c                  | 389 +++++++++++----------
 fs/smb/client/smbdirect.h                  |  71 +---
 fs/smb/common/smbdirect/smbdirect.h        |  37 ++
 fs/smb/common/smbdirect/smbdirect_pdu.h    |  55 +++
 fs/smb/common/smbdirect/smbdirect_socket.h |  43 +++
 fs/smb/server/connection.c                 |   4 +-
 fs/smb/server/connection.h                 |  10 +-
 fs/smb/server/smb2pdu.c                    |  11 +-
 fs/smb/server/smb2pdu.h                    |   6 -
 fs/smb/server/transport_rdma.c             | 385 +++++++++++---------
 fs/smb/server/transport_rdma.h             |  41 ---
 14 files changed, 613 insertions(+), 493 deletions(-)
 create mode 100644 fs/smb/common/smbdirect/smbdirect.h
 create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
 create mode 100644 fs/smb/common/smbdirect/smbdirect_socket.h

-- 
2.34.1


