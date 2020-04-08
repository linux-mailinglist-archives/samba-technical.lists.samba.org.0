Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1991A2868
	for <lists+samba-technical@lfdr.de>; Wed,  8 Apr 2020 20:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=0NbN+zZ6nJkPwRW9EFOaT3oJuAFOk6yMjO8wL1c24sw=; b=v0f/EBMUKFOzHYcJ3LnvJvD06A
	YHUvneuGQi/kSpbkh9XEpC1Q2zCd9AA59vYFduj8JSUfh1cxY8zf0c3FzuW3SM5OZ05t+MX/ns5Ue
	yb0vZXJpDR7nVi8ZHAtWAwT8Cn9naUQDrafsT/2i1z3+bkuDuytVvixnhua1a3C5lPtwQhVwdEO8e
	wR3shd7eABB1m6hLsr17S52bQw6/qjXKZTvRYsZR8fR4zGv2Y3R6YVw+9GzPH0HsFY47oNjwPiMq7
	IFtpCbccVAk71by9b4aC7e+UGT3LXU6HYVjmKABzKsQqwauW8S+YBs7YxbYiMFhtXRvKpkXf/Nejc
	hFeKNHFQ==;
Received: from localhost ([::1]:61452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMFJl-000CWl-2g; Wed, 08 Apr 2020 18:20:53 +0000
Received: from smithers.houseofnate.net ([66.175.213.200]:37388) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jMFJf-000CWe-Kk
 for samba-technical@lists.samba.org; Wed, 08 Apr 2020 18:20:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by smithers.houseofnate.net (Postfix) with ESMTP id 0C8B621F480
 for <samba-technical@lists.samba.org>; Wed,  8 Apr 2020 13:55:51 -0400 (EDT)
Received: from smithers.houseofnate.net ([127.0.0.1])
 by localhost (smithers.houseofnate.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEN_By8Dukv0 for <samba-technical@lists.samba.org>;
 Wed,  8 Apr 2020 13:55:50 -0400 (EDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: nturner)
 by smithers.houseofnate.net (Postfix) with ESMTPSA id 2852421EF56
 for <samba-technical@lists.samba.org>; Wed,  8 Apr 2020 13:55:50 -0400 (EDT)
Received: by mail-lj1-f182.google.com with SMTP id 142so4063898ljj.7
 for <samba-technical@lists.samba.org>; Wed, 08 Apr 2020 10:55:50 -0700 (PDT)
X-Gm-Message-State: AGi0PuYsMSsoeEn00rrsBCIRYd5wWng/BkIMx2fNv2k3tcxvR+m84Mil
 7pxJK4XiRI9zjL830t7wculf44mifNWmxFFIrp8=
X-Google-Smtp-Source: APiQypLSvRe/9cNtNAhWbrI8UMYhuJ7L7Sa3MuQ/m3RraLg1Lb5+If85yqLkZRX/whXq9hJYoCmPC0WiCFrBidyvkWg=
X-Received: by 2002:a05:651c:201d:: with SMTP id
 s29mr5952066ljo.214.1586368548883; 
 Wed, 08 Apr 2020 10:55:48 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 8 Apr 2020 13:55:37 -0400
X-Gmail-Original-Message-ID: <CAPw4iV6hCi_hvWAgJrQoovW9D5fM8TOcWSFBWn96X21qwC0JAg@mail.gmail.com>
Message-ID: <CAPw4iV6hCi_hvWAgJrQoovW9D5fM8TOcWSFBWn96X21qwC0JAg@mail.gmail.com>
Subject: autorid broken in samba 4.9?
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nate@houseofnate.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I have a configuration that is working correctly with samba 4.8 (in CentOS
7.6). When I apply the same basic configuration to a system running samba
4.9 (CentOS 7.7), I see a very strange behavior: The ID mapping for trusted
domains does not work right.

Both systems are joined to the domain tc84.local (TC84), which has a forest
trust with TC83, and they have identical smb.conf files. Here's the idmap
related bit:

# testparm 2>/dev/null </dev/null | grep idmap
        idmap config * : range = 1000000-19999999
        idmap config * : backend = autorid

Here's the samba 4.8 system:

[root@kvm7246-vm005 ~]# wbinfo -i TC84\\administrator
TC84\administrator:*:1100500:1100513::/home/administrator@TC84:/bin/bash
[root@kvm7246-vm005 ~]# wbinfo -i TC83\\administrator
TC83\administrator:*:1200500:1200513::/home/administrator@TC83:/bin/bash

And here's the same config on a samba 4.9 system:

[root@kvm7246-vm008 ~]# wbinfo -i TC84\\administrator
TC84\administrator:*:2000500:2000513::/home/administrator@TC84:/bin/bash
[root@kvm7246-vm008 ~]# wbinfo -i TC83\\administrator
TC83\administrator:*:10000:10000::/home/administrator@TC83:/bin/bash

The UID 10000 is not within the idmap configured range!

I looked a the idmap_autorid(8) manpage, and very very quickly scanned the
source diffs between these versions, but nothing jumps out at me. Is this a
known issue, or is there some new idmap configuration setting that's now
needed?

n
