Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85243159036
	for <lists+samba-technical@lfdr.de>; Tue, 11 Feb 2020 14:46:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JPDiKGDtaYDK08rZxO1MHiaEBIEZo3iHXjBN4K3ILuY=; b=M+HUbdfFQAXIFkJ+SMcPdKCtta
	QEttxHpd9jHyNJDXHEPeK28A2y2b3AN0epIQ3BO88WBAvKHfZbD7k7XYh4x7B4EeceMzqrw3BBHG6
	udo55J8dxIszhBQu7LL2nYu2AnunW+nSquXbtc20dicYH83g3DJjMBtOg7Dbknz22kLJ+B8vAA+6Q
	Yb8Bgy5LPPZkf1tsWhWS/w4s4Qen5QELu2fx6p0bU09PfCZ2mynOSkdzSpU8P3Zi69ej8NcWrYinq
	V/sYpL7HFPs1Erd6aDOa18uNWnqWYZihTNQdhcdGJZNctcJSdT+hZw8sFuRNn0r+5nxuLCbOgNlEp
	Udw/CvpA==;
Received: from localhost ([::1]:65478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j1VrY-009NaM-ES; Tue, 11 Feb 2020 13:46:04 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176]:44491) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1VrS-009NaE-6f
 for samba-technical@lists.samba.org; Tue, 11 Feb 2020 13:46:01 +0000
Received: by mail-qk1-f176.google.com with SMTP id v195so10038787qkb.11
 for <samba-technical@lists.samba.org>; Tue, 11 Feb 2020 05:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zjkT7EZu0/GOA2a9YNJOQCL9jphF/AZRKKXnzdVQd7A=;
 b=MNFToH0Aj8Y/qTePB1v71QoyJUCDEMDR+exHtEkl7ToJKsL5Y951SgzKSRgZSAgBCj
 lb558RDZLeMLd5O5fUPYOKcemmj10mn38NzlH4stvxYNFXzdNt5R/wT1HB512cTQ+Frs
 RbIkXAlvEZGEzYvlFhMqk8W6z/N1/6OQuefnEm0+7ZueSTqoKlKJDOS1mNIwPog6q55N
 lvWl+GkhpQkEFzsLe+QO5E1Oajd3FtGwS3pt1c2E98skIuWR+QZXVqx+igGk2g+HlaA0
 rKBrRcI1ZcaBod2c7nKgcOoLurn3BoS6JeJocjDsQluLmJYaZYKpSvpVegIROHY4FRKh
 3z4A==
X-Gm-Message-State: APjAAAWeeMayJZrPtTqg2HiUho/hNx3mn5w43MOuYWhAEL6bkZ8gbmc9
 HiIpcIfQnwMyTFltAbPU/88mn17ioaIsFkUD09Ti4g==
X-Google-Smtp-Source: APXvYqyUVv7kVqkD1HOaRcnec793mKGN4XubxtB8fz0hoRJIXgyoA1GLUxl4CWSJiGei8BWJj0UUouBoCoSrjDRwOjo=
X-Received: by 2002:a05:620a:15f2:: with SMTP id
 p18mr5589798qkm.181.1581428754143; 
 Tue, 11 Feb 2020 05:45:54 -0800 (PST)
MIME-Version: 1.0
References: <B14B9A04-A84E-4DCB-95BE-E029378E49C6@gmail.com>
 <20171105085753.axk2m5lsdjns6u37@kazak>
 <CALdFvJGSw9WSm9UtAB32Nqgt=4qA_whai15Fo9C6ypspdKQt5A@mail.gmail.com>
 <20171106094708.ku75kutkm3s6i23c@kazak>
 <441FAF42-21F1-444D-BECB-843F2CF4A73A@gmail.com>
 <509e99ca-dfed-e09a-1da5-f1b0c1238d5a@sernet.de>
 <CAB5c7xokf5Fs-hcx=uREuiOb2LO1D3AbDAg+kyGzy+Yvpn_4ww@mail.gmail.com>
 <1e46dc1a-5e03-6df0-5fb3-15ff1ce00ed7@samba.org>
In-Reply-To: <1e46dc1a-5e03-6df0-5fb3-15ff1ce00ed7@samba.org>
Date: Tue, 11 Feb 2020 14:45:28 +0100
Message-ID: <CALdFvJE5UpDGKpxdhajRUvgAffm2fXUtsP63B48ENQYbZF5vnQ@mail.gmail.com>
Subject: Re: [Proposal] Remove dns_sd API
To: Ralph Boehme <slow@samba.org>
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
From: "Timur I. Bakeyev via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Timur I. Bakeyev" <timur@freebsd.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 11 Feb 2020 at 11:27, Ralph Boehme via samba-technical <
samba-technical@lists.samba.org> wrote:

> Am 2/10/20 um 10:16 PM schrieb Andrew Walker via samba-technical:
> > This is used in the FreeBSD port for samba, and is currently used in
> > FreeNAS 11.2 (though future versions are moving away from). We can work
> on
> > upstreaming the fixes and time machine support if there is interest.
>

That option indeed present in the FreeBSD port of Samba and, at least
compilable.

As far as I know, FreeNAS build of the Samba uses this patch and has dns_sd
enabled in their version of the build.

I'm sure that other users of Samba on FreeBSD use this option as well.

With best regards,
Timur Bakeyev.
