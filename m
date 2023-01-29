Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF1680148
	for <lists+samba-technical@lfdr.de>; Sun, 29 Jan 2023 21:04:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vJxH3/2WK1vJAtWDWu9OWSqPWPvJWZWlvGmZt8o4Wqg=; b=13sb90cFS+pZXAz5P18uuaaTge
	5uVFLNMkFjDUtl6+MZHZq4IXd2AvEw4aHbYi+4pVUpqrRMS8XB9g3N43hNaaOWHv4GsTW+pTbya5b
	DYxM5kxkcL1dGwE7B+oOOBtwAu+mbYv8mPV3bMdP3a9jC1U9aopI40PM5Vr+niC1R4VkLo2GZFquN
	JNhZ0QHkLnZ8PlYNbG3SugX7Jkbn6YA3WXAWddDU9EDLb35Ie5qSildYBszAnqdrEYjjtHzHtp8Qf
	E+nfgB6z4ZAi5Drea/HCM/nnAE7saVjVYY7ibUXKPfLLOKTMKkNqKAuCZIaU+yGJ9M6G04PsKyKfN
	WHanMU9w==;
Received: from ip6-localhost ([::1]:50716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pMDuF-004P0k-E7; Sun, 29 Jan 2023 20:04:03 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:37601) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pMDu9-004P0P-G7
 for samba-technical@lists.samba.org; Sun, 29 Jan 2023 20:04:00 +0000
Received: by mail-qv1-xf35.google.com with SMTP id jf11so3871639qvb.4
 for <samba-technical@lists.samba.org>; Sun, 29 Jan 2023 12:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6qV6T5pbqCUgwa7OV/meXsk6cATN/NVGxc79YaWs6bc=;
 b=MmvpX/pDMnU6JsL7pfOzrcyGZaAxvtdUsVyAlikyv7JdZsrFeezS0eyUFR5EzDLAg3
 gaBIU+t2nr/K44O/2dLxyB4Hq/DLAH4yCkipLeqk9YYowd25oSMa+MwcNIzYuurow9h6
 9buOakgQM/egy4l2IRUk3LSJc6zO6ScpIP1lqCsPmk5JrHcqVCXNci5SeUjlQH2HNrg1
 3zLNjw+w60xRzuyRwMsusPyPNH0fkBEueZN7y3vA08N/whK1GVZR5Oc+/9uCgOXCxEZU
 5hr/v3mjX4ZmWJawYzh1oWP/2SQqiEbeWLaxBvVbIWaphepqWRr/gKSNygFGX8su1+yG
 +IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6qV6T5pbqCUgwa7OV/meXsk6cATN/NVGxc79YaWs6bc=;
 b=Xt47T8Vq+YJGmiqPksQpz+ug60IZSN6pc+Y69SJKrI9bxSQB+HOuS23hYrIhk3LzBW
 2ZFU0FJDIN0gWdMRL86fCDtVWkFoQyqp5VtnvuRNSObKkheId1fOu7zXx0+OlMUBLdCt
 7qu2DGWWDvGmKJ0bMgWkZE64TK6oQ+qE21sSNJrdiZvI5B8CCr8zVkvRxSUcf/CdbFX9
 u8O+wwKCSTNVF201yFZak81Fyc29D9+hUFe+ftZDLviU+WJJ2yIArcTEjQegP1CucXyV
 bAeq6IUApSsg162P4+euunbmSlavMwDwQqHLQdvCKloJDsuEN5J7rx6JvasTjBeJDJ+Y
 okFQ==
X-Gm-Message-State: AFqh2kpGCxwJjf6lU/FHJFXOOo1WpuD9LbWqwhndo4yVTitm259JYWPn
 VnrRndUGYEDLj2YBhU9M+3J6CJY8EfXFvsKsUWU5/QUIbvk=
X-Google-Smtp-Source: AMrXdXu7btjTWe/Anjd8/cJnMvHKJanZTjrRrR6i78H8oU/h+f89FQjX/cR6BaXlL+r196XfZNrO6WrBbnKShcvuXU0=
X-Received: by 2002:a05:6214:5781:b0:535:1c64:4261 with SMTP id
 lv1-20020a056214578100b005351c644261mr2572429qvb.103.1675022635048; Sun, 29
 Jan 2023 12:03:55 -0800 (PST)
MIME-Version: 1.0
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
 <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
 <Y9QuBd7wf9hfbpT5@jeremy-acer>
In-Reply-To: <Y9QuBd7wf9hfbpT5@jeremy-acer>
Date: Mon, 30 Jan 2023 01:33:38 +0530
Message-ID: <CA+RDaRAxOKK9FmwOFrh=ZNkw1ZP7xZiyah=NjKjjxvs7HnK7tA@mail.gmail.com>
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
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
From: varun mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: varun mittal <vmittal05@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I made some progress on this.
It seems the `streams_xattr` VFS module is making the difference.

On Samba-4.9.5-Debian, which was not working earlier,
once I disable this module Robocopy changes the CreateDisposition flag
and it starts working. But I could not spot the difference in traces
https://tinyurl.com/robocopy-issue


On Sat, Jan 28, 2023 at 1:33 AM Jeremy Allison <jra@samba.org> wrote:

> On Sat, Jan 28, 2023 at 01:27:36AM +0530, varun mittal wrote:
> >   > Wireshark will be the key. Compare between Windows server and Samba.
> >   That is what I thought and have started looking. Any suggestions on
> which
> >   call in particular, there are so many :)
> >   BTW, with a Windows server, the flag is FILE_OPEN_IF
>
> Well that's at the point you know there's a difference,
> so work back from that point. Try bisecting the trace
> to see where it starts to diverge. No tools for that
> so you'll have to do it by hand (something I unfortunately
> have great experience with :-).
>
