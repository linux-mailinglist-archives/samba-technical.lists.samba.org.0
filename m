Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB92AA40E2
	for <lists+samba-technical@lfdr.de>; Wed, 30 Apr 2025 04:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+O8Dmab1b4tsHWPcWfjD8QapSwI8OZjK9z1XmU5hlBE=; b=i4A/CCF0IJgg/epLr/Vf2lCigT
	J2QImXfkmMtVl6zWtIMqmSq/oX53Tems6WspbnbMIWS0HNi2xbwUuBLCmtxj1RvSXkD6VELGhKotj
	OhYjo7I5bARhfHpQPknojDDLKuOKgqyHucIwpQOUDsmd4PB9ffMftTXVD6wAHAIYuYa/tjxKNo25z
	5uinNJHvFWCdVFdpHUv/wUP8eJxtIH4zRwoQka2X+mrMrPpyCNOPZH/dExSBESl4rgPnM/X+KxU5Q
	1RK8fresLVbO2TqC6bZp/9OoMTTkunfzD3K76y+taF+jcM3xvUpgD5RG9SjjP/uOIXVIVtYUOICce
	9XqDFTRQ==;
Received: from ip6-localhost ([::1]:51696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u9x1O-0010NP-1p; Wed, 30 Apr 2025 02:18:02 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:49317) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u9x1J-0010NI-W8
 for samba-technical@lists.samba.org; Wed, 30 Apr 2025 02:18:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7376dd56f8fso8983627b3a.2
 for <samba-technical@lists.samba.org>; Tue, 29 Apr 2025 19:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745979474; x=1746584274; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zMXZ4MQ5F5yIQGj3qV30eyYjF5vKnuVdYTfczaHfdHU=;
 b=hkI85NEYBVEi/jmScjXLeaiN+R2xgMBkPY1VQFozs1deVhWJGQS4sPtp344tnAKGhM
 ckAdfw3KuZq1JERdc50QLdzPt8wRahwgreEHH6ZfpG9rvVRrMUJxHxJ7poXAjqEtqCOK
 7hP8b5dxDYL+5KO9TU/wmCsmWiwl/E5Gf50A9D5eqrH2we1jqKYOP8sQVuri2q3ZCFec
 JywQVxgWkXbIXY7pFt5kdUvCLtCq6BJE2/38G1E0dxbNKB95I5+vkp4ySeA2xWAn66w1
 Pbj+4gEY+Q6lWqrqe8BbQiBnOpKhulmg8Ql34JjvwxkXgV/z6M8XVcwjplKDldkwl/e1
 o8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745979474; x=1746584274;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zMXZ4MQ5F5yIQGj3qV30eyYjF5vKnuVdYTfczaHfdHU=;
 b=PX420VSYi2FN5Vbcg+YgbH4vpxzD1whhU8lp3mA9nna2q0cahKPX7W0naIjyUG+/Zr
 nWmWrd9BTEicYmcj0KRzvP7Vdad83EKKC+AdBaWVsBWCUBehz8xYa9hMqLB+O6FDDNoA
 wWJYUZYUnkmyH5zsY120Q/vf3UBfZSN0oVwXZYFVkubcnxmM3byQMgCXXbdj01gIYdWH
 57MR9KsT0B4Q1Tm8f2gDeS1qsl2Kou0BJzPM6bUTCMXjxEiX7RtWiC15W5XUG4MQr1wR
 +yOzZtVQEIc/H4YbqWzkq1w7SPe4TL/fzQejJT9MuYwZwbWUXxuyblsT/GhdUs34HJTn
 gURQ==
X-Gm-Message-State: AOJu0Yz//NxCYoJ+sJpixDcOcnnfgC43UHS9fIn35M7FVAefPyl8oQTQ
 AiaeFCkA/n83k+NMc4NCppatTpy9YsgAwvcl4StpSYbl/+l5cjjpYJKNdZ/Roh8Ibj5EdI3XO6a
 T4sPDAiRfdYniFxFbifasXFRxVLZRYQ==
X-Gm-Gg: ASbGncviPsD3GNXva0yF3gkQAnLI5AUbynzeAoE2SMzgjdL8YjvoQLcvl0vvfFe5uyP
 mQn4/iII2hT0JKXjgiO4iCPkiNJDAFU0HXbBCPUNkMy4zVi+QYM3WoldBhvU+/KAaPfvJVXrlCO
 SIYdZ0mXjwmp4m64fDJSFfF6o=
X-Google-Smtp-Source: AGHT+IHLaMHagY00V7Ftw/JsSow3wXykaLCrT4DyP8dtJEoInmTLGS6FdLxj/yimHOTNa7njm9ySrUzf8jZdislo6C0=
X-Received: by 2002:a05:6a00:4b06:b0:736:eb7e:df39 with SMTP id
 d2e1a72fcca58-74038ac9bd3mr2538723b3a.24.1745979474165; Tue, 29 Apr 2025
 19:17:54 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 29 Apr 2025 22:17:38 -0400
X-Gm-Features: ATxdqUEkrc_uVtUlBtXYkr62439sshzfa7tZ7MMMOetZ4SzuTsw3_Kicoo43L1M
Message-ID: <CAJQD4dc=sLoPhVkUqSauJ+bZhKh9Dpb6b1qAdbH1HavNYMqiAw@mail.gmail.com>
Subject: restoring winbindd_idmap.tdb file
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Chris Chupela via samba-technical <samba-technical@lists.samba.org>
Reply-To: Chris Chupela <cxc718@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I recently had to remove and re-add a RH 6.10 server (ad domain joined with
winbind), due to a failed server replacement. Problem I ran into is that
domain accounts that had permissions on the file system (home directories)
were assigned new UID/GID's when I rejoined the domain, thus blocking
access to files/dirs they previously had access to.

(did not make any changes to the smb.conf file during all of this).

I did copy /var/lib/samba/*.tdb to a backup directory, and cleared the
cache prior to re-adding the server back to the domain.  If I was to do the
following:

1. stop winbind and smb
2.  dump the contents of the old winbindd_idmap.tdb file to a text file
3.  make another backup of /var/lib/samba
4. delete the existing winbindd_idmap.tdb file from /var/lib/samba
5.  start winbind and smb back up
6. restore the dump file created in step 2 with net idmap restore (feeding
it the dump file)

Could I expect that this will restore access to the homedirs/files with the
correct UID/GID's from the copy of winbindd_idmap.tdb that I made?
Thx.




-- 
*Regards,*
*cxc718@gmail.com <cxc718@gmail.com>*
