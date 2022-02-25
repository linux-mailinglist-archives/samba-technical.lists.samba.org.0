Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAD44C4D5E
	for <lists+samba-technical@lfdr.de>; Fri, 25 Feb 2022 19:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vhKRV34EksK3RMxv+JlKPfQs99dj2uLaTeiqYiBu8Co=; b=wkplzMfoCibEczx6jvC7pASvU7
	tzNVruivn4YROL4vbRs8tGMQx6Xs9DEQCwYXMUm72JB7DzeTYGg7fD7QWQdaBGisOEKFKoZsXsSsT
	++MUr24RYdu3H+sGIHuc97Wth+VRvJJIeNo38S4OTL5bVLeacSNRMPKERWxQGw5yBZ3DKbrC2JBUQ
	DC5iHX9ynojiBCIhjzQK0WoWBGL6dijlYr3tY+UZKY2WkWDcDXGFhjHCWcsTIy4QMbwbXva48fHv/
	rbZFKsCZP//Qul03hP6MRNtVE480s5btS0BZMcUlA7W42FAxo8rwMPoRFuvYj5jpZA8MgkQjAJ41f
	J+/uoDlw==;
Received: from ip6-localhost ([::1]:36420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nNf3x-00BsQp-23; Fri, 25 Feb 2022 18:11:29 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:35795) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nNf3s-00BsQg-16
 for samba-technical@lists.samba.org; Fri, 25 Feb 2022 18:11:26 +0000
Received: by mail-lf1-x131.google.com with SMTP id u20so10792757lff.2
 for <samba-technical@lists.samba.org>; Fri, 25 Feb 2022 10:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uj+AlrNZn8I9NWGKp43dvNrhpBRkf6IcRGcRQZ2B1XI=;
 b=WtybJYrjK0DfB3lX4nR0ryBa12Oc2YLrH2smyx8vyNZUu4/pk1bdDrm7Fqxe7pCsCO
 Q99ND06+KRvXXF6LMYn1mJlHNKNYxhPz9hs5ppHMwPTpFYeIDv8c2Neey3kh5h6gv3LR
 nn3K/DkylH2VCaoYdJ19Gczg1o14bAudCvy8gTbta6kuSI43mAi4UWbptYvZjYU24rEB
 ORHBfHWJ7SAuX30b0q71K3U5za4d8K8V+qd8Iv4SxFDvlJhK0q0CWU/Z7y820iM9XBH6
 KqbIpSIjT4i3vqMaSDbPTqDqx0jrxTVvjG7wsKK/GoyzTX+y2OPc8d3Qy1qm51DUNCkf
 7yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uj+AlrNZn8I9NWGKp43dvNrhpBRkf6IcRGcRQZ2B1XI=;
 b=ruU7GfpSUP/wyXiEqEFPMkoYWszza/oNJj5Itxqibvz7CnG1QMvvcOc8TrSjhp3MsE
 NjOlX5m3kY6GQeOaqdyvwhLOMlnMQ7pbjYFXmYh2mRSu5uut/773xQw92SUe/D9pjNNR
 2NlID/l9SWVhsMnff082fU2PZF2tqW1DtkxblG+BbnriN5O4YoK3uNeFFlm8uZXlKtW2
 7ofXfTeOm5SeyanYGOJhA0NGPYhtlRbQqp+bSQiToVg1RKRS7k9FkfbxXWqLjoT6OkQL
 FUN1ugpKwBLUL/8Uo0Hz41CTTYbkM3kaxErSMqeXCSYQcFRQYuL+faqP7ljLsZ2JOJD/
 iiqw==
X-Gm-Message-State: AOAM530i0IxUplHaqQlrlEPQ7XyJr+ukn+dyKhcB7beBXgfrkA8uJPIC
 jr+AaxmErqwlR/0xmgEXVBbMly2J3K9qcQQ1Ex0=
X-Google-Smtp-Source: ABdhPJwa48rX/EiR3uJLsF1T+bIm8aArx8P7ZY3WPgx0ry4NWw8NSUgWPsTkdf0398KVQvlfymXTpGP15AqPRlJWO5A=
X-Received: by 2002:ac2:4156:0:b0:443:1591:c2be with SMTP id
 c22-20020ac24156000000b004431591c2bemr5880563lfi.234.1645812682253; Fri, 25
 Feb 2022 10:11:22 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mt9OfU+8PoKsmv_7aszhbw-dOuDCL6BOxb_2yRwc4HHCw@mail.gmail.com>
 <Yhf+FemcQQToB5x+@redhat.com>
 <CAH2r5mt6Sh7qorfCHWnZzc6LUDd-s_NzGB=sa-UDM2-ivzpmAQ@mail.gmail.com>
 <YhjYSMIE2NBZ/dGr@redhat.com> <YhjeX0HvXbED65IM@casper.infradead.org>
 <CAH2r5mt9EtTEJCKsHkvRctfhMv7LnT6XT_JEvAb7ji6-oYnTPg@mail.gmail.com>
 <YhkFZE8wUWhycwX2@redhat.com>
In-Reply-To: <YhkFZE8wUWhycwX2@redhat.com>
Date: Fri, 25 Feb 2022 13:11:10 -0500
Message-ID: <CAH2r5msPz1JZK4OWX_=+2HTzKTZE07ACxbEv3xM-1T0HTnVWMw@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Enabling change notification for network and
 cluster fs
To: Vivek Goyal <vgoyal@redhat.com>
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
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ioannis Angelakopoulos <jaggel@bu.edu>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc@lists.linux-foundation.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> IOW, in general disable all local events and let filesystems decide which
local events to generate? And locally cached write is one such example?

The fs doesn't see cached writes so probably best to still use the common
existing code for notification on local writes

On Fri, Feb 25, 2022, 11:35 Vivek Goyal <vgoyal@redhat.com> wrote:

> On Fri, Feb 25, 2022 at 09:27:55AM -0600, Steve French wrote:
> > On Fri, Feb 25, 2022 at 7:49 AM Matthew Wilcox <willy@infradead.org>
> wrote:
> > >
> > > On Fri, Feb 25, 2022 at 08:23:20AM -0500, Vivek Goyal wrote:
> > > > What about local events. I am assuming you want to supress local
> events
> > > > and only deliver remote events. Because having both local and remote
> > > > events delivered at the same time will be just confusing at best.
> > >
> > > This paragraph confuses me.  If I'm writing, for example, a file
> manager
> > > and I want it to update its display automatically when another task
> alters
> > > the contents of a directory, I don't care whether the modification was
> > > done locally or remotely.
> > >
> > > If I understand the SMB protocol correctly, it allows the client to
> take
> > > out a lease on a directory and not send its modifications back to the
> > > server until the client chooses to (or the server breaks the lease).
> > > So you wouldn't get any remote notifications because the client hasn't
> > > told the server.
> >
> > Directory leases would be broken by file create so the more important
> > question is what happens when client 1 has a change notification on
> writes
> > to files in a directory then client 2 opens a file in the same directory
> and is
> > granted a file lease and starts writing to the file (which means the
> > writes could get cached).   This is probably a minor point because when
> > writes get flushed from client 2, client 1 (and any others with
> notifications
> > requested) will get notified of the event (changes to files in a
> directory
> > that they are watching).
> >
> > Local applications watching a file on a network or cluster mount in Linux
> > (just as is the case with Windows, Macs etc.) should be able to be
> notified of
> > local (cached) writes to a remote file or remote writes to the file from
> another
> > client.  I don't think the change is large, and there was an earlier
> version of
> > a patch circulated for this
>
> So local notifications are generated by filesystem code as needed?
>
> IOW, in general disable all local events and let filesystems decide which
> local events to generate? And locally cached write is one such example?
>
> Thanks
> Vivek
>
>
