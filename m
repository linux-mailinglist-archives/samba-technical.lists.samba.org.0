Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 200FA874A2A
	for <lists+samba-technical@lfdr.de>; Thu,  7 Mar 2024 09:55:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=warou/4ZoeVQCOXsoBqQxozGmPUsOzd0YrxkN4n/fHM=; b=VO1SCFV3XiGYD3+FO+iGufTZhC
	hu/QqdbUAgkJjISxnBl56lkY2IQ5+Ifg01VLB1f1YlD4jBIqy9X6DO6fRqItqt2MVJBchyw3zgzl6
	9XHCQ36xbfPtO+gc+spce6JkIDhhhBqIqY9r02emhvuVXivluEcA55CYyTrC/cOS18ERrJ/T7jO4P
	gZWzzZ5zgeDN0XY4TqnJ04F9KNt3QHGmaIjL9od26qPdzsUKtaeXdyvfMSFGJnFnFI6iYM1W4CZTE
	9Q/7NtRCEYCxYs4cCM0aWn3swPknTTlr6TSPVPFbdOWvwEramd2M3B3rOU83z2B7KxrFq5wgUK+uX
	B4U1bQkQ==;
Received: from ip6-localhost ([::1]:59070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ri9WX-00BzKL-4O; Thu, 07 Mar 2024 08:54:45 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:53523) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ri9WT-00BzKD-3R
 for samba-technical@lists.samba.org; Thu, 07 Mar 2024 08:54:43 +0000
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-60978479651so7241637b3.3
 for <samba-technical@lists.samba.org>; Thu, 07 Mar 2024 00:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709801679; x=1710406479; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=warou/4ZoeVQCOXsoBqQxozGmPUsOzd0YrxkN4n/fHM=;
 b=ei3BAX35IFBhHWayMwYztDqz9n2F1zjRJlfvBOPknYeWRaoElnpjKv5uViMnKIO40j
 xAEbT+CaK5N4ko4E22qJevAtSXI6/TQs3PU/iSVQvYGwgA0GtiuDkJ1its002Pep5tlx
 zByFwDSOAQd6t7PKvtCCcsWcEwxdgGSBrpY4jlHl1UJjLI79DCSsEI4s4od6nInxVLz7
 3oH2cSQSI4PNFwDEDA52vQbsqEPYPgxtZcYERMvi6eRyyJCHoik2+L+fYVI5iBtgVHmy
 3/O5qB+PZg1J9dBAJVC+cYfbzaqILEhIxVWLH3XAk6yXn+TAmLVqckRxZ+vMhmGa/rlx
 aLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709801679; x=1710406479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=warou/4ZoeVQCOXsoBqQxozGmPUsOzd0YrxkN4n/fHM=;
 b=fKSSKTj0UGsUkek8DLrfK28fRGHLkd4h7KXtGy9b/Qs96xpmxxrR2xg668zBXkwckV
 BYGyv+OLR2pzsG02h0YwarvFXRy7HkMsw2i/7LIVgO0bRoBQ+DGmNKJqCz3e+caOvaDc
 z3i7BRKtk403gsCKNbcw983+b68auwNy8PQhsU23mz+JEye9s4JmejM6UXy1Diymmv6C
 UEseGjdOoiQOU0FgpvxZY4r8sT3RG1zCnXh7WX/tzPsAfsBohL2+hnEYfoCIymlvCDR+
 E4IIxBd/1fck+nkXfVKlr7RdDEzN0cAnBY+03bgbCRIXbz6+b3J7qltTof400ELdxYc9
 Zwqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD2CkYrjK7UT8cbkTjRZadqxxmXSM7zPYCZcBx4BV5secFDPqHEpYgK2KGxlfyNt7H1nnfK5cwa35UGngP+QLlQSbh8++wheLBmP2COUj0
X-Gm-Message-State: AOJu0Yw+XMvJz81KoDUbc8OIdD+TblquNpXkuQO6OmTxEbT1iY3jtrtN
 yQHNpj94/JZLiqxnJPduia5vRRGNQxpxOTtiGfrUf8KBiASWVuH7kBqwrBZuwVR/f2j1xNdykOA
 PHVIy94NOJzLTQyWXHe780UNZwJE=
X-Google-Smtp-Source: AGHT+IE241cAoDN15OyIXUS5digLbXgrYwMzfGXNtu8QARD6JyLJrI9undleI4uAurSPNG65KUkWowLfKbhiTafIOYk=
X-Received: by 2002:a05:690c:fd6:b0:608:d2fe:14ab with SMTP id
 dg22-20020a05690c0fd600b00608d2fe14abmr20192411ywb.5.1709801679105; Thu, 07
 Mar 2024 00:54:39 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mutAn2G3eC7yRByF5YeCMokzo=Br0AdVRrre0AqRRmTEQ@mail.gmail.com>
In-Reply-To: <CAH2r5mutAn2G3eC7yRByF5YeCMokzo=Br0AdVRrre0AqRRmTEQ@mail.gmail.com>
Date: Thu, 7 Mar 2024 10:54:27 +0200
Message-ID: <CAOQ4uxg8YbaYVU1ns5BMtbW8b0Wd8_k=eFWj7o36SkZ5Lokhpg@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] statx attributes
To: Steve French <smfrench@gmail.com>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Kent Overstreet <kent.overstreet@linux.dev>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc <lsf-pc@lists.linux-foundation.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 7, 2024 at 7:36=E2=80=AFAM Steve French <smfrench@gmail.com> wr=
ote:
>
> Following up on a discussion a few years ago about missing STATX
> attributes, I noticed a case recently where some tools on other OS
> have an option to skip offline files (e.g. the Windows equivalent of
> grep, "findstr", and some Mac tools also seem to do this).
>

Which API is used in other OS to query the offline bit?
Do they use SMB specific API, as Windows does?

> This reminded me that there are a few additional STATX attribute flags
> that could be helpful beyond the 8 that are currently defined (e.g.
> STATX_ATTR_COMPRESSED, STATX_ATTR_ENCRYPTED, STATX_ATTR_NO_DUMP,
> STATX_ATTR_VERITY) and that it be worthwhile revisiting which
> additional STATX attribute flags would be most useful.

I agree that it would be interesting to talk about new STATX_ attributes,
but it should already be covered by this talk:
https://lore.kernel.org/linux-fsdevel/2uvhm6gweyl7iyyp2xpfryvcu2g3padagaeqc=
biavjyiis6prl@yjm725bizncq/

We have a recent example of what I see as a good process of
introducing new STATX_ attributes:
https://lore.kernel.org/linux-fsdevel/20240302220203.623614-1-kent.overstre=
et@linux.dev/
1. Kent needed stx_subvol_id for bcachefs, so he proposed a patch
2. The minimum required bikeshedding on the name ;)
3. Buy in by at least one other filesystem (btrfs)

w.r.t attributes that only serve one filesystem, certainly a requirement fr=
om
general purpose userspace tools will go a long way to help when introducing
new attributes such as STATX_ATTR_OFFLINE, so if you get userspace
projects to request this functionality I think you should be good to go.

>
> "offline" could be helpful for fuse and cifs.ko and probably multiple
> fs to be able to report,

I am not sure why you think that "offline" will be useful to fuse?
Is there any other network fs that already has the concept of "offline"
attribute?

> but there are likely other examples that could help various filesystems.

Maybe interesting for network fs that are integrated with fscache/netfs?
It may be useful for netfs to be able to raise the STATX_ATTR_OFFLINE
attribute for a certain cached file in some scenarios?

As a developer of HSM API [1], where files on any fs could have an
"offline" status,
STATX_ATTR_OFFLINE is interesting to me, but only if local disk fs
will map it to
persistent inode flags.

When I get to it, I may pick a victim local fs and write a patch for it.

Thanks,
Amir.

[1] https://github.com/amir73il/fsnotify-utils/wiki/Hierarchical-Storage-Ma=
nagement-API

