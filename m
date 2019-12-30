Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 862B312CCE4
	for <lists+samba-technical@lfdr.de>; Mon, 30 Dec 2019 06:30:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oaq9J86A5qT7Ev0xA8fI+XgQrZQUEfev6OaFKLCG7Dw=; b=QCQiq+DUw++o7aXm7V4C2KLp4J
	lD1iPUOH469X7SCDThFUQboM41gf0ZFa1ho306V9GTFwh4TdH/WosStE1roYln15MHQHzSg3c2xdq
	bL1rN9k9Pyf51O0XL1qp+i8O1JxWWffZ6yKN+56XWdHXQsHrCENmCqL7ZLWj0iqso2qQcyJlQ09aJ
	AUbupbjSvE4m1CqRSRflVMjUF90mI+fwwjYxVyxF1ABhD0RbJD0G2YYdE0RfJrnYbzZBJbU9VHeG+
	zV8H49vhziPn8qGWjRIr0+sSmeVq4t+c8nV6joWPWy3NsCZ828dsqSzNOSxPwVJoZepgZDBbTDKG/
	WN3jtiaQ==;
Received: from localhost ([::1]:31838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ilncO-000Nyo-CM; Mon, 30 Dec 2019 05:29:28 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:43244) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ilncI-000Nyh-Uk
 for samba-technical@lists.samba.org; Mon, 30 Dec 2019 05:29:25 +0000
Received: by mail-il1-x142.google.com with SMTP id v69so26994059ili.10
 for <samba-technical@lists.samba.org>; Sun, 29 Dec 2019 21:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oaq9J86A5qT7Ev0xA8fI+XgQrZQUEfev6OaFKLCG7Dw=;
 b=SMehIdrSF8BkcyHoop7g/76N+O+AJj4+31Bn0PLKZUCkw2mFTTnVBShq+bgLnQ/9u0
 wvEELyH5m+sQcYhCCKXFRMWk0NQ7qitRLqHcMk6sxP7Ymm9QrbSc2ts5V+ayAVxwA+56
 CpnU1Z4KvqVZjRSNktnuvq3y8YO4rgzCs4qoEXGj8tDWwfqTFGKxONnN+U9EJotHsGKZ
 mr6rYRtvRV8kI5FODrPH1KMSO8KA2iPcLMngz/txFhfMbtI6K3kjDQpJdTia2dLxmYRb
 tXsXXP3Mvw+KGWiDqRbZb1cY+aTTXNWhQ65r6GjW8zAhUpRE7gHUvk9A+G62hvzrZoyU
 xtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oaq9J86A5qT7Ev0xA8fI+XgQrZQUEfev6OaFKLCG7Dw=;
 b=UetzKuM1HEmse9jiRLe8dTlTNHOqzQ6dqOzc5t558zW8+HdSDXNJXS1DGvkyVYjBRK
 2agw2dsUoY+8nVfni9/8AcsXYrxGZjmmDaS2lsTkT69ULjYsqw+/CANnEdf8oNOtxk0o
 4Xw3MiTOJKdy9IvJr7hZPVTb7rZ5v+h5G3+nAVOmaT0ZYPAyENDaAnaHJmSExgoK1mMB
 TZr9gh2mlj+uAe3LpBDhz6wfmZZXZYRP0XPrFhpRMlNxnXkKDQG28EwQVeKYxGl6d0e+
 luX2Ji7BDQiSfy4LrCaTQYIFPLRR2CRWxCBgMiODhAb+NZBNTjMdsqWuXKtbQNml3J+P
 wMjQ==
X-Gm-Message-State: APjAAAXLZ0Ywf98PWkFBk7+zTIdFEHZKoxNMjwCskxsin/jWEdbswrd8
 qMQnyuxyYliFad5BAxlwZWRzE/L+zxeRZ51VdQ8=
X-Google-Smtp-Source: APXvYqznxWMOc/zeoeuvpB4zDr6gxOrtbKhiqFQDRhYff1gxXRNYl6M6jFdOGJOqlPZESbiMwJfJRV7An3TD5Cy5fEY=
X-Received: by 2002:a05:6e02:d05:: with SMTP id
 g5mr37929888ilj.272.1577683759157; 
 Sun, 29 Dec 2019 21:29:19 -0800 (PST)
MIME-Version: 1.0
References: <1577244621-117474-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1577244621-117474-1-git-send-email-zhengbin13@huawei.com>
Date: Sun, 29 Dec 2019 23:29:08 -0600
Message-ID: <CAH2r5msEOq877Rudaz1aOeF-sxe2qvy+Rc8nWc-Bq_-qZNqYHQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] fs/cifs: use true,false for bool variable
To: zhengbin <zhengbin13@huawei.com>
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
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

On Tue, Dec 24, 2019 at 9:23 PM zhengbin <zhengbin13@huawei.com> wrote:
>
> zhengbin (2):
>   fs/cifs/smb2ops.c: use true,false for bool variable
>   fs/cifs/cifssmb.c: use true,false for bool variable
>
>  fs/cifs/cifssmb.c | 4 ++--
>  fs/cifs/smb2ops.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> --
> 2.7.4
>


-- 
Thanks,

Steve

