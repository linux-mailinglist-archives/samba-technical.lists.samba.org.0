Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 380021ABA00
	for <lists+samba-technical@lfdr.de>; Thu, 16 Apr 2020 09:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UUNY3ShQiEMlKdA2OtEmjXgSE2HQo1VpKsXAZEAB++8=; b=2ynNqBYEhWdi+gMMwzWTNmQaUH
	WFjMWZFUxLP0q9keU2S2WbEAXKE1izGnrfsN94vk2/IchV7+8/vk/Y7vElzKK9vQiLgHiulQG2MfM
	S2/YvLbEyawAB+ZhBhGujplIvSpbKvfW26eDnGXlpVLw6t+AUU82W9Cbp4zSsU8jdQVdZ0xS4Gmpj
	HnrwGDRNXR1Yr8Ub5YsjaXAuUqI/v4MDMoG++oXHMUbNbVc79eNK9XrT++2/n2Fes6U6RmQAwveRf
	st3lc1Q27dQOPQEbUDqXQqfMNOqfLTVtLsXT2iZ2CkRFbi/ugu9LiVWGbW+Q85D1z/DRpaZ0lv9Rp
	TRvJ0fBQ==;
Received: from localhost ([::1]:23770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jOz1p-000s0s-8l; Thu, 16 Apr 2020 07:33:41 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:46713) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jOz1e-000s0l-Q8
 for samba-technical@lists.samba.org; Thu, 16 Apr 2020 07:33:33 +0000
Received: by mail-qk1-x744.google.com with SMTP id g74so20262959qke.13
 for <samba-technical@lists.samba.org>; Thu, 16 Apr 2020 00:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UUNY3ShQiEMlKdA2OtEmjXgSE2HQo1VpKsXAZEAB++8=;
 b=hAAkkXoJSeTZMtgLyumWdDpGnE/XBC+aHvFhGPPys8ToYyqHksL4ZpwqW5T+JaRcXl
 o43Nn1KGZaVBKhFR5FOvCjbaxWqLrHV8OuMXkvtnh//zZQZGZaqTPXCj5qByMUT5RFbh
 SJPoK/fhkM3ssd3iqshhMe81Lr0zwvKA7RXU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UUNY3ShQiEMlKdA2OtEmjXgSE2HQo1VpKsXAZEAB++8=;
 b=eHoJrJe10+5T3I8AzoHnk+wgWT7W6XkhMoOISF2cJY8riP5YKD8R8Cp3RsVEhafTpZ
 uOf8RtgLHk2DU+i8SXX0sEbS2DWWZfkMxHIQDqGamDWPQvd0jrDcxjBUxBOWNvIsNwpS
 cDqhXhp2iPesezPaOgJK7XOwVNUMZD1Uk6YTtgy4R9QsbQOX9ZxTPjobuSDvuuGo9BCZ
 iswf2UWelYAr2sVTz7KPgGIJebDNxvybAJtV8cPDqcPFhKH47kFlLujZK39+5T9WAeBD
 yUmmV0SCcJU3fXEIrGPMfUKqzdsEgFY6vZChop/QPWER93qcE6DEiCVWFBeYHXbbckvE
 lS3g==
X-Gm-Message-State: AGi0Pub6QUzDKHPYa8lLL71JjO4v5FItFxM7+Zj3jUT0cH+33srxznRu
 GklAWbxmTdWD7F8/qdSr0HhRJTPh2OaV5JAiniWqLA==
X-Google-Smtp-Source: APiQypLjMQQF6xFJgGIcXivLrWGvnotQ+D6p4pL53qIa6tvjRUBiKhdEepCEpb+H3UzPYGRtQEGOvPOSLCAH19n/LJg=
X-Received: by 2002:a37:8b04:: with SMTP id n4mr30253412qkd.222.1587022408701; 
 Thu, 16 Apr 2020 00:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUGjKiLPQP9wp0AgLUvHgKBOe9We2a-RQaZ7cd7CvhnarwWiw@mail.gmail.com>
 <CAKywueT0Q9WkANNsg8cEDwGZSMaaE5c4LHuEeMhVDzJAzycroQ@mail.gmail.com>
 <CAEUGjKhSBNQboKOMFMgos9OQfxcLQZsXp8aBrUSFcaSe1saH2Q@mail.gmail.com>
 <CAH2r5mt1k5t8rSH1KizeSrcLaN1Fn3GWeMvDPwT2Kfq43UAWaQ@mail.gmail.com>
 <CAEUGjKhpgmhj9RzcGQXPuFUyoqsUnk2d3oCpOYBdR=EwCO21YQ@mail.gmail.com>
In-Reply-To: <CAEUGjKhpgmhj9RzcGQXPuFUyoqsUnk2d3oCpOYBdR=EwCO21YQ@mail.gmail.com>
Date: Thu, 16 Apr 2020 15:33:18 +0800
Message-ID: <CAEUGjKh5mj0rFUZPoguFh4G-_YfwACV+_jVK7TNi+jK_fE1dgQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: improve read performance for page size 64KB &
 cache=strict & vers=2.1+
To: Steve French <smfrench@gmail.com>
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
From: Jones Syue via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jones Syue <jonessyue@qnap.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Steve

> Test read performance over 1GbE network with command:
Also test read performance over 10GbE network,
vers=3D2.1+ can reach over 600 MB/s with v2.patch.

aarch64, page size 64KB (CONFIG_ARM64_64K_PAGES=3Dy), linux-4.2.8,
cpu Annapurna Labs Alpine AL324 Quad-core ARM Cortex-A57 CPU @ 1.70GHz,
ram 8GB,
with patch,
vers=3D1.0,cache=3Dstrict: read throughput 110MB/s, max read IO size 16KB
vers=3D2.0,cache=3Dstrict: read throughput 106MB/s, max read IO size 16KB
vers=3D2.1,cache=3Dstrict: read throughput 667MB/s, max read IO size 1MB
vers=3D3.0,cache=3Dstrict: read throughput 639MB/s, max read IO size 1MB
without patch,
vers=3D1.0,cache=3Dstrict: read throughput 107MB/s, max read IO size 16KB
vers=3D2.0,cache=3Dstrict: read throughput 107MB/s, max read IO size 16KB
vers=3D2.1,cache=3Dstrict: read throughput 106MB/s, max read IO size 16KB
vers=3D3.0,cache=3Dstrict: read throughput 106MB/s, max read IO size 16KB

command:
mount -tcifs //<server_ip>/<share> /remote_strict
-overs=3D<x.y>,cache=3Dstrict,username=3D<uu>,password=3D<pp>
dd if=3D/remote_strict/10G.img of=3D/dev/null bs=3D1M count=3D10240

--
Regards,
Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
QNAP Systems, Inc.

On Thu, Apr 16, 2020 at 11:46 AM Jones Syue <jonessyue@qnap.com> wrote:
>
> Hello Steve
>
> > Did you also test (at least briefly) with vers=3D1.0 since some of your
> > code affects that code path too?
>
> Yes test v2.patch on 2 platforms aarch64 (page size 64KB) and x86_64
> (page size 4KB), vers=3D1.0 read function works fine on both.
>
> Test read performance over 1GbE network with command:
> 'dd if=3D/remote_strict/10G.img of=3D/dev/null bs=3D1M count=3D10240'
>
> For read performance on aarch64 (page size 64KB), vers=3D[1.0|2.0] is not=
 as
> fast as vers=3D2.1+, max_read on both SMB 1 (16KB) and SMB 2.0 (64KB) are
> still smaller then page size 64KB plus packet header size, hence do not
> support readpages.
> aarch64, page size 64KB (CONFIG_ARM64_64K_PAGES=3Dy), linux-4.2.8,
> cpu Annapurna Labs Alpine AL324 Quad-core ARM Cortex-A57 CPU @ 1.70GHz,
> ram 8GB,
> with patch,
> vers=3D1.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
> vers=3D2.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
> vers=3D2.1,cache=3Dstrict: read throughput 115MB/s, max read IO size 1MB
> vers=3D3.0,cache=3Dstrict: read throughput 115MB/s, max read IO size 1MB
> without patch,
> vers=3D1.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
> vers=3D2.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
> vers=3D2.1,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
> vers=3D3.0,cache=3Dstrict: read throughput 40MB/s, max read IO size 16KB
>
> For read performance on x86_64 (page size 4KB), all vers can support
> readpages because max_read is bigger than page size 4KB plus packet heade=
r
> size.
> x86_64, page size 4KB, linux-4.2.8,
> cpu AMD Embedded R-Series RX-421ND 2.10GHz,
> ram 4GB,
> without patch,
> vers=3D1.0,cache=3Dstrict: read throughput 109MB/s, read IO size 60KB
> vers=3D2.0,cache=3Dstrict: read throughput 115MB/s, read IO size 64KB
> vers=3D2.1,cache=3Dstrict: read throughput 117MB/s, read IO size 1MB
> vers=3D3.0,cache=3Dstrict: read throughput 117MB/s, read IO size 1MB
> with patch,
> vers=3D1.0,cache=3Dstrict: read throughput 110MB/s, read IO size 60KB
> vers=3D2.0,cache=3Dstrict: read throughput 115MB/s, read IO size 64KB
> vers=3D2.1,cache=3Dstrict: read throughput 117MB/s, read IO size 1MB
> vers=3D3.0,cache=3Dstrict: read throughput 117MB/s, read IO size 1MB
>
> > And if anyone figures out how to configure an x86_64 Linux to use
> > PAGE_SIZE of 64K or larger let me know...
> I am using physical platform with arm cpu and aarch64 toolchain,
> perhaps try qemu-system-aarch64 later.
>
> --
> Regards,
> Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
> QNAP Systems, Inc.

