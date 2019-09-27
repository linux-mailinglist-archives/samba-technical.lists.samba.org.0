Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C83C054B
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 14:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4lYLQ+0+MTpC+hgwdhYAMOCDKkvsaIaQOM6ho1HUlJI=; b=XqNRQKvM/O8QhBoQ1M/xyLuws/
	Q5PAcQC7jKWm5Z1XdqJm6GcgtxIGOn9IJwDsd5tFXVSDcgaR36NvA42VlgS1oigQLpw99B73M4Tj5
	IALedzVCVX1Lo9bzzylMem5nw7/ekTCd9oirysG3Tyj46waVbcPqBZclsjxVtuAYGbW5wKkhNWtWT
	llByWxfbFNfvxkIMoUJKPqxHAvXuHbXq3tmVJhuF3pIEQFYQfAvUEWJU0M79wrKC2QVklwbD+1C2O
	NF92PwL0XDmi/5KxtyLp37FPgvPFkc7rn4Jd6+gHlQmfkXYQu5OSSNqkmrASU8Rft03w+dwR+rB3Q
	zb7ttfnA==;
Received: from localhost ([::1]:48512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDpVR-0097rH-EL; Fri, 27 Sep 2019 12:37:53 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42104) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDpVL-0097qu-GP
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 12:37:50 +0000
Received: by mail-io1-xd31.google.com with SMTP id n197so15812698iod.9
 for <samba-technical@lists.samba.org>; Fri, 27 Sep 2019 05:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GtXiAkoXxDl4ot+fLaB+vHXku0lb6QwseZBofRwoCMs=;
 b=OoMRyjAmBs/7qfun5ljdluUAF9ABCQv+HfevQ6gEu3soN1PzoQkq0QoltqpZTGYpIp
 2947KVBKJXou9vEBZAx5gCL2FRPjXOjHodq5y97KH/a/RyFdap//R/HNZ2HJ9j0keaPJ
 RLlFnHIgZ6ThDUQTI9BWaQCw31yIqDj1USFGZ6u9/fQ2PRTG06RRv84j1DSHDA44IKxm
 d2X4MPx/H6MBcZTHMu7Iz7uMra//tyz3GsfggM41ULC4gcmnsBTU+ljcrN7CjeXHcVDX
 VM95cGJHdGQHNxgTDHDk9Ir6TwGEhaegADzmeIBRSJtx8hzuQ2wgnj3GRjLVWLHnEl3d
 z6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GtXiAkoXxDl4ot+fLaB+vHXku0lb6QwseZBofRwoCMs=;
 b=ifJb+ehBLmXQMqYFaY/SKDZDPiYX2yB+PxwgyVCMMEoJ+rtHZOUaor13zMTIQPlnNz
 R4BG+stvJ6PvyoIzLihBHZQL9sgGfpnUm6NrgjN6bXbq0ZbwxZd1l0vI9ff88y7nnBhZ
 /9Oc1Zvk1QXW0+wiu0L48PDbOIqOTBWnpEbZVVncmbgZQXucFzRBX2DpU3RgZWstwk/h
 l3LbOU0xlsDl3zQNi28YeC3JNHOu+60Hv+MJR9vHRHayeevl3jWmsWrq9vrpCC7xjhna
 4+xMRhkSMs5JxBzSJdmN9lYv604YR7HmhBRNWmPnKAwxLWY27xiyJDnmMBwjV2lsEwNa
 6XRg==
X-Gm-Message-State: APjAAAXzah/A9VKZWg1y7bzSwMxZfxL100RAF3pqxbKT+BoksOl/ypPP
 WoxzyhKAH3KuBZ/PfENRY4FRVbUDHNkzdBTbyFw=
X-Google-Smtp-Source: APXvYqzRh8gNHJwdLhxihra440Y2sFDmwzyR6UhqJK0WigqUvnkrRXeN79O8lu73TsQVpgeY2GPi9OqdadT52xRsia8=
X-Received: by 2002:a02:a999:: with SMTP id q25mr8296945jam.27.1569587864112; 
 Fri, 27 Sep 2019 05:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
 <461a8f64-1f29-5b30-6b2d-4f4f88812323@samba.org>
 <CAH2r5mvC6qMyxmhB_fdXxnXCztefowpWcgqxUgK1m_GSFZOS-g@mail.gmail.com>
 <9a5da317-166d-d5a6-6026-88d1cdd92ac2@samba.org>
In-Reply-To: <9a5da317-166d-d5a6-6026-88d1cdd92ac2@samba.org>
Date: Fri, 27 Sep 2019 05:37:32 -0700
Message-ID: <CAH2r5msjZXWSYrWDCNwi1+X2tGV0Nj4vMXPfFtcsi=hNpkcPtQ@mail.gmail.com>
Subject: Re: Getting the SID of the user out of the PAC ...
To: "Stefan (metze) Metzmacher" <metze@samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Then there is what Mac does ... If you know the sid of each user who has
authenticated on that client to that server we can estimate mode better
without upcall to winbind in many cases

On Thu, Sep 26, 2019, 23:58 Stefan Metzmacher <metze@samba.org> wrote:

> Am 27.09.19 um 08:50 schrieb Steve French:
> > On Fri, Sep 27, 2019 at 1:44 AM Stefan Metzmacher <metze@samba.org>
> wrote:
> >>
> >> Am 27.09.19 um 08:39 schrieb Steve French via samba-technical:
> >>> Is there a way to get the SID of the user out of the MS-PAC through
> >>> Samba utils (or winbind)?
> >>>
> >>> This would help cifs if when we upcall as we do today to get the
> >>> kerberos ticket, we were also given the user's SID not just the ticket
> >>> to use to send to the server during session setup.
> >>
> >> Only if you get a service ticket for the joined client machine.
> >>
> >> But I don't understand what a possible use case would be.
> >
> > When not mounting with "idsfromsid" this would allow us to use the
> > correct owner SID when creating ACLs (to include the owner and mode)
> > on mkdir and filecreate (the acl can be sent in the sd_context during
> > create)
>
> Maybe CREATOR_GROUP and CREATOR_OWNER are of some use for that...
>
> metze
>
>
>
