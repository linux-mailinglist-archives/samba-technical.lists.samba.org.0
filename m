Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FE44C48DF
	for <lists+samba-technical@lfdr.de>; Fri, 25 Feb 2022 16:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9EAGZgY5SPdT1cVkvJoh2QfrN+7asBE1KRK8S40gaDQ=; b=CytUgwH2vAGt57ZMnZEORKkx+7
	nAwXDL6CeQhhQdI00/v1QY7Liwjv05VZl34pSYrt84LgMppQady72ybUSTb50UK/onyx4NMJe54na
	sNz5ZYsCA3QxRHsI51+8WUtvxepkA+emaEOtZQ7rkCd90RKUOTIpl2uCuy5HLb7dRyKWHCFTaa5Hk
	ihXbRubFHzzzviEgf4KvCyXairBvdjAUKu99yFoxdlVuP7fc0CM33dFR6Ty0tqqSsmWwjMEgd9SKy
	rXpKvtBrlVpi5BkNz8mA8cCwWVpRbzMQoH4Y80FkleTOxIPeXQjJ1RpZDTbiOhE0+fv7U10FBqORb
	Gk0EDDDA==;
Received: from ip6-localhost ([::1]:57592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nNcVz-00Bhcm-B0; Fri, 25 Feb 2022 15:28:15 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:34444) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nNcVt-00Bhcd-JA
 for samba-technical@lists.samba.org; Fri, 25 Feb 2022 15:28:12 +0000
Received: by mail-lj1-x233.google.com with SMTP id r20so7923398ljj.1
 for <samba-technical@lists.samba.org>; Fri, 25 Feb 2022 07:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9EAGZgY5SPdT1cVkvJoh2QfrN+7asBE1KRK8S40gaDQ=;
 b=fRej6ns/ZWUEzUvxNGbQZNAT0BSw4zJppp4g8vJ12SjSS7/PKWYqWh+qGLnO51O8iL
 xYfz41lSy7g9p5dFSX/Vhn9G1iI4DI42ZpPD98CNT4CIVD+KHqAMGHjPeFAxtW7r4OWJ
 Bt24gJWuMtOlAENd3MxdHU1fclGI3Ej7waj6TqxJBGC+e5Plc8MWVww3O23yMZN5MEai
 +v5oPQeRV/Ecda+PFN2Fi3sqCicKjkSIcXNayKhRTQKBSKzcFg6VPMXnJJl+dWQ+yZ2I
 Us39X3Lp2huMeqYZOnP4q4WORoar2kNDCdTWI8b0htO7xg8iaNf+S0vFGZcd7nT8mqH5
 YvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9EAGZgY5SPdT1cVkvJoh2QfrN+7asBE1KRK8S40gaDQ=;
 b=yLC9KNNS6LZhD9/j2rraQVMhDEGBI9vpwVci68+F71Ikm/zQwabfZPqczly4ISIykm
 rPrbdre7LFCPQKBw/BpQoEKp8XUvy7EAZ1SpCRE0lrJoYUPl9VRZORGmNrxNvpcF9Auz
 8Rc4wvTicQLi/Ud6DBWEtjwIRYUe6tiN9Hq1Wuyl6WeuJfAbIKin/t+9qORecsoMq6Kl
 9Gc0+Fad6HPJChaH5MIlmkO88cQItEAFP/9sxrSs01FBrj4TeATDhPR3BgIovXyILrzE
 usg9QHCogfLWbRFC41e2TY58HRKV4WDYVFtiyMeWEegueSDI5yassj5ANHuwKAbNpPuF
 ZJSQ==
X-Gm-Message-State: AOAM532oLB0aX3eLgXLv+8y2eKuJHtWuuuy4bCqivekfr6m9thoeE3it
 xKIvGO8gT+v+FSUTiipm+xVQyb5p8HRyj1tNHjQ=
X-Google-Smtp-Source: ABdhPJwxd5AOIZzj1xHVv9ZDVXsnGHmJoUs7e6+bgciCEyzgPU77fjeFtutgvognPrXU36YRHWEpujkFHRb8BSzbEgE=
X-Received: by 2002:a2e:b014:0:b0:23c:9593:f7 with SMTP id
 y20-20020a2eb014000000b0023c959300f7mr5517803ljk.209.1645802886225; 
 Fri, 25 Feb 2022 07:28:06 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mt9OfU+8PoKsmv_7aszhbw-dOuDCL6BOxb_2yRwc4HHCw@mail.gmail.com>
 <Yhf+FemcQQToB5x+@redhat.com>
 <CAH2r5mt6Sh7qorfCHWnZzc6LUDd-s_NzGB=sa-UDM2-ivzpmAQ@mail.gmail.com>
 <YhjYSMIE2NBZ/dGr@redhat.com> <YhjeX0HvXbED65IM@casper.infradead.org>
In-Reply-To: <YhjeX0HvXbED65IM@casper.infradead.org>
Date: Fri, 25 Feb 2022 09:27:55 -0600
Message-ID: <CAH2r5mt9EtTEJCKsHkvRctfhMv7LnT6XT_JEvAb7ji6-oYnTPg@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Enabling change notification for network and
 cluster fs
To: Matthew Wilcox <willy@infradead.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Ioannis Angelakopoulos <jaggel@bu.edu>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc@lists.linux-foundation.org, Vivek Goyal <vgoyal@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 25, 2022 at 7:49 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Fri, Feb 25, 2022 at 08:23:20AM -0500, Vivek Goyal wrote:
> > What about local events. I am assuming you want to supress local events
> > and only deliver remote events. Because having both local and remote
> > events delivered at the same time will be just confusing at best.
>
> This paragraph confuses me.  If I'm writing, for example, a file manager
> and I want it to update its display automatically when another task alters
> the contents of a directory, I don't care whether the modification was
> done locally or remotely.
>
> If I understand the SMB protocol correctly, it allows the client to take
> out a lease on a directory and not send its modifications back to the
> server until the client chooses to (or the server breaks the lease).
> So you wouldn't get any remote notifications because the client hasn't
> told the server.

Directory leases would be broken by file create so the more important
question is what happens when client 1 has a change notification on writes
to files in a directory then client 2 opens a file in the same directory and is
granted a file lease and starts writing to the file (which means the
writes could get cached).   This is probably a minor point because when
writes get flushed from client 2, client 1 (and any others with notifications
requested) will get notified of the event (changes to files in a directory
that they are watching).

Local applications watching a file on a network or cluster mount in Linux
(just as is the case with Windows, Macs etc.) should be able to be notified of
local (cached) writes to a remote file or remote writes to the file from another
client.  I don't think the change is large, and there was an earlier version of
a patch circulated for this

-- 
Thanks,

Steve

