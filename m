Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD535D45D
	for <lists+samba-technical@lfdr.de>; Tue, 13 Apr 2021 02:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=q8zLFPx1aQMVOfdtZ5kgBVw6QCXBH3THleOQVoOLnp8=; b=Dc6pqr4yz5p2i8UYhcpVb6C2U1
	GikX+wfgbyANVYzwBZ38Bi+aBy8Vs+IahFu29GxsvGXQmoNlPwPVOzg2IPYOxcoGpbLQQwIV3q/EQ
	DXrcwZ5+Q3AzAbn65tnyKzvrzf+0/ONEoQhx6mCXTPruFcclTZGzeZZVDov4xI9AZJT4X2tePYFIC
	nn82Bn5HqobCx7ru1df+4g+jMRr7MQLwGY72O3Ek7HHz/cjI7PjZT6cEaSWss3oBthkeRcUVvzL4E
	Sqkos4FvIbYEuAzLaNyDnIT4a/SEbccD6RCv2LZeD/9LIH3BPviyCMvj6Jtj98tWf1rn6Kj3BkeQv
	V98Bs1yQ==;
Received: from ip6-localhost ([::1]:55478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lW6dc-00B3Yn-5b; Tue, 13 Apr 2021 00:10:40 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44]:43583) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lW6dX-00B3Ye-9x; Tue, 13 Apr 2021 00:10:37 +0000
Received: by mail-ej1-f44.google.com with SMTP id l4so23050970ejc.10;
 Mon, 12 Apr 2021 17:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=q8zLFPx1aQMVOfdtZ5kgBVw6QCXBH3THleOQVoOLnp8=;
 b=clXAVZ0VlBQiXuoikYEkRYO15QSDYVIgkRiawhiYczywZAx+2aWd2X0WTrwVKyOZrg
 ozYKkXSBVPe//N2qVtY+aFolncqRFQgGXWAtVOhBM1qQ+gkA4aJAG5JVU0zRgi9IqH7T
 OOFfT9VAZaZy4hUDYLqNLzbpKqrDMheQdjiQfDEz/CZ8XBOc6OZI3LJ+kZ+RpuoFJ2i9
 9bizj8LYSf15QLZSXzFYPA+Xcbem04nVS4GUgNxN93rJOF4a/G1sAnvSbkc/2sqBOGGM
 Y3cbrYBlSrGExFIF0DqdW3t4i/81ONJF741M0fMERilbAPD0WNLxfVofJNd+5eip7XV0
 HOYg==
X-Gm-Message-State: AOAM530K2rjsSxCV/O0j7z0MtkC1Pji/KE3Q+wnro9Cnbd/mdN67Qg39
 q9Czz1qm3yqmlYDvz3VQrhFwfx8yiD/V7+9eMg==
X-Google-Smtp-Source: ABdhPJxHftmE0W4PX+n0s+uwb2KoVlSYE1nmlFWCS+s31Yf+arlwLnhWoTJWD7di4CrOOLmhOL/A3U79XPIWGw1BHss=
X-Received: by 2002:a17:906:cc46:: with SMTP id
 mm6mr3729341ejb.138.1618272634015; 
 Mon, 12 Apr 2021 17:10:34 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Apr 2021 17:10:22 -0700
Message-ID: <CAKywueSqRGSFmeDHQacyu831BNUeGFxGg3vgBmozzhkGBCjyXQ@mail.gmail.com>
Subject: [ANNOUNCE] cifs-utils release 6.13 ready for download
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

New version 6.13 of cifs-utils has been released today. This is a
security release to address the following bug:

CVE-2021-20208 cifs.upcall kerberos auth leak in container

For more details, refer to the description below.

===========================================================
== Subject:     Container calls to cifs.upcall access host environment
==
== CVE ID#:     CVE-2021-20208
==
== Versions:    cifs-utils 4.0 and above
==
==
== Summary:     When a container process causes an operation that trigger
==              the kernel to ask a userspace for user credentials for
==              an SMB filesystem, cifs.upcall utility may indirectly
==              leak an information about Kerberos credentials available
==              in the host environment and cause non-sanctioned SMB
==              filesystem access in the container.
===========================================================

===========
Description
===========

A bug has been reported recently for the cifs.upcall utility which is
part of the cifs-utils package.

In scenarios where a program running inside a container issues a
syscall that triggers the kernel to upcall cifs.upcall, such as when
users access a multiuser cifs mount or when users access a DFS link,
cifs.upcall is executed in the host environment where its execution
may indirectly leak an information about resources available only to
host applications, such as Kerberos credential caches, to a
containerized application. As a result, a containerized application may
trigger access to files on an SMB share under an identity otherwise not
intended to be accessed by this container's environment.

The bug is a consequence of the kernel calling the host cifs.upcall
binary and can traced back to the introduction of the cifs.upcall
mechanism in cifs-utils and the introduction of containers in the
kernel.

With this release, cifs.upcall joins a caller's process namespaces
before accessing any resources to perform Kerberos authentication.
As a result, access to SMB shares is limited to credentials already
available inside the containerized environment.

==================
Patch Availability
==================

A patch is available as an attachment on the bug report.

https://bugzilla.samba.org/show_bug.cgi?id=14651

==================
CVSSv3 calculation
==================

AV:L/AC:H/PR:L/UI:R/S:C/C:L/I:H/A:N/E:F/RL:O/RC:C/MAV:L/MAC:H/MPR:L/MUI:N/MS:C/MC:L/MI:H/MA:N

Base score of 6.1 - medium.

=========================
Workaround and mitigation
=========================

For host systems that cannot be updated, DFS and multiuser mounts can
be disabled in the container SMB mounts options i.e. adding 'nodfs'
and removing 'multiuser' (if present).

=======
Credits
=======

Originally reported by Alastair Houghton.

Patch and workaround provided by Alastair Houghton and Aurelien Aptel.

==========================================================
== Our Code, Our Bugs, Our Responsibility.
== The Samba Team
==========================================================

