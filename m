Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D2A6B3C2
	for <lists+samba-technical@lfdr.de>; Fri, 21 Mar 2025 05:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dqqlOuwgDqZzp9bz5GBCwhxF+fXIVL65riJZdwC7+6Y=; b=RHJLxdugDYOoxf2e+SER4JrBC/
	ugwEEvay76/nTSTEhOLFlRAyhH89VP/whLBCsQBLrYAuycZnPqyGqFRA9iH6uQDkbs4zst6xxY3vf
	1Lv7w7mGonWsqdWo8duWHgS0dRUDQQIBKT9Tj1cj6QqgLNg1wJLmhRKrMjhya4ic3zD1zCJhSePQ0
	AofLtnC6vBAsRMAv66lplHc5677j1aDYsf1Sds4TZl/mghOSWAT2ux/UwUascHfvESeoCqAFnYfOP
	siulDsF/DGvcPt+SNxrElact14NReLrcFsvK30HYCOcTI6Z8vxW6FumAMTS1EFInojaG1qThEiJkY
	4jMzMyQg==;
Received: from ip6-localhost ([::1]:63086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tvUCW-00GdJS-1H; Fri, 21 Mar 2025 04:41:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:59722) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tvUCR-00GdJL-B7
 for samba-technical@lists.samba.org; Fri, 21 Mar 2025 04:41:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5499614d3d2so1808023e87.3
 for <samba-technical@lists.samba.org>; Thu, 20 Mar 2025 21:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742532085; x=1743136885; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dqqlOuwgDqZzp9bz5GBCwhxF+fXIVL65riJZdwC7+6Y=;
 b=F3/ClwrrUkApU6jX8bfjxOuaxI0vVJdxBwo08EuaL+DeG27PB3/rNwqpWYvmxJcCjm
 TYwyHlG/XooWnBYyivJvPWQJ1VYqRnbVkRwy5uoZ7Y0kVZg8LGIIqV33li/TqtZRxqHM
 eXEDEE+wrw2VQsjinRxK5T79+ApvOyqOc7R1HV1ynXmca+kDc6u93gdBgU7lUtwoLuMG
 J0seELowrF1hrt6+eyh7ss3UhPd5tH/ObLFY1xJK0tc8q9n5yYvw56dFvlo1e35Bswc+
 jgotWIWCS9Kyk7nfzRYfsBjHHq9KIR9WbqxUdKAlJdeZ9zx8KatuAvSxYC5F9gO/9sPp
 mGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742532085; x=1743136885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dqqlOuwgDqZzp9bz5GBCwhxF+fXIVL65riJZdwC7+6Y=;
 b=c3MZDPYUaV1OV3T3NJQM2rNYNbA71yvvhU1pO2XQlZd/WGxlTRSnQ7o9uyqeTLtYbV
 +5SdlFI4FK/8EHys7m/R+TSn6K9DU/89HTlO9fueCu1BbJhSr1oDNOuP5xpH6DXjGC1/
 aSzxnJWu23nTtBXpI3G20jnrCxDgubvR/IBulxPWJI5j9H+/Gi/jfopUy55rpU2bygsR
 bq9DgOr6ZRfa8tbPRjkQY+RjxCsgspmEsbh/o1lOQhhxJduuF1BYGyvnmkBxQELjcsaj
 liPbLOBhe7RYR1YAtw/3ZJxskHXZaCUsnN+9oinO6aUDfqrEMt1kk8BlWur9B+Cz85bR
 54rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3YGxYgJr3vUWU32S+SiO0oxpMdX5YFJQjGztUmWjcEs3KHUTdWNnbuRpQPX2ZgPe/FdzlqjKjIiyVSWW4hrk=@lists.samba.org
X-Gm-Message-State: AOJu0YwxC6Jfm2Bd3lqRAlgoLBtR7pZ1aME3t3+bryldzK40/P8ho/om
 VdS93EbaVzCl3W+3oZVQm1WIWhpE5MgVa7BdUwA8JFgDSE4SkdsyK8RuqCPhuAiZOn/gKZaGIQU
 lWWlTpcAknZkeeX9wdtmza/TxS/o=
X-Gm-Gg: ASbGncvwVt7o74pY5gxWO9S5tlKCGyiJTWK4u5rqNs0DhCou1nHABxlR75cyUUNkIXW
 TWC3Q19ZkHVRS17V5fn09Wp60nKUlwMAoo1kHXnLfM4jhxV2OdtfLSpvBJc8KcoXW3NHanL2NgZ
 JISbjDG77UgJQ956+vrxmCp2AcBl1rUr+/V6jnFXbN83MJyXajICm0PVdFQnZU
X-Google-Smtp-Source: AGHT+IH9Ctb8My0VZ3PKZcoJ3VCVnG95JCkGLLFwePI/PfbhY9yjdHxpreHd3SgkxzXTJUzjVG0OiwqWXBgVO3Q+odA=
X-Received: by 2002:a05:6512:12cb:b0:54a:c4af:29 with SMTP id
 2adb3069b0e04-54ad650348fmr674536e87.52.1742532085157; Thu, 20 Mar 2025
 21:41:25 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 23:41:13 -0500
X-Gm-Features: AQ5f1JoP4_OIOZBwzf7C-v4c73Qz62SPygr11gWZ1F6iL8usKWg0jUqOex5kbJU
Message-ID: <CAH2r5ms4nV+_+L_o8rhiAMhkF4u+SEThEQn5yfDn2fiLvXc_5w@mail.gmail.com>
Subject: [ANNOUNCE] cifs-utils release 7.3
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 =?UTF-8?Q?Pavel_Filipensk=C3=BD?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

A new update, version 7.3, of cifs-utils has been released today.
Users of cifs-utils version 7.2 are encouraged to update to 7.3
since it includes a fix for a problem with "guest" mounts that
was introduced by cifs-utils version 7.2

Links:

webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
git: git://git.samba.org/cifs-utils.git
gitweb: http://git.samba.org/?p=3Dcifs-utils.git;a=3Dsummary


Detailed list of changes since version 7.1 was released

Meetakshi Setiya (1):
      Fix regression in mount.cifs with guest mount option

Pavel Filipensk=C3=BD (2):
      cldap_ping: Fix socket fd leak
      resolve_host.c: Initialize site_name

Pavel Shilovsky (1):
      cifs-utils: bump version to 7.3
--=20
Thanks,

Steve

