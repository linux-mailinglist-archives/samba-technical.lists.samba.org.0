Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9855787544D
	for <lists+samba-technical@lfdr.de>; Thu,  7 Mar 2024 17:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wa8nE8b8SqGhZ4QI7aILjtKTfQn19EOeWHCgUsOwbGw=; b=G+g1zYRk9C6Br4oTprZMYDC064
	Zhukkeiv+WHUYiOzFzfi6u0zFbtVxY8bNpPN6P6y8gxTk1EcaCJixbWDxlu4tMIwlf09z4L3szrlI
	d+QI3pTTcXAoJDMr6eKEzECbOa+Ue9TKdwJgNFXig5MpABAyJ/IgNLdUJ11npI8sNy0ENSRsm54pq
	b9LcBAaZsqIKfhRt8vtrN8XAqlreO35sMHnjrYiuTIRAG9E5E4qzaDObnxIHLNliEZMbRwZNH3fnx
	df3wOjByP8LbYjFu29LoM/m97vRmImH1NHWguZTb7bvZe0EQe5KXXtBjghZCEfLMtzS3eyc1gw1Dd
	eNGxLTKw==;
Received: from ip6-localhost ([::1]:50576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1riGkO-00C0Bz-BL; Thu, 07 Mar 2024 16:37:32 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:60495) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1riGkJ-00C0Bs-PM
 for samba-technical@lists.samba.org; Thu, 07 Mar 2024 16:37:30 +0000
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d29111272eso16671611fa.0
 for <samba-technical@lists.samba.org>; Thu, 07 Mar 2024 08:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709829445; x=1710434245; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wa8nE8b8SqGhZ4QI7aILjtKTfQn19EOeWHCgUsOwbGw=;
 b=Z1f9K3EtqFTPcRceKIrML1XCy/wC0J0Ud/antkbZep5m2S36Lp5ruNZwm/lCp5RWQI
 17OfAzGmhOTr/2eM1nKz3irB3jfDTIC0Yy2O7Et2ZWycvzZ5K3ONQJ5Ij2/JEVZXalBe
 fOBYqb2FoTaJC7tw9o1yjvh9JHHXoIVMR2xbFpONMUCm911DRq2sm9e4dt0BPUUQ6DyY
 OFH9QacSW7eKr0U19hhbcdVJZ+Evz05POppTVvYEw8AiF3mzUxrHWt6NXbnm+9o5F7dw
 Lq3FTU30yjRke2MUSQnSkjWIZWJGw6/AraJO4zwvwMN0r3affmfZQvCStU/Kv5AYgwi+
 Y9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709829445; x=1710434245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wa8nE8b8SqGhZ4QI7aILjtKTfQn19EOeWHCgUsOwbGw=;
 b=Op7mlVXGRWL2mmE8W3DCeZcCx9IzJaOxS5in6YMYoYGGWogA8xWeffiuTf3GLy0kLq
 NJeBQJlCapaDvINxAHDDc35Kj9rdEb7Ro3l+ImqhaewIn1GbUBeXJT2Ra+t+qRQgX2WC
 4tEdPDYvL4MWc//ZDO113vXMDVVcjfnZjEs3Qcy2AxfPki+4JRmyQ1JTpu9LPcPBjP1Z
 xddSA+pKC/M+AKv/ZcxcriykCpuxRBRJ0Ip5GUxFtKt3m9JXHBlB5+yRKja2RelbB/Al
 CQwbTGA15OO+84jFjRXNIh/Hk96yY2YqVPTFNWlmnB2zbgHxmqyHFAya0Gh36WrLM7V7
 b2sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7gwSzt6C6BXeYbN0NsjDAwMjLK+dQ7Lvno81skK8/wL9UMck5K1cmx3i0gcex99zDrIvbhY22LRZk4mvoaMKc5MvvwnDshB2/wyHUy/m4
X-Gm-Message-State: AOJu0YxVK2IQOrDVQsuEXOCloisVCr+SPx+OkINa1y1hCiEZYNp3SYJG
 HgDu5rc8dpKzCnTOXwIQFwdmChscZz4rGS0CS+IlJsZ1XpatFr2xNhcfx41acaTIR3go6b2sAem
 Wez79H7xxCBBuTX2Ueyzc1xKaJzA=
X-Google-Smtp-Source: AGHT+IGMWmggy9gl2hWKPZoIZmBitATbdUkOinib/daRk5QHwjzoxyiLosZnb+VyP2uYgps7e3EIF0J+yGEpNOc2u4k=
X-Received: by 2002:a05:651c:1049:b0:2d2:4474:2e69 with SMTP id
 x9-20020a05651c104900b002d244742e69mr1874237ljm.9.1709829444350; Thu, 07 Mar
 2024 08:37:24 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mutAn2G3eC7yRByF5YeCMokzo=Br0AdVRrre0AqRRmTEQ@mail.gmail.com>
 <CAOQ4uxg8YbaYVU1ns5BMtbW8b0Wd8_k=eFWj7o36SkZ5Lokhpg@mail.gmail.com>
In-Reply-To: <CAOQ4uxg8YbaYVU1ns5BMtbW8b0Wd8_k=eFWj7o36SkZ5Lokhpg@mail.gmail.com>
Date: Thu, 7 Mar 2024 10:37:13 -0600
Message-ID: <CAH2r5msvgB19yQsxJtTCeZN+1np3TGkSPnQvgu_C=VyyhT=_6Q@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] statx attributes
To: Amir Goldstein <amir73il@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Kent Overstreet <kent.overstreet@linux.dev>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc <lsf-pc@lists.linux-foundation.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> Which API is used in other OS to query the offline bit?
> Do they use SMB specific API, as Windows does?

No it is not smb specific - a local fs can also report this.  It is
included in the attribute bits for files and directories, it also
includes a few additional bits that are used by HSM software on local
drives (e.g. FILE_ATTRIBUTE_PINNED when the file may not be taken
offline by HSM software)
ATTRIBUTE_HIDDEN
ATTRIBUTE_SYSTEM
ATTRIBUTE_DIRECTORY
ATTRIGBUTE_ARCHIVE
ATTRIBUTE_TEMPORARY
ATTRIBUTE_SPARSE_FILE
ATTRIBUTE_REPARE_POINT
ATTRIBUTE_COMPRESSED
ATTRIBUTE_NOT_CONTENT_INDEXED
ATTRIBUTE_ENCRYPTED
ATTRIBUTE_OFFLINE

On Thu, Mar 7, 2024 at 2:54=E2=80=AFAM Amir Goldstein <amir73il@gmail.com> =
wrote:
>
> On Thu, Mar 7, 2024 at 7:36=E2=80=AFAM Steve French <smfrench@gmail.com> =
wrote:
> >
> > Following up on a discussion a few years ago about missing STATX
> > attributes, I noticed a case recently where some tools on other OS
> > have an option to skip offline files (e.g. the Windows equivalent of
> > grep, "findstr", and some Mac tools also seem to do this).
> >
>
> Which API is used in other OS to query the offline bit?
> Do they use SMB specific API, as Windows does?
>
> > This reminded me that there are a few additional STATX attribute flags
> > that could be helpful beyond the 8 that are currently defined (e.g.
> > STATX_ATTR_COMPRESSED, STATX_ATTR_ENCRYPTED, STATX_ATTR_NO_DUMP,
> > STATX_ATTR_VERITY) and that it be worthwhile revisiting which
> > additional STATX attribute flags would be most useful.
>
> I agree that it would be interesting to talk about new STATX_ attributes,
> but it should already be covered by this talk:
> https://lore.kernel.org/linux-fsdevel/2uvhm6gweyl7iyyp2xpfryvcu2g3padagae=
qcbiavjyiis6prl@yjm725bizncq/
>
> We have a recent example of what I see as a good process of
> introducing new STATX_ attributes:
> https://lore.kernel.org/linux-fsdevel/20240302220203.623614-1-kent.overst=
reet@linux.dev/
> 1. Kent needed stx_subvol_id for bcachefs, so he proposed a patch
> 2. The minimum required bikeshedding on the name ;)
> 3. Buy in by at least one other filesystem (btrfs)
>
> w.r.t attributes that only serve one filesystem, certainly a requirement =
from
> general purpose userspace tools will go a long way to help when introduci=
ng
> new attributes such as STATX_ATTR_OFFLINE, so if you get userspace
> projects to request this functionality I think you should be good to go.
>
> >
> > "offline" could be helpful for fuse and cifs.ko and probably multiple
> > fs to be able to report,
>
> I am not sure why you think that "offline" will be useful to fuse?
> Is there any other network fs that already has the concept of "offline"
> attribute?
>
> > but there are likely other examples that could help various filesystems=
.
>
> Maybe interesting for network fs that are integrated with fscache/netfs?
> It may be useful for netfs to be able to raise the STATX_ATTR_OFFLINE
> attribute for a certain cached file in some scenarios?
>
> As a developer of HSM API [1], where files on any fs could have an
> "offline" status,
> STATX_ATTR_OFFLINE is interesting to me, but only if local disk fs
> will map it to
> persistent inode flags.
>
> When I get to it, I may pick a victim local fs and write a patch for it.
>
> Thanks,
> Amir.
>
> [1] https://github.com/amir73il/fsnotify-utils/wiki/Hierarchical-Storage-=
Management-API



--=20
Thanks,

Steve

