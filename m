Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 607AB36F331
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 02:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=gSW1CmuOZeZHyt5GqSVhd7aZOrjYujOOMSffWSAzEkI=; b=Q0VBRYdLZJcQ6DnXUIoLgAMjlz
	GPUZnmrHVlyu6zk+6uiaFImFL6ITHw+DrPqls4ZgbUusWAomFE9Ah5x6YCHJFU25VGjklKe2XpC8K
	t6xdkxjsfgBFlK4ljWkCCEEWG5O7eJX4MFngpUHTrOjUMWuL38r0j4qMXgFrp400C9efbMZzOvE4R
	7MvhAWsrDGaSmz4j8VIbIWqQ7WFPFLQN5cfC0Q1WcshJ4LhhioiJScGTdVyavVx0A8SFabG/AUFfo
	/6ZExiCubFb3v67kiT5J0qhOXBJCqXMqjsCjctxdmFy4eNvt5cH4+b52VDwbcu5p9IUqotTRY8Y6m
	zaqJ7k/Q==;
Received: from ip6-localhost ([::1]:38172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcH8F-00DGsq-Uj; Fri, 30 Apr 2021 00:35:48 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36480) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcH89-00DGsj-Kx
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 00:35:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id m9so55914525wrx.3
 for <samba-technical@lists.samba.org>; Thu, 29 Apr 2021 17:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQEd2trIqXSfH/JTUN/NoArhKqBq6AqfJ8G2HVDAboM=;
 b=GI9jAmWhMnCeZ1Zn3syMXlShA/07VArR5ewIV6fCMD+AnERcG7/1C5zulUm+mkIv+M
 M7P19YFvB+yIlrU9W41I8mFIRnAcYLoBsg1RdC8eLt4jLR1J8HlAeBLTBNdY2o5z1dUc
 f6uloyzo/HUNfkxVW3T0+ZnFVEiLYMxCtF3c3zR3wP4puW0b+XON2wAhwbuwFLaqbdHb
 U5GTv3IUEGm/REHCEsmOsLt8hqqRsTyCEPio4HibvX+38EkvZ+60SYzqW9F/mTiMlWUO
 wOzuWKBkxOgXLVME55G8/v9d675LAckcT5Kl36dlqU8oiX87SQC3l4rBjllKAHgrz0H5
 rz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQEd2trIqXSfH/JTUN/NoArhKqBq6AqfJ8G2HVDAboM=;
 b=QYMApaF6wJ/3f1ZoOjDB/J76dWnoXe0qL+fCGY2VgjW4EiJ8NIBXfykQt62eYuaROm
 sxMm0x//u/KbVrEmAahTwNDnBQ1VY5bEBJLFFCrgf3woC8lSnNs0zy+gjuq79ujazcNx
 kxA9r+AqpXHsEZcvUn49YjXDes44cpEIUufuEzl/r7kG5YkesoN9j8QNmuyRsh/AXQhd
 tS5iqLj3ysOIND6KHwG/GBPWIIIULgmoRHLCASPukz1BUBa2fBIabIWH5umD30/qDlhr
 SVWJ4J7mVVHF5JQFE0zlXuxcPYMVzbQN+DYFDBcLKk/RkOe/XF3tpJ/wnFtMEDmP5THr
 lpCw==
X-Gm-Message-State: AOAM533498hJjEFJfPh7MMJ6qgLtPOR3jAiLPZAOhzALKh9YlOYh3u9S
 Fm7OrDtGcyHuyfXm/M3j5UfwxgIix1j80TKLIg4=
X-Google-Smtp-Source: ABdhPJzVxOaq0TBmxXV8elC35QsHva05OppQpX7C7iFNosi1pOwvw20j+NNB1nKzCJ75rBkM7fjYI678jhoxueVqLEc=
X-Received: by 2002:adf:d22c:: with SMTP id k12mr2929981wrh.25.1619742940106; 
 Thu, 29 Apr 2021 17:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAHbM3qio_0K45DZbK5aYXPE_QAkku8K_XBpFxHQWksf=iK65uA@mail.gmail.com>
 <20210429034446.GC808221@jeremy-acer>
 <CAHbM3qgQctYp2sYdpvt3NbtiJ+Dhv4h1KMsMgjnic4jLdONW4w@mail.gmail.com>
 <20210429173927.GK838134@jeremy-acer>
In-Reply-To: <20210429173927.GK838134@jeremy-acer>
Date: Fri, 30 Apr 2021 06:05:29 +0530
Message-ID: <CAHbM3qiSLoK9uAw7q4J9dtN3UcqPBUsEdXybQW8g_iFktXCzng@mail.gmail.com>
Subject: Re: domain join stuck at krb5_get_init_creds_password
To: Jeremy Allison <jra@samba.org>
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

Hemidal has refactored lot of code in send_to_kdc.c even for timeout with
connect. But, I found an earlier fix that addresses only the connect call
nonblocking and timeout. Below are the links for the fix that I used:

https://github.com/heimdal/heimdal/commit/842ca62336cd44b6ed1add2c93bf7a7649c58f08#diff-c65c9c2776f6f83857fdbc5546feeea98f2a1cb6cbd4ca087cfd9d16e67d367c
https://github.com/heimdal/heimdal/commit/3a30f3b0d1e0a00e5f9372092a7a9497c2f73e98#diff-c65c9c2776f6f83857fdbc5546feeea98f2a1cb6cbd4ca087cfd9d16e67d367c

Thanks,
Shilpa



On Thu, Apr 29, 2021 at 11:09 PM Jeremy Allison <jra@samba.org> wrote:

> On Thu, Apr 29, 2021 at 06:07:12PM +0530, Shilpa K wrote:
> >Hi Jeremy,
> >
> >Thanks for the response. I do not have the network traces. In this case,
> we
> >were using 'net ads join -k' and 'net ads testuser -k'. But what I got to
> >know was that there was a firewall for one of the KDCs and Samba tried to
> >connect to it and the function krb5_sendto() got blocked in connect(). It
> >appears like the timeout value for connect() was 60seconds. As there were
> >multiple attempts to connect(), it added to the delay. I tested a fix from
> >heimdal which uses non blocking connect with timeout and this seems to
> help.
>
> Can you point me at the upstream heimdal fix so I can look into
> adding this to our version ?
>
> Thanks,
>
> Jeremy.
>
