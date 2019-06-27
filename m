Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0F0581A0
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 13:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KwK6xUEFR3Y0y6oMUHX9fqg/8vWNXrSxOiTfBNZrDSQ=; b=0MPWoMyEBdtRLLhZCpoNY7IdSd
	fi4Bx7qlL18DHPjGmyunixaPjoAjDAE788XdsJkKwekZsBaOUdnwFlWf/xzslJPcl3eD6OPQOEL5+
	xWvmNGh2xeru6b5udN+Ai36aF4fQ+oRiVZHIJRWdyPlVUNw+o/0g+JMixaYQQUPS3oEm1e8ZDuyo5
	Y+e/37cFC69s0FFWuID5tOu/f0gYSz2+96KRbtnfWAmU+i3yUdJ3LmzfLHVIUUW9vzUvTdNWO9Oa2
	32IX4LOQ8KfO5+ZB8Gn+NhdQNtBEWE8kjfCa1waOzJ2VZagrAXb4nNOYvALYHe/odj9A1DzS7lxEk
	rXsouNAQ==;
Received: from localhost ([::1]:18170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgSdu-0028YZ-Lo; Thu, 27 Jun 2019 11:32:42 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:40141) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgSdp-0028YS-GV
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 11:32:39 +0000
Received: by mail-yb1-xb43.google.com with SMTP id i14so1351397ybp.7
 for <samba-technical@lists.samba.org>; Thu, 27 Jun 2019 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KwK6xUEFR3Y0y6oMUHX9fqg/8vWNXrSxOiTfBNZrDSQ=;
 b=i1kTuWGeddA6UQoJyJaUXI/ExSgg1Mqy7MN5aQNGFgOJ7569IZGMhJlOgWFkwZa9Fe
 2t7mHQbFO/KXQAB0li05Yw1ay3NVcuvjLSCHryLj4+E+jMRqDsDfenyfZy1O6v6wfoUK
 +JBe4d09fAqDQ+0w0SmE25n7BEsh8c7yyYcFlANaxePTKPX//NeEQHclh5/dmL+4sat4
 ptPH2ynw27tDHu3Ie6Ufjur2bzk5hg25tEHoyizqOks8bXDqvYrrL4jgzoi+SYud5rbL
 y6TJg9JeorIniWBDrfLFfi88Twbm+n0tR/uLgRIWH9oBnlbmGVghZSvuSfou2zozpquk
 C21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KwK6xUEFR3Y0y6oMUHX9fqg/8vWNXrSxOiTfBNZrDSQ=;
 b=JrvTRHG0X5PxlgvP/GE67CbUZ/gfCSKmEZCGzif7ea+e1+WFIZcnU9/qVfW9wEUuDX
 ikbQcDxAyGMUEs/Q2LaGu0krs84pWQPLdKkxR24C7SpzkR0XH2AW/w915PY2inFJWh4f
 fV8tFkxMxjkt1W5OsWsIuPXO/horlamuzctFf4mZiKDui+MUFK2gbKweHhLyMrLxnOyY
 Fp5eJrCYIYSNnRp3qzUE2MVmd0K+sp7kexxT43bJKP9mnT040A3wafqAd0IX9NyYB6Tb
 JrHp5nxNuZB0Dy1Liu0WLAu8RBkdllJOmdp0xGYq0Q+n+07Cwb35P+zLOMu5N0Y1aTcA
 tgDA==
X-Gm-Message-State: APjAAAW9ZANsC8U+HVJxssBIWXxLtpvKPLo82zxRUX5N6r6VTbr1Yyuq
 cT0zO8JHMITnoH9PPK2rrgWL9wboGcK2Kqrrz223Ww==
X-Google-Smtp-Source: APXvYqxMUaGq60c90+HpEHYVv6QG0Z8HkR7Vse4ZNgTzm/2fa0n+XCrVtyIeqOSxzoJBGnKCDwNaft4dtH9rzcGvTuk=
X-Received: by 2002:a25:bf85:: with SMTP id l5mr2229403ybk.45.1561635154868;
 Thu, 27 Jun 2019 04:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190626135745.lk7757wmy26pgy26@inti>
In-Reply-To: <20190626135745.lk7757wmy26pgy26@inti>
Date: Thu, 27 Jun 2019 14:32:23 +0300
Message-ID: <CAOQ4uxiGEPB7e33Bt_NJ255BsTAviOB0yEmwQNDy_ZEy9FF14A@mail.gmail.com>
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
To: Ralph Boehme <slow@samba.org>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>,
 Volker Lendecke <Volker.Lendecke@sernet.de>,
 Samba Technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 26, 2019 at 4:58 PM Ralph Boehme via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi all,
>
> in short:
>
> Samba will adapt a new File-ID generation scheme, based on a file's initial
> creation date instead of using the file's inode number.
>

Hi Ralph,

Just wanted to point out that most Linux filesystems already have a unique (*)
File-ID via name_to_handle_at().

The problem with this File-ID for samba is that it is often larger than 64bit
and it is only unique within the same fs, so your proposed solution is way
more generic.

However, you may want to allow for a configurable option to use those
NFS file handles as File-ID IFF the size of the handles is 8 bytes (e.g. ext4)
and the share is not expected to cross filesystems.
This has the advantage of files created not via samba will also have
a unique File-ID.

Thanks,
Amir.

(*) Disclaimer: ext4 64bit handle is 32bit ino (reusable) and 32bit generation
(globally incremented and may overflow), so with standard workloads
the probability of reusing a File-ID is very low, but with crafted attack it
should be quite easy to generate a new file with the same File-ID of a
deleted file.

