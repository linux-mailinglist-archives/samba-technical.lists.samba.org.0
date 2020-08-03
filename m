Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2EF23A80A
	for <lists+samba-technical@lfdr.de>; Mon,  3 Aug 2020 16:07:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vH8bO8FRtQMsS4x2v3UcgwOQ+Uz8vOydK0oG9K3SvCc=; b=zkRQfdsdFZljESThpn+a0xZEOJ
	HcYEJFFQ4GX9uH+CjxFMOUF5cFUbLfc0FNKjTlRzBbeRnuKvbNFDNKIHsCP0frKjroL76ge0jKcqZ
	akMNg6o0i9N9Cd0Fjsgo0vf/B9piq/9/BMjwBFcDMUYviw51vV48i56NbxD2RbjBY8BAuCIe9pkK/
	3ZyCE7GZ3YX0b4Rp8huMgh+qw/tCn6ZP+J7Ta5a2YEqXIZ0WMve4F028ocS25ar194T6Lu5ZMMdtp
	m3RfjT/RjdZ3/Y4yP1NWJkJh+8uDjr8nNtHOb3QVCm5fX9rnL77wStPodKvjBBuEKu+Z2ZIaLZlFQ
	Vgeaad5g==;
Received: from localhost ([::1]:59912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2b6F-00CLca-U3; Mon, 03 Aug 2020 14:05:59 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37803) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2b68-00CLcT-AB
 for samba-technical@lists.samba.org; Mon, 03 Aug 2020 14:05:56 +0000
Received: by mail-io1-xd29.google.com with SMTP id w12so24990269iom.4
 for <samba-technical@lists.samba.org>; Mon, 03 Aug 2020 07:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98Tu/I9SuLdcnsvrO0zMpQoFhaybzFFU5ewiHdqgV1U=;
 b=f2ugI38ZYznnDPynJE/aVqR5wYj8OVFmRLbGMovoSDTxHkhmE8ixGW712zSt4uVAlK
 HVpvRc4sE7ix1X8CCg8wliqdiCg9mc9WyNpBJXgTP4Y3SX4hGWI1syM/KArZk+0TLnTX
 22aFGXULmp2Zp4JGdL79d87XHT64r3lRFguiMVgJSB13qtzD7BQ8VqyE7g0vlCyRj2id
 k2U+eeMbfLlJpoJQN4t/eL524BNr4XtBPEAyk/Tj0RTZxobVXPbqSlUxYoZHZuZCLvG4
 YYFAzjVBzUnUTv6aUat6WkFZSGdCcJgS4f4HMjIwcIT99b0/3m40dHb/k8hXljPbRXrM
 TVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98Tu/I9SuLdcnsvrO0zMpQoFhaybzFFU5ewiHdqgV1U=;
 b=TUIFhgLmYILNSOi3xetZJ4XD2fOKJIwxWPDFO1gCEwB4lp1EN6u08oAIguIBVaRrcy
 B1t1H5Wh3gEQuYRq+rNtQwHG44zbwHrQ5qK4eBGm4yxSPrAktNuqSlBh2aVcPRHW421y
 Fx/5ELaTs0GJXf4Yovmg1Mv5/QOaTTs5wFeoN9if0FVMj6VxNk27GFb6N8/MGyd9nJ7d
 s6N+L9csdDSgrVGQeCl4RhI0/9XhIE+BjbLermDkgXlrMAZxQWGuHEWXDd79mtVChbr8
 CDabmhUDo2zmkW5FqVjZd/TD47u8uL7hQeQxh0hEBXIHZB4evlyJdfhuof3wNTrMM704
 BCGw==
X-Gm-Message-State: AOAM533E93aw5Es+ypd42GbXecBFnXCcV2O9GePC8Z8moHNbkv8izMKp
 HJMfwx0l8RnLzvHOSswdtpAx+zuWHCWD/m0lKEI=
X-Google-Smtp-Source: ABdhPJzxZ6Jhd2m33Yi8ZcComtyivAjcjiVcpwUpYvEXPQynpH69tQgmdCp9/4sE3ce2KGpPHGXNiIuGVBtCI3myi6U=
X-Received: by 2002:a02:a915:: with SMTP id n21mr11454903jam.78.1596463550145; 
 Mon, 03 Aug 2020 07:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <1119714633.44793917.1596421202774.JavaMail.zimbra@redhat.com>
 <506179292.44794805.1596422888744.JavaMail.zimbra@redhat.com>
 <CAH2r5muWV2P75oHToSR4_LaVWETXC1Y0LbpEWfD-rF00jfFMFg@mail.gmail.com>
 <342612495.44824091.1596444372983.JavaMail.zimbra@redhat.com>
In-Reply-To: <342612495.44824091.1596444372983.JavaMail.zimbra@redhat.com>
Date: Mon, 3 Aug 2020 09:05:38 -0500
Message-ID: <CAH2r5msOKOHrtwP7-VsTGSuf8p9RJ37mbukaAbWKmzkxp5EJ2Q@mail.gmail.com>
Subject: Re: fallocate can't change the cifs disk space usage
To: Xiaoli Feng <xifeng@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Which local filesystem type on the server?

On Mon, Aug 3, 2020, 03:46 Xiaoli Feng <xifeng@redhat.com> wrote:

> Hell Steve,
>
>
> ----- Original Message -----
> > From: "Steve French" <smfrench@gmail.com>
> > To: "Xiaoli Feng" <xifeng@redhat.com>
> > Cc: "CIFS" <linux-cifs@vger.kernel.org>, "samba-technical" <
> samba-technical@lists.samba.org>
> > Sent: Monday, August 3, 2020 12:42:32 PM
> > Subject: Re: fallocate can't change the cifs disk space usage
> >
> > Any luck trying the same thing to Windows and/or Azure to see if this
> > is possible Samba bug - sounds like possible Samba server bug but need
> > more information.
>
> Thanks for quick response. When trying the same thing to windows. This
> issue is gone.
> fallocate can update the space usage.
>
> >
> > Are you using one of the Samba plug in VFS modules on the server (like
> > vfs_btrfs)?
>
> I'm not using any samba plug in vfs.
>
> >
> > What does the filesystem show (before and after) on the server side
> > (local file system not just the remote view that Samba is returning
> > for statfs) when you try the df -h?
>
> on the server side, the space usage reported by df also keep the same
> before and
> after fallocate.
>
> >
> > On Sun, Aug 2, 2020 at 9:55 PM Xiaoli Feng <xifeng@redhat.com> wrote:
> > >
> > > Hello all,
> > >
> > > Recently when I'm investigating the xfstests generic/213 generic/228
> > > failures for cifs.
> > > Found that fallocate can't change the cifs disk space usage. Comparin=
g
> xfs
> > > fileystem,
> > > fallocate can update space usage.
> > >
> > > My tests is in 5.8.0-rc7+. I also file a bug for this issue.
> > >   https://bugzilla.kernel.org/show_bug.cgi?id=3D208775
> > >
> > > # cat /etc/samba/smb.conf
> > > [cifs]
> > > path=3D/mnt/cifs
> > > writeable=3Dyes
> > > # mount //localhost/cifs cifs -o
> > > user=3Droot,password=3Dredhat,cache=3Dnone,actimeo=3D0
> > > # df -h cifs
> > > Filesystem        Size  Used Avail Use% Mounted on
> > > //localhost/cifs   36G   23G   13G  66% /root/cifs
> > > #  fallocate -o 0 -l 2g /root/cifs/file1
> > > # df -h cifs
> > > Filesystem        Size  Used Avail Use% Mounted on
> > > //localhost/cifs   36G   23G   13G  66% /root/cifs
> > > ]# ls -l cifs
> > > total 1
> > > -rwxr-xr-x. 1 root root 2147483648 Aug  2 21:57 file1
> > >
> > > Thanks.
> > >
> > > --
> > > Best regards!
> > > XiaoLi Feng =E5=86=AF=E5=B0=8F=E4=B8=BD
> > >
> >
> >
> > --
> > Thanks,
> >
> > Steve
> >
> >
>
>
