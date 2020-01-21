Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B014A143A3C
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 11:03:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lRLVY0ayDDdLTY8PY27WBbkZWTqTTISM+W1lZC8rwFw=; b=lyO7ByI4twx82HVmc6G+ZTUe3t
	HtFq6IqiSHUtN0qOdEgvz6nRc5UtsdRJsuLNv2xUYDVXjGi35Q/xyl7PCZh6jX38hVOBgk73fkzQ8
	jzt9Q+c9KBhW6ls1k00Km1U0E7swYdke2Tk8R2b5x4bX/1vJv1IheYcVw3FA61xA8YpLRJN6opPDz
	psTzM9PMn5kYDvschERwDtlrItyWf5pbw05ZZYfzpuAJI27Meu5vGlWQFZPy4d39i3CQFoChwa5E3
	kV/pE0iKmVPzGCZtWx82ZRkql7d3A1jv5jZwyfsuW1dVZ1Rrw/cYz45DaRQvUKqkvzyBIg0Eo0pvE
	4LEMqzEQ==;
Received: from localhost ([::1]:57170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itqNR-0040jM-Kv; Tue, 21 Jan 2020 10:03:17 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43111) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itqNI-0040jF-WC
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 10:03:15 +0000
Received: by mail-io1-xd44.google.com with SMTP id n21so2197415ioo.10
 for <samba-technical@lists.samba.org>; Tue, 21 Jan 2020 02:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lRLVY0ayDDdLTY8PY27WBbkZWTqTTISM+W1lZC8rwFw=;
 b=DVh8CqzIeJJCqf5lPCo5fml9z41h0s45Lfl19jzzHrciveokpsxw7VW7fTTioI29IB
 TJviJ2WeJFbjyw/16aezwF10+mby0r/igGmygy98Ayh/qHA6/y8UjimBFTMzYrEeBIes
 eofkvD99ixwuArs+n6WicBKTYUh1n7hZsA6Ptrvj+DEdP/feNKBqMVfp7kE5Wsyus/VG
 NtJW4Ety1aQ2WMMfX7L/VS9KJINaXUy6SKYcaLj2gWrUN3W9b9eeteQZ4syX7rFN73bN
 3UPOaVn4B68rlZaUcnI3ZTSaWE696jPhWItmAlFWH7gsY792e2Ne4qvYCq06DtsdQUif
 IT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRLVY0ayDDdLTY8PY27WBbkZWTqTTISM+W1lZC8rwFw=;
 b=CHDzEDbpZx9aM2jNDqnd3OoG/Nbv6leEI50HtC/r7Jjd/WS6phUOj5XdZp0gq2X6ZJ
 8N6wwQhTeKgTqeqVODDNYh55sg/vwV0j3DDO+xT2eKrh3WCOVbrloaWSWiHAXVN4v4YA
 RX3xfSbOvWMqb2SmxTWA/AeQbB5PxdyBdcPVGRAXixN7SoS5i4dYqRs1I1I8Bq5XKgUF
 sUNuKRxwTGY3JmXgOjnco+gkX/FHf8MXjutNMzW073EDb7rV8qXsn+HLoiH2Ei7DnWhy
 V9njCmBFvSRE2uJMzljD5QyA41YCnud17iH02dDZkB3JtXr9CncPgOHAKdeKD+j+2+tB
 J28Q==
X-Gm-Message-State: APjAAAUZwtYnM5U3bGcsjIHL8hUWCFnfxgtgF+jp7B+37ww753fVsoXf
 8uMhrLgoSY8BYQt6zTgFYBmHBwnAfhVRQ5JDUb0=
X-Google-Smtp-Source: APXvYqzdOeESSnZVuwRJTueioQY/+cJkRvgsK9YbBYEH2ehmz0OoLGmo5Er8u4bnQhrPYdvAfN0uy9vXJg71sUzjV8U=
X-Received: by 2002:a6b:e506:: with SMTP id y6mr2340288ioc.209.1579600987362; 
 Tue, 21 Jan 2020 02:03:07 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvUmZca8TRVsyZvrB_Loeeo4Kd8T7rHw5s6iaN=yC+O_Q@mail.gmail.com>
 <CAOQ4uxipauh1UXHSFt=WsiaDexqecjm4eDkVfnQXN8eYofdg2A@mail.gmail.com>
 <CAN05THQeUs1ksOv5sRTx7Dvr0=WKxSguw+gWpw2KpX3byEJagw@mail.gmail.com>
 <CAOQ4uxgNEoO-NHb9V=Nqho5dBz2U034Q6wa_Gw=sKmYj2uUJMQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxgNEoO-NHb9V=Nqho5dBz2U034Q6wa_Gw=sKmYj2uUJMQ@mail.gmail.com>
Date: Tue, 21 Jan 2020 20:02:56 +1000
Message-ID: <CAN05THSwSMji9CHM=x6oKzRmD2XO9TUShBO-ExT07vom8fRdoA@mail.gmail.com>
Subject: Re: [LFS/MM TOPIC] Enabling file and directory change notification
 for network and cluster file systems
To: Amir Goldstein <amir73il@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 21, 2020 at 7:43 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Tue, Jan 21, 2020 at 10:30 AM ronnie sahlberg
> <ronniesahlberg@gmail.com> wrote:
> >
> > On Tue, Jan 21, 2020 at 5:48 PM Amir Goldstein <amir73il@gmail.com> wrote:
> > >
> > > On Tue, Jan 21, 2020 at 5:55 AM Steve French <smfrench@gmail.com> wrote:
> > > >
> > > > Currently the inotify interface in the kernel can only be used for
> > > > local file systems (unlike the previous change notify API used years
> > > > ago, and the change notify interface in Windows and other OS which is
> > > > primarily of interest for network file systems).
> > > >
> > > > I wanted to discuss the VFS changes needed to allow inotify requests
> > > > to be passed into file systems so network and cluster file systems (as
> > > > an example in the SMB3 case this simply means sending a
> > > > SMB3_CHANGE_NOTIFY request to the server, whether Samba or Cloud
> > > > (Azure) or Mac or Windows or Network Appliance - all support the API
> > > > on the server side, the problem is that the network or cluster fs
> > > > client isn't told about the request to wait on the inotify event).
> > > > Although user space tools can use file system specific ioctls to wait
> > > > on events, it is obviously preferable to allow network and cluster
> > > > file systems to wait on events using the calls which current Linux
> > > > GUIs use.
> > > >
> > > > This would allow gnome file manager GUI for example to be
> > > > automatically updated when a file is added to an open directory window
> > > > from another remote client.
> > > >
> > > > It would also fix the embarrassing problem noted in the inotify man page:
> > > >
> > > > "Inotify  reports  only events that a user-space program triggers
> > > > through the filesystem
> > > >        API.  As a result, it does not catch remote events that occur
> > > > on  network  filesystems."
> > > >
> > > > but that is precisely the types of notifications that are most useful
> > > > ... users often are aware of updates to local directories from the
> > > > same system, but ... automatic notifications that allow GUIs to be
> > > > updated on changes from **other** clients is of more value (and this
> > > > is exactly what the equivalent API allows on other OS).
> > > >
> > > > The changes to the Linux VFS are small.
> > > >
> > > >
> > >
> > > Miklos has already posted an RFC patch:
> > > https://lore.kernel.org/linux-fsdevel/20190507085707.GD30899@veci.piliscsaba.redhat.com/
> > >
> > > Did you try it?
> > >
> > > You also did not answer Miklos' question:
> > > does the smb protocol support whole filesystem (or subtree) notifications?
> > > (or just per-directory notifications)?
> >
> > SMB can do both. There is a flag that specifies if you want to just
> > get notified about the directory itself
> > or whether  you want notifications from the whole subtree.
> >
>
> I see. There is no user API in Linux to request a "subtree" watch.
> For the private case that the user requests a FAN_MARK_FILESYSTEM,
> cifs may translate that into a SMB2_WATCH_TREE for the share root dir.
>
> For that, Miklos' RFC of vfs interface inode->i_op->notify_update(inode)
> should be enriched with sb->s_op->notify_update(sb).

It all depends on what actual linux applications want/need.

On windows, things like the windows explorer file manager only uses
"this directory only" watches.
I imagine that linux gui filemanagers would do the same and be fine
with this directory only watches.

On windows you also have a large class of applications that does file
caching in the userspace application itself. Like IIS or other
applications
such as indexing services or things that keep track of changes to know
what to backup at a later stage.
They always use "watch the whole subtree" version of notifications.
I don't think there are any linux native applications that would
depend on this as the functionality was never present. Maybe an
exception would be windows applications running under wine, but surely
no currently existing linux native applications.

If we do get an API that would allow to watch an entire subtree then
that would make it possible for future backup applications to become
much more effective for incremental backups.  Things like "git status"
would likely also benefit greatly from such an api if it became
available.

>
> Thanks,
> Amir.

