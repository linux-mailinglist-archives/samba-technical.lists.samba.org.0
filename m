Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CC9324F95
	for <lists+samba-technical@lfdr.de>; Thu, 25 Feb 2021 12:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MtvRLKn+emqQaGBf7p74HfjCGYNUUpTGS91Ouk4K+Uw=; b=LmEI6ZODP35cbCJPHF7hVflZC8
	WtLPuzGl9Qi6TI2Xzst1TzItRqp2XoQNG+a4J7q5YMBIteSncEDH7RjZZRa+hoANrV4i8iQbPDNkX
	WoZIvoZa0ALT8zBRBkfAWfUSAmmU97XGuizeEPh648KNWkS3kab7gSLdKNGi+cMhMLzjzQqNQys+n
	WQzWmr1HNxaGpXc7AvSyiM/1JJeGq4Th86thvMdawjRGrjVQrTQAZkMY6XDfD3/InAiGdnJLaizhc
	O8L8Xx/CPAe7J/wiuwzKWIPdR4yuRFWzoQcvG8Gs9F7rwEvzteRIAXMe+7XAJ5woALQVDbY+ge2fI
	+Zh5xakg==;
Received: from ip6-localhost ([::1]:20826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFFHy-001O1N-Ha; Thu, 25 Feb 2021 11:58:38 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:37935) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFFHt-001O1G-KT
 for samba-technical@lists.samba.org; Thu, 25 Feb 2021 11:58:36 +0000
Received: by mail-lj1-x229.google.com with SMTP id 2so1592100ljr.5
 for <samba-technical@lists.samba.org>; Thu, 25 Feb 2021 03:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cHnH5anQ7O0K1yCw8Tgxh3VL4beIR5/YdTjUt4B93S8=;
 b=tv5SgSy7fywlEeRpKB4g9x+caYgjzePZ4PTMrOkMzPimXbJrC9fBqPe+iuk3piaI3m
 cc+yyugO7hMQvyw2ME/CJKoNZUeLpGUzkkH0p95Sdpz7n76tOQKMv0XZqn2CrWbVC081
 InI9D64KOIBj5TeCMt4WKLcWByM7zFEG1YFKbcE/NdBKMyr6tD1HcTdwC1EPMQMifmuv
 1XpsvwkQG1ZOtVQiy9D1AFK6CIRCwiLn+alX48SMhTvptZ1Rp7b+ixTVhrOcxYdaZfkR
 yf1667AbrlD+CEGqWglgDyBkTjhG+X48Y/ne6wcoIFJ820L19PL9AvRbqL7IBUcIO+Ea
 tNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cHnH5anQ7O0K1yCw8Tgxh3VL4beIR5/YdTjUt4B93S8=;
 b=sV8CBA/7M1aXYLzQfr3jSeMlmr897FoOqNSLBt3LGg2vesv9sFYwjx9FtKBYr4Jd/b
 Urw483oUZvcxgCQJZhilMr5sOSA773573DqO8wK/6HDHhAyIL7iz451NFyG8wqzmG6jC
 xujhpdx53/1zX/zAmIRl9qCDi+H0EYfvzLJzuu6GnU1phMu2Zmo1k77c4Rq4/q37rRsC
 oTP6RHjSjqlBAJ0202ousp0qf3NkFjZWs2F1npvOb6jNqdz+FJLdPqr0ICC8/7S/OSGG
 XRhuR/wOfiu34Z9d+wFiiFUuyX9AKk+t70Ezn66110/4nS/EzGD/OqEeoQLsAcTdwoSR
 JSFg==
X-Gm-Message-State: AOAM531L7Lf5ApXYbjOh1n78mtKjb7ioR9VCuLwqJI6c7rquAk9sU+z0
 cY3uOtod+qEPxSIwWZIzc5eDnOLmZGHNZQm6ZlI=
X-Google-Smtp-Source: ABdhPJz+oUmR45xkf2my+c9I1qmnya2E2v4ShjNmbxGb1ELt4CA1sKqrgUYxtXafO2ngfYPnwORg4hPeSwvaEmSvGtc=
X-Received: by 2002:a2e:8141:: with SMTP id t1mr1445814ljg.385.1614254309611; 
 Thu, 25 Feb 2021 03:58:29 -0800 (PST)
MIME-Version: 1.0
References: <CAH_vq2Hx+RzJoudmxcECe0PXG7uGvydzJceWm2nMEX0C5naV6w@mail.gmail.com>
 <20210224182956.GC1333267@jeremy-acer>
In-Reply-To: <20210224182956.GC1333267@jeremy-acer>
Date: Thu, 25 Feb 2021 17:28:17 +0530
Message-ID: <CAH_vq2HzC9T8FNc7khndkPa_uOTxOh9B94sU7TiN5zn0G3Ssmw@mail.gmail.com>
Subject: Re: Kerberos Constrained Delegation in libsmbclient
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
From: Vikram Bharti via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vikram Bharti <vikrambharti33@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

IMO KCD can take service user, password/keytab-file, UPN of impersonation
user, and SPN of service as inputs  (probably in auth_callback)
or it can take final service ticket (TGS-REP) as input in auth_callback.
Not so sure what should be right the way but I leave it up to you decide if
these 2 are feasible or if there is a better way.



On Thu, Feb 25, 2021 at 12:00 AM Jeremy Allison <jra@samba.org> wrote:

> On Wed, Feb 24, 2021 at 05:29:37PM +0530, Vikram Bharti via
> samba-technical wrote:
> >Hi ,
> >
> >I was exploring a way to get KCD work with libsmbclient APIs and i see
> >libsmbclient supports Kerberos auth but can't find any API for
> >impersonation and delegation.
> >Pls let me know if there is a way to get it done.
>
> No, this is not currently available in the libsmbclient API's.
>
> Can you give an example of what you'd like this to look like,
> so we can assess how hard it would be to implement ?
>
