Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC961A1020
	for <lists+samba-technical@lfdr.de>; Thu, 29 Aug 2019 06:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NWVOfHDaPa1JXjahrXr3gtA9w996ssiG4UTUIisw4iM=; b=UhYNJ563ls5kKz5JD8LphC/fR7
	ObQYITDWIrjNhyGhPtrtUTIkH8hn8RJ/DrmobuQxgvo6vrx9eJQM+RAUtvxEOJCR5VzioKlzVOMiy
	eCMysBm+HezbrKm8mlYw6H5njHD6/uuJ7h0LpZ8kIwe/RE38+RHGUIIUUsA+K64d+Ff7d5raaoXBg
	z2r6IOK06bEXFieTU3RAjdG+7C2tSWFeuzvyOP1gfOyRfBsOzb1KBZdt68/GE9UGi1oVWFevmWBQv
	IRE9Ffp9EdhWPirxoJgP+4aa4Zy17J3QgcYDiaLxkXUzLv7gC9rx9RBFH3f2x/rtCG8/ETvpLzAfw
	WaRD/8/Q==;
Received: from localhost ([::1]:24930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i3Bbi-0009BF-Et; Thu, 29 Aug 2019 04:00:22 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40213) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i3BbX-0009B8-RJ
 for samba-technical@lists.samba.org; Thu, 29 Aug 2019 04:00:14 +0000
Received: by mail-io1-xd2e.google.com with SMTP id t6so4072385ios.7
 for <samba-technical@lists.samba.org>; Wed, 28 Aug 2019 21:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NWVOfHDaPa1JXjahrXr3gtA9w996ssiG4UTUIisw4iM=;
 b=XSb6pIY/kPb5cGGMWENjAA1EtiWDclpcTZ85OE17tION/EyvWZoEs2hgBvSOP9Zknu
 XTvJf+YfQjrKB8MxGCzom2HDIgAmbkLK7o2uTtQIjZOw1O8TiG080WXFA4U4i8Q2lI2s
 nAIQ6wkwPQJGo+4D2JeEos/IKqel6DVy+To05kc5At+UmWm6AtnFs1Ycr0xF6+7O/I9i
 sPedDi2fvM+Yo/C3QeLuKlvEBpOKNAcNe9R4Sml9Bb9Y1eFUFLYeQyeAsKSyDmCyMV2U
 3uQ6RGst2vs4/IKmiVamTZ49T7xEsaMYAOdAucqmukmLWoJJLoD5dz6IVRwFzws+nFD6
 ECcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NWVOfHDaPa1JXjahrXr3gtA9w996ssiG4UTUIisw4iM=;
 b=DfZUgTCxSXEikBuDQaXMV9CyNYgY7OJdq7DMa1D6058yFlCPPETPCbuLgJ8ybsMxuF
 rOPPQVgzn5W7S4Vy2bcnn/UtkeWC0o6qx+hxv0z6eGyHUDD7LHDMwL9oGRobzn4vYMy3
 XuQ6LhGTQvrkC1YR5AiuWOBTvVXF3rg9+IIda6++TKnw9Q5dC68F/oEgU5LfLLQz/Bka
 0MHw4t1mYCv2W9MUt2vMLde3dsgrIiMGSTRiBTJiROmb/NRQTz3ehJJI2TAwXCmyc6gE
 7DOozZCTVmpCd5244V8/3BzCL8CyTFCFsr5l7JkclnMimo7vsIkcItsQq/aiAZM5d8sz
 rZOA==
X-Gm-Message-State: APjAAAVZp3tsjP2aOKCjK5q83B1BRKxK6VKlwmRWm9BeeX9YPVXCMPaa
 gZJx4rZuGKhVnFAxQ2cK5yL3DkYNTi7yG/xYkWk=
X-Google-Smtp-Source: APXvYqx4PCsxUhe81DE2v6/NTP2dSpI/V5FBpW5yhwLopIpzKy0MMytemfSlADC62e3LkF2ZrfAYFBfAZWLbhcKRdCg=
X-Received: by 2002:a02:390c:: with SMTP id l12mr8164554jaa.76.1567051208512; 
 Wed, 28 Aug 2019 21:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190829000006.24187-1-colin.king@canonical.com>
In-Reply-To: <20190829000006.24187-1-colin.king@canonical.com>
Date: Wed, 28 Aug 2019 22:59:57 -0500
Message-ID: <CAH2r5mtSSwS7_E2WkS3Lsk02BEf_UwZ4H9oCEFTSf94U=4Cm9Q@mail.gmail.com>
Subject: Re: [PATCH][cifs-next] cifs: ensure variable rc is initialized at the
 after_open label
To: Colin King <colin.king@canonical.com>,
 ronnie sahlberg <ronniesahlberg@gmail.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

Ronnie,
You ok with merging this as a distinct patch?

On Wed, Aug 28, 2019 at 7:02 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> A previous fix added a jump to after_open which now leaves variable
> rc in a uninitialized state. A couple of the cases in the following
> switch statement do not set variable rc, hence the error check on rc
> at the end of the switch statement is reading a garbage value in rc
> for those specific cases. Fix this by initializing rc to zero before
> the switch statement.
>
> Fixes: 955a9c5b39379 ("cifs: create a helper to find a writeable handle by path name")
> Addresses-Coverity: ("Uninitialized scalar variable")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/smb2inode.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/cifs/smb2inode.c b/fs/cifs/smb2inode.c
> index 70342bcd89b4..939fc7b2234c 100644
> --- a/fs/cifs/smb2inode.c
> +++ b/fs/cifs/smb2inode.c
> @@ -116,6 +116,7 @@ smb2_compound_op(const unsigned int xid, struct cifs_tcon *tcon,
>         smb2_set_next_command(tcon, &rqst[num_rqst]);
>   after_open:
>         num_rqst++;
> +       rc = 0;
>
>         /* Operation */
>         switch (command) {
> --
> 2.20.1
>


-- 
Thanks,

Steve

