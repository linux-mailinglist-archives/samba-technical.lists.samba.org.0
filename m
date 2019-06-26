Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D28E256E03
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 17:48:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4XbKOSqnmWXmqHW3WXDSQVNj7jNZC8w1O0AnEjRzOnE=; b=3Mp1e74cDeneqPqpRKdjBcSqmp
	hlshJn9xGIA0rhtGf/fXaZNY0241/tdbwDXVbG+EOO9c604Nhp/3Rq3zd35ZUCeaSLUNbcdc+AiwP
	eSIwHeWMmp/p7lS2gC5s6/suLoDe4dw7ovezbFdDi3FHH4c6QnN0e2Bt33PEyK7A1kKnYIcFczCHo
	Ol+xvgaqd87n3OY1chtkbG8zlyyOAGhrVrptXgHwdJsamqhQjhBI97xS9Rh3K/9+fRB1J/QIN6j3n
	SkaWoujEXVbMoDlJZ2rwREV6CxD8V79/JRcoNa8nS8O6q+lVDAmxE4XOm1boe+ffoiTuvbwFS1RFM
	yZkE9KXA==;
Received: from localhost ([::1]:40908 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgA9L-001wEN-Sz; Wed, 26 Jun 2019 15:47:55 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgA9G-001wEG-NW
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 15:47:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id s3so2623150wms.2
 for <samba-technical@lists.samba.org>; Wed, 26 Jun 2019 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4XbKOSqnmWXmqHW3WXDSQVNj7jNZC8w1O0AnEjRzOnE=;
 b=K5nYgMgrMtTHic5nc3nBVxVw2Sx++Em4zpzKtp9j6Asaj9BE5N03ABwcpr8GEHcmiQ
 f9PMMhGphIPDeORqAJfSSVjLwVRgmWq6BIPh9Qlq1qP/yTBSZNC6vfBYBIW/ZloR+DLf
 PJejSpbwvcnebZyu2al3qhCfodSZVCfIAabKtxmj+H5I4/mZerY34+bkz8YV9IJQaJ7i
 LJQtbV7lnCinIxPv24AjATgboLXge+ud0sPq6j03+/kDykYW/wkahpwbL0du3kTs32S5
 M26SYjO94pzSl5YA6SAzTkkwrNMN6k1YG5wPs1tNxtt3UbqZDHa+6M4hso4sKKZN66z2
 e3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4XbKOSqnmWXmqHW3WXDSQVNj7jNZC8w1O0AnEjRzOnE=;
 b=o7cz05q8iWVXHr9G4/MBjaoPgW7d1Jog/qNymoEDXeU85F/Pgk3WqZynqgowBI5wWZ
 V7GGVMyqV1Y9eumOrjm9okpVUf20S35yaedZHPAI+h0ElDmJVVZApIv898GDvXSs2gep
 OiJfcHyhTZ44Qy4UZjvc39p9kw5RcFk484oyfbu3+QegDF1XSJE4vdDqrY1uWRCxKzZM
 ByKf6LEMWKmOmuYiduMzkZnphQRrGIfd2yA4pE1Ny85SF3IiRjjjkxAnagcQOAUVebBZ
 xCdTf79HPtpuQU/dlrp4w4HclZmBHKUajqLzk8qPsFXx/Hfn8xxUqWodFA6LureqQ6XE
 B73w==
X-Gm-Message-State: APjAAAXCuVscJX109BR/HBP7xpd2X7JbJRU4NkK9ORkskWGSREIzqcpV
 4m2YxNeyFq14M18II+2pGHPfayiHZW3ufIC/azfLRA==
X-Google-Smtp-Source: APXvYqwN+pxvR2Pxoy0uKfTd98fpnJmO6CYTy5Tb/kNWTkG5bLKmUNaivWnlQP3M/X89miiHuHQyjvRXf5Z5h7f+P30=
X-Received: by 2002:a1c:c747:: with SMTP id x68mr3239972wmf.138.1561564069879; 
 Wed, 26 Jun 2019 08:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190626135745.lk7757wmy26pgy26@inti>
In-Reply-To: <20190626135745.lk7757wmy26pgy26@inti>
Date: Wed, 26 Jun 2019 08:46:03 -0700
Message-ID: <CACyXjPwn1+Xn04JVMnDPj+4zRg=FyNzHHooKb87kbRN4HXT91w@mail.gmail.com>
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
To: Ralph Boehme <slow@samba.org>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>,
 Volker Lendecke <Volker.Lendecke@sernet.de>,
 Samba Technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 26, 2019 at 6:58 AM Ralph Boehme via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi all,
>
> in short:
>
> Samba will adapt a new File-ID generation scheme, based on a file's initi=
al
> creation date instead of using the file's inode number.
>
> Long story follows.
>
> Recently customers have been bitten by a problem that seriously affects
> reliabilitly of Samba as a fileserver for Mac environments.
>
> The problem is providing sane SMB File-IDs to Mac clients. We have two ch=
oices:
>
> 1) By default Samba uses file inode numbers for the SMB File-ID. As inode
> numbers may be reused, when this happens Mac client get very, very unhapp=
y. Bug
> <https://bugzilla.samba.org/show_bug.cgi?id=3D12715> has some more detail=
s on the
> application level impact and more technical background.
>
> 2) To avoid the problems outlined in 1) we return 0 File-IDs to Mac clien=
ts (Mac
> clients get detected by virtue of SMB2 AAPL contect negotiation, only Mac=
s do
> this). Returning 0 File-IDs has the same effect as setting the client sid=
e
> option "file_ids_off" on the Macs in a config file /etc/nsmb.conf to "yes=
". In
> both cases the client ignores the server provided File-IDs and applies so=
me
> client side magic.
>
> Unfortunately, this mode seems to have its own serious problems:
> <https://bugzilla.samba.org/show_bug.cgi?id=3D13999>
>
> I've brought the issue to Apple's attention, but I don't expect a fix for=
 this
> will be available any time soon.

I am all in favor of ignoring the bug-ridden products Apple produces ...

> This means we have to find a way to provide clients File-IDs that are nev=
er
> reused but are constantly increasing.  metze suggested somehow using a fi=
le's
> creation date, given nanosecond granularity, to minimize the risk of ID
> collisions.
>
> We can compress a struct timespec into a 64 bit File-ID with the followin=
g logic:
>
> - struct timespec.tv_nsec (nanoseconds) requires 30 bitmap, leaves 34 bit
>
> - set the high bit for creation date based File-IDs, leaves 33 bit
>
> - struct timespec.tv_sec is seconds before/after UNIX epoch, with 33 bit =
we can
>   encode dates up to year 2106 which should give us some time to develop
>   something even better
>
> As a file's creation time (or btime for birth-time) may be set by clients=
, this
> would result in changed File-IDs every time a client sets the btime. So w=
e need
> to store an additional copy of a file's original btime. We store the btim=
e as
> part of the DOS attributes xattr, we need an additional field in there, m=
aking
> for a new level 4 of the xattr info struct. Looking with samba-tool ntacl
> getdosinfo the new level 4 looks like this:
>
>     xattr_DOSATTRIB: struct xattr_DOSATTRIB
>         attrib_hex               : ''
>         version                  : 0x0004 (4)
>         info                     : union xattr_DosInfo(case 4)
>         info4: struct xattr_DosInfo4
>             valid_flags              : 0x00000013 (19)
>                    1: XATTR_DOSINFO_ATTRIB
>                    1: XATTR_DOSINFO_BIRTH_TIME
>                    1: XATTR_DOSINFO_CREATE_TIME
>             attrib                   : 0x00000020 (32)
>             birth_time               : Wed Jun 26 15:05:56 2019 CEST
>             create_time              : Wed Jun 26 15:05:56 2019 CEST
>
> For any file with an associated level 3 blob that lacks the birth_time fi=
eld,
> when upgraded to level 4 eg when setting DOS attributes, the level 4 will=
 have
> no birth time set:
>
>       xattr_DOSATTRIB: struct xattr_DOSATTRIB
>         attrib_hex               : ''
>         version                  : 0x0004 (4)
>         info                     : union xattr_DosInfo(case 4)
>         info4: struct xattr_DosInfo4
>             valid_flags              : 0x00000011 (17)
>                    1: XATTR_DOSINFO_ATTRIB
>                    0: XATTR_DOSINFO_BIRTH_TIME
>                    1: XATTR_DOSINFO_CREATE_TIME
>             attrib                   : 0x00000002 (2)
>             birth_time               : NTTIME(0)
>             create_time              : Wed Jun 26 15:12:40 2019 CEST
>
> Only files (and directories of course) that have an immutable birthtime w=
ill
> take advantage of the new File-IDS semantics. So generally any existing f=
ile
> will still use File-IDs based on the inode number. That shouldn't be a pr=
oblem
> however, the realworld problems generally only arise with newly created f=
iles.
>
> Currently the only backend supporting storage of immutable birthtime is o=
ur DOS
> xattr via the VFS default backend. VFS modules can implement the DOS attr=
ibutes
> VFS function to implement their own logic.
>
> Existing VFS modules that want to take advantage of the new File-ID seman=
tics,
> must either implement an immutable btime natively, and until that happens=
 they
> have to call the VFS NEXT functions to get and set the immutable btime fr=
om
> vfs_default. vfs_ceph already does this, but vfs_gpfs needs to be updated=
.
>
> WIP: <https://gitlab.com/samba-team/devel/samba/commits/slow-fileid> (als=
o
> attached)
>
> Passes CI: <https://gitlab.com/samba-team/devel/samba/pipelines/68050729>
>
> Questions? Remarks? Thoughts?
>
> Thanks!
> -slow
>
> --
> Ralph Boehme, Samba Team                https://samba.org/
> Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46



--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

