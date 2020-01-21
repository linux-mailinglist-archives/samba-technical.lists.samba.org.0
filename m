Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC114383F
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 09:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lmYZA0xagCNpKIKxnr8C27kUmnLdAKn/OTbkn0CFX/U=; b=cXhcbaJuMP/swljHiKITXydBXh
	TfgO36ta/HW5Nmx43AgR1SJ0llFMjabEs+gHrzEEuXBMMbY9tzKwQbqJ1DGMnsu754t6FFvnYs/4q
	5ZMO3SA4FG+tS4pW4NO0ueqNnpsBFW8KVCKgy8/YmNcMJHrA8ku9ZrplR7zKwB2KZF9PxFZjRuUKr
	AEZGfTiVJ4oi9A4tbDV2cAzl/tBRUHCpquuA2VGKx7krDwZp/TVpF7aMYiA6eyw8pnJBYFBUnRVAk
	fy7ihhppQP2qIeOFt02l470cLT0P/CZoJ1fiJXNKGiUTSXTjVtUTGexlQiNgewUT3K6hQbiZsk2RG
	DtiCUcCQ==;
Received: from localhost ([::1]:46816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itowG-003zET-Od; Tue, 21 Jan 2020 08:31:08 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:36121) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itow8-003zEM-8Q
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 08:31:07 +0000
Received: by mail-il1-x141.google.com with SMTP id b15so1723518iln.3
 for <samba-technical@lists.samba.org>; Tue, 21 Jan 2020 00:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmYZA0xagCNpKIKxnr8C27kUmnLdAKn/OTbkn0CFX/U=;
 b=Et9c6PWnnBiw+t3+vwjYJioRYKMX5K/LHeHA+QdUm6jwsMmxkx5DkoZpFvltAgckcK
 5tLBpdreal7Sgh25xCh4o1j4J5GM32RFtbwWcZ+/Vk4nD4ozs3HpRajulGQhjbj1Vgmq
 vCtDwDQr7H4Wg8eIZKxcE/7atF/Mh9IpjUZkRPU+kV4W5e4drzQzLUOubaRCtSqBEIZY
 637vyUCzdNePQHmTEFzOxj0qEYISZ+mCYf5K+Mb/gkVozpS04GPETGm/1f/Py8UaOOFl
 hqdj02wkV3PbKUPhttnNuTVWWc1Hk1L04gY1doushBJV0Q4s9MWTw9c16fJ7ICvvR+hU
 gprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmYZA0xagCNpKIKxnr8C27kUmnLdAKn/OTbkn0CFX/U=;
 b=i9GfnYg8lZf6lFTxt/z1uU38d2P4jVSYTME4SZm1DAZe3H+n+cMYt1vVOGYXpklND4
 LOzAUf4unXRGd7G/yMU03CD1J9yCC4d8VQKZK/3pz5R/KVw7AqTFDxZrYs1Xgyzyosa2
 08DygjcAZG9uZEJu6L13jVH1S/5q1KVQJhTlt3e4BZWgUS2g9uKWJFj5bMDY288TA9YQ
 sBBUaMkjHe8lRRkpPY/JBBmQDu6jam+h+s1br0EFuhOF6ymt+6DBdXQde2jXMZWXgGDP
 e/tFXfEHPDs764xDYh/WhzxxCJcI77He03WjZGeO5vzNyRViaa9UnKJQJxd4fI82tVmy
 NafA==
X-Gm-Message-State: APjAAAVKSK0yMSGZv+00szWcSVzBTQUE4BgWk8/YfmWulZZymaOVM5Vt
 Hmyu0TSVL/n/JT121PcmmmqdPonc/oz3IVxl7Hc=
X-Google-Smtp-Source: APXvYqwCqtWTPNjVv9vureQtYBXjkX/ot+vJ9y7f9T+ySw23uFSRbyKmenNIgO2Y5AOhIhUVoiktBF4yUgnseUzNU4E=
X-Received: by 2002:a92:5b49:: with SMTP id p70mr454103ilb.209.1579595457634; 
 Tue, 21 Jan 2020 00:30:57 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvUmZca8TRVsyZvrB_Loeeo4Kd8T7rHw5s6iaN=yC+O_Q@mail.gmail.com>
 <CAOQ4uxipauh1UXHSFt=WsiaDexqecjm4eDkVfnQXN8eYofdg2A@mail.gmail.com>
In-Reply-To: <CAOQ4uxipauh1UXHSFt=WsiaDexqecjm4eDkVfnQXN8eYofdg2A@mail.gmail.com>
Date: Tue, 21 Jan 2020 18:30:46 +1000
Message-ID: <CAN05THQeUs1ksOv5sRTx7Dvr0=WKxSguw+gWpw2KpX3byEJagw@mail.gmail.com>
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

On Tue, Jan 21, 2020 at 5:48 PM Amir Goldstein <amir73il@gmail.com> wrote:
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

SMB can do both. There is a flag that specifies if you want to just
get notified about the directory itself
or whether  you want notifications from the whole subtree.

>
> Thanks,
> Amir.

