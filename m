Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADEA34A766
	for <lists+samba-technical@lfdr.de>; Fri, 26 Mar 2021 13:39:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=o3mjcWP+M7nr23fPP7Bvp1154+C1emg189qFpIvgwJ8=; b=icHVS58uW09BmU1u4nYW82mb/N
	cqrdIyPgKWQ4QQm49IBzjUJduwWEtvJjSpU+wiuw85ZZM4kJkPuE7IyVu11xAWEeA8ENw1Ph/VhZf
	RC8X70u7PY4N6gmv4gfHiAQ0jbpOQEZ/VMkg/vOxZbSzvjHnsej95Nbn8pL/1i25BiW2kl6TBcxR7
	pDHIambdecm/6kG6SSXQBOXwZ6DFPFasLIG7qALtFjJ6DLd/tjtJig0PWrhc5iZ+c1NNyBnNjoc2Y
	cIFPHc7YPvHYZNoDwsddI7ijNC9nrFxItjbNZ6gDVxl5ZE6vhFkswgz/pdrjyZiqfX5uclGXTHdTF
	CFxzLC2g==;
Received: from ip6-localhost ([::1]:64296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPljJ-006qCl-Mz; Fri, 26 Mar 2021 12:38:21 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41856) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPljE-006qCe-0t
 for samba-technical@lists.samba.org; Fri, 26 Mar 2021 12:38:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u5so8175053ejn.8
 for <samba-technical@lists.samba.org>; Fri, 26 Mar 2021 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=G9eYn5VszibWbRs5o+6f5Q7q4M4qV+hD0fE8e2l7s8I=;
 b=dON6QO2H61YlmGJiLIC1j+usW1Zq8SUG76LNfhNNAyX8G0waWLZFIsTi1Iz0A09F+E
 6JUXSDIF60mw3kukEeWHK2JV3F/yMMWagOYhoeqkllMlCW5koRyCpYI/DE+y9nCJ8uAA
 2mOLtEYy+cEt4Fvw66x1GRU0yEt6aqWcotPlwvXgyHxCHMWiEfwA32MYWbjAfYCCfK/5
 RIytQ/C8T9kAOLjksIW6dKGXGEmHOO0T0MNyLB9zR5aaIpShMG9Y3qgraUi1bao0e1yC
 R4jRaGGSKKWCoBlV/nf0ZkmlGsi/Kv3up992wx6qnp2408dxdjqmIj2oC5PUKBogzsmt
 0EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=G9eYn5VszibWbRs5o+6f5Q7q4M4qV+hD0fE8e2l7s8I=;
 b=Wsn/MvVuqjEGuj0O2brvxDMHlr2B6ecAaLd5rz1Vu1z7y5+SVlv+u4L2oebfnJ9rU9
 SWaoPvjVUV42YcXl8Tn6X9z87H4ujFnwhPkYRmAucZ+i9yFO2yMGbru4wKMfB9v3Itfu
 kCZD0koQ2JjJa6Hs/aloPU8hQC9VIXhwQbTQmhDmM6GVwFYmSU6sRCbf+PxPObcpdKYn
 iamaD60uaY+4sClhazryHcK8D/BEUJwe9mc4iOMeR7P4MxB0tFP95ZR95xL4mlqZlS7E
 bXzNey3dhiT5buj8SrZSxVuxEfO51cEG7VO1ziHOPw9TuvzFUVZSlNdWgXiXa6NIrwXy
 XrOw==
X-Gm-Message-State: AOAM531IB2z4bV0Wy0/BOkZBaZv7MuAgyYb5t6XoKGcCOMTBhj7P1DmW
 MWP1qosRsfrc5lYtxoLNWM/yBKkN5JwZ02kTwANL4Pbd83EvCA==
X-Google-Smtp-Source: ABdhPJx/zD2tVKQ9UBW2NIrZCtjDPGAsSmttf+0zBE8kp6/SfqWetaXISFEvNTmLYM0RItHxSVc2iYlkwD63o/0dVKk=
X-Received: by 2002:a17:906:719b:: with SMTP id
 h27mr14967663ejk.123.1616762295015; 
 Fri, 26 Mar 2021 05:38:15 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 26 Mar 2021 08:38:04 -0400
Message-ID: <CAB5c7xpuL7-_AqJX1szNA9QBjHtOTGmPODoOgr2bvu2EUqVoTg@mail.gmail.com>
Subject: vfs_full_audit annoyances on major version upgrades
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've noticed that several users (including one in the samba lists just now)
got bitten by vfs_full_audit on major version upgrades. Due to VFS
modernization, user's full_audit:success / failure configuration strings
may be invalid post-upgrade. A concrete example is "full_audit:success =
unlink". What makes this particularly painful is that full_audit will
default to logging _everything_ if it encounters an unrecognized parameter.

What do you think of doing something like the following:
https://github.com/truenas/ports/blob/truenas/12.0-stable/net/samba/files/patch-source3__modules__vfs_full_audit.c

Basically:
1) expand table for vfs_op_names to include an "old" name to use for
lookups as well (so that "unlink" logs "unlinkat")
2) fail Tree Connect with a concrete error message printed at DBG_ERR if
logging parameters are invalid.

Andrew
