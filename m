Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61623308973
	for <lists+samba-technical@lfdr.de>; Fri, 29 Jan 2021 15:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=V6qv+oFb11XdFcUsmas84nA9lg+RQRaOfdB5dP2dknU=; b=pLB3CC0uhAgn8EFD1LyociYokI
	2dMvVQkwMQ8ANW7lMarRof+j8z6LnV8GZAWJ8GzEKx2LBlvBbXNdwwQiQIKsiYL3lLlISEVFHOWDZ
	eHlSH8HLkOzj1+K6biqIFPg+IDD0a5ndROUO/LFAHg14Ljc1ZkcNzvKBK59b78qCU9Sops7zmI5wP
	4PPO03CngdAEOB3KKGKvoCIQ9C5Ch9ZkyP4rDU7PWDx1CiPJmj2EQcxceNDOPpxu8ofzfiL02JoFK
	GbG/Ga1goSgR1Pm/IA/+V5GEFnS6o33ZUFyxRzNCnVSLwT/huGUqFwwYwn9odK3iEnpEk6blBWZmx
	9lVw7qig==;
Received: from ip6-localhost ([::1]:59202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5UTI-007jfw-53; Fri, 29 Jan 2021 14:10:00 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:45515) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5UTB-007jfo-RO
 for samba-technical@lists.samba.org; Fri, 29 Jan 2021 14:09:56 +0000
Received: by mail-vs1-xe33.google.com with SMTP id n18so4868820vsa.12
 for <samba-technical@lists.samba.org>; Fri, 29 Jan 2021 06:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FlLU5lZoYXqWeHPAScdo8qgj+x6ZJNB88hEt+ZQdIRI=;
 b=FNruPl2xFnKwNQVuuhgX2MJMonohMGVbJ81GGHDbY7AWjI2KF/qpOOQtH94p/G7waB
 /2TmPt+Uz6zvLlrkVkLZmpH8TgosmhHbIvMD7ZAqvK92If0mgFbel9wmRR0v9KMTzHO8
 D4dSV4QKOVpElNMMiuB5ConkIXTt2qLrno9XpYWbKngdthuSCnW06HAzC/2ExIhQhvfT
 lT0qrnyWvlUki2GD+2EdT8WYzIxWihu/xQDxOF0E15OAPfS1JW6Kxm/DbIkw+RKhGbal
 zbbrUw0PlEqGWrem0oFVVL4dHhqYrYmOg3U1tktDHqH3pSn+RNuVfdVpfEj6C1bA5x/U
 hMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FlLU5lZoYXqWeHPAScdo8qgj+x6ZJNB88hEt+ZQdIRI=;
 b=rWFr6v9Aa1mO0JPzrlR+PsMOh2D4cCw1bWnAjQh9tJ+XQoA2aVJ8EOunItftJ1Z/TX
 Xddpk6OGbJf9UNAZg/Qck9bnElFuO1VCj0EddnhyIDvfdfYUg7NaXURBu/l0QSAXNv8C
 Zs4r/n8nApF8Uu7eiFxCpsNI1iMVl6C4+dhjp9TOZ3kaOzN8fhvlavtGQqketdkGXSFd
 LviQrQbtJucDQNQSD5i5BhxR9RNO44NGetQZrs85EsFaNqVp5eaH751MDO0BoyU938hT
 bAmJR29Z2C1xXqZVSeW3xMl7KKhxt+COse0qYEnxq9/nOx6ESwg3cEYfdkXlNQ+P2GLg
 oFXA==
X-Gm-Message-State: AOAM530YWHh2Mox//o98AgUIJrt6bHWQsTl7nLW3Z6NGvx4VxlaP5+b9
 oX31ripVnnJlV/sXUCgwvxeZIYcxcCOZUvPOd0NHwwvADlpz9w==
X-Google-Smtp-Source: ABdhPJzPWau6I+9czPyjodA+QxRFD/SX3jg67sn/u72uq7tOILkaBO8bVM2lzHinddqsELRReUjMd2WPu3QG7uuW1fk=
X-Received: by 2002:a67:ed4a:: with SMTP id m10mr2756388vsp.14.1611929390685; 
 Fri, 29 Jan 2021 06:09:50 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 29 Jan 2021 19:39:40 +0530
Message-ID: <CAHbM3qh3pAXzSzSRNjE77jL1tmsREuRu9BQOCaPnWBY9dVdNdg@mail.gmail.com>
Subject: winbind cache issue for NDR entries
To: samba-technical <samba-technical@lists.samba.org>
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

We had a customer report that the users were not able to login for about
30minutes and the problem cleared itself in almost about 30minutes. They
are using Samba as a member server in a domain which has 2 way trust with
another domain (say ABC.COM). Upon investigation, we found that there was a
problem with trusted domain DCs for a very short duration as per the event
log on the DC of the primary domain. This problem seems to have been
cleared away after a short duration. Around the same time, a user belonging
to a trusted domain mapped Samba share and encountered a problem. At this
time, looks like NDR cache entry for trusted domain group "Domain Users"
was added in winbindd_cache.tdb to indicate that there was a lookup problem
and the status NT_STATUS_TRUSTED_DOMAIN_FAILURE was stored as part of this
entry. Once the issue with trusted domain DC was cleared and the domain was
back online, when users tried to login, PAM_AUTH was successful for the
users but getpwnam failed while looking up SID for "Domain Users". This
failure was returned from the entry in the winbindd_cache.tdb as
wcache_fetch_ndr() succeeded for this entry. Due to this, users belonging
to the trusted domain were not able to login. Once the cache was expired,
getpwnam succeeded for trusted domain users and the shares could be mapped.
In order to resolve this issue, should we not refresh the sequence number
when the domain goes online? Btw, we are using "winbind cache time = 1800".

Thanks,
Shilpa
