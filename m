Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 819EA1437E0
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 08:49:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZADz/FNfyrk8GhdpCwj0XUkKM1g47IFDaAtucTO16qc=; b=nql9tu6z+42TYqlgmfE6xgD+a5
	VDzANYy8W2odAUet8I4wo+kGpwxO7Q0GuDg+IYbfWaAkIJU+gcfZSTr4Qxct8hFb9JPUJV0PXJW/w
	841PtnHN2hy6xyAh/cpo8HkQQR6Im1aZW33wNgYtl32gg/D03fOO2/mueBUIKDjmN8NGpWGE3ef4e
	7c+YuKNl7c6sJBscNeGZPBEr8OyWH5Rssorv3K9N1s59QUBV3K4tELS/vGExi5QOmvPEu0Q9kD+Qk
	BMvUviAoEyAt7cBX8s8Gp0hzndRT7Yg7azP1zwkniU0eWYsPipGgSJsMlFI6+JGOSWCBOIZBMXrs9
	B+7091Ew==;
Received: from localhost ([::1]:45888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itoHy-003z3i-Js; Tue, 21 Jan 2020 07:49:30 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:39118) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itoHq-003z3E-E8
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 07:49:27 +0000
Received: by mail-il1-x142.google.com with SMTP id x5so1620591ila.6
 for <samba-technical@lists.samba.org>; Mon, 20 Jan 2020 23:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZADz/FNfyrk8GhdpCwj0XUkKM1g47IFDaAtucTO16qc=;
 b=jNz9Ohc565qRzVXzSYzlKqNVNNEULA0EkVEYSEyawvPa0vDsLlZfWkDXzizX8wcb5D
 oSAu0czMTxQG/8MECY8NjpkTUxA08oJM85rckS9SaxQxlj4AoxlHLUt7OTUmDselV/RV
 C2e80KMbsAHEGULaI+Bz3M5CmLgRk1ECCKwOvC+lcWsbhRTh4XgrRqIdp5AKdTEHgnpH
 x0lNSPczqLOeOZwj9wyzGS0yXt7zX+LYVmdncO5miJz6urpSgztp1zz43hPJpLAPoT7t
 OINVyyd98RhIuAAsXVbm4b2LqDcSOJKbS3iVWZp2Let/bZ0peflKujWRhYEXgi0VvLWT
 WKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZADz/FNfyrk8GhdpCwj0XUkKM1g47IFDaAtucTO16qc=;
 b=eP9Dx/RId0Cwht4c87/BnOy60TvD7Umq13/zai1kLwlEa0ylo/IO0tovkCMOxRHez5
 h9IxERpb791SqSUkw1KXgWuhO2oIO++k2REuyjfEdKxog5ppGVXlw7d7/0bN/m/n8Ti6
 sEcnpw/M08Zv8gRxpvkWfZ8o5eHcQzxXSkgcoaDvT+pOuQsbELwY4SuhRvuLVvSFZcdB
 T2Ldemec0mnlVJCqRmXZD7qXUS9yzSkuudawA7bH4BEktiyvxRSB1aRVBl0B1w2l21uL
 T4pnlStawqBDrJ1KMcPAtiFaxRw1HMvQU84Ct0JjGIgaY5EFGLCvkEl19zhB8qbU33ek
 xvKA==
X-Gm-Message-State: APjAAAX7VEVCfd9snT+9o45RLnuQf2OsGhTxH7wXVq8CFPATvaWfZlRb
 NQqegcSysW4TS2nIh0QpJwATsuQQhrcWV3a6Vvs=
X-Google-Smtp-Source: APXvYqyscUHi4/FZylWVcSxo7TKDBIOKpQNTLHgUP8nf1eAm36zAv5zDgQqMEvdHljx48bvDMaFT1Sg5ajsaBgYhLgM=
X-Received: by 2002:a92:9f1a:: with SMTP id u26mr2696893ili.72.1579592960046; 
 Mon, 20 Jan 2020 23:49:20 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvUmZca8TRVsyZvrB_Loeeo4Kd8T7rHw5s6iaN=yC+O_Q@mail.gmail.com>
 <CAOQ4uxipauh1UXHSFt=WsiaDexqecjm4eDkVfnQXN8eYofdg2A@mail.gmail.com>
In-Reply-To: <CAOQ4uxipauh1UXHSFt=WsiaDexqecjm4eDkVfnQXN8eYofdg2A@mail.gmail.com>
Date: Tue, 21 Jan 2020 09:49:09 +0200
Message-ID: <CAOQ4uxjFof3GWX3gncJgbaynsmQ2+4A3hGuSOhGDQsGguJu-Vw@mail.gmail.com>
Subject: Re: [LFS/MM TOPIC] Enabling file and directory change notification
 for network and cluster file systems
To: Steve French <smfrench@gmail.com>
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
 lsf-pc <lsf-pc@lists.linuxfoundation.org>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical <samba-technical@lists.samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

CC: lsf-pc

On Tue, Jan 21, 2020 at 9:47 AM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Tue, Jan 21, 2020 at 5:55 AM Steve French <smfrench@gmail.com> wrote:
> >
> > Currently the inotify interface in the kernel can only be used for
> > local file systems (unlike the previous change notify API used years
> > ago, and the change notify interface in Windows and other OS which is
> > primarily of interest for network file systems).
> >
> > I wanted to discuss the VFS changes needed to allow inotify requests
> > to be passed into file systems so network and cluster file systems (as
> > an example in the SMB3 case this simply means sending a
> > SMB3_CHANGE_NOTIFY request to the server, whether Samba or Cloud
> > (Azure) or Mac or Windows or Network Appliance - all support the API
> > on the server side, the problem is that the network or cluster fs
> > client isn't told about the request to wait on the inotify event).
> > Although user space tools can use file system specific ioctls to wait
> > on events, it is obviously preferable to allow network and cluster
> > file systems to wait on events using the calls which current Linux
> > GUIs use.
> >
> > This would allow gnome file manager GUI for example to be
> > automatically updated when a file is added to an open directory window
> > from another remote client.
> >
> > It would also fix the embarrassing problem noted in the inotify man page:
> >
> > "Inotify  reports  only events that a user-space program triggers
> > through the filesystem
> >        API.  As a result, it does not catch remote events that occur
> > on  network  filesystems."
> >
> > but that is precisely the types of notifications that are most useful
> > ... users often are aware of updates to local directories from the
> > same system, but ... automatic notifications that allow GUIs to be
> > updated on changes from **other** clients is of more value (and this
> > is exactly what the equivalent API allows on other OS).
> >
> > The changes to the Linux VFS are small.
> >
> >
>
> Miklos has already posted an RFC patch:
> https://lore.kernel.org/linux-fsdevel/20190507085707.GD30899@veci.piliscsaba.redhat.com/
>
> Did you try it?
>
> You also did not answer Miklos' question:
> does the smb protocol support whole filesystem (or subtree) notifications?
> (or just per-directory notifications)?
>
> Thanks,
> Amir.

