Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA08139DCF
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 01:11:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8UNqqNp6A2fIfgRhJ+N8FfocsDdpIEbo7VDkTlOjrXA=; b=hdcZTpg1yVB+O5MWzjOgC17cjc
	oN/g7aMpJqoWlPVTvaYA6rdyAlLJpdwYc4uapMfa9OM9UGJkmsrdHoCxaFbwFS6mRCDqCQ4hffESv
	Py2XO61ti7+auvjnht6MBIEciV55X6mKtSZSULqaM8MoXcAGvHJffo5k6+jUIFEGW43qtgbvXP/iJ
	J/vi0XzwVMijUNP1lDYb/YwOmtPp343JhQnyAwNkft17PWE6yjDeqDQ4BVgK4PEoLl2TdmOFzlZ9L
	YLfqEAIyRAs0NkRRG6ZA99K7t8WoLu6MLOpmqBoM0wgLO+BDuWL1zDcPhRFNB0Rcx1nchzX7hwc62
	o8E7LZoA==;
Received: from localhost ([::1]:64418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ir9nR-003JNr-Te; Tue, 14 Jan 2020 00:11:01 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:43634) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir9nN-003JNj-QI
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 00:11:00 +0000
Received: by mail-il1-x131.google.com with SMTP id v69so9815721ili.10
 for <samba-technical@lists.samba.org>; Mon, 13 Jan 2020 16:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8UNqqNp6A2fIfgRhJ+N8FfocsDdpIEbo7VDkTlOjrXA=;
 b=OaOQOeC7i69s1P467Z07W4hfiyQYDktORsqTyx2MVFiBeYe+bh0+XnIi32ys7XqfTy
 LkYvW0o8A1pqU4N3qSuL+lqQ2SCqdKfgNj7mDOT1iJ+zSkKZ1i71zk6JD4dBcwy+hBfe
 3LYOrdN5Pgp2LYpT6yrS2XNRKUKBX6MVlF0rxywlCii5js52q10uRXVc1wpu0p7J1YFt
 YUlYnxqHgodngnx8XRCkfp+zZvDBVQK2OyINu9wtOtfLBiqEKERX9gm2XJQq4ILCPvg4
 DyZI5zxaTlZ6C5KwSPPI5FPSpSwZguVZMzuVqE2Ckq7EAYmpPLaZdQs0XaYP0vQTLzT4
 yD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8UNqqNp6A2fIfgRhJ+N8FfocsDdpIEbo7VDkTlOjrXA=;
 b=oeDot/qAzqZWkSRUi9AviiuJpZfDzMkRIVE1QvGX33rtGZngGywjN/c64KoUKhbPnd
 l5ZaRcTLu5NOriemVtiXns8CaDQhO7+CO8ojeKXpw9mWjFTiWYakMs5tjeMzhIjZEQmG
 i4fHzlJa9OIyGfa8v7JPzcJnQQ6ydTUb+tLZyD7tM0tMXQH2lB50r6gYtIPS5q6oBCNi
 Q/Fzrt6kSmtQq3o1eXK77LGxSguDcyQd1WJN/bw2lbEBYCeVYAfm3mvdY5/n4jQdOJ7C
 bGg4RSwiOOQ6wTJVOsESCbSUGN2Tf8AxTAaYbG44IGIigW01y/yuhHkweoAQLnrRpgdn
 +0hg==
X-Gm-Message-State: APjAAAVXmsceAJnqRLp8m3/WRrD9jQIgRbL2zUdlZEVwOYJAm+W9uESC
 W4TQqHIqFH4ZteaGlgZf0V/0INSqVTJhFuEp12sKPw==
X-Google-Smtp-Source: APXvYqwi6Vexdb9Bci5Y91T3oUEyPhoSyQM+S0dhCBZfAjOwDSe9Q2t1UCqDdyHcn/Sk3see60cw4CIWEeSk3kRgVE0=
X-Received: by 2002:a92:c990:: with SMTP id y16mr1042054iln.109.1578960648955; 
 Mon, 13 Jan 2020 16:10:48 -0800 (PST)
MIME-Version: 1.0
References: <fa364f9a-b16e-9142-177e-a98b6bf8ce0d@suse.com>
In-Reply-To: <fa364f9a-b16e-9142-177e-a98b6bf8ce0d@suse.com>
Date: Tue, 14 Jan 2020 10:10:38 +1000
Message-ID: <CAN05THQJPv+ZWVfbwoLhk+Yru3mawZgCcy=ROxOH6ak_DcHdzA@mail.gmail.com>
Subject: Re: SMB2 Write truncate
To: David Mulder <dmulder@suse.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Truncating a file in SMB2 should be
SET_INFO/FILE_END_OF_FILE_INFORMATION

On Tue, Jan 14, 2020 at 9:29 AM David Mulder via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Based on the behavior of tests in source4/torture/basic/delaywrite.c, it =
seems sending a write request in smb1, with a buffer size of 0, would trunc=
ate the file (at least that's what the comments say in the test). There doe=
sn't seem to be any reason for the offset size in these tests (some are les=
s than the current size of the file, others are much greater than the curre=
nt size, which doesn't make much sense).
>
> I'm working on converting these tests to SMB2, but the behavior isn't the=
 same. An SMB2 write responds with NT_STATUS_INVALID_PARAMETER when you set=
 the buffer size to 0. I can't find in the MS-SMB2 spec how to correctly tr=
uncate a file. Anyone know how to do this?
>
> --
>
> David Mulder
> Labs Software Engineer, Samba
> SUSE
> 1800 Novell Place
> Provo, UT 84606
> (P)+1 801.861.6571
> dmulder@suse.com<mailto:dmulder@suse.com>
> [https://www.suse.com/email/img/2016/email_signature_suse.png]<http://www=
.suse.com/>

