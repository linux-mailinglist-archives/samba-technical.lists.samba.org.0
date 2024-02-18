Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A02A85975B
	for <lists+samba-technical@lfdr.de>; Sun, 18 Feb 2024 15:15:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=WCZeTngdTdY4LMvqp0SlCZmKfhPgCdnb3nqSo8FJWQ4=; b=gS3RQb+mPoTsiHcFDE6O5DeE3c
	R6S4HpSLktfgY2Uaz00sJfRXvLJSBvE7W15aCJjB3O5d2OwhEfFczev2iHViNcbqzxIfFi0J33gCe
	5G8jALtHd1mWf8MFPxrA/qYAC8g/DXlzsMIyuPH3gzD7jjL7xylxSAG6lrVeFMWyRPatcOsCMwp2e
	8QgMc+A+dTjoQt/WLGMQPnlSniVXtBbFRbcRN5lMewtsEeUbKRyO2CJVx4WytLJ5De7swLFuNKsEc
	RRmrXH9ftlpPYGU9hAyjD3IPzMvV7JSLD+Dy4kLdXrfTw43Xrflpl1ilTta5ZPVuZKKXO/ss/klbt
	8AoYDK8Q==;
Received: from ip6-localhost ([::1]:20560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rbhvs-008q2V-13; Sun, 18 Feb 2024 14:14:16 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:54491) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rbhvn-008q2O-9K
 for samba-technical@lists.samba.org; Sun, 18 Feb 2024 14:14:14 +0000
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-36423c819a3so14379885ab.0
 for <samba-technical@lists.samba.org>; Sun, 18 Feb 2024 06:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708265645; x=1708870445; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WCZeTngdTdY4LMvqp0SlCZmKfhPgCdnb3nqSo8FJWQ4=;
 b=ZuNfhyzfZ7VzIz2h+5wECH2CkjeVjFaxsNGCFs27thqLFH1+KFR1J+GUT41PHud2VX
 lwtOVDRvXGkO5anSm5+6GXxQ3hfpQb58jqCgMDBDX2ruX5Al27+ZbF909NfBZ37998V3
 3rpM/lDP9kTLZ1Zpp2lsJ5i748KIOHfUs2/pM6noExMERTcRPio/VlJIv5N09Zxj0hWh
 z9SHZbN8nHJQzvFs+MshUWxUrJgmwUk9QH/WhILXiWLoyk1Xwy1Ou9/99vmxt5+bp7de
 UrC39ZkYfmuwezp3ZaSXhIWjj/xIktKmqHrs/DIK7yIjGzKcA0CvRCP+gSn4qmMsjR7m
 oa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708265645; x=1708870445;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WCZeTngdTdY4LMvqp0SlCZmKfhPgCdnb3nqSo8FJWQ4=;
 b=fLfRXtICF2SSE5FDfs6sUZsQatRLFOn1Jz3ye2fpeO5R7bC8Xhaxc5VGTxXdZTamZL
 rmKrj/rxdsiHwg73dT+npiOPe+NlfUjiAN9HAua2qNSBNhA+AKdP6T+YjmxluNya7Rem
 7KZHSuUzJ32Jhlh08oc5hvU+KVfnrYi2QAvEKAolih4yMlu4Uy7VmBiknWANXkq8intk
 BKEfKx0FE5y11trGAT4RJoqvuTrgYmP5qGF9i7vQDcE6y5kpPVF3d4s+7IMDEEZA25e1
 yHDj3mAH9H2ZVlrvY5SqGMJyYccU4Aos3FImshho0K8uocn4b2k16u4HWTtb4lGT6EFM
 ECUQ==
X-Gm-Message-State: AOJu0Yw4L4DIKUcJb6vTuKwalSiFskU2U/H/+lIK/GKVp1BffoLi+reL
 vYYwdJm7q8Hu7Unhf2j9m4uAGR899u+RzeHLPyrHkawHObKWSZDDBzKnQJf9QKv8T6aqgHG06gW
 0y70KEHzO7w6yQNFFElK2PzRFA84ZlHojjgQ=
X-Google-Smtp-Source: AGHT+IGqyUEyvVJ914NiqsIxGvZYkOdktkjd2gtvcwYheoX1g4w3GL/aFjfqmF4Gu8Qmuzdc/g8+5wwDrOG6lWKYBDU=
X-Received: by 2002:a6b:f310:0:b0:7c7:3e8b:1d94 with SMTP id
 m16-20020a6bf310000000b007c73e8b1d94mr3061596ioh.14.1708265645608; Sun, 18
 Feb 2024 06:14:05 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 18 Feb 2024 09:13:54 -0500
Message-ID: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
Subject: Samba 4.20.0rc2 fails to support "--with-includelibs" or build
 Heimdall Kerberos
To: samba-technical <samba-technical@lists.samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've been publishing backports of current Samba releases for RHEL to
include full domain controller capability for a few years now. Red Hat
elects to turn off the domain controller features at build time, and
the Fedora SRPM's reflect this decision for RHEL. Building for RHEL
meand activating "--with-includelibs" in order to avoid conflicts with
the libldb, libtdb, etc. versons used by sssd and other default tools.

My current work is published at https://github.com/nkadel/samba4repo/.
When I enable the use of the built-in Heimdall Kerberos with the
"system_mit_krb5" option in the .spec file, I get these errors when
compiling Samba with the "mock" command.


error: Bad exit status from /var/tmp/rpm-tmp.sarBcy (%build)
RPM build errors:
    Bad exit status from /var/tmp/rpm-tmp.sarBcy (%build)
Child return code was: 1
EXCEPTION: [Error('Command failed: \n # /usr/bin/systemd-nspawn -q -M
62568e9bb2da46fb9560a29c33520d1a -D
/var/lib/mock/centos-stream+epel-9-x86_64/root -a -u mockbuild
--capability=cap_ipc_lock --
bind=/tmp/mock-resolv.0z11du6p:/etc/resolv.conf
--bind=/dev/mapper/control --bind=/dev/fuse --bind=/dev/loop-control
--bind=/dev/loop0 --bind=/dev/loop1 --bind=/dev/loop2
--bind=/dev/loop3 --bind=/
dev/loop4 --bind=/dev/loop5 --bind=/dev/loop6 --bind=/dev/loop7
--bind=/dev/loop8 --bind=/dev/loop9 --bind=/dev/loop10
--bind=/dev/loop11 --console=pipe --setenv=TERM=vt100
--setenv=SHELL=/bin/bash
 --setenv=HOME=/builddir --setenv=HOSTNAME=mock
--setenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin
\'--setenv=PROMPT_COMMAND=printf "\\033]0;<mock-chroot>\\007"\'
\'--setenv=PS1=<mock-chroot> \\s-\\v\\$ \
' --setenv=LANG=C.UTF-8 --resolv-conf=off bash --login -c
\'/usr/bin/rpmbuild -bb  --target
x86_64 --nodeps /builddir/build/originals/samba.spec\'\n', 1)]
Traceback (most recent call last):
  File "/usr/lib/python3.9/site-packages/mockbuild/trace_decorator.py",
line 93, in trace
    result = func(*args, **kw)
  File "/usr/lib/python3.9/site-packages/mockbuild/util.py", line 612,
in do_with_status
    raise exception.Error("Command failed: \n # %s\n%s" %
(cmd_pretty(command, env), output), child.returncode)
mockbuild.exception.Error: Command failed:
 # /usr/bin/systemd-nspawn -q -M 62568e9bb2da46fb9560a29c33520d1a -D
/var/lib/mock/centos-stream+epel-9-x86_64/root -a -u mockbuild
--capability=cap_ipc_lock
--bind=/tmp/mock-resolv.0z11du6p:/etc/resolv.conf
--bind=/dev/mapper/control --bind=/dev/fuse --bind=/dev/loop-control
--bind=/dev/loop0 --bind=/dev/loop1 --bind=/dev/loop2
--bind=/dev/loop3 --bind=/dev/loop4 --bind=/dev/loop5
--bind=/dev/loop6 --bind=/dev/loop7 --bind=/dev/loop8
--bind=/dev/loop9 --bind=/dev/loop10 --bind=/dev/loop11 --console=pipe
--setenv=TERM=vt100 --setenv=SHELL=/bin/bash --setenv=HOME=/builddir
--setenv=HOSTNAME=mock --setenv=PATH=/usr/bin:/bin:/usr/sbin:/sbin
'--setenv=PROMPT_COMMAND=printf "\033]0;<mock-chroot>\007"'
'--setenv=PS1=<mock-chroot> \s-\v\$ ' --setenv=LANG=C.UTF-8
--resolv-conf=off bash --login -c '/usr/bin/rpmbuild -bb  --target
x86_64 --nodeps /builddir/build/originals/samba.spec'

