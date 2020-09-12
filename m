Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E92CE26787A
	for <lists+samba-technical@lfdr.de>; Sat, 12 Sep 2020 09:15:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oBoCN0MH3dn6uP/lwM5Y/5NVjlId4pqtEr/PIC4f6ag=; b=DYaI4ltEmMKo0Cjz3EWRSLfyer
	sHcnqo5Li4PipRRJHvM+0ZBxWH9eqGcyYk2jQFYvuIuoMgHqibHg9Re/OnJMZEKHp/skhwBUSlvR5
	+UlhsPUkjAEwSc+xOxT5S3jB/cqT3iSVj/rSUjQt+gdYY1TnPBp5NrFOjEXcfnXvFGaIkc0bTXyTq
	cbLQO4zOMVxFv8jH5aIOAz6h76Qau0e08B23FlrGAQLpzrGR13x6c9wtEDc+PxMpS8NPSds125F9o
	gl4a7Ba0WyV6sG6648+sVmy4kYr0RkXpFVfoEH6W829Mkzz9g7jhyi5mdG4b/GbDI0jfHQUv5V/kr
	6mkOQ0Yw==;
Received: from localhost ([::1]:46216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kGzjN-005EEV-UH; Sat, 12 Sep 2020 07:13:54 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:43956) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGzj7-005EEO-25
 for samba-technical@lists.samba.org; Sat, 12 Sep 2020 07:13:41 +0000
Received: by mail-qk1-x729.google.com with SMTP id o16so12137395qkj.10
 for <samba-technical@lists.samba.org>; Sat, 12 Sep 2020 00:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oBoCN0MH3dn6uP/lwM5Y/5NVjlId4pqtEr/PIC4f6ag=;
 b=f6jzx9Oq52CWCioJmnQkve4YUThF91FMJ4Rsszjg3Buksd8e1/MceBgKdGm1cYCkJm
 ubQhoJOOkuAYNorw/D95O8d1Lf/twCoQAVeRaWDFmi4Nerchy6bbDeSd4BQNMKyatO5a
 60OBu2+rRV5VVGJyc22GD8V2XHiUyWjf5YcrDyFyF2G5t+hPhSMnMGLGTkLVhmOFjMPB
 S4lfcXqQMVQG4OlYWo+H+7R18dha1+EkPRLtNOOCh9WDzuQTbbmqNDl/Jg2419+X4BU9
 JgogPsNd2keo8FV+0xxrC/2V7Sd+hLta8cYIGMkYCkvA+goZLLJlZ/mtbWhwUMxa8Ql3
 vMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oBoCN0MH3dn6uP/lwM5Y/5NVjlId4pqtEr/PIC4f6ag=;
 b=Fl8ZEAXFe0AVQLNLg0gYeDNXsjtZYB+xr9qmqbdsMbtu+ko/KqqvdQu9OPkI5CyqLk
 OUxU6mYBp3niQ1bndBBkqWEIl5qiPr6aJfsPf7A7B8RD8FO8Ioa5xpXcJO2n5+yKNkbk
 K+3jxJGQ5XWcuRj9FytEuHLpkwj1RrOm1CXJVdWcwbiAiKEuZX4BglMSYfl2Xl47o4lm
 3CQalcVXIN4Mp+cqnJVZ2kcjXVN/YyRO+Tm8SDDXEDFUBI00XInVwqfPrxVw5jTFTIV+
 98uMxp/dwI7EQ8dQ69B1fuW49dt+lwN0RrycOLMVT0fHnx5HnGmzdFpnQ5sVNMf1Qlnr
 Uljg==
X-Gm-Message-State: AOAM5338yN2jszMcKnZFbMls98Kz4Km8pF6IXkuI3n+ZHBZ4vR6pC878
 TAsb4SnMb74dff4QNsMbT8/TCBMEpP4uqHO+ptk/t0PeYUY=
X-Google-Smtp-Source: ABdhPJzk1r75aCp5t47Tm2mOy3Gj0a4A15Di2QOyT/w5wBJJTI5axfPZyt0IgW1J9BeAVAhomuc3KBrEautmo3GPYoY=
X-Received: by 2002:a05:620a:3d0:: with SMTP id
 r16mr4751999qkm.129.1599894813479; 
 Sat, 12 Sep 2020 00:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <CAC-fF8R4+mJ1LG1xK2+3hEws7=Pj6TYd-+FgHf6=eXEPn5pwyg@mail.gmail.com>
 <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>
 <20200911225405.GA1035745@jeremy-acer>
In-Reply-To: <20200911225405.GA1035745@jeremy-acer>
Date: Sat, 12 Sep 2020 09:13:22 +0200
Message-ID: <CAC-fF8SeA8LZkc=9MnwbeOwtdSbemJdn-QERN+e-sS0P9-rk=w@mail.gmail.com>
Subject: Re: winbindd main process hangs on samba-dc
To: Jeremy Allison <jra@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Sep 12, 2020 at 12:54 AM Jeremy Allison <jra@samba.org> wrote:
>
> On Thu, Sep 10, 2020 at 12:06:22PM +0200, Isaac Boukris via samba-technical wrote:
> > I think there is no point trying to maintain domain->online per domain
> > in the parent process, we should just ask the domain child (fork one
> > if needed), and avoid ever trying to talk with a DC (sync) from the
> > main process.
>
> That certainly seems like the correct fix.
>
> OK, I took a look at your change:
>
> https://gitlab.com/samba-team/devel/samba/-/commit/5ee90438cc2aa26514f60c7d72a3e854adee0148
>
> and I see what you're doing here. I think
> there still may be some calls that can
> be initiated by wbinfo that cause the
> parent process to try and do domain
> activity and don't go through a child
> DC.

Yeah, we'd need to analyze all the direct parent handlers.
I think maybe we can get rid of fork_child_dc_connect() and its logic
altogether, the parent should just talk to the per-domain child, and
the child can block, and would block eventually anyway, so it should
just connect (i think there may be concurrent per-domain childrens for
a given domain, but I could be imagining). Although I'm yet to
understand how the timers for reconnecting would work, or how they
currently do.

> Can we work together to track these down
> and make sure we invoke a child process
> for them ?

Would love to, thank you!

