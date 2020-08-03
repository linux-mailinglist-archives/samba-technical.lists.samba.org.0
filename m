Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 407CD23A145
	for <lists+samba-technical@lfdr.de>; Mon,  3 Aug 2020 10:48:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4bR7uOTWMj9kfPdiRqLG6vVN909/nPWN1VUTch9yl4U=; b=SV5gTj48jjg3zwz7D3GJiXtXt0
	xm8oBbXAcCelZn2mp3rwr9VNHpVE74QjQfeIzrwi3GKJcuI6cd9n2fuebT2V8Cj48A8TTHU0wqwYT
	MCe51UWPDTfx4lGUTNc52Eg6Bs1U6uo6CZDcund3Dw638KRj7B6fpdoNZi4zhnuy1JNKKb5zYla1Z
	lPlrpIc/OljSOxUVis1zR7Ox8w1KhaVcolpO+K3XUKmfDlmMM1Zc8yn8jkrkFI0hkX7WPzF4NfdTF
	NsQ/tVZGoy8diO2eW4mUYuR5N2Eosis9SVJ93OfHo3bdKbHR41rCsLzMkITsGO9UNn+8oWPg1GhSb
	DkHeRJoQ==;
Received: from localhost ([::1]:56708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2W8M-00CKip-9P; Mon, 03 Aug 2020 08:47:50 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52451
 helo=us-smtp-1.mimecast.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k2W8F-00CKii-2e
 for samba-technical@lists.samba.org; Mon, 03 Aug 2020 08:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596444454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bR7uOTWMj9kfPdiRqLG6vVN909/nPWN1VUTch9yl4U=;
 b=T8jjM+GrC9hwI+uz6Mu26KknGa+Hwt10QI1qvFm54Lmf3irL+kQn+zSyX811SH6AyYIVeA
 UWJXPtdpxGT8UaR5CnNZDaoCxTEvowX4ZcGOgsef6GPBWGMt4tW/gfztXVZC2Rc//CuTRd
 t8GX3RPyelyKZ0n03WEOh3HhxiUkWMI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596444454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bR7uOTWMj9kfPdiRqLG6vVN909/nPWN1VUTch9yl4U=;
 b=T8jjM+GrC9hwI+uz6Mu26KknGa+Hwt10QI1qvFm54Lmf3irL+kQn+zSyX811SH6AyYIVeA
 UWJXPtdpxGT8UaR5CnNZDaoCxTEvowX4ZcGOgsef6GPBWGMt4tW/gfztXVZC2Rc//CuTRd
 t8GX3RPyelyKZ0n03WEOh3HhxiUkWMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-wnMgLCO3Nfyu72u8CiV8mw-1; Mon, 03 Aug 2020 04:46:14 -0400
X-MC-Unique: wnMgLCO3Nfyu72u8CiV8mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43A28100944A;
 Mon,  3 Aug 2020 08:46:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AD581A7C8;
 Mon,  3 Aug 2020 08:46:13 +0000 (UTC)
Received: from zmail23.collab.prod.int.phx2.redhat.com
 (zmail23.collab.prod.int.phx2.redhat.com [10.5.83.28])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EE6E95A72;
 Mon,  3 Aug 2020 08:46:13 +0000 (UTC)
Date: Mon, 3 Aug 2020 04:46:12 -0400 (EDT)
To: Steve French <smfrench@gmail.com>
Message-ID: <342612495.44824091.1596444372983.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAH2r5muWV2P75oHToSR4_LaVWETXC1Y0LbpEWfD-rF00jfFMFg@mail.gmail.com>
References: <1119714633.44793917.1596421202774.JavaMail.zimbra@redhat.com>
 <506179292.44794805.1596422888744.JavaMail.zimbra@redhat.com>
 <CAH2r5muWV2P75oHToSR4_LaVWETXC1Y0LbpEWfD-rF00jfFMFg@mail.gmail.com>
Subject: Re: fallocate can't change the cifs disk space usage
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.68.5.20, 10.4.195.24]
Thread-Topic: fallocate can't change the cifs disk space usage
Thread-Index: o2ES4eYYrbK81j5z4Y02rM6QfIXPqQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Warn: EHLO/HELO not verified: Remote host 205.139.110.120
 (us-smtp-delivery-1.mimecast.com) incorrectly presented itself as
 us-smtp-1.mimecast.com
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
From: Xiaoli Feng via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xiaoli Feng <xifeng@redhat.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hell Steve,


----- Original Message -----
> From: "Steve French" <smfrench@gmail.com>
> To: "Xiaoli Feng" <xifeng@redhat.com>
> Cc: "CIFS" <linux-cifs@vger.kernel.org>, "samba-technical" <samba-technic=
al@lists.samba.org>
> Sent: Monday, August 3, 2020 12:42:32 PM
> Subject: Re: fallocate can't change the cifs disk space usage
>=20
> Any luck trying the same thing to Windows and/or Azure to see if this
> is possible Samba bug - sounds like possible Samba server bug but need
> more information.

Thanks for quick response. When trying the same thing to windows. This issu=
e is gone.
fallocate can update the space usage.

>=20
> Are you using one of the Samba plug in VFS modules on the server (like
> vfs_btrfs)?

I'm not using any samba plug in vfs.
=20
>=20
> What does the filesystem show (before and after) on the server side
> (local file system not just the remote view that Samba is returning
> for statfs) when you try the df -h?

on the server side, the space usage reported by df also keep the same befor=
e and
after fallocate.

>=20
> On Sun, Aug 2, 2020 at 9:55 PM Xiaoli Feng <xifeng@redhat.com> wrote:
> >
> > Hello all,
> >
> > Recently when I'm investigating the xfstests generic/213 generic/228
> > failures for cifs.
> > Found that fallocate can't change the cifs disk space usage. Comparing =
xfs
> > fileystem,
> > fallocate can update space usage.
> >
> > My tests is in 5.8.0-rc7+. I also file a bug for this issue.
> >   https://bugzilla.kernel.org/show_bug.cgi?id=3D208775
> >
> > # cat /etc/samba/smb.conf
> > [cifs]
> > path=3D/mnt/cifs
> > writeable=3Dyes
> > # mount //localhost/cifs cifs -o
> > user=3Droot,password=3Dredhat,cache=3Dnone,actimeo=3D0
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
>=20
>=20
> --
> Thanks,
>=20
> Steve
>=20
>=20


