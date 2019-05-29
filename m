Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FCF2E283
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 18:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=eqW7On8caGUQMRi3VNnzp6QN4SBU6pCFO/a4taxVuZ8=; b=Ly6VYOldBrQQJzCTipggKtdpsV
	4dkBdgawOh2wm4m7TeyGIkBrX38+Z0OzEhgqkdoW3J3gFmRU2jdX+Li/fgXH3v3vg23HC94MyUqKK
	9GDLT6sHWrdLsvz2w5BRZJ/HppcoUwFWWKrUpvSV/EmNzjRHYwX1N4dTY+g4p3LTB/s7bMqSVhP5J
	OScjZ+DEONwFSFfzhyGb0OOOz1gkYfXWr5E0swJv2Aw7tTzMPOAtbqZkZijSeJTrw74vH7cq6Msws
	+vwqv2IsKWhaCOzfjVrw76LRaZi0pnpRSfuhmxEuSp/O2uuJuuLzuMn64cBkNG1sx7aRsFVz43Czr
	LXvPENbw==;
Received: from localhost ([::1]:36896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hW1kT-002VTg-9A; Wed, 29 May 2019 16:48:21 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:36786) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hW1kO-002VTZ-AZ
 for samba-technical@lists.samba.org; Wed, 29 May 2019 16:48:18 +0000
Received: by mail-lf1-x12d.google.com with SMTP id q26so2674890lfc.3
 for <samba-technical@lists.samba.org>; Wed, 29 May 2019 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=eqW7On8caGUQMRi3VNnzp6QN4SBU6pCFO/a4taxVuZ8=;
 b=AQuAl4uBBrjNa4284iTGTIb2t8HMms0GUJSBg+uz5n+H/tqh1SyAUlIF2n84nLcMiv
 eYBkMWb1KnsY/4N0Z+A9Z9RNN3+lJ48yij8yV/X3KfTEh3N0jv3hQegiqrY8lpY99Hq2
 VGZ9GAKbwlB0r/sj/OzZ9NcpyR1zoQl9NnO2cf2AXaBJDw66QMaQKEi2l+qYNC9k1Vni
 8mU21BgUmDBmaw0z4H41rU3W6L7A3JX8TUw0wLUsLi2H5fttI6MK2/Ou2qfCYBzbs/BX
 T5STeGAxQuTwrJcSzPwCxioXgLc6jCGMYD2Nsg9qcOY01O0Db2f0Ee54kJwzqOz19O9Q
 uGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=eqW7On8caGUQMRi3VNnzp6QN4SBU6pCFO/a4taxVuZ8=;
 b=Ti5STs+W0APheBvQ8G6/ZPb/dHsZtsWHnEev1aIYUYbkarfjevgAt23qAFZFKzx+bl
 oKcT0ZJTEReHAOGq5+vXV5tCr6bq42N+C5tJIQ5u77dvjLWZbxdGHl+sQq0QEht2m/kP
 fq/C3m+7PwD5qjHDgty1hoqVUCN7wpPCn8RT+o9+nMwJVxNu1gfeUfjHoghLQLXwNAOU
 ZxEc21dHhwPjj6uvrO0BSzcOtwRXy58NUbxIKmwp4jG8O58wrRo0Gd1EkI+ROMxN6gYE
 GeDwEkDuTSSJljUqjNrjtuLKIrcf5SVEM12SJZwG6nV5tKQEHQdAWvUY5Y856/OLXU5r
 cZMw==
X-Gm-Message-State: APjAAAUVjoMdAfQJlSvAFdTE+8JijJAFeusKuTUhH0PjgXpuP4ycW7Yk
 uHJcxVheU7YCyL9wwUC6ghp1iHaNt8AEz5v7b4yzliJ9
X-Google-Smtp-Source: APXvYqwj9k/aK7Go79CJLl6ON3EvDVOPLSZz+IFRF3Cuna54W4YQbNmlgHA19g93AWF+KhTVui15+Mku1/GJYbtHhdg=
X-Received: by 2002:ac2:4a6e:: with SMTP id q14mr30272234lfp.46.1559148495086; 
 Wed, 29 May 2019 09:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
In-Reply-To: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
Date: Wed, 29 May 2019 18:47:56 +0200
Message-ID: <CAC-fF8SAdgU992P8tsKyGSLfi0iwcjH7vdWrw8ObqqrcZsdycA@mail.gmail.com>
Subject: Re: [PATCH] pac-glue: fix delegation info blob
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 29, 2019 at 6:03 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> Hi,
>
> Attached patch fixes the delegation-info blob to be the same as
> Windows KDC returns, by adding the realm to the correct principal.

Metze points out that this bug is already logged as:
https://bugzilla.samba.org/show_bug.cgi?id=13133

And thank you for all the other hints!

