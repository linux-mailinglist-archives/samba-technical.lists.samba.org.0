Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA7D36E3C8
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 05:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=CSB+OUWTTK2UBV3abH48XdwPEmvHDKkJGoNxJT+npxE=; b=bsdPt5mUGJ9m1ZX1zfvMvxdlsb
	TY79RFK1a7KVy4dvF75Px2Urv6SXJ8p1SkfZePZqHTqi8/6/zoRYSrMdJ5xpr9sILpD5ZtjSeyNdC
	swz9Ur0v2HJHSqHdC3Oixz+b5DnMHkXDUhygB7joPJoYS1B/6kCrMB+KID4DdT0FXdM+N0zhpTy6y
	Nlmiz6p3OzPNz5qfMvRAWARKOR6tT8KOPW4FTMWcIKOHbv2aSbKfvEcM8Sk22uI+hNvvtXIWhk8xX
	fV2giPR5XUJ7z73Rp8RHgYVEAQHGNXfFZqHdkuUVV8VMiVAcr9SeU9k07WEKTIkSSrIwqUILbT0gn
	OgcG388A==;
Received: from ip6-localhost ([::1]:62406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbxbj-00CyYP-Ao; Thu, 29 Apr 2021 03:44:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48672) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbxbe-00CyYH-St
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 03:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=CSB+OUWTTK2UBV3abH48XdwPEmvHDKkJGoNxJT+npxE=; b=VQFOzaLAr/wcYhAXNR63YBP9oN
 wKKLWInilv+C2Ew4e178WBaePrvw/Sacsm/4pbwNO+l1g/Uet6FBJulGLrR928cS4V1481vD27LUk
 qd2oSMGYzmZER1pLBJTvdwVgs3TvnqVLpVL+ikepoRyB4GnnPqyvl8Y7FpdqfkPHUr6CIqGPTkqzb
 20yF7rOUgO4L9oFmJoYH4DZSBc1N9+cOhfnB4bn/rC4TKslCrykKMgFQVqh9RWfJSU+O/P9bPEeoT
 m7yCxwmX7mE2E6UlAYpPm9O+U5w7zYrfgr+8HNPG7xfFwTkPIjOxXsqm6Zs1cK8qkN4eGPtNJNXRR
 bczGm6bpCZok32lc9kAhRudCOla1xbVQ8lnTeqZxCVKdPWY87X8sZ5smMveGsve9Qx6uhwrQC80fO
 LCfuKL0r9tl9MnHg89kJSJxWFp9lomlWYEhASGSt+u6PYrGXnfFh9DRkR8vTzSK/w+NzYcvcpQN/F
 fGUq1S6X0UBcbFL7gQHHGmzI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbxbe-00061e-8U; Thu, 29 Apr 2021 03:44:50 +0000
Date: Wed, 28 Apr 2021 20:44:46 -0700
To: Shilpa K <shilpa.krishnareddy@gmail.com>
Subject: Re: domain join stuck at krb5_get_init_creds_password
Message-ID: <20210429034446.GC808221@jeremy-acer>
References: <CAHbM3qio_0K45DZbK5aYXPE_QAkku8K_XBpFxHQWksf=iK65uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHbM3qio_0K45DZbK5aYXPE_QAkku8K_XBpFxHQWksf=iK65uA@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 29, 2021 at 05:55:33AM +0530, Shilpa K via samba-technical wrote:
>Hello,
>
>In one of the cases, we had a situation where KDC was not reachable during
>domain join. In this case, we found that  krb5_get_init_creds_password()
>will be stuck for about 6minutes. Is there a way I can reduce the timeout
>value for  krb5_get_init_creds_password() so that domain join will not be
>waiting on this call for too long?

Where in krb5_get_init_creds_password() is it stuck ?

Is it the DNS resolution, or in the connect() call ?

Can you give more data on what you see in this situation
in wireshark please, and what Samba binary is calling
krb5_get_init_creds_password(). That will help a lot
in debugging this.

