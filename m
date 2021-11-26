Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 448A345E694
	for <lists+samba-technical@lfdr.de>; Fri, 26 Nov 2021 04:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=rDFqm1jkQ60CUK2AAx0JS+iz3IaSCyggZtrPU/jdaf0=; b=Cr+LkxPZv9KlkjIKwrkObK5YP8
	RBRl3MrhJoTBVWUMg8NwaE3sEK00HU9gmMNAeu8JJhcAi6SUOAd8PjUFvvDUTzhiGl8nm/NkBB6jz
	q6rRG0GGo3k12zEDc2/zpkCpTH0J3pLNjakypTWw3B7TWppYm+S8qwDRA536Lj+YV96J/rT834dX8
	0SNjvVnHWndhwDkVgi1Z0Nd9gr8/lp6LKlzRZsLcqC+VwtD51WP5lA5ZKGwqLo2Ra/Rm7W0SMKzMX
	jnEO/+dDBnwR7ETZxOM0TI/IqYS1ONrZGYVX0iX8cwguB1VLpXQ8PrIgvI4sYANJIWDJhjnK2gqVX
	1B/3Eqlg==;
Received: from ip6-localhost ([::1]:28378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mqRxU-004kyg-1Z; Fri, 26 Nov 2021 03:31:32 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:47004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mqRxL-004kyX-2s
 for samba-technical@lists.samba.org; Fri, 26 Nov 2021 03:31:28 +0000
Received: by mail-qv1-xf34.google.com with SMTP id jo22so6112748qvb.13
 for <samba-technical@lists.samba.org>; Thu, 25 Nov 2021 19:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=nuTeBeTsOgY6C/J0uG+ZASo2qhNrHC5sRFbZ5ajmj3c=;
 b=A62t1fSDhwwjpq5PkJixXWp1OV22vJLuYQsWqrQ4qUUeyM0In4vqXQ/B3K1PedAKvO
 WbVi15BuAia5SiJjL8MysZEBcKRUgIGQiZOqpapPIrwwLjM9FCPGXX5sGlW8PjZklByb
 2wIsMkssNdS6WPf/RCwDaVM1Td2SUGuEOiPeIDeY1cQFMcXSh/w++TjGaU5C264WSTMb
 FXuVcU8nPqLXna1hevgQUQeVG27NJqvzB5ph0qEY6p+CHpF8nGoiL9sFZjAkgRbRe8x7
 Xn37+axLPB9ifd5uk5co5VBJXQcgQVMtsyTE0SjofBMutt7bSrG1KrElxBfdBa2tXnUB
 5/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nuTeBeTsOgY6C/J0uG+ZASo2qhNrHC5sRFbZ5ajmj3c=;
 b=sgH5plWppHrer/F17WoMPdCynwRCWVgjO9rZURrYPyZbrqqbnhd8ZrFXZ8ihdB2phU
 /+sJmGVKOKt4qjw8FGOMSR+bj//n0Irb3x7Jl9ElZ1eHMLIpXTy03Ho/kOYSk+I7Z7qG
 2/imha+hVoQOPi5vhWAZaEsqXzCvTVBGrxJQQAkg2EH1nseyozja+7JFt2KDG1ypzqrx
 T0mbpaLORyBR8/s1RK02SZR2XQnSE+jU01ydGZc864urdQDkABBt3Vtd1gM+jVXPJpvu
 1JwLPLVI22scD81g59fjfsF8YHjjyE71SWBXrPEYeLneWCW621x6Ge/+x3/jmUKed8RH
 5Zbw==
X-Gm-Message-State: AOAM533bMVlbTkbi6y7UYvBY2bI2mqvI3CQB79oPjKi6lWkx0nl1Gipd
 0nJRzT2HJaoUXwxcyRhnkmMhFmkwLoENFo/MHXsJkRVCLq4=
X-Google-Smtp-Source: ABdhPJzI2ymS9ysVAshD+XGLZ/+zpwXFdP29ihvbE5I06l39idHGADd0D83e7LVx8g1n8fnFMgMp5Ml5P4gXhZz23P0=
X-Received: by 2002:a05:6214:19e3:: with SMTP id
 q3mr22839712qvc.35.1637897479114; 
 Thu, 25 Nov 2021 19:31:19 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 26 Nov 2021 16:31:11 +1300
Message-ID: <CAHA-KoMZENMX2U3vMVYUro_trOAU0qBtQYPqYtfPw7cJ8Sj7YQ@mail.gmail.com>
Subject: Failing pipeline build,
 https://gitlab.com/samba-team/samba/-/merge_requests/2271/pipelines
To: samba-technical <samba-technical@lists.samba.org>
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Have a failing pipeline build for a patch set which I would like RFCed for
work on for merging.  This builds cleanly on my set up at home, and
there don't appear to be any build logs that tell me where gitlab-ci is
going wrong for merge request 2271....

Thank you for your patience!  I am a bit of a green horn when it comes to
this...

Matt Grant
