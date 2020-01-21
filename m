Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 770DD1439B8
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 10:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rSC80w1hqN7I9WREwEfl+koEvmU+Z7Kf4VwNXG3N+/I=; b=IlXs9WhHl2XwpIBqDwPpRkzupF
	o++syGhIAo+C4n8eRZlhaUfjPgP0XUdwFhx1LA+D+T7YkNSrOYZJXXMep/GndB39fLDaDLqlomGqJ
	/BCUmPQ+ri4bT7xaMrL7Kyj7rGwWY/e4KBeHXfgd7fGSPlzd+uEpSmZDyqX8kntu8QsRiW5emYPW0
	lfmAkQRRnzeqxh/UPrQvGmXw5tpY01UbHH3r+Lw65IFBXDZFUpIndysw95EIKz1AlUmkfhXsCj0SV
	gnNr6m/7On+VO1EFeczMIfMCl37ddJvPCrzWgYRsMdrVk3UaSNxiYsetoPK558a4bOBepeBtkKjAv
	wNFNBXrQ==;
Received: from localhost ([::1]:49984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itq4A-003zku-SR; Tue, 21 Jan 2020 09:43:22 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45943) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itq46-003zkn-7z
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 09:43:20 +0000
Received: by mail-io1-xd44.google.com with SMTP id i11so2122599ioi.12
 for <samba-technical@lists.samba.org>; Tue, 21 Jan 2020 01:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rSC80w1hqN7I9WREwEfl+koEvmU+Z7Kf4VwNXG3N+/I=;
 b=iDhWr5DHulz2CjWIl8UqyGsfO41PP0v73orZ/uai7miM82+1XtTvcibof1v+wK9bBP
 hQVdNCdkXPXZsOsJj4pScBZoswTrzpnKzTTkhr3TewxaGxbfNspR5HDYGjRhtKfaNhrf
 K41KxmOKXz8LCI+qrHqkVId+gCHH7TXkKZIHWaYrr/WTykCarUHwXgcZNQUimBEHk/1C
 eE9/RiX8+2JY8NMkul1WXNwD670pE6n/O/pjOGSLpeaJc2VuX40VPdfmTePtioCynHdw
 xFGITUoqM4LagiBBPu79msqCSow4sSJTs9sjH7xyXrGT1Yg0EQyYFwpW33tIMd8pcx6B
 CvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rSC80w1hqN7I9WREwEfl+koEvmU+Z7Kf4VwNXG3N+/I=;
 b=sUA816+Rv9R4zkES2egGorZUdvvh4AyffBw2lQB+IB5JFX83e1luFw8lOm36AMFQEZ
 lyijQYyuNY+ar1738IBM/p+jTFnF3fdzDP55E6d77+bpvHWhFPe+cN6zpEzwtUoGHETz
 rcsF4JsLim/1FSk1Lp1h2Xagji3fVOS4kHsYqctyX6MBeOgcmYS6heiQVOxApOfCRQh3
 +L9R5Jn4pWzvt5g6kOkcIs7KC9sJxA02D3y3KY4UxOCmU3ymTqyHykebf0R0/CuyJA8N
 8MzVnMzgLzgZunxanKmK/Qz6LTtLpX+LZ9I35Fs4edOiurG7ymxz8p30k/zyLvj7q8FZ
 f+qA==
X-Gm-Message-State: APjAAAV9ig1CFC6Odu2GwEuL2H9DNOWIPuQBnyq+bv6/3N7YT4vFYG8C
 ywfCwNVir1bTjkFNqJX6JlzbsLxBGAS1jo+4aas=
X-Google-Smtp-Source: APXvYqyC3Q2o+FEXJZs0Ii3xtV0ucBq9A76dblPtJcymujCucsXIJDoVrpoFepmICsakC+pFR+N+rX0JwR8T6ovFrrQ=
X-Received: by 2002:a6b:f214:: with SMTP id q20mr2520410ioh.137.1579599796371; 
 Tue, 21 Jan 2020 01:43:16 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvUmZca8TRVsyZvrB_Loeeo4Kd8T7rHw5s6iaN=yC+O_Q@mail.gmail.com>
 <CAOQ4uxipauh1UXHSFt=WsiaDexqecjm4eDkVfnQXN8eYofdg2A@mail.gmail.com>
 <CAN05THQeUs1ksOv5sRTx7Dvr0=WKxSguw+gWpw2KpX3byEJagw@mail.gmail.com>
In-Reply-To: <CAN05THQeUs1ksOv5sRTx7Dvr0=WKxSguw+gWpw2KpX3byEJagw@mail.gmail.com>
Date: Tue, 21 Jan 2020 11:43:05 +0200
Message-ID: <CAOQ4uxgNEoO-NHb9V=Nqho5dBz2U034Q6wa_Gw=sKmYj2uUJMQ@mail.gmail.com>
Subject: Re: [LFS/MM TOPIC] Enabling file and directory change notification
 for network and cluster file systems
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 21, 2020 at 10:30 AM ronnie sahlberg
<ronniesahlberg@gmail.com> wrote:
>
> On Tue, Jan 21, 2020 at 5:48 PM Amir Goldstein <amir73il@gmail.com> wrote:
> >
> > On Tue, Jan 21, 2020 at 5:55 AM Steve French <smfrench@gmail.com> wrote:
> > >
> > > Currently the inotify interface in the kernel can only be used for
> > > local file systems (unlike the previous change notify API used years
> > > ago, and the change notify interface in Windows and other OS which is
> > > primarily of interest for network file systems).
> > >
> > > I wanted to discuss the VFS changes needed to allow inotify requests
> > > to be passed into file systems so network and cluster file systems (as
> > > an example in the SMB3 case this simply means sending a
> > > SMB3_CHANGE_NOTIFY request to the server, whether Samba or Cloud
> > > (Azure) or Mac or Windows or Network Appliance - all support the API
> > > on the server side, the problem is that the network or cluster fs
> > > client isn't told about the request to wait on the inotify event).
> > > Although user space tools can use file system specific ioctls to wait
> > > on events, it is obviously preferable to allow network and cluster
> > > file systems to wait on events using the calls which current Linux
> > > GUIs use.
> > >
> > > This would allow gnome file manager GUI for example to be
> > > automatically updated when a file is added to an open directory window
> > > from another remote client.
> > >
> > > It would also fix the embarrassing problem noted in the inotify man page:
> > >
> > > "Inotify  reports  only events that a user-space program triggers
> > > through the filesystem
> > >        API.  As a result, it does not catch remote events that occur
> > > on  network  filesystems."
> > >
> > > but that is precisely the types of notifications that are most useful
> > > ... users often are aware of updates to local directories from the
> > > same system, but ... automatic notifications that allow GUIs to be
> > > updated on changes from **other** clients is of more value (and this
> > > is exactly what the equivalent API allows on other OS).
> > >
> > > The changes to the Linux VFS are small.
> > >
> > >
> >
> > Miklos has already posted an RFC patch:
> > https://lore.kernel.org/linux-fsdevel/20190507085707.GD30899@veci.piliscsaba.redhat.com/
> >
> > Did you try it?
> >
> > You also did not answer Miklos' question:
> > does the smb protocol support whole filesystem (or subtree) notifications?
> > (or just per-directory notifications)?
>
> SMB can do both. There is a flag that specifies if you want to just
> get notified about the directory itself
> or whether  you want notifications from the whole subtree.
>

I see. There is no user API in Linux to request a "subtree" watch.
For the private case that the user requests a FAN_MARK_FILESYSTEM,
cifs may translate that into a SMB2_WATCH_TREE for the share root dir.

For that, Miklos' RFC of vfs interface inode->i_op->notify_update(inode)
should be enriched with sb->s_op->notify_update(sb).

Thanks,
Amir.

