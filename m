Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AAF239E6A
	for <lists+samba-technical@lfdr.de>; Mon,  3 Aug 2020 06:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=N38Pn4J9CycWsZX1TeoF5FHH9FlQEReI7jzAoV0JqIo=; b=UnJ9TZdTTOyB7piTa+5UWvXHBW
	sTP4L+hm9fNOh2s6WSDtO8KkrG1HEt2YZHmM0j9GbaCAFY+ZESurdb8JKTk5K7IcnU6/j1Sb4LAqZ
	c92ja3egak92RKrWeqGD9LQ1GpROhYCUfViaxuUiRArB2LAxTwmW5afVi80zu+f0Rh2NvbrYJi8Zg
	awvBW6DgkizZHPjbY/XBA40yQJezd7+W3/qOYMB3+z1oZa1aUts67qNkYIf/HtYU+Licw7OMibO4p
	boT/fgnoEAUYm7I5Y5hy4aiJlqQpzUHuuBoQmWSYbz1Kt+pHmLkcJ9mEF7djwUByhxE1uRLXYOkIe
	5Uca3L2Q==;
Received: from localhost ([::1]:46320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2SJH-00CIwE-Gc; Mon, 03 Aug 2020 04:42:51 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:41953) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2SJB-00CIw6-LH
 for samba-technical@lists.samba.org; Mon, 03 Aug 2020 04:42:48 +0000
Received: by mail-il1-x142.google.com with SMTP id c16so18238725ils.8
 for <samba-technical@lists.samba.org>; Sun, 02 Aug 2020 21:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N38Pn4J9CycWsZX1TeoF5FHH9FlQEReI7jzAoV0JqIo=;
 b=dIqPniJP917TGPKfZ1qlS6vs3HGb9Y2VUdDLLGDrvIDCEK79neHCkquOjOm74VC8uk
 WitV9jSF0wqQWY4hbf8zEBOWOF4GJPXK87xiyNxT65Vr1WaYDBMBbRroYt0KRF9dheal
 d+H5ctGvlLsopltXb2Vx6dVyQD4c2I8K1oU06K5/B8zChMUhxTFKDI6A+CPxfcZBCLSa
 4fLjs0DJ4EM2X/gcrZ8xRqJtsszir0Wtq27PmZjdwL6OWSywkv8G+MltPKc0/gW5DNdV
 OMMyHMtg8ii8TX5vhTvJEmGP8shOJBUo7hFUzsUrBh1m90DcNLhw2CiBO513lpG/0+te
 PKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N38Pn4J9CycWsZX1TeoF5FHH9FlQEReI7jzAoV0JqIo=;
 b=uDRd+uvQx9ueLO0UNQf3eW/8ZW8+pDYiISeSaFPjyKQzNE+HdFriflIXAXUdzrsdbU
 Lx9bqIYt38JJNOYKPaUX0OO+0jrz32EmNc32+RhBIJm/pLSfemsp0DIdYpk1FfvDB92w
 XOAZ06CiKzhSbiPjsdd7y1+V1e3pECtNfESJiiTjkKPH+YsVAk0CkHUGvtfAjxMFTOTK
 PaFWJ2lydO2+Woj8IYTChS39sf4FlLrEvxSzPVkMJ23M4X5+gklP06IHqYbT3Kn+yS2R
 cTxR2PVzjVJRB21UzpJA2qyMtY5n7kjd4bIl36W/n5ARUktE8zHTVv3pIfknZlsmzO2+
 XxcQ==
X-Gm-Message-State: AOAM533O6dHr8lSkKq0TooTj40MX7GhYWPWAeUxlQlY6dYnwPo710wRu
 07CkiU4w/3C163RVURVnuIWKzyOa+o1/JSGHZBw=
X-Google-Smtp-Source: ABdhPJzGNLIXjeBm9kSSqwNRuM7XGVPZrw5G0x3bnsovTPZtAggJ4+j9dIbtwgX1/jkJ19OxfbEZz4pnWm1RF9DVcjQ=
X-Received: by 2002:a92:890d:: with SMTP id n13mr14718511ild.5.1596429762740; 
 Sun, 02 Aug 2020 21:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <1119714633.44793917.1596421202774.JavaMail.zimbra@redhat.com>
 <506179292.44794805.1596422888744.JavaMail.zimbra@redhat.com>
In-Reply-To: <506179292.44794805.1596422888744.JavaMail.zimbra@redhat.com>
Date: Sun, 2 Aug 2020 23:42:32 -0500
Message-ID: <CAH2r5muWV2P75oHToSR4_LaVWETXC1Y0LbpEWfD-rF00jfFMFg@mail.gmail.com>
Subject: Re: fallocate can't change the cifs disk space usage
To: Xiaoli Feng <xifeng@redhat.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Any luck trying the same thing to Windows and/or Azure to see if this
is possible Samba bug - sounds like possible Samba server bug but need
more information.

Are you using one of the Samba plug in VFS modules on the server (like
vfs_btrfs)?

What does the filesystem show (before and after) on the server side
(local file system not just the remote view that Samba is returning
for statfs) when you try the df -h?

On Sun, Aug 2, 2020 at 9:55 PM Xiaoli Feng <xifeng@redhat.com> wrote:
>
> Hello all,
>
> Recently when I'm investigating the xfstests generic/213 generic/228 fail=
ures for cifs.
> Found that fallocate can't change the cifs disk space usage. Comparing xf=
s fileystem,
> fallocate can update space usage.
>
> My tests is in 5.8.0-rc7+. I also file a bug for this issue.
>   https://bugzilla.kernel.org/show_bug.cgi?id=3D208775
>
> # cat /etc/samba/smb.conf
> [cifs]
> path=3D/mnt/cifs
> writeable=3Dyes
> # mount //localhost/cifs cifs -o user=3Droot,password=3Dredhat,cache=3Dno=
ne,actimeo=3D0
> # df -h cifs
> Filesystem        Size  Used Avail Use% Mounted on
> //localhost/cifs   36G   23G   13G  66% /root/cifs
> #  fallocate -o 0 -l 2g /root/cifs/file1
> # df -h cifs
> Filesystem        Size  Used Avail Use% Mounted on
> //localhost/cifs   36G   23G   13G  66% /root/cifs
> ]# ls -l cifs
> total 1
> -rwxr-xr-x. 1 root root 2147483648 Aug  2 21:57 file1
>
> Thanks.
>
> --
> Best regards!
> XiaoLi Feng =E5=86=AF=E5=B0=8F=E4=B8=BD
>


--=20
Thanks,

Steve

