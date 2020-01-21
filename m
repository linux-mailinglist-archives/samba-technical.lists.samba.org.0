Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4EE1437DB
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 08:49:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PgjBhPbvshFDfbTkhZA28Te0UEivEgnibuK+F+CDeMw=; b=PzGJzORcGQ539dffu/yJS8iMDn
	CWuGH8CY4oWtXh8gJimLBd8iCHbc2XhbifNkMTNjGW0OSG79uerDzbVBJQMoRtsOtA6+0VdsACvdt
	Edff2DwkOss4ptUDBzN+Fvw8Kx5v5klmswp/1lUsBDV9eSPqfvBlOhDhUW5L7x76c/j/h47etQaT8
	dOcfOV4rd3xKXmjKYXwIpJbRYECPeGa9rFl3a4+Bv1FbkgKO9eDPGjR6dOhW7K7mDWUpGHh1BMVC0
	7yBigQylaMQLAFcTcF30VOgAzcJawlB/yD7K2TWuQ0lZWUnp0KNRASiBDJtIIUGRuHuLRdCot1k7E
	L93f8XmA==;
Received: from localhost ([::1]:45128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itoGc-003yxb-Iq; Tue, 21 Jan 2020 07:48:06 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:35505) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itoGR-003yxU-No
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 07:48:02 +0000
Received: by mail-il1-x142.google.com with SMTP id g12so1636816ild.2
 for <samba-technical@lists.samba.org>; Mon, 20 Jan 2020 23:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PgjBhPbvshFDfbTkhZA28Te0UEivEgnibuK+F+CDeMw=;
 b=nqc+rxO6ibTOcZJ566VYbsDxMcnlALzKdSMga43H9i0fCDdV3POAscmCBadFbbfKcR
 BFfIqQ7TO+4bZril9E6hqr32maedxZE95eYHZnGUB/fLXYzwjbYA9qth94MBbHLlftb9
 gHe0f47lfmVXPrsYv7/BD6c3e5EV4xzzcuAlmXXhrTS1XG69RnJ5mdkEAfFAvTVqdbfq
 7HX4fR57V2jbx+mT6X7QFyHSKlYhnNBjs6clvOccnlquQ/38qu+3v7O8WgcsToGAmriB
 NZJqF+hIWO5NyEeVfQnjMdtCZbPbUa0VSdY7bhrW/okdm/B75124cjFWo9Y0ksx22ifl
 R1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PgjBhPbvshFDfbTkhZA28Te0UEivEgnibuK+F+CDeMw=;
 b=TRIYbLZuGob9tGveeJo2I+PFIyXfyo8KWByZ3Lz0CigHkRS/APmDZQPPmIUQX/u4jr
 HckY0dyB0B490fnH5+cI3ca4RncV6KAEBVNPA+DQHd/ncMQTAc670VsjU3GWUq1KttDV
 lt0Im7en82II2Bji8NY/nrIBckZtgDELfyjI9qsFP1yzZHYKOk0UlnHRtVEWnPqdo88e
 LGC/YHXp/9R6J6VGVqoJpq257B+qt57yIAts1Y991RnbcM5Dz5NrEM2QdxBOaGXASMvA
 xYAIHQzSd82svZ4BcytoQocjO38bHLIzzU6WCzX46Pjpu34CCX1qtDLzb2seIZxe9vLH
 hTkQ==
X-Gm-Message-State: APjAAAW7HoJrhw/Qft63cEpSb06Z/dvZ5iFdv5SSilF2RFgSf4G53Iou
 WyD/ieFxMs921s7HMHrR281IBCYW/fLT9SfhQn0=
X-Google-Smtp-Source: APXvYqwvCy26eK74WcnhrWGh3ZJau/X4Pbmh8O54PvYsw6GC0n0c4VxqXT0yqYF88bbM9pFnRRP31sV5HpO7nVVnKIw=
X-Received: by 2002:a92:9c8c:: with SMTP id x12mr2548323ill.275.1579592873495; 
 Mon, 20 Jan 2020 23:47:53 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvUmZca8TRVsyZvrB_Loeeo4Kd8T7rHw5s6iaN=yC+O_Q@mail.gmail.com>
In-Reply-To: <CAH2r5mvUmZca8TRVsyZvrB_Loeeo4Kd8T7rHw5s6iaN=yC+O_Q@mail.gmail.com>
Date: Tue, 21 Jan 2020 09:47:42 +0200
Message-ID: <CAOQ4uxipauh1UXHSFt=WsiaDexqecjm4eDkVfnQXN8eYofdg2A@mail.gmail.com>
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 samba-technical <samba-technical@lists.samba.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 21, 2020 at 5:55 AM Steve French <smfrench@gmail.com> wrote:
>
> Currently the inotify interface in the kernel can only be used for
> local file systems (unlike the previous change notify API used years
> ago, and the change notify interface in Windows and other OS which is
> primarily of interest for network file systems).
>
> I wanted to discuss the VFS changes needed to allow inotify requests
> to be passed into file systems so network and cluster file systems (as
> an example in the SMB3 case this simply means sending a
> SMB3_CHANGE_NOTIFY request to the server, whether Samba or Cloud
> (Azure) or Mac or Windows or Network Appliance - all support the API
> on the server side, the problem is that the network or cluster fs
> client isn't told about the request to wait on the inotify event).
> Although user space tools can use file system specific ioctls to wait
> on events, it is obviously preferable to allow network and cluster
> file systems to wait on events using the calls which current Linux
> GUIs use.
>
> This would allow gnome file manager GUI for example to be
> automatically updated when a file is added to an open directory window
> from another remote client.
>
> It would also fix the embarrassing problem noted in the inotify man page:
>
> "Inotify  reports  only events that a user-space program triggers
> through the filesystem
>        API.  As a result, it does not catch remote events that occur
> on  network  filesystems."
>
> but that is precisely the types of notifications that are most useful
> ... users often are aware of updates to local directories from the
> same system, but ... automatic notifications that allow GUIs to be
> updated on changes from **other** clients is of more value (and this
> is exactly what the equivalent API allows on other OS).
>
> The changes to the Linux VFS are small.
>
>

Miklos has already posted an RFC patch:
https://lore.kernel.org/linux-fsdevel/20190507085707.GD30899@veci.piliscsaba.redhat.com/

Did you try it?

You also did not answer Miklos' question:
does the smb protocol support whole filesystem (or subtree) notifications?
(or just per-directory notifications)?

Thanks,
Amir.

