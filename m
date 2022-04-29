Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BB85157CF
	for <lists+samba-technical@lfdr.de>; Sat, 30 Apr 2022 00:04:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=bPmhOVUWo0n5hG/Bfz/n8rvpnhUee/nCZeFEHS7ETZ8=; b=zdhpL1Phi0TgcuUGxMeo1IyaFU
	cYa6QybIgGmbxZffj29RislqGZ7dRjJdK9K4LawPXAr65pVaK7PQKAXOKZKqP3ZUxLjraptoWpwSi
	VThFMcL+Qt17+M9Cq8H15bOpwCPpJltthUR1fJuqjC/9WUDOr9sWpXURSiBWKdRBiM4GMwCcQiD77
	LefHn8dwdFgzfsxWIQhVvTYOCoIsrTzpRQdBiBZA5RKoftOVD0QBmr9MpJyUZQzHlW+XtFvnqth3O
	fNmbv22zLOckhcS19Z1ruH8L1HrSHjstJ6UjqQF80vG65JgPbzvoyhcqbiwl3Q9oPHL4gFr49Wk9j
	SJDz6UyQ==;
Received: from ip6-localhost ([::1]:30668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nkYi3-003MVM-SP; Fri, 29 Apr 2022 22:03:31 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41]:41791) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nkYht-003MVA-70; Fri, 29 Apr 2022 22:03:29 +0000
Received: by mail-ed1-f41.google.com with SMTP id d6so10506850ede.8;
 Fri, 29 Apr 2022 15:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bPmhOVUWo0n5hG/Bfz/n8rvpnhUee/nCZeFEHS7ETZ8=;
 b=UMIl7K1pup8ZHcLhAatRsnpPkgMq/4cTlGMF/Px/rVDyq6r2+t8Vbm0MVH4IWrd9fG
 FC9u8CVNaH2K5lomTFjW5siImXbH9S1mxuEJVhz3rCkZbJ+rNGIsj4fEaEwEvIG5JXNT
 S4lzd6Q0nGcusnyNxSWRKUMCmM8h8g0/GR+8K54Pnb1izm+CYAYqYxRNgYVLwyZuN4A3
 hGCqB0b9tRilnNUAxb+FMytDwdohPLOWlol9ZPKf0UrQ18sa8K/JLJBPimOYemLM2l7C
 OwFGnGbwgfRPQa7xOWaj6ajMDpqsf6ydAtYRUCPSrGAL6N2DwUDHIxfgOp7lC0ejttRu
 goTQ==
X-Gm-Message-State: AOAM530KFcBVXDZ+NfHIuo/Z6FmHIqYhO0Qz2z1zwGe7dgtEJCxzYRY3
 8V/UU7POUneG7E0BySXXMG+Gbgy3XGTjV2jtTg==
X-Google-Smtp-Source: ABdhPJz/yv8Dcvt94vlyaoWhyHGprWg7rzxKlb8JpI2bt+Gp6VAMUHLZm6+HKxdDU1uDwyyX3pLYDyXcLpN3mhEcoDc=
X-Received: by 2002:a50:c3cf:0:b0:41d:5fc4:7931 with SMTP id
 i15-20020a50c3cf000000b0041d5fc47931mr1453175edf.244.1651269799450; Fri, 29
 Apr 2022 15:03:19 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 29 Apr 2022 15:03:07 -0700
Message-ID: <CAKywueTY1gvxKAH7q3rP1U0XSU9AhTZqUcH3GoqgQdbOfbh=Ow@mail.gmail.com>
Subject: [ANNOUNCE] cifs-utils release 6.15 ready for download
To: linux-cifs <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>, samba@lists.samba.org, 
 Jeffrey Bencteux <jbe@improsec.com>, David Disseldorp <ddiss@suse.de>,
 Steve French <smfrench@gmail.com>
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

New version 6.15 of cifs-utils has been released today. This is a
security release to address the following bugs:

- CVE-2022-27239: mount.cifs: fix length check for ip option parsing
- CVE-2022-29869: mount.cifs: fix verbose messages on option parsing

Description

CVE-2022-27239:

In cifs-utils through 6.14, a stack-based buffer overflow when parsing
the mount.cifs ip= command-line argument could lead to local attackers
gaining root privileges.

CVE-2022-29869:

cifs-utils through 6.14, with verbose logging, can cause an
information leak when a file contains = (equal sign) characters but is
not a valid credentials file.

Both issues were originally reported and fixed by Jeffrey Bencteux.

Links

webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
git: git://git.samba.org/cifs-utils.git
gitweb: http://git.samba.org/?p=cifs-utils.git;a=summary

Thanks to everyone who contributed to the release!

Best regards,
Pavel Shilovsky

