Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8EF2E8A26
	for <lists+samba-technical@lfdr.de>; Sun,  3 Jan 2021 04:47:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=S7XkGEH+8RkBNYCEf7NdeeHpDAFBsEQHpOi3CzI4PHQ=; b=111HfrjfknJy92W6FeNKk5vBUK
	+sE59Nyl8oxvGE7gje/f/umgfgMRRR+Ut40AcUuawpwTwcOXD8KHjCK8OuvmQdALr+Me8b2NkZhZ3
	RzjjkqpuJp4kVYsqG2FHtxsBYAY7C1Gs6SzJ4ZUJM/seUwxI5ij4KewpuypKCAd2hAwTVwLjs+pKP
	fg8kq8+z/Evro5xoCQf4m+Ps+Tlu2M52kSr1shrnMt84mbDLZ+ciyqqWdtMu+2C4UIn/KzYECIXVF
	IBjORQMC2dgl0tqD391yk8ZWJndkKSM2kmSOHce+z5W0t2Tj3eKYnWz44dhMQ4duVT2AcLgp0KEQ0
	j2+uVQlQ==;
Received: from ip6-localhost ([::1]:32412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvuLb-004cHH-8w; Sun, 03 Jan 2021 03:46:27 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:43300) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvuLV-004cH8-Gp
 for samba-technical@lists.samba.org; Sun, 03 Jan 2021 03:46:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 23so56772858lfg.10
 for <samba-technical@lists.samba.org>; Sat, 02 Jan 2021 19:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S7XkGEH+8RkBNYCEf7NdeeHpDAFBsEQHpOi3CzI4PHQ=;
 b=vG033Qu29kv1kBkK+tUfNkL4czdv2Os3fKc7Mjw9NheCBKakXKwB6GPC4RYKLg31/P
 AYbMAfO0Ww+mDkHEXOCq60LRx4oLelpoOKhroVOudV9ERGu2Yhue0iZ6L03c6a4paxDd
 5DFf/RhIcSzs9TyOiKZO6i3eJSYdNVcC3KRPKn+ZAMa8j/pqyaYSc6UNYEVRHoWr5Z1N
 s9n28BEHjesUbsz75z3qssaQhTE6OC0Yzf7PAep8ruq34DZkdGi2mD+VocCKbOuSCuou
 IIOy7f6rfzIldvZoZhIYt58IWC+vVYWuxuHFbi9lt9NHUtxiw9bSg6+d4K4TfKmShI5A
 k7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7XkGEH+8RkBNYCEf7NdeeHpDAFBsEQHpOi3CzI4PHQ=;
 b=AZIv/vymzSzhe47NQ5fvjYANsQ3oKfeFx/6lfz5s+Ra+H8jZ7GQtzUCw3UiJASrFYv
 sZHSCMWUWTIYpAeYgfOroSb6E0tBq1/uCImAQrcGZhao9yWYIdV9S7Hm9R16xbwv81/D
 9XQ3KaYeAYtqSxfPP1s7Jsk04ttZ6/DbnqCQg+E+j1dNu3RdtyeRQTagJFaKHvLHKWcm
 mbeX3u1/rwLIu/4pMQO/5CFDgnPa23HiKd95t2vvhVHUwcIX0wbmQCMJvbWswpO5grfC
 awKYSN47hCBK0q5i8WLDJw0e8XSD5t+BKI3deqfpt9bKHuXnT6F5CYzMBp5UO4Y2A53l
 CrMg==
X-Gm-Message-State: AOAM530UhBIw1clRxAJPb1v9HIPt3x/2/w66ceJygy5bLfGjoiqMVaIl
 N87hKipIK+aJjQlEXJ6ZMbf06n1Jkf4wKiHcBM206OX3kHQv3A==
X-Google-Smtp-Source: ABdhPJzP+cVbpVwoq+krBeYGKJ8dU+aUU9UqMV8ZDJFEs5O7IngJEnQVxPkfVZpADbJz3YMGEc7Mwk5R/9RiTphukbI=
X-Received: by 2002:ac2:5689:: with SMTP id 9mr30942152lfr.175.1609645564785; 
 Sat, 02 Jan 2021 19:46:04 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
 <20210101060050.GA1892237@jeremy-acer>
 <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
 <20210101195821.GA41555@jeremy-acer>
 <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
 <20210102025837.GA61433@jeremy-acer>
 <CAH2r5ms1V2KKb6T3ELQ-JsQ3fniOScTE2654_xLwnPruiekzEw@mail.gmail.com>
 <20210102052524.GA67422@jeremy-acer>
 <CAH2r5msZt0UZG5r5Z7=_jQf=-xgNz8zW7fZOnqncqeJHB=mOmA@mail.gmail.com>
 <20210103012116.GA117067@jeremy-acer> <20210103012511.GC117067@jeremy-acer>
In-Reply-To: <20210103012511.GC117067@jeremy-acer>
Date: Sat, 2 Jan 2021 21:45:53 -0600
Message-ID: <CAH2r5muZ9tFZtHakrSf6Px2HGQTDUzg8+V52+NQaytKX_ZpHCA@mail.gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
To: Jeremy Allison <jra@samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Jan 2, 2021 at 7:25 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Sat, Jan 02, 2021 at 05:21:16PM -0800, Jeremy Allison via samba-technical wrote:
> >On Sat, Jan 02, 2021 at 06:19:39PM -0600, Steve French wrote:
> >>I agree with the idea of being safe (in the smbclient in this case),
> >>and not returning potentially dangerous file names (even if a very
> >>remote danger to the tool, smbclient in this case), but I am not
> >>convinced that the "user friendly" behavior is to reject the names
> >>with the rather confusing message - especially as it would mean that
> >>inserting a single file with an odd name into a server could make the
> >>whole share unusable for smbclient (e.g. in a backup scenario).  I
>
> FYI, as I pointed out this only happens if you *explicitly*
> set a server parameter that is only expected to be set on
> a share with "clean" (no non-Windows) names.
>
> So just creating a file containing : \ etc. doesn't do
> this - you have to misconfigure the server FIRST.

I agree that with Samba server this is less common (not sure how many
vendors set that smb.conf
parm) but note that "man smb.conf" does not warn that disabling name
mangling will break
smbclient (assuming that local files have been created on the server with one of
the various reserved characters, perhaps over NFS for example).  But
... there are many
other servers, and I wouldn't be surprised if other servers have
sometimes returned files
created by NFS or Ceph or some cluster fs that contain reserved
characters, even if
it is illegal.

> The SMBecho is due to the keepalive failing
We (SMB/CIFS developers) would know that, but I doubt that all users
would realize that
(for example) creating a file over NFS with a reserved character and
then reexporting the
file over SMB with Samba configured with managled names off, or with a
server that
is less strict than Samba.   Seems like it would be better to print a
warning like:
                    "exiting due to invalid character found in file name"
rather than killing the session and ending up with the (to most users)
unehelpful error message.
-- 
Thanks,

Steve

