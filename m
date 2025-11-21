Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C9C7BF39
	for <lists+samba-technical@lfdr.de>; Sat, 22 Nov 2025 00:39:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5yZR9PZ4cQwCsgTuoYLVZkrtiQUKvHtt143Dw7SbRzw=; b=k8Zh8E+h37hRQbhvbyMp9cJ7wE
	BMqAbx1QxGl6wYolWI8ezXl9exD977A9mG0MTo+njTjBqstg/Qa6U+IXYriNFMTd+0Izs1v9wgEeW
	7NH+NrB2yMizPcDgJ2bzRUIv/jrtyr7uhiOoFDYtzthWWq1CxMwyTL4SwhWEvQkwjTm3NZhVw1Yr7
	+fQTl/rHzWm/yR5T7350wwDpCZ6CCscIUryoHcbTkA3+XYeSi17VAeSekLwBwbyDQ/pINKroN49Fn
	EX9MjDpXQWRU3+rtdCX6tu8gCfCZERhHV7B2Fo+u1gMmtLQXohq66edlyr3pAOcRY2ZWeZdxL3GFT
	5bkQ8hQA==;
Received: from ip6-localhost ([::1]:32440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vMaho-00CsF0-S8; Fri, 21 Nov 2025 23:38:20 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:48218) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vMahk-00CsEt-TE
 for samba-technical@lists.samba.org; Fri, 21 Nov 2025 23:38:19 +0000
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-4eda6a8cc12so26120291cf.0
 for <samba-technical@lists.samba.org>; Fri, 21 Nov 2025 15:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763768295; x=1764373095; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5yZR9PZ4cQwCsgTuoYLVZkrtiQUKvHtt143Dw7SbRzw=;
 b=SrdWw14WwEVto6t583D8gMDPBHNlgFvE8QYCQi7+86X/VWWQwH2yy9yAPXS+GaYpde
 UNoginNsqr7QkbmMIlAv38mAZuKHD/0c+ul2zN+Rn8y7pHlvReMhTvlFryZWowoNv2ri
 3L1XY5CyX21pBL2GUNf7csRBLysfPlDZ2l5gpEHGRi9q7IB/7sPvZk8vtiw08w2yFHlJ
 NLxlyr6EBDwyVkl8hhpCw4Jjrr1xRcP19B4uhiLOVZQxaagm5JqEh5QU+yMaOZYMensY
 kwOj1xSTRE6l4WPWL1HIDz7NqNK9WFBvPUvI/4FMnzniSrnc56MzVpq7Z4YVBe1ksyER
 itSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763768295; x=1764373095;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5yZR9PZ4cQwCsgTuoYLVZkrtiQUKvHtt143Dw7SbRzw=;
 b=H5nvdsEpGvDoR/wyD1hH3cBEtTUx96dUe/bzg34dJppOJqNDFosDh7O6S5kvHqREQa
 S+oogwKEom7OsAkiKkzBJtuKzm5p9od4gmTBUNrTD9wl+Zzizc2UuNb1uUtgBsxxNz9H
 fYSIUuvLhZq6LeiKcfahBuVwV7LptDyCB5BE7oMvGzd8v7om6SMNxtISEZBjFgQiZdcl
 6gLtgZ9Pf77ORgGmFbC+gO5NAT2+o1ZksW/8EOpXWNW+0YG/vakHqeGE+B7ZZJiSrDN4
 BmBf2n9HC7dd4ltqMSlEpMaGMMuAOcRlG5LrtfKL+vuz79BhIOdvJHT5yHmFMKQRxZfU
 XaEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV230j2MIytYj5gLjHbOYhFCNxPhTk8T91uKyBIf/n4f3pz5C6U4AO7nHNtVrY6b+FzpkEXHf50P8ZDi6pkuTU=@lists.samba.org
X-Gm-Message-State: AOJu0Yz9h5+LnZZgRp3olMvDvW52DtW79j1xVcqPoQp76QZdA1SVkrzM
 /tZ7A4xWZQHsC8S5/7KreQVH24kzZdFD4OeGSgAAEHQTlTQTLyu4BT54pasvtE7b8MNCENMQ+B3
 19UxU52Kh4dP0qpjOQMLMB+KwGJhSttY=
X-Gm-Gg: ASbGncuhfwiEhl70vm3oGpMPPxvE733AmSTj8Z81kdFdQ5wQlLA1yNGmDLiEf+pgXzS
 J1Os1JHOq9UBaxYGEmlxz+4QeHrRglJJbX2sq6OwkGNiI47K+XeB/WrKwAGm4RPvPQbg45j5WvF
 +tPHdmi8PNJB/Axvg3b2NOqK0OIGg0dzl5Ub80TWo0F5OnlwMn0WBVimAi8I6w2sg5ezZSEnGqu
 qpW9bOuf+ygg56oe3MkVRJUtKi5DIgxd3ZNbMov59n28SRMhZlLLJiKPXjs7+LX8v2gX/axEkeh
 AWBwjfL6p19DDmyFmf4PzDH3N97tPgvXnONvWseIz0o0sKkTBvfu3lnt5oiJ8uPTyvjgSArBI8g
 +OlNojXjscG9JPkpbOQAa/+UAfjTCeeNcnRsNZen5HrMvvt+ZmZQXBrXIvkBvus95gxJi1BBPHp
 gI3afwV3RRNg==
X-Google-Smtp-Source: AGHT+IFDIsAYDbXY79i2HogGFE9nTO2FQ0+ZSZhlk5OgkecwtjW9FIDF3of/VCsb4AGwZNmsssiyAKzSd4TmfuTL7o4=
X-Received: by 2002:ac8:7d86:0:b0:4ee:1d76:7341 with SMTP id
 d75a77b69052e-4ee5877ff3dmr60140011cf.0.1763768294770; Fri, 21 Nov 2025
 15:38:14 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 21 Nov 2025 17:38:03 -0600
X-Gm-Features: AWmQ_bk87nWr6fyL0sErZgefWPCikaLVzZJoSWyRpBO5CaoSgrh8BruwUS_PjE8
Message-ID: <CAH2r5mstHjwg3=Vz_3cPXKGJphGhZ7G0hep=-sSfP_hE_3fd3Q@mail.gmail.com>
Subject: Client and Server patches for upcoming Linux kernel (6.19-rc) merge
 window
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

With the merge window for 6.19 Linux kernel likely approaching in ten
days, now would be a good time to collect all of the pending patches
and apply to for-next branch (for the client) or ksmbd-for-next (for
the kernel server).

There are likely many patches that I missed either due to getting
routed to spam or postponed ones.  If you have patches you want us to
consider for upcoming merge window that are not already in for-next
e.g. please email e.g. git link to current version or attachments with
the patches (some e.g. will need to be rebased given the huge amount
of change to fs/smb  in 6.18 so far).

I don't want to accidentally miss good patches due to some patches
getting ignored due to the very busy 6.18 release

-- 
Thanks,

Steve

