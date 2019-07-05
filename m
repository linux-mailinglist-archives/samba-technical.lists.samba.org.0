Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0563B6012B
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 08:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3A5FTPXHImqnG2HCRa3FjlBhRZS/kJqz5EKpIQ+NzBM=; b=JTixAUJR2XaMTJLiXLxCmboUEU
	tzL84sQ6y4rm8MiKY0CaUxdrcJef5mI3Xh+P1+7Ej9yeuIVgvPfD7ebTXXeNJmJudIWtecKpbpMOP
	ZUchKybDk4oSlEWLb9JfCn+TzwFclsflfL/cyu1SAZcls5J5KFc6vEdzy/xVFCZBlNONPIPaymG7j
	+dqPj075kxWy4sU1hSsGVOH/CM/yXEAQaUPZZSNLnpo1SFa8s0IUewcafljaacPRNiOy56aNx98p4
	hvPD3EXPsYKWjyMyWkLPwmIwxPIIZmBCYiC+ydvEVdYXjOExwu+3Jfzg0ge4aFFYUAKnKL0gSXUPa
	ouDV2gJg==;
Received: from localhost ([::1]:26346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjI3C-005IFA-3S; Fri, 05 Jul 2019 06:50:30 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjI32-005IEy-8G
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 06:50:24 +0000
Received: by mail-oi1-x244.google.com with SMTP id g7so6437087oia.8
 for <samba-technical@lists.samba.org>; Thu, 04 Jul 2019 23:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3A5FTPXHImqnG2HCRa3FjlBhRZS/kJqz5EKpIQ+NzBM=;
 b=IFU14fL0QrgT8VRCn/DmfWNu7CbNTJbXyJLHT3pJbCLm1V9pbzig1w0g/v09pVixrK
 lUvzT5sk8mzqr+UUadyDOOCv3/sn3rtX64+BKxDJm2qN53GsLc4CY4VCFq9RklelKCsu
 HrZAKpU/9oCZB41scq+muBUw6CziBYpo0X6To8/tgGObofNcK3x+1EJ5JnW4jTwkLwCO
 D4PXihWvDo9XpOb8VZtoB7x7XeHeWVGCFYWPbsU+4SbghzS1h5oDuKFgnUchpkGAO2zH
 5mUGPo4Ss6H9j2vKx8DEyNnWfHQNmI5b9VjRK8wV4CFiQZ2loDaXZpnYGV5/tA3Oa+/A
 pleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3A5FTPXHImqnG2HCRa3FjlBhRZS/kJqz5EKpIQ+NzBM=;
 b=VnsjIREJ1h2lNPiY76kM0ZsUArGC9Xd1RhOG+5fHhG8VXegTmA+kopF8ukKM50Df0b
 IVUvyxfSUVJ7RofmgJDn+DWtGc0wFcsv2+yb9D+hBddup5YJVnlM3ZvJ9tai7tntpx8p
 8Pbeo3UnC/u9NSiPkCnucx0TuWtAyndysc/r+j77lHTqDwCwEiNeRLUTHHlTj7a9R1iI
 vkrj9DMDacVq2j6kZpyT28GJjQFjKwNMcb5qJ3TTSwEWz7fxhMETgCuV0PrgpQL8Wxs/
 nqRoMovJZKcmpHUQQb/CK9yrMLuJYG3j3Cr+7dQxbdiLoWiU3sC85KIe+zsodhL9G0Jl
 faGQ==
X-Gm-Message-State: APjAAAVt7vyX2DOhztumCSJmcmHDVFR4iN64pBwQpKvqG6FIUaBCBte/
 0VBkAeuwCsquDCDBqVDGDpBG1HjUxY2YQN9Zf+JMyg==
X-Google-Smtp-Source: APXvYqwfPhYHpG3qUhogzkWU9pqh4cpJIwwNubYebD2EhXb6ppxTfJVc4GAtoF6Px0KNPAiA9Z3lbo7qGYgvB4tunBo=
X-Received: by 2002:a05:6808:298:: with SMTP id
 z24mr1175516oic.177.1562309418568; 
 Thu, 04 Jul 2019 23:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190704175355.24272-1-rafaeldtinoco@ubuntu.com>
 <20190705164447.4e684fcd@martins.ozlabs.org>
In-Reply-To: <20190705164447.4e684fcd@martins.ozlabs.org>
Date: Fri, 5 Jul 2019 16:50:07 +1000
Message-ID: <CAJ+X7mSa791Oy_6DdpDRCQP30CWwc2OHCXkL+F3HH6BgRzBWVQ@mail.gmail.com>
Subject: Re: [PATCH] ctdb-config: depend on /etc/default/nodes file
To: Martin Schwenke <martin@meltin.net>
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
Cc: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jul 5, 2019 at 4:46 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Thu,  4 Jul 2019 17:53:55 +0000, Rafael David Tinoco via
> samba-technical <samba-technical@lists.samba.org> wrote:
>
> > CTDB should start as a disabled unit (systemd) in most of the
> > distributions and, when trying to enable it for the first time, user
> > should get an unconfigured, or similar, error.
> >
> > Depending on /etc/ctdb/nodes file will give a clear direction to final
> > user on what is needed in order to get cluster up and running. It should
> > work like previous ENABLED=NO variables in SySV like initialization
> > scripts.
> >
> > BUG: https://bugzilla.samba.org/show_bug.cgi?id=14026
> >
> > Signed-off-by: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
> > ---
> >  ctdb/config/ctdb.service | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/ctdb/config/ctdb.service b/ctdb/config/ctdb.service
> > index 675b3147417..fd81c38e26d 100644
> > --- a/ctdb/config/ctdb.service
> > +++ b/ctdb/config/ctdb.service
> > @@ -2,6 +2,7 @@
> >  Description=CTDB
> >  Documentation=man:ctdbd(1) man:ctdb(7)
> >  After=network-online.target time-sync.target
> > +ConditionFileNotEmpty=/etc/ctdb/nodes
> >
> >  [Service]
> >  Type=forking
>
> Referencing bug 14017 in commit message instead of duplicate:
>
> Signed-off-by: Martin Schwenke <martin@meltin.net>
>
> peace & happiness,
> martin
>
Pushed with a commit message change (/etc/default/nodes to /etc/ctdb/nodes).

Amitay.

