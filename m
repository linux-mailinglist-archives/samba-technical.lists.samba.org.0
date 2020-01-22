Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2C7145A5F
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jan 2020 17:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZHdhn6fXAUDdnrx4kd/QPO0tJ0CsK7JpRCtqUMJ7Cm4=; b=TDtMYiiNeFOEBYDmmzIRFjlGUV
	ziEkw4+sKObfS4N/3ZScWWyY/fXtScbGn6mhdc3R8vjug1zy3cK/UbYhTQ+cMa8s09Tu00lxMLcZi
	QlgFyLgqCK6HaYNYAIsOiwzDqbhUe1ScPRQ5FNZqMd1OByEP0ZQ2B1e4jIV6Q2dWmJ/yrGqgFGqun
	irh2SyCprbgTx8NVDDEuDmBxXNo6OdjcYCi2kLP26yu1D26UdYfgynOIlYg1+/m/5ef5vOlAgwPT+
	L8FMZYMU+eXoY8qEratiWuaEjYnjFBeowcVDqS8QoiKe5R4b4AX7IFwwcpyFIn0RnSj8LaE0HFVvb
	HtMkfF7w==;
Received: from localhost ([::1]:52638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iuJIX-004FCg-I8; Wed, 22 Jan 2020 16:56:09 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:38250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iuJIS-004FCY-81
 for samba-technical@lists.samba.org; Wed, 22 Jan 2020 16:56:06 +0000
Received: by mail-io1-xd35.google.com with SMTP id i7so7329198ioo.5
 for <samba-technical@lists.samba.org>; Wed, 22 Jan 2020 08:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZHdhn6fXAUDdnrx4kd/QPO0tJ0CsK7JpRCtqUMJ7Cm4=;
 b=NKfoMhoKha20dXUbR9fhBu5NawwwGFdt7yueRkrClQareyo65KCPW2oNJD6Rmz56Sn
 D2xBYFaJ5d5hZIXXtiV4PTNyURLxZlIhzI8Nfs66apcVazKAA4qDmY0U3iwXxB46il7k
 4asyJ076h+pn+3dQTDDdq6fpBv2WZt8wYteusrDRiSGMLf/8B8e4q1y8be72z3k5HUHP
 wqNIthWZphaOpKt2VTBkKRRdQ/x6/kErRscIuRsrOLzWLIwjdwjPNjQvP5q4jvmOo8h9
 99BVwVfjcoFQxLl83tQ3xGNEwGxf18AntdVrHwWSV5mDX0FPOAeEhdsQ2XF6CmAVXQy2
 caOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZHdhn6fXAUDdnrx4kd/QPO0tJ0CsK7JpRCtqUMJ7Cm4=;
 b=LvTtXzsm6CHRfKlrEIU6pZrSQp1yHmKi848K17/0aSeMI8btp8fVU8LJQnZUna23pn
 6jNRjswf6cPl8biTwE+hic/sZ0LtQTg1n/jTxRBQq3aBjh8bnsbpm7VwiblQ1OgTZUO0
 WL+P+7b1+3QWJKfgnkRb3Q8VoAF84MPypBOxBDYEgSPUf0M8EOntgkbJr57g1xLpZ+4e
 nKdc8gdAZKwIHndAF3HH7LfUf3XyewtptvLUGlu+QMSpeLiR2D3mzpG51y5d7d6JqZFO
 1mj1s1us+koT9L91tC/DXKYMXGxP3/HawyDr4bcUhuVsy6IQMDHdTRh/x9qi9ck1pl6n
 yGNQ==
X-Gm-Message-State: APjAAAXhr5ErAF9pI7/qaw0oK6xJ0ib+pl+0frjita+U+6P/bNKN5UVw
 dMdZG6cZEABPVBk/pal9sBKsdgER4Jc3Wfg/rH0=
X-Google-Smtp-Source: APXvYqyBbHrbpZbLz8l/A1YUBkn6s5Bfj3VkhX6XhSTnkIlgQUXUY7gokWPNPOguWfpyCvG0LUFQukLm9VT2UvT6Mw0=
X-Received: by 2002:a05:6602:d4:: with SMTP id
 z20mr7834112ioe.173.1579712162351; 
 Wed, 22 Jan 2020 08:56:02 -0800 (PST)
MIME-Version: 1.0
References: <20200122102030.95853-1-chenzhou10@huawei.com>
In-Reply-To: <20200122102030.95853-1-chenzhou10@huawei.com>
Date: Wed, 22 Jan 2020 10:55:51 -0600
Message-ID: <CAH2r5mv+dCyj4dQm8kSiVSyu161oyuOSYO3Ec0VbewjFJMv5hw@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: use PTR_ERR_OR_ZERO() to simplify code
To: Chen Zhou <chenzhou10@huawei.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Jan 22, 2020 at 4:25 AM Chen Zhou <chenzhou10@huawei.com> wrote:
>
> PTR_ERR_OR_ZERO contains if(IS_ERR(...)) + PTR_ERR, just use
> PTR_ERR_OR_ZERO directly.
>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  fs/cifs/dfs_cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/dfs_cache.c b/fs/cifs/dfs_cache.c
> index 751c2fc..43c1b43 100644
> --- a/fs/cifs/dfs_cache.c
> +++ b/fs/cifs/dfs_cache.c
> @@ -662,7 +662,7 @@ static int __dfs_cache_find(const unsigned int xid, struct cifs_ses *ses,
>          */
>         if (noreq) {
>                 up_read(&htable_rw_lock);
> -               return IS_ERR(ce) ? PTR_ERR(ce) : 0;
> +               return PTR_ERR_OR_ZERO(ce);
>         }
>
>         if (!IS_ERR(ce)) {
> --
> 2.7.4
>


-- 
Thanks,

Steve

