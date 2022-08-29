Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5F5A54E3
	for <lists+samba-technical@lfdr.de>; Mon, 29 Aug 2022 21:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iGOHgV7dAo4/twqODxBohIswAPwtfs88+v5El78ch7E=; b=IoMNf3TD2nytRjOwR/HJGAfVl7
	mLSAbUDzW15FU8GV3YktcfQiqBvJzfD73Sk17plFtLzk3lP1pNZpG42SfLVqP0HhkT5sc349otVna
	8/yEKUxl98yRm5qr/8V/fD1V1hRJQd9XxYXWn6r92L8riasBap4Bda9E3AuvgJinoPA7JBiFOzCX8
	RooMc+mFlWKwyKrdZk/1u9NDZ8lvKGCj0EBxewcomTUeZYwLy/vDaTuJouwy4tk6PE6yaYhE7Yilg
	jK3WVlU9pLSfTXXhB4oyoTp4T21vdQCtd70GFa/3Cecbin/9MBpLNURe6bf0DOolL9K3vg5JNakoQ
	bnUpqpiA==;
Received: from ip6-localhost ([::1]:57482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSkqz-002xnp-RK; Mon, 29 Aug 2022 19:55:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14884) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSkqm-002xnf-Km
 for samba-technical@lists.samba.org; Mon, 29 Aug 2022 19:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=iGOHgV7dAo4/twqODxBohIswAPwtfs88+v5El78ch7E=; b=vXmeeW4YukAexKU0F9qev3E6O6
 cGD+3ya2KN/JVq41xFASxp5MHukTdvUIarVzniBxtSfk+i780g4JWtaWDVdhoNifzRNDA/lYlmmek
 Dd9hV9AltIejErIQCDI8QLEfhSsi7BQCrnFj/8HdGWo8HC7+LqJBj8azOuBU/lgj+cUSBaGviUGrD
 HhIjzmKyY54B0YH1jf8ryqlLDJLwB7towCKttg6EDOl+3Wkn0KblolLxCrcamWSogpwHgRnmd8Dmq
 KXea+IrZnJi+QKD5L/d+kWoAIaCS6JIxXD8PsbbXJ54NbQbxNwgwZqcNDkJBCfYy5ofkggK/18A7t
 L4zW7/wqabGcoh/cbkdWEte7Xr02ioDsHFRhGc2dYAw1P+/luwLHb1T2zWfwbutvW88u9x9/ZmANd
 gKBn83NtPmyGMw+I8MLXjpWSxV9cazi1/bqSx5BVKpxyKu1VhopPZBcdEFaj4jEoPL3fa4PQ9eC7Q
 pZ/RScQHqUES70M1Jxph1M00;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oSkqk-002G7J-Cv; Mon, 29 Aug 2022 19:55:10 +0000
Date: Mon, 29 Aug 2022 12:55:05 -0700
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: Samba 4.17.0rc3 opens via vfs_glusterfs fail
Message-ID: <Yw0ZmZwzOcthaVk+@jeremy-acer>
References: <CAB5c7xobm2hCmdmC3rspWC4-YOETb-S4Q7wtfMmccqMZRt8+Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAB5c7xobm2hCmdmC3rspWC4-YOETb-S4Q7wtfMmccqMZRt8+Hw@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Anoop C S <anoopcs@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 29, 2022 at 03:36:21PM -0400, Andrew Walker via samba-technical wrote:
>```
>[2022/08/27 14:48:25.748586,  0]
>../../source3/smbd/files.c:1187(synthetic_pathref)
>  synthetic_pathref: opening [.] failed
>```
>
>Seeing this on trying to connect to share. Looks like we're trying to
>glfs_open() <connectpath>/. with flags (O_RDONLY | O_NOFOLLOW |
>O_NONBLOCK), and it fails with EISDIR.
>
>Following patch fixes the issue (i.e. on EISDIR reattempting open via
>glfs_opendir()).
>Has anyone else seen this issue?
>
>```
>diff --git a/source3/modules/vfs_glusterfs.c
>b/source3/modules/vfs_glusterfs.c
>index dd05da0f9bb..22762a8703f 100644
>--- a/source3/modules/vfs_glusterfs.c
>+++ b/source3/modules/vfs_glusterfs.c
>@@ -822,6 +822,11 @@ static int vfs_gluster_openat(struct vfs_handle_struct
>*handle,
>                                 how->flags);
>        }
>
>+       if ((glfd == NULL) && (errno = EISDIR) &&
>+           (how->flags == O_NONBLOCK | O_NOFOLLOW)) {
>+               glfd = glfs_opendir(handle->data, smb_fname->base_name);
>+       }
>+
>        if (became_root) {
>                unbecome_root();
>        }

Can you re-test with the latest glusterfs fixes that
just got added to ?

https://bugzilla.samba.org/show_bug.cgi?id=15157

If it's stull a problem, can you coordinate with
Anoop C S <anoopcs@samba.org> who is working on
4.17.rcNext with glusterfs.

Thanks ! Jeremy.

