Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8062B23AC7D
	for <lists+samba-technical@lfdr.de>; Mon,  3 Aug 2020 20:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=seXX3JFlODwhYuziTgkf5LhwE3gVUmZ6n9r7aMdwrlo=; b=AvuRAg/Uj1Gpvuk+HnY8XFs86S
	4UonK/0WTVUKwTfBttJ+GbpcUvIksihewTNmwfuLlxT9Hc3UzTneDF90arLzbs+Pb64zt7N44N3Kt
	MutnH9kRgtiNI80RZw/gRQ8rdTpuVbfWGKT9e8K0JyjocnCu1bt4vswfMEykiSw7MjrzFFcqwwsyp
	qyXW1uqD+xfrTcJ3dZDPofJ4rXpLGw72/St20XMrbpA7SoGOoBqgEh4WoGdwcaeTb00Uh7n/QEyiA
	nZF24v6pQMfi8DGM0shWdegfCrlEXTGJYqJEdIg4V8bXulFGAWCEOwNfgtRQUWzpgVywZ894Vvtfz
	zkTObc4g==;
Received: from localhost ([::1]:22230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2fKQ-00CNCR-R0; Mon, 03 Aug 2020 18:36:54 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:33058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2fKL-00CNCK-6p
 for samba-technical@lists.samba.org; Mon, 03 Aug 2020 18:36:51 +0000
Received: by mail-il1-x144.google.com with SMTP id p16so21194551ile.0
 for <samba-technical@lists.samba.org>; Mon, 03 Aug 2020 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=seXX3JFlODwhYuziTgkf5LhwE3gVUmZ6n9r7aMdwrlo=;
 b=p68gfOi4R9tp4ai9lxwzec5KkdbFkxqknakmatvZnkUJGJkFfBtqW1619TaUl32Fku
 5daK6G7a9GEQCzF+6pEy9RwtqRvtiQMAeVdxTjehVijyENAbFNhzdViSBYoj0chkJegP
 ejJISGHCHYr1gg402lIixHZoSfOIzV096S8CR+ihGqRcSBEMkLzpLCEJkOA+hDYSk7IN
 F6dRoCCi3KTUlF4/9yGevSIH60xTYMdMH95NdjS6DQwleFZlBiCN85V6CreGIj2E7mLF
 xh1XWuWuMnpqUXj8aWO6MPYX4kUEMjV/FJvragjFgmcfjzt7GNS38FUUtw/xDEYJ5O1L
 tWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=seXX3JFlODwhYuziTgkf5LhwE3gVUmZ6n9r7aMdwrlo=;
 b=uSaJMhLtObEhMSkpnIq4y+1nmGxwmxPKIh1jKKP+eN4oTt6HONf52llPfUaLvAOJym
 yD2wxPZgGdfSetaAIrB45AQ10rLESdXvX3Ew6YWB4B5gnicXyzf2HOMSeTW8jxwIGMs3
 aZYNajdtU2QC6g+msK9EjTGeJQgaLlNLuR8Wglga5lAlePRIJmZtVn/9cMtZbgronYU/
 R+Ix3n4b148qlm7Q042x53y1CJSyj0fn28BUtcWSVSe0frmW13KhVIA/3y6PPHNoH8Y4
 8VIsjhcSFDn86dE9c6n0YZ88nwJkkEf2s3nms5lWPdD9axaFWHddnmFJHyVSCzoVdygu
 Y0Yw==
X-Gm-Message-State: AOAM530gpirgLWKuJeDDBbNuGqLwSPuILhGw/d05YIgEg7KQO+kg3RDh
 PjqyC2c2lFV0lJR/zk5PCXYb9QyzNkFtqxNzyeY=
X-Google-Smtp-Source: ABdhPJzZ4boSCWKvK/iguS768TLKovcRM2CwOfOKn1oayM/vGOYfm1LW6BofTJyJWI/MEttZzHIGZNEPivGQLlaC+b0=
X-Received: by 2002:a92:890d:: with SMTP id n13mr745429ild.5.1596479807346;
 Mon, 03 Aug 2020 11:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <1119714633.44793917.1596421202774.JavaMail.zimbra@redhat.com>
 <506179292.44794805.1596422888744.JavaMail.zimbra@redhat.com>
 <CAH2r5muKciTKUjMa6o62J28Tvq=qaQryOGvfC8NRWkV29yiDaQ@mail.gmail.com>
In-Reply-To: <CAH2r5muKciTKUjMa6o62J28Tvq=qaQryOGvfC8NRWkV29yiDaQ@mail.gmail.com>
Date: Mon, 3 Aug 2020 13:36:36 -0500
Message-ID: <CAH2r5muYQB-OaX8Njhr60LVy58LRcp2bSHMK1abA4Mqg4uFdQw@mail.gmail.com>
Subject: Re: fallocate can't change the cifs disk space usage
To: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

One of the things that Samba server appears to be doing wrong is that
Samba is creating the file as a sparse file and returning that it is
not a sparse file - this obviously creates a problem because an
fallocate on a non-sparse file can be a no op ... but the server
didn't tell us it was a sparse file ...

On Mon, Aug 3, 2020 at 10:59 AM Steve French <smfrench@gmail.com> wrote:
>
> So locally on xfs this works, but Samba when receiving the request
> remotely apparently isn't doing the fallocate.  Would be curious if
> this works with vfs_btrfs and btrfs filesystem on the share - or a
> Samba server bug.
>
> On Sun, Aug 2, 2020 at 9:55 PM Xiaoli Feng <xifeng@redhat.com> wrote:
> >
> > Hello all,
> >
> > Recently when I'm investigating the xfstests generic/213 generic/228 fa=
ilures for cifs.
> > Found that fallocate can't change the cifs disk space usage. Comparing =
xfs fileystem,
> > fallocate can update space usage.
> >
> > My tests is in 5.8.0-rc7+. I also file a bug for this issue.
> >   https://bugzilla.kernel.org/show_bug.cgi?id=3D208775
> >
> > # cat /etc/samba/smb.conf
> > [cifs]
> > path=3D/mnt/cifs
> > writeable=3Dyes
> > # mount //localhost/cifs cifs -o user=3Droot,password=3Dredhat,cache=3D=
none,actimeo=3D0
> > # df -h cifs
> > Filesystem        Size  Used Avail Use% Mounted on
> > //localhost/cifs   36G   23G   13G  66% /root/cifs
> > #  fallocate -o 0 -l 2g /root/cifs/file1
> > # df -h cifs
> > Filesystem        Size  Used Avail Use% Mounted on
> > //localhost/cifs   36G   23G   13G  66% /root/cifs
> > ]# ls -l cifs
> > total 1
> > -rwxr-xr-x. 1 root root 2147483648 Aug  2 21:57 file1
> >
> > Thanks.
> >
> > --
> > Best regards!
> > XiaoLi Feng =E5=86=AF=E5=B0=8F=E4=B8=BD
> >
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

