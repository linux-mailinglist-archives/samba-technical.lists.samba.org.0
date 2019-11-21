Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD11058D5
	for <lists+samba-technical@lfdr.de>; Thu, 21 Nov 2019 18:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PGPmuVKWm0lCjfwiQ5Oedqi0prxcPjmtTU4qtRJdBCA=; b=LECn10si9P0scybEDGtUzBvJVF
	usi7mLdu9eoh5hDe6RLJa11ohsDMKxpKpDJw1aQ/VxbsAhDNKtds9HQQtXEunTzZNbpXEUjAC2rXi
	cnZPKK6oP4TvmBpjie6V8t++oeXIhiW5R+Fhd/nUCidAFQ/FPZK9wLMlWW5U3Ys14+cxNWDZzquk/
	MBC3ifzwRsAJF8/kE0L93AFdAt1KdI1ViIWbUksf31cb+4/7Z278M0Pc5knJxzAmD6S0tWCDcCKW9
	5j+xiPyuxLbHD0R3ptRrd/R64ry8+K6Tx73RslhKTMQ6eOrLepUE7hIZJBhmJY/72CL3gwxYDnb6J
	eo8K2OyA==;
Received: from localhost ([::1]:25696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXqdU-001vpx-Fz; Thu, 21 Nov 2019 17:52:56 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:42534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXqdQ-001vpq-47
 for samba-technical@lists.samba.org; Thu, 21 Nov 2019 17:52:54 +0000
Received: by mail-lj1-x235.google.com with SMTP id n5so4212160ljc.9
 for <samba-technical@lists.samba.org>; Thu, 21 Nov 2019 09:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PGPmuVKWm0lCjfwiQ5Oedqi0prxcPjmtTU4qtRJdBCA=;
 b=XjSGf+3/PnxnGeRWAc9loX6cqpEF54K589i6K1sxu2hcG84hYutEw/Kz5MAYgCYj1i
 nWTDYHIHrBtrR3CT47fCmCrPXaFmL502FA3sNYLSS8O4yDem02RlAZvNP3LKFek40Ulx
 mN9USlIRHCccqCxTXple8WYG976CXpg9E5rNkf6xHiwWA1ArtknSwsHYh/uPDRRUm9Tb
 wbD9CtxX94g190rN8EcdTy0CosW1IfOjiGE85PN1HH9NUdkM6mImESLedfHgRN3DYT3m
 McQBEvpXWPU5rPspxU4D/g9yNADPxRSehzP61tHzGaWzO3r9QaHqRiHdQrSk27eTLwV6
 BKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PGPmuVKWm0lCjfwiQ5Oedqi0prxcPjmtTU4qtRJdBCA=;
 b=ftPU6vDuER5gQnn/RGrpQ/FHUnM1QSRxnSGp0T+Op9rZgS99ANQKzN2mOihI5R9Gbs
 8tl9W6uwT7ITfCtp0B+VAXkockEaYlNIF+czr229oO5KOrGnW6scxMNLSqfes+nkAM9l
 FU0Gv1PWWh6SPnnZZd1cIUJDb0PcEs+jlwumH2oXhe8LZg2z47OgUUhhuyrvD8JMhPAX
 KC/OJioqhSabOU5S0oGFUf4lv6WDa3oaiJyhqBUkdFDCYG777NcVTkUi3sPPC8YhZ9BI
 AKz3zhwacUvLT+56M6u+bI0vhXthDOWC80wgK5jrdxDHhgsZgUUmoW+kWdHjGUKii6EI
 xiXQ==
X-Gm-Message-State: APjAAAUwECXaM0iY+XwVpeDkLoNQpidiY9FI6b1P8DobmfBreEycfz32
 4XyAYg2eaZ6NUnERa9QJjnZDvO7EVZGY+5iaAnV1ySss
X-Google-Smtp-Source: APXvYqyhecbeiUbsXtaCjleg1osjD42PAK0jHeBJHyX5vrgDWd7irW/0/RANJb3BGAyXUPkkWDyGGD1H03Yn8N0oJWE=
X-Received: by 2002:a2e:9b89:: with SMTP id z9mr9040153lji.185.1574358770703; 
 Thu, 21 Nov 2019 09:52:50 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 21 Nov 2019 18:52:39 +0100
Message-ID: <CAC-fF8T2bviHcpRgmjmVoiAvtpLEmFkr-5P9Q9dr=AoKCiEyMw@mail.gmail.com>
Subject: MR !854 | sess_crypt_blob() fails to decrypt its own cipher text
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

While adding tests for sess_crypt_blob() I noticed it fails when the
input is not aligned to block size of 8, and it looks like we always
use it this way (see also comment above sess_encrypt_string()), see
pipeline:
https://gitlab.com/samba-team/devel/samba/commits/iboukris-dtest

I think we should simplify it and require the input to be multiple of
8 like in the above branch, thoughts ?

Thanks

