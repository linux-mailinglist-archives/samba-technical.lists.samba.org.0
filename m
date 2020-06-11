Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E01F62CA
	for <lists+samba-technical@lfdr.de>; Thu, 11 Jun 2020 09:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=iSSX7smqnfbySPNFE2ekjRHcmWxCWQmZu7M5YVkRJdw=; b=qz0LBz3REl445K8wrahaT9WmOO
	MGD5tOOKKKTosJy7p7BKtY7xOpQffOJ2GWjdLFKKICmAb8ysTNClMSpTPbL4yXkuPNMeJqOpsPKL7
	HQRtRIEOpOFGXVG1Y1uPPfwFNTh2wzOkDKCrLo7ouuBWyyr682VNFPQjVNy9ZIFM7GcgWmdeAFQCE
	pIyQCCRDGIv+M9EveMY0ULQ2EPxU++0+GF/6+Q7RL5f2bFhBx7dernh+kiA3yIatv24nFAoyh0C4f
	IWf60mJvJiZfO6r91ABXPFZ62g3RqK+h8TAEizHXGuTlQAFzoeOuCc9Sp7jo+MD9GqF0oPhMZHPuo
	/W040SLw==;
Received: from localhost ([::1]:31850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jjHok-0001vb-CO; Thu, 11 Jun 2020 07:40:06 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37763) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jjHob-0001vT-Fv
 for samba-technical@lists.samba.org; Thu, 11 Jun 2020 07:40:01 +0000
Received: by mail-ed1-x52f.google.com with SMTP id k8so3231821edq.4
 for <samba-technical@lists.samba.org>; Thu, 11 Jun 2020 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+uoc6dMR5LPc48sAxFU7UIkfn6EDJ9gxnFL4R2HS6ME=;
 b=hpqPNHiUiZEXFS8FGmxoPhle2P61IIdxyS6kMC88js5849IpnwsoysCsuWn8z6jasX
 XtCmXEQYy+SW5HejRbRPowB+RUJo/sWFwsbfOIEebgQoV+DZCd3Luq4qI32C/8Vjqpdn
 YUNv1uyL7FSSN8TecL/ZkOWt1sdBSuqVLl2jZda0iqajx8s/wt8rC2BIFYuzINfxrM5g
 XoUfrinOH1KjCid/HpqrhK+p6tvCJF54m77tfi2PSoaTSUWuzCh6sgjdDSpbwVjUt4st
 Exy7c/eA4Dn7gjxlAlaKzhXPo9z6jfirWn1IV+nxfKX3cXPfC1dlTGANMD0p8u/Dyr4q
 GW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+uoc6dMR5LPc48sAxFU7UIkfn6EDJ9gxnFL4R2HS6ME=;
 b=lfyDc5CeiJisWI6U7i82pDR40BPRF1Kn3BWSYHcJHbQXZy7ecg0kFjSgBiUsphDhCx
 1UkUakmjT2YT2J09zzyAiCs3ehCKRPSkvVuHJXhsL54RnGF3cwpen++BQIBIlp4FkaFe
 d81tRquZF5RMFQ+bhzxfK3yqY1vMPXWyNyzcT91NGi9KEEKPw68PYS87SZ6oWmnvwet9
 aHlUh5b1khXTmE3oRhCUYjI3Sh5XTT9gp4xsXM9ELXBAZXDBCF/Wla2XYybTmn8aWHSs
 rFCPP6d+6JWHP070hfVxMq8KrUG+fcm519NBnYWOLBckVP/Fgl8GiQHklg+CBMxLw2+I
 6KEA==
X-Gm-Message-State: AOAM533CDhPL8rC3PhvosGLtXCPM5fL/dE/vqkl8xLxcx6q8TsjD8xzA
 5uyQW+8AF/9MkoHqGZhUzuMzkrxA00TEbf36ZBxSYWao2Jw=
X-Google-Smtp-Source: ABdhPJz2iaKnbbGF8iT8RvgbD9MtFlRDw5K2TAs8nq1zo9e1B+yKIeijRK2Kjsgt/QKPx/zWjCynprx1D/rWJHt2Dvk=
X-Received: by 2002:a50:da83:: with SMTP id q3mr5972630edj.325.1591861193152; 
 Thu, 11 Jun 2020 00:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCVhmE3Gn1uiC2iRV2_-EbC7bWW_WJeX+n8xs42me6bgVQ@mail.gmail.com>
In-Reply-To: <CAH72RCVhmE3Gn1uiC2iRV2_-EbC7bWW_WJeX+n8xs42me6bgVQ@mail.gmail.com>
Date: Thu, 11 Jun 2020 10:34:44 +0300
Message-ID: <CAH72RCWeHHJRftd+gm+yX5jdQW2fqvoxMVJPRWr-cq9iKi3R4A@mail.gmail.com>
Subject: Re: GSoC 2020: Week 1 and Week 2 Progress
To: samba-technical@lists.samba.org
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sorry I didn't to give the link to the repo:
Here it is: https://gitlab.com/HezekiahM/samba-ad-dc

On Thu, Jun 11, 2020 at 10:31 AM hezekiah maina <hezekiahmaina3@gmail.com>
wrote:

> Hi Members,
>
> I wanted to give you an update on my progress for the work I'm doing during
> the GSoC 2020.
> Week 1:
>  I worked on some bits of the following:
>   Computer Management - List, Create, Delete and Showing the AD Object
>   Time - Showing the current time on the Server
>    Domain Management - Provisioning and Domain Information.
>    Sites Management - Creating and Deleting
>    Contact Management - List, Create, Show and Delete Contact
> Week 2:
>  I have been working on the following:
>  User Management - Creating and Listing Users
> I will continue working on the same and hopefully write tests for the app
> before the end of the week.
>
>
