Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC525C815
	for <lists+samba-technical@lfdr.de>; Thu,  3 Sep 2020 19:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=v1XhI1LSAM2uv1/MyByn6atDg2jfT9gssL5nzm1/cs0=; b=UnYW1lh3nqV5/jtF2Ny5qnhR8+
	ghiD0kuHzjLOQ0tOxnQaMVXuEZmKrMW61JTghCV8ulFf2rNYFFgJnplxvEKSvUFagZvdw0Xh0z5yX
	nNK/2oB/DFeYacAIvE0RyAqlcQUDxr6IRkg+k17cczxIaBHoZyj8KyI8m24V4QSabWCtynrtJsHCa
	Wq3QEqPXLzEXv1WeBIV6/YdRdAEVt69n3UaW2u7CwL0gUqEQSm3gMLDDSi1eUk6/ClSCZ6S7lp/ct
	MS4gME8OrDwaxicLD9Ly+N17wwsp6oGrFaAuP4mSsZvGpmeJfZb2zhOBngv7ygag99W1On5NsljJO
	W4/PDwcw==;
Received: from localhost ([::1]:64632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDt3V-003h6Q-8H; Thu, 03 Sep 2020 17:29:49 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52]:38531) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDt3N-003h62-UG; Thu, 03 Sep 2020 17:29:44 +0000
Received: by mail-ej1-f52.google.com with SMTP id i22so4971392eja.5;
 Thu, 03 Sep 2020 10:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=v1XhI1LSAM2uv1/MyByn6atDg2jfT9gssL5nzm1/cs0=;
 b=iXxsXZ0MspqijsNGC80bKtZCA1WXSf+xeYT1cy1BJEhSPH2b31xl6zb61q77lN9qUA
 g1O3nzn093piGo+C43CAgAGIXlfochKTap2opVmEb+2L6/r/hd/rUZ0AXY35YxsUtC6h
 gawrqFhClsYK8cU8uiZW0knbclVOSFYAob2wXqBf0By2XZSpuudFTtAeOEWhj5N46XJS
 85g0x+/pz0EeZ5u2WMP4c45w7zsClAbF71sKTKk1dAQ+rAEfI7XM4Z7qmTOwcUEuMH6k
 c5iTfuTftk83lMrU3gaPvHTFjo6MtaP4u9XqM1ChAr1TFvZ0twEdG8n5rIw5709dqQxV
 OLSA==
X-Gm-Message-State: AOAM530Ras3pYl45lWmbTQDjy3HsaQi2y6UWl8TbDyx3IyVzGWCuKIF7
 6IxUg5IpTZ8WtX02tSHkk/ZTOw68n0H43rE0Nw==
X-Google-Smtp-Source: ABdhPJxrDf+8JSyUd0UYfIVPxrqVSLtHov2JPOMZW+TJF/DE9Lc7FmjJfrcVRW/wbELJpI5i00PAVVdWt+5JLZhdX4E=
X-Received: by 2002:a17:906:4a8c:: with SMTP id
 x12mr3324165eju.271.1599154180681; 
 Thu, 03 Sep 2020 10:29:40 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 3 Sep 2020 10:29:29 -0700
Message-ID: <CAKywueR5QBgAYWHpn-AJMO8jmVpBqPLfgY5BOhB7-_8sRxLdVw@mail.gmail.com>
Subject: cifs-utils release 6.11 ready for download
To: linux-cifs <linux-cifs@vger.kernel.org>, samba@lists.samba.org, 
 samba-technical <samba-technical@lists.samba.org>
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
Cc: Steve French <smfrench@gmail.com>, "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

New version 6.11 of cifs-utils has been released today. This is a
security release to address the following bug:

CVE-2020-14342: mount.cifs: fix shell command injection

For more details, refer to the description below.

===========================================================
== Subject:     Shell command injection in mount.cifs
==
== CVE ID#:     CVE-2020-14342
==
== Versions:    cifs-utils 5.6 and later
==
== Summary:     A user controlling the username mount option can embed
==              shell commands that will be run in the context of
==              the calling user.
===========================================================

===========
Description
===========

A bug has been reported recently for the mount.cifs utility which is
part of the cifs-utils package. The tool has a shell injection issue
where one can embed shell commands via the username mount option. Those
commands will be run via popen() in the context of the user calling
mount.

The bug requires cifs-utils to be built with --with-systemd (enabled
by default if supported).

A quick test to check if the mount.cifs binary is vulnerable is to look
for popen() calls like so:

    $ nm mount.cifs | grep popen
    U popen@@GLIBC_2.2.5

If the user is allowed to run mount.cifs via sudo, he can obtain a root
shell.

    sudo mount.cifs -o username='`sh`' //1 /mnt

If mount.cifs has the setuid bit, the command will still be run as the
calling user (no privilege escalation).

The bug was introduced in June 2012 with commit 4e264031d0da7d3f2
("mount.cifs: Use systemd's mechanism for getting password, if
present.").

Affected versions:
  cifs-utils-5.6
  cifs-utils-5.7
  cifs-utils-5.8
  cifs-utils-5.9
  cifs-utils-6.0
  cifs-utils-6.1
  cifs-utils-6.2
  cifs-utils-6.3
  cifs-utils-6.4
  cifs-utils-6.5
  cifs-utils-6.6
  cifs-utils-6.7
  cifs-utils-6.8
  cifs-utils-6.9
  cifs-utils-6.10

==================
Patch Availability
==================

A patch is available as an attachment on the bug report. It can be
applied from v6.10 down to v6.2 included.
A backported patch is also available for v6.1 and under.

https://bugzilla.samba.org/show_bug.cgi?id=14442

==================
CVSSv3 calculation
==================

CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:L/I:L/A:N (4.4)

=========================
Workaround and mitigation
=========================

For systems that cannot be updated a wrapper executable around
mount.cifs can be installed. This wrapper simply calls the original
mount.cifs on correct input and exits on injection attempts.

Once the wrapper is installed and owned by root it can have the
setuid bit if necessary and the original mount.cifs binary can
have the setuid and execution bits for group and other cleared.

You can find more information along with a Golang implementation
of this wrapper on the bug report attachments.

https://bugzilla.samba.org/show_bug.cgi?id=14442

=======
Credits
=======

Originally reported by Vadim Lebedev.

Patch and workaround provided by Paulo Alcantara and Aurelien Aptel.

==========================================================
== Our Code, Our Bugs, Our Responsibility.
== The Samba Team
==========================================================

