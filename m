Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4A5241516
	for <lists+samba-technical@lfdr.de>; Tue, 11 Aug 2020 04:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dZ+8XtWdADii4kBhHkwnxGWHLxSFZlJmOm1pFcvDFPc=; b=Om9PBayVehza3G85OelnR7F96e
	yRQPmrsOpYWRl8brvXiUoT7dZEmAWyvZz0UcDT7XqHnCYORAHGOq3mD/7H0NXOCqAwDF444DOQckg
	0rTwf2HMZIgC7fKsYot7nX9famkqQxsNpMSzq4GDG0SqaI3ajkKkGDQMhJIIOKGRjXtNkFst8TBwq
	t1RhIO0CEKgbD/61AO7IGYYUHRn3+fY2RJ0h44jvPK9WTitt/LkqIBq5p8T7yvuPEGsog9vMCgcUG
	O0vI0hsvNp3ZxCsMVu7AzOxiVCZfzO8g4te0lLVo/pRNeghCAh1H3RHm11dpkP6xi5otmb0CDYrnx
	6knVVzFA==;
Received: from localhost ([::1]:21282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k5KRg-00DAUG-Py; Tue, 11 Aug 2020 02:55:26 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:40771) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5KRW-00DAU9-LO
 for samba-technical@lists.samba.org; Tue, 11 Aug 2020 02:55:18 +0000
Received: by mail-io1-xd44.google.com with SMTP id b17so3601772ion.7
 for <samba-technical@lists.samba.org>; Mon, 10 Aug 2020 19:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=orrL3ZFabwF48/NHF5Ju4rXncnI8Pcwga8qiLBYQJLU=;
 b=HIo6WzCwT25AjqRMznp+7EMjAc/gVLwPWlkuXIZRfR0rc1WXCT2wBRFmqqq3aMN0z8
 hiPZnUyBsTFrrIXtsSYWRdGq7g7jfQ/t/bFrxPtMGl6yO0eITO9Qb7nojngdYsjqsy8R
 vWry0t4lDkOpIQes0MuN6NVE7JGpJ/feuFFoKqIsSQZvQBGxBmQ3l2ULa68+riCM5rnw
 P+JwX9qNLt0sgiB/JF3nR2qwAYQgL/dRUN5vCYdDgYltTEgUU3gUmYfvhDTHU9S1ZCOL
 1UJfoqtPiAffGZldzN9aPTW6PqckTvMVbd76TyTpduWagAPqClO2tu41QwGLczaOWQlR
 BFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=orrL3ZFabwF48/NHF5Ju4rXncnI8Pcwga8qiLBYQJLU=;
 b=X2iWDTJL79I9y/xC0PWRJ0sDyOvH+/L6I7+4kLdXeWZfuKneR5aNInbneBBu2xUJw8
 jokUunWfx0G16RT8jTh6T3XE0eP0lKWRCjKVi0AaENpaUfbK3H56NWTuREzykr0ALvsL
 9ePPcoJfXmuOwHLv50pHCMhr/kachdopweXB7loETGwPsxtqOG93yx+yr73xfcs2iJSV
 V8xs+0IdGtSty7rhIFFHXejv+kqrkiwfwUmgNYe5wZPTsG6gUXTlKi+2G9kGeqpZex6x
 C/CKM3C4XSeSdpmZlwQS/NECWt6WWAbanx9GMr+gmhik3gQBUmL7K3jZNTs1STPVxVer
 IsrA==
X-Gm-Message-State: AOAM5315dPPP5trl3zXrhH3NQwsz0sTFJC6gu3WWnjlj79gOPaDd3lSa
 fc3jWjKEF9byJYqBtMpaMEAjzK8AM9SkkZR7WZU=
X-Google-Smtp-Source: ABdhPJw+tHsCvVh4Yx9iot7SWBeNhGuw2ns7KWzpETKyJ6ABpjmIsLOkwjz3twlvYpIZHR6bQsKUZL881E8FcZ8MGDo=
X-Received: by 2002:a5e:a607:: with SMTP id q7mr20459514ioi.16.1597114512113; 
 Mon, 10 Aug 2020 19:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <5c4a8c734508477082819724c6853337@huawei.com>
In-Reply-To: <5c4a8c734508477082819724c6853337@huawei.com>
Date: Mon, 10 Aug 2020 21:55:01 -0500
Message-ID: <CAH2r5msNsWTMV2eghSmEeU98iUU3_x2rfu3QXeJQ6Ny7ZP27mQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Convert to use the fallthrough macro
To: linmiaohe <linmiaohe@huawei.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I find the /* Fallthrough */ comment more intuitive but if it is a new
kernel style requirement is to convert them all to a macro .... I guess
follow the preferred style ... just seems little used

On Mon, Aug 10, 2020, 21:11 linmiaohe <linmiaohe@huawei.com> wrote:

> Steve French <smfrench@gmail.com> wrote:
> >
> >merged into cifs-2.6.git for-next
> >
>
> Many thanks.
>
> > (but note that most places in fs directory other than cifs and btrfs
> have not been updated), and I noticed another 8 places in fs/cifs that you
> didn't change in your patch (ie change from the older way of
> >indicating fallthrough   /* Fallthrough */ as a comment to the newer
> >fallthrough macro.
> >
>
> I'am sorry, I missed that. I would fix another 8 places in fs/cifs soon.
> Thanks.
>
> >
> >--
> >Thanks,
> >
> >Steve
>
