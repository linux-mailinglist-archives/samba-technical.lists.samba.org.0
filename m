Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 668EA27FE81
	for <lists+samba-technical@lfdr.de>; Thu,  1 Oct 2020 13:35:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/FhZCRnorfntLK1kfvWwzZ5IWtH5hTk+2zSmGcGKnwU=; b=ZoTUdB0Joc4+HCoy7rsRuu9U+X
	gNrvb32/nNTspvHDHyNQ+ngxJ8RvH5Fa+UWNOZlGzICUChMNsfQWE0c+0gPJc7F1AtW4Mk64jW3iK
	Bd7T8idgcBudbaySCP+KyyxEi64xi3dQxcqxQu1MEHrrU/NFdp2WZIZHRd5ixnQNWtSHy0PBuAca0
	FLqRm89HTSN+0YCfqS7KCEla1Iddhjg5SLky5Oewae/gcvrQdSS3ZRWEO4jNelPjVskllAp1JvY/l
	Zn010KW/3xtMd4rxeePpvFdGtbaCzefW3un6qZSlmpzegPaoNExAUV/QkUHiYhD5akHnURmZrIefj
	dQCMDwjw==;
Received: from ip6-localhost ([::1]:61788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kNwrF-009z2F-N4; Thu, 01 Oct 2020 11:34:45 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:44751) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kNwrA-009z28-TD
 for samba-technical@lists.samba.org; Thu, 01 Oct 2020 11:34:43 +0000
Received: by mail-io1-xd41.google.com with SMTP id g128so6190034iof.11
 for <samba-technical@lists.samba.org>; Thu, 01 Oct 2020 04:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/FhZCRnorfntLK1kfvWwzZ5IWtH5hTk+2zSmGcGKnwU=;
 b=GO2FKvDW9RBo0iO4fSY0zKQIbYCBgTBsvylWVCJefxuPHYWkqHknlWtvCqze7MimET
 gDh7zZcL4t3SglWae8A7G27LKpobRKVRhYK4C+nVBQ979dZ183dFoJ2jtJofTQmHnLmD
 bRHXIab+Yhb9mnmxFKzYjPf9hxCdUQbZSd+NYrfwBc9VCI0BFbbPQyyHzIDzQo2nN7Ef
 BjqrFsBChJoXjpuWnfyuEkDQ/0Xk4SZAQnps6+xam3nooV1NlVHkOv6ERMLZLeBkivqh
 LGaTT2NG5teYhsgYwbScCR0yBKXepyBC2xlfP7EKXQKCqMc9i2smjuVcXcSuywtyIZ8W
 FT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FhZCRnorfntLK1kfvWwzZ5IWtH5hTk+2zSmGcGKnwU=;
 b=S0WYJnu7pQR+CYB4ItK+hKRZFvyKWw0GoWuFu3uhFBb2Jqs5ADYsJvNA+uBhfQcNJu
 RIuMLTA/Ufd8kD5T/TABx6KsNMNsJXVy17Pv58ZvEMme1N+JZp9axHQZE7PrzkAIih7X
 yAFip3gpcc0BAmyhBPZ5MHz7aPKZ0UIrKbh5kezW/OWRixu39MAxgoVdu/cQZ4Qo5qBE
 RYIEEkvETfnKwj1oeHtil/EeQdydDw1Wl0TnpNrnzAIc2RcVpVz8x54Y25ejs8XPvlx/
 SVNDfMhfzmXYFOItyOM3B6fHJNsfyQ4FmFPZDXIrJeElAWp7aPeeZGwMmcPhYhMxQ+E+
 OX2w==
X-Gm-Message-State: AOAM53232XSltanNbqxTmKOKqye0j9h4LHIfKhLCMc2uOT7PIydgZQeB
 +UEc15fB3voxEs4mL/92FZOnlhZ8VklPnMA0r0E=
X-Google-Smtp-Source: ABdhPJxvHNbXjho1jt/H6IqPByxkftI1w+csup+4q8Qqi0djV8JXbvqoMAeNpy+RHc6+lRxNoo16WDaTwPoN8b5TCuc=
X-Received: by 2002:a05:6638:d46:: with SMTP id
 d6mr5832134jak.20.1601552078625; 
 Thu, 01 Oct 2020 04:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <CANT5p=pvumVCNCLbSCaxgmfFLR-ifeQJrUETfG4ALxzfTRRxew@mail.gmail.com>
In-Reply-To: <CANT5p=pvumVCNCLbSCaxgmfFLR-ifeQJrUETfG4ALxzfTRRxew@mail.gmail.com>
Date: Thu, 1 Oct 2020 21:34:27 +1000
Message-ID: <CAN05THTANbmogCk6pXx7RtbKfb_OpUzNbvg5JyJdee5osJVDCw@mail.gmail.com>
Subject: Re: Error codes for VFS calls
To: Shyam Prasad N <nspmangalore@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 1, 2020 at 8:59 PM Shyam Prasad N <nspmangalore@gmail.com> wrote:
>
> Hi developers,
>
> I seek your opinions about the error codes returned by the Linux
> filesystem for the I/Os triggered by users. In general, each VFS
> system call (open, read, write, close, stat) man page defines a
> limited set of error codes returned by the call, and the meaning of
> the error, in the context of that call.
>
> But in many cases, especially in network based filesystems, this
> limited set of error codes may not be sufficient to indicate the exact
> problem to the user. For example, in case of SMB3, where things like
> authentication or actual mount of the filesystem may be delayed to the
> point of first I/O by the specific user on the mount point, having a
> limited set of error codes could end up confusing the user, and not
> indicate the actual error to the user.
>
> So my questions here:
> 1. Should the error codes be specific to the filesystem in question,
> and not just specific to the VFS system call?
> 2. Do we have any other mechanism of returning a custom error message
> to the user (the one that tells the user about the exact problem in
> more detail), other than to print this in the logs?

In short.
We are limited by what the manpage lists as valid errno values in the manpages.
This is what applications and glibc is coded against.

Other mechanisms/side-channels may be possible.
dmesg or /var/log/messages comes to mind.
But we cant break the userspace api.

>
> --
> -Shyam

