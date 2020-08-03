Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E0423B04C
	for <lists+samba-technical@lfdr.de>; Tue,  4 Aug 2020 00:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3F9SEZhG1aS1l0cqzcNuvZwsbanjqvUn9FEGcIlBvv8=; b=jJObsupcnKtHsjzRl1EuCGT5lL
	A29NdsbORs3myLJCPzBTMmIU7eEclvWFFPVfb2mnFPIaeGKR3ZmWVK0n9HqIhktjWrS3fvFqrSkMT
	cXtxFU5JdxdSdFBDT5yTOpY6eBHEvli0PcEvc1UVDp8IVC+d+c/qnuGFyxcfxgiFNbqrGqenXiGok
	87IUxUK2fueukguXMdXTU5M8LGelHlkbAjPn2v5oF8awWR2vz95vclW5MyadB/jRUXupuPfzWVDWX
	U6V9tmptGXBDEBb1oW7at1J/YUWoz7uhZePv3i5ipPzerO/Ij1OEuqs5FiOkgxItNjcNzs6ztXznx
	wVQlPNaw==;
Received: from localhost ([::1]:25574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2j73-00CNr2-Ka; Mon, 03 Aug 2020 22:39:21 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:42899) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2j6w-00CNqv-W6
 for samba-technical@lists.samba.org; Mon, 03 Aug 2020 22:39:17 +0000
Received: by mail-il1-x131.google.com with SMTP id i138so26611332ild.9
 for <samba-technical@lists.samba.org>; Mon, 03 Aug 2020 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=3F9SEZhG1aS1l0cqzcNuvZwsbanjqvUn9FEGcIlBvv8=;
 b=C3takTxtU+OpGAatpkZPO3tDKrJZlCehX7hoC3o40TzrqN2sNzrNiDe+aBltG9WA8Z
 D6FexIuxvUdFn0+L464XzmK5fGLKJHZpkqMAjznOyfth+FT/3BQePxBydTSZRKsGCByQ
 RhIs0Q4EbMeoqZJ2U2sOIFyENkkZz32EJz7PPFOBSVkjQDLugcKNRfjJyPPO95L6G+yi
 iihiVC69dwRHO1IsuxRhKQXRvvKosc6zBYEi2I3ipnn1ES8osXEP5pz7sTtKkpVEIEvZ
 +M3JHwcBBz6FacSa6W1VC+4JBAazqOlGg7nbT6fx2zyuaJqCHjJi2l8g8f9rqYK5qvm4
 cIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=3F9SEZhG1aS1l0cqzcNuvZwsbanjqvUn9FEGcIlBvv8=;
 b=Wq+T4x85e/aNUZ0feo4pNyHpmvtZNKCvNBU5FL2a+dISNRWqpBLYzQP015mquIMnAo
 i9UGtZDpjr4uCVIEOfuXCx0CCuiJq2GcRr+K3uO3BR5RNl190YNgXvqbRRU6UuvmpoMq
 ZxKxdjybUItofK1TEMBjA1oTHt7UjOIBPvgxRu7RcW5LVBH1q0upcRUlzkmm0ADweWso
 6iz2iQ8rAifXfEHA+ZmvOsYvkACTHfiOybrd0exlab1uPHxbRWjZG0JN1+d6RWiuMvyH
 NuizkQFYPG5N5KAyFVd8KQ+Al73LL4o1J7P9Xb5cJa/rc96NZ6/W9SlwwQ0kaa3w3/Cx
 4fXg==
X-Gm-Message-State: AOAM5335w9G1qoJoL0tKn14AhI2Z+XzG9rwqoSvqJgecKo/QbCovKwN3
 kCQkl9VTYfGVWXiP+EeTwgRGGHLIHcfZTvbN5xg=
X-Google-Smtp-Source: ABdhPJy4nViBQEa3Z6kbyAVPMikytxqyUqAMrulIHwN8m9PoKhqoqG/B5wzCynRBW0c3k9JAovQfU7d1o5UiGQ8Oh7M=
X-Received: by 2002:a92:c644:: with SMTP id 4mr1652155ill.3.1596494352497;
 Mon, 03 Aug 2020 15:39:12 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 3 Aug 2020 17:39:01 -0500
Message-ID: <CAH2r5mvRncMmG3H5gb--b-gf2j=gJAcqbN6V7LGR5=ywUuQbcQ@mail.gmail.com>
Subject: fallocate extending file behavior and Samba
To: Jeremy Allison <jra@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
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
Cc: Xiaoli Feng <xifeng@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208775

mentioned the problem XiaoLi noted - extending a non-sparse file in
Samba doesn't allocate any disk space as would be expected.   This
behavior can be changed by "strict allocate = yes" but presumably
Samba server should report sparse files as sparse (which they would be
by default on most Linux fs).  Looking at where FILE_ATTRIBUTE_SPARSE
is returned - it doesn't seem to have anything to do with whether the
file is actually sparse (ie the blocks allocated for the file are less
than the file size).

Perhaps more worrisome though was looking at what file_set_sparse does
(or actually doesn't do).  See source3/smbd/dosmode.c   It doesn't
appear to actually do anything (other than save the bit in an xattr) -
ie it doesn't actually do what the user wants (which is to guarantee
enough disk space is reserved by making the file's allocation size
match the file size).

-- 
Thanks,

Steve

