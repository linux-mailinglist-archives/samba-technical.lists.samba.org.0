Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D49F1AB656
	for <lists+samba-technical@lfdr.de>; Thu, 16 Apr 2020 05:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=p2zr2yzrNsT1VByiv3D1r8GTU5TzFzKm9+3tOVsKYnQ=; b=tI/iHvcHCX6B6ryyM2Ln/koSgE
	CaGMBV1j8yqg5iGpiShsfed8HVJoLk4vF4x+vWkc9IJo7zDFODuOj7DBEGths4smlQHwKmXOc/f6U
	Vz9rBvtWfIJFzEIjc3Rekxcm3PVczZa1qJGl6ifRb1tXFxP6W3/8yAom0FNmn2t+F66/B9bLQJhYb
	Fh/noUDmhJ8RWegsdaRZZvUXAPXNe+qvA1VMKfinxLNHM09sOsGA30kBt29i7d7KpzZQMW4MfV0jd
	xI6ly34+ZBv+MI/+VDRqhg9N4f1OnsAr5LfbuMdxj5VpA1J7Wbqd3CCgb69+xnWQnBzV376PaCXVn
	ZlqyAhnw==;
Received: from localhost ([::1]:63162 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jOvUW-000qNA-J2; Thu, 16 Apr 2020 03:47:04 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:41014) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jOvUR-000qN3-1h
 for samba-technical@lists.samba.org; Thu, 16 Apr 2020 03:47:01 +0000
Received: by mail-qt1-x841.google.com with SMTP id l60so6954251qtd.8
 for <samba-technical@lists.samba.org>; Wed, 15 Apr 2020 20:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+B1zq4ft8xaL7AFlltyDqJIC2uWmVQEFp92mK6qO2U=;
 b=SdREXSvRXBei/w6mDdcu62WmLhVXvwwCJPX5EpFvzYBiUfqZIaOjujhd4hxZg0OXWY
 1HJ+6m8ShdafMX5dZcYRQyvCFonC/M0QE14PQ100HSeEqUnGjhCBXSAtxPKbCcA2fuqM
 VHaw1BXPLscXdXa0v2w7zncLCHvQOVAVAYuxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+B1zq4ft8xaL7AFlltyDqJIC2uWmVQEFp92mK6qO2U=;
 b=cO0yHirUD5KbhO3SHH5i1addYyKk64/1WU6cYm4Fzjh0ZG1oGl9IPIn2oIKxeb8SNe
 /IzyaHvUa96QbdwjVHvQ/cszByDt78/6iysbohqZKXLn/QntXsnCCU8diutCJnDtp+hd
 tA9kRGoOahXgBSJHLKkjRpDpfvmPQjb1Xgz8oT6f3gTEqoTvVfxYp/oA+ujqME52N6ZR
 VmJYpgfXMn27CxLllrHE4t23bO8ErPBCWF5gN5eOHtVEBJgjn+KHGPpzO0xvm+b0OMhZ
 B/hASkbkWu1xJJPgJHvTs1AhBVYIyLHZdB8+feQLAwF970AXbM9d0HhLuiI9eEM4acne
 SHpQ==
X-Gm-Message-State: AGi0PubBaFrjpXuW123PZIDdb1wJIub3Mu47zG97Ufj1fzEZnoeoI2+Q
 I4zwi04Pr9XVd1L5hf9acrQJV+XtmFAhNXLkXxukbQ==
X-Google-Smtp-Source: APiQypLx2qZb7uIZ10CVx4WMNuJiQyoF++l5SXKXh6X/gvuw23fA7SF3tnIofYcH/695ErOGJEMeA1qJk5oUr/i0kRA=
X-Received: by 2002:ac8:1833:: with SMTP id q48mr15615242qtj.38.1587008816855; 
 Wed, 15 Apr 2020 20:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUGjKiLPQP9wp0AgLUvHgKBOe9We2a-RQaZ7cd7CvhnarwWiw@mail.gmail.com>
 <CAKywueT0Q9WkANNsg8cEDwGZSMaaE5c4LHuEeMhVDzJAzycroQ@mail.gmail.com>
 <CAEUGjKhSBNQboKOMFMgos9OQfxcLQZsXp8aBrUSFcaSe1saH2Q@mail.gmail.com>
 <CAH2r5mt1k5t8rSH1KizeSrcLaN1Fn3GWeMvDPwT2Kfq43UAWaQ@mail.gmail.com>
In-Reply-To: <CAH2r5mt1k5t8rSH1KizeSrcLaN1Fn3GWeMvDPwT2Kfq43UAWaQ@mail.gmail.com>
Date: Thu, 16 Apr 2020 11:46:41 +0800
Message-ID: <CAEUGjKhpgmhj9RzcGQXPuFUyoqsUnk2d3oCpOYBdR=EwCO21YQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: improve read performance for page size 64KB &
 cache=strict & vers=2.1+
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Jones Syue via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jones Syue <jonessyue@qnap.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Steve

> Did you also test (at least briefly) with vers=3D1.0 since some of your
> code affects that code path too?

Yes test v2.patch on 2 platforms aarch64 (page size 64KB) and x86_64
(page size 4KB), vers=3D1.0 read function works fine on both.

Test read performance over 1GbE network with command:
'dd if=3D/remote_strict/10G.img of=3D/dev/null bs=3D1M count=3D10240'

For read performance on aarch64 (page size 64KB), vers=3D[1.0|2.0] is not a=
s
fast as vers=3D2.1+, max_read on both SMB 1 (16KB) and SMB 2.0 (64KB) are
still smaller then page size 64KB plus packet header size, hence do not
support readpages.
aarch64, page size 64KB (CONFIG_ARM64_64K_PAGES=3Dy), linux-4.2.8,
cpu Annapurna Labs Alpine AL324 Quad-core ARM Cortex-A57 CPU @ 1.70GHz,
ram 8GB,
with patch,
vers=3D1.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
vers=3D2.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
vers=3D2.1,cache=3Dstrict: read throughput 115MB/s, max read IO size 1MB
vers=3D3.0,cache=3Dstrict: read throughput 115MB/s, max read IO size 1MB
without patch,
vers=3D1.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
vers=3D2.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
vers=3D2.1,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
vers=3D3.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB

For read performance on x86_64 (page size 4KB), all vers can support
readpages because max_read is bigger than page size 4KB plus packet header
size.
x86_64, page size 4KB, linux-4.2.8,
cpu AMD Embedded R-Series RX-421ND 2.10GHz,
ram 4GB,
without patch,
vers=3D1.0,cache=3Dstrict: read throughput 109MB/s, read IO size 60KB
vers=3D2.0,cache=3Dstrict: read throughput 115MB/s, read IO size 64KB
vers=3D2.1,cache=3Dstrict: read throughput 117MB/s, read IO size 1MB
vers=3D3.0,cache=3Dstrict: read throughput 117MB/s, read IO size 1MB
with patch,
vers=3D1.0,cache=3Dstrict: read throughput 110MB/s, read IO size 60KB
vers=3D2.0,cache=3Dstrict: read throughput 115MB/s, read IO size 64KB
vers=3D2.1,cache=3Dstrict: read throughput 117MB/s, read IO size 1MB
vers=3D3.0,cache=3Dstrict: read throughput 117MB/s, read IO size 1MB

> And if anyone figures out how to configure an x86_64 Linux to use
> PAGE_SIZE of 64K or larger let me know...
I am using physical platform with arm cpu and aarch64 toolchain,
perhaps try qemu-system-aarch64 later.

--
Regards,
Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
QNAP Systems, Inc.
