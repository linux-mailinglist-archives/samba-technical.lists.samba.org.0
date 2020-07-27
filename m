Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 123FF22F2DA
	for <lists+samba-technical@lfdr.de>; Mon, 27 Jul 2020 16:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5fm6LLGXmrsEdK7NGa4PN23TzcU/HAbppem0AWGTU7k=; b=Hx0cnih+P9ZibMJxLYBfSr+VUD
	J9XeF1X1EY+tLcxB4JZanKLLFjmRUnlYADRB3XFBv7NiAoGZWXn8AH2KadU65THBLmK5I7xvrE9Km
	kwzNkBZxHuPg28psH8p9uUY4JWZjm/+eg1EgV9dR4NUL7jd/JmndEaadK53VW8k9IaxdQAjDhEpxU
	matabvuftRcspFK2NxNkzTa9dhPeKvwnBNaJRJKPKbF1qXGs5Boj7dfPQxwnPW6zS7mbCWMU2FOhe
	XB13W3/vZo/rj9M4SsETISEA0dCkLsN/aeqfiQ12+1c4vtQlchP0lGQVzTuaLXfo2Zlyw9O5fs0oQ
	5dXdImNQ==;
Received: from localhost ([::1]:64906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k04K9-00A0sm-MB; Mon, 27 Jul 2020 14:41:53 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:40078) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k04K3-00A0sf-09
 for samba-technical@lists.samba.org; Mon, 27 Jul 2020 14:41:49 +0000
Received: by mail-il1-x135.google.com with SMTP id e18so13257249ilr.7
 for <samba-technical@lists.samba.org>; Mon, 27 Jul 2020 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=5fm6LLGXmrsEdK7NGa4PN23TzcU/HAbppem0AWGTU7k=;
 b=B6fPr1DSAgq59CWdRioWVw3g9kY4+bu0LSUtoqV16r3kBrzoCcUvHTNNlX/ep6dID3
 x7hiCbfOEDuawsRFM62IRI1qwrr1iV+FTx/b5IUe3gDdpCMt1mnvN0b0f01q6HxiFi2d
 Uq8D4sMJu1FPs3EZVj3yvYROvqFrrdm7bBJK5J8Izt3dv7OnZ3/tGdr/3wIDunrjvbuP
 oAV5SuakLPt1Q7efyaO2qrniObZAKvaUDSp2d1ykGqKgpmuzjb+ZZdj9e6K+ZyJEzjyh
 fzj9407WM3LCx7zipGjDYPbbg9azmyNnDHIQie0vW9CgyyBjNlIHhKjNuu+6/lwHTqUt
 DIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=5fm6LLGXmrsEdK7NGa4PN23TzcU/HAbppem0AWGTU7k=;
 b=LEME0euWSW5WGnTxW8rGZJPrpjj54p86AnuGbRf3wJjZVOYTVtFRObxEt92d+eTjqk
 i1ZWKp6cJVLZFr1XOWBYz4C04TwCvdde2vOJuy9DTABmV1wdzXvomgqDkwf8qCoZLyyS
 53NeVp7AUz01xh6OcD71xE9ViuvuuO8uP5h4Qw3/1GQ5C106jD4DTLgXOejqpQgQ/S3V
 ZqL3Bssu/dUyGddNrZqWVQjOZrxrF0Tfvh7YM2JwoMwcNmYJehlgr0qT/rotgJYoM+fD
 4w2NNyfSObBPw6Onrhugl1N/R76YgIHEmzmtHWHCgTZosQf9QUNk5lBucddXcGEEEhMb
 cgug==
X-Gm-Message-State: AOAM532Mp8B50zBON+lDnrUckOeHMlhhTuULUNoW4mYcTQ/iDOmu1Ho4
 OEgj6Mm+ZAjp1eWrlN3APAC50+inB4daDxt/9UXboA==
X-Google-Smtp-Source: ABdhPJzzTBFGDHhPxdiqgkB5kYuSXTVbXL0Vh6uy7RRUGGzw5SiwQQ1GUvuzgrR2Z5xxTX3BYdSnXTKkqu2uDRFIxPk=
X-Received: by 2002:a92:6a07:: with SMTP id f7mr12321206ilc.271.1595860903146; 
 Mon, 27 Jul 2020 07:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200727070710.9EBD51404CD@sn.samba.org>
 <0b25d64a-ab44-b0ea-db3a-de021da00d10@rsmas.miami.edu>
In-Reply-To: <0b25d64a-ab44-b0ea-db3a-de021da00d10@rsmas.miami.edu>
Date: Tue, 28 Jul 2020 00:41:31 +1000
Message-ID: <CAJ+X7mRC=VUiBDfCzMyojgFHt1H4C+Mi64jE7nVan4RiSFC+Nw@mail.gmail.com>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
To: Samba Technical <samba-technical@lists.samba.org>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jim,

On Mon, Jul 27, 2020 at 10:54 PM jim <jim.brown@rsmas.miami.edu> wrote:
>
> Amitay
>
> You did not add "|| true" to the statd-callout invocation of nfsconf
> like  you did in nfs-linux-kernel-callout.

The script nfs-linux-kernel-callout uses "set -e" which requires that
commands do not fail unless there is failure.  That's why "|| true" is
required to ensure that absence of the nfsconf tool is not considered
as a failure.  However, statd-callout script does not use "set -e".
So there is no need for "|| true".

Amitay.

