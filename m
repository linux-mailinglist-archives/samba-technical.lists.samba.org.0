Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF29332A73
	for <lists+samba-technical@lfdr.de>; Tue,  9 Mar 2021 16:30:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DvA/3LMjXNjJ73L9Id0NwmZgWerOITpTPS2rD5U/l1M=; b=BxKsxoklWHHrcEtREBsELjPhrT
	hR0e/V6Eidm1M1F+1xOH/gFyAT1yyKGz+Af6A5qyzxfaIAuBfmJiWVNgYWXnNrIQx0v7cmcySkmyf
	zQzgQYF32pHEF1Sx18AsiMCiFn5T1LBx5q/sOGa6Kt+U+8SEmRY0i6zR0sCIGRbVdtJFTM238rgM7
	mrnMOqgS9Lsh10BaB+HKLJ9H6OEfwZ8+x1MTSTYrR1dsBOPs4im6i1SNJZkK5/sOgSyI9jlP24S1C
	KTYJtHLI4hkwDKoyDjUbjQmCGO0tDoXwq8pl4CNkzchgSrNB4DHNZ0CSikZh9PVD4jF7pt1FLBCI7
	0wSJ3ADg==;
Received: from ip6-localhost ([::1]:52116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJeIg-004f5q-HG; Tue, 09 Mar 2021 15:29:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52594) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJeIa-004f5j-EQ
 for samba-technical@lists.samba.org; Tue, 09 Mar 2021 15:29:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id n22so2391944wmc.2
 for <samba-technical@lists.samba.org>; Tue, 09 Mar 2021 07:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yiu1ejemdsBsT6LTbh3bVj467m9MmAActLvOg9IrqdY=;
 b=rg9Lb59eycBdOJJCfU5r1l91D5MikI99WZU+G+2qvZHWTZmWr3IGT54oo059Ri+cV9
 2M40ORbUVLN/xOdS/LpZ4XcwCcnOqOYme9yuYtfo7Yg1Ezkm2P5OfcA3tX1cT/Q7qvez
 FYwJ0Cj9kE6xGjKkBB2RiUpBiHUe6Gq5RbU/pmTl5F86PKkKCSDzDXKORXUT3lnnhGVx
 R38ggBXvP8E0yG0o5yjVib5X1XLP83jPlPkwlDHKwzBekZ9Wfr44d/T3HOiOUFkkA4FY
 AXHshnsFVY3ljxQA34RbrqLlAdeZU6wAqvvfs2bA6m1YyVLJmAOg9rG525qWnuH2ArQX
 6imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yiu1ejemdsBsT6LTbh3bVj467m9MmAActLvOg9IrqdY=;
 b=PICNuuZJGxac7ztx0atxN0paBITayylNoKBXz4pMUehAJ9VNQr8YkL6BxAuFjRd6BF
 w1oMczhGeQPiJDiMabWVymUHKnU7jDpwkWH0cDO4wYD1G7DRBYMTzUQZJNdHIO2fRefm
 8KROg6Yo+mUipCApQMbNaPongbwwuUW8dhOymM1LFqBL2zgctKBXWybSZWawjQN/A+wz
 4a0kf8RFzKFJLcrweRZ/CMpNSay8WWjfDth5HQo1TWrlaH2yGyu2sTS8GA2x6gLtGo8M
 9VexFqhGyWUTE1gODXc8Un01i96A82b1fPTSdkaEm4Wh2DWEBcGiSFJghKbIvjvb6cu0
 CAbg==
X-Gm-Message-State: AOAM530dgtVXVAc/YpKTSCN6u1s11XmiHwOr5ghp6T09HJhJbVnpCeub
 2T43MPmeggERAE51G3ht5RDRRYFlSGVO6ILXcjFw3LiXJj8=
X-Google-Smtp-Source: ABdhPJyEeUSACdA9vzob+EpB2itLRGMIEwyW8W7sqgpP4l160bym5fMRI/57nRYeAW7uU9VXg+1lZPOvmKYlSOD2tk0=
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr4646003wmg.53.1615303767347; 
 Tue, 09 Mar 2021 07:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20210305094107.13743-1-vincent.whitchurch@axis.com>
 <CANT5p=rB2=DvjtpmVy803emWpuzsy-C2+d4wqQ5g_9fJ8+a5Cw@mail.gmail.com>
 <CAN05THQtb5RY2ye7nkyWBjrXS+=usZCxUM7jBQG+JEpg_TQQTA@mail.gmail.com>
 <20210309134118.GA31041@axis.com>
In-Reply-To: <20210309134118.GA31041@axis.com>
Date: Tue, 9 Mar 2021 09:29:14 -0600
Message-ID: <CAH2r5mvuQivNXWiG_PmREp0w5qOWGS5WR_4UDQ0nfdz5KxRfzg@mail.gmail.com>
Subject: Re: [PATCH] CIFS: Prevent error log on spurious oplock break
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 kernel <kernel@axis.com>, Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I lean toward reducing or skipping the logging of the 'normsl' (or at least
possible) race between close and oplock break.

I see this eg spamming the log running xfstest 524

Can you repro it as well running that?

On Tue, Mar 9, 2021, 07:42 Vincent Whitchurch via samba-technical <
samba-technical@lists.samba.org> wrote:

> On Tue, Mar 09, 2021 at 01:05:11AM +0100, ronnie sahlberg wrote:
> > On Sun, Mar 7, 2021 at 8:52 PM Shyam Prasad N via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> > > The reason for rejecting the request maybe a number of things like:
> > > corrupted request, stale request (for some old session), or for a
> > > wrong handle.
> > > I don't think we should treat any of these cases as a success.
> >
> > I agree with Shyam here.
> > We shouldn't change the return value to pretend success just to
> > suppress a warning.
>
> Thank you all for your comments.  I see that everyone agrees that the
> error print is useful for SMB2, so I will drop this patch.
>
> > However, if it is common to trigger with false positives we might want
> > to something to prevent it from
> > spamming the logs.
> > These messages could be useful if we encounter bugs in our leasing
> > code, or bugs in server
> > lease code, so we should't throw them away completely. But if false
> > positives are common ...
> >
> > Some thoughts I and Stever brainstormed about could be to change the
> code in the
> > demiltiplex thread where we currently dump the packets that were
> "invalid"
> > to maybe:
> > *  log once as VFS and then log any future ones as FYI
> > * log once as VFS and then only make the others available via dynamic
> > trace points
> > * rate limit it so we only log it once every n minutes?  (this is
> overkill?)
>
> Thank you for the suggestions.  In my case, I've only received some
> reports of this error being emitted very rarely (couple of times a month
> in our stability tests).  Right now it looks like the problem may only
> be with a particular NAS, and we're looking into triggering oplock
> breaks more often and catching the problem with some more logging.
>
>
