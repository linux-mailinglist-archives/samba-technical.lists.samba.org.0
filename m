Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E06939D44C
	for <lists+samba-technical@lfdr.de>; Mon,  7 Jun 2021 07:23:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xuslhfQuGvnBxz9S5yqyS0cumWR66kA/8dHKsMdbWQM=; b=GYCFmrT1IL8MFkdQRzEo7USHXM
	dLfixzmAxNhv32DfKo35BNKsq9mBIuYocqLAHFeKecmDzFRadZBFTnt8zQooiESR3aCJ9Xh6FvZ8O
	xWJKueFjOR3rq/Bfp5FTB6xbPrsz4nmebFXmXzi2hp+a3KabGH2ROIMQRQVrV9SaU1XFovjx4Wi7F
	TCf7oO3Pgq8BlY3C1sDeMOWjU5F7ST8lSLQNTcZcFr/TGNUyHtGiDvokxGe9W8WSM8zV7S3Vl6Y1R
	D2JBxMnL4U5fHO3rEdoEllgetbskQ+fDNpYCKB2g21Wq1A/5s85sllZTh2P3FpBJxGoLS7ZOc+W9L
	YT8uwd1A==;
Received: from ip6-localhost ([::1]:60542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lq7iy-0047VB-G8; Mon, 07 Jun 2021 05:22:56 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44575) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lq7it-0047V2-2M
 for samba-technical@lists.samba.org; Mon, 07 Jun 2021 05:22:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id c10so24534175eja.11
 for <samba-technical@lists.samba.org>; Sun, 06 Jun 2021 22:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7FW1ylAWcgsFNbGT9e7BzUq59rWS/CEsqtD0fVUZhL4=;
 b=QK4U7GVjn0l+vjLOucjlq++530iDVD7grhx0GAuk6Z8t+VQHCO7i2tge1xCA1emMNR
 enikln0aIT1fConppYbZHA50eSiwclD712LhEVd1iGfOx3sAz8HvxMKnpfDl1RJHCg9X
 hum92viJH6ePFaGG9JB5ZU+sM1KM1e1a1+2FCgKVSL8d8v0iJQcD37tqLJL2Hz1QO+CK
 Ohi2IGqyDW7nUzaM7qJ4ccQJ+R45rpwwUuRcbP6CNdwpz67swZ2Twjodzlc3kxiXCP87
 1mlJ75W8wyW/807iJXToroufR8GNZMwoBX5Z3FKsBSuBcwyO4i1gx5PAdRZFkXNyukoI
 AP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7FW1ylAWcgsFNbGT9e7BzUq59rWS/CEsqtD0fVUZhL4=;
 b=Lbsv/DGJfuKbMkKUlJHWOwHnivs+AwJelwlXtBu5ZzbjiWm49bN7drGu0H0gNmo3Td
 oR6wKSPY5XWMcrA4jTV8tH2R7pr6aILTTpmUmEJVwjS+7pLPRLm97RaK9Ek3PDYnwyAO
 gOWs0W3Fg3EBW8hWZJdC+h4WKLa9HVPof+6xVfw7V9KpKDlPjnLrewJg6aDLq2Dg8Vls
 sf0RhavQp1MQoGLDq3Rln4l62asoh2TvmBjqrBUdi2t9UlUGYTeostVt5oKvjzBJ9tlL
 YigMoOq9sPbJSV9pkYbonlzT5Qleb4o4ELvKM49+I8LA6tI7SY91f7ln0OxPrzcvi9o7
 ltFw==
X-Gm-Message-State: AOAM530U9C4DUJdxvQAUcZ4eFWp2fw0tNth5dkpTW8cMxrIcQsnzYEzU
 ZeZOe8f5/IaJ0LwODW8IP1KFjCe/h107mPzh1k9BmQ==
X-Google-Smtp-Source: ABdhPJyZqqOYBeA2yNdrtWaSYI+8VH6AE590O+HGC9km9We3oN7R3hoBEVBKASQywEzoFIQ1DbKd0J54g7xBkLUxerE=
X-Received: by 2002:a17:906:6d97:: with SMTP id
 h23mr16010996ejt.467.1623043368146; 
 Sun, 06 Jun 2021 22:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAM5jxn-zkzoAh-sL=e-hqhd+Yi-GivqwdR9JYFiaXK+gMBnNHw@mail.gmail.com>
In-Reply-To: <CAM5jxn-zkzoAh-sL=e-hqhd+Yi-GivqwdR9JYFiaXK+gMBnNHw@mail.gmail.com>
Date: Mon, 7 Jun 2021 01:22:37 -0400
Message-ID: <CAB5c7xoaYgQYj1W4D+tj0j0KX+7cuN_0KgWK-Xte2Mk5B_zncw@mail.gmail.com>
Subject: Re: JSON input / output for CLI utilities
To: Raghavendra Talur <rtalur@redhat.com>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jun 7, 2021 at 1:09 AM Raghavendra Talur via samba-technical <
samba-technical@lists.samba.org> wrote:

> > I know we've added JSON output to a few of the CLI utils. Over the past
> > year or so I've added this to various utils in FreeNAS (using
> libjansson).
> > Is there an overall strategy for this? I'd be happy to upstream what I
> have.
>
> Hi Andrew,
>
> I am looking at adding json format to the smbstatus output. I don't
> have anything working yet and will try to reuse the json util
> functions that you have in your working branch.
>
> Do you also have anything in the works for smbstatus?
>
> Thanks,
> Raghavendra Talur
>
> Yeah, I've already written JSON ouput for smbstatus. Actually have an open
MR for adding it that I've let linger for way too long. Can maybe clean
up / update next week.
