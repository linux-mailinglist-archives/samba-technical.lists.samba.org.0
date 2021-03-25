Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E244349548
	for <lists+samba-technical@lfdr.de>; Thu, 25 Mar 2021 16:22:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DWdXrxswFdWMzj92Kr/qs8gPd/Sy1C2PZmeLqGsaT0g=; b=btGP+YfUueSQ6m3kWQiEJpZzlo
	CNE2WchJUVkxrpvdOcsGWwPq64JObNgzfN/gdOtD334BrK6ModGqeTKaCQnrootoqaIQ9R0ho8ST4
	IN2KBnMQIjeFserNlLokuwhCFtGj1TFUtXLV+0Fst55cepBRK+KZaJUTHADBIaEwR7H5w/6Gzt6TI
	GUW/KKLBdHAn2rtfLDHAKkpQT+dZFYPXNfpu6aLYa6AOJwSfWg0nl7xs/QCLrHvUnJByUpqWdRQvy
	zKnbjVbC1pmq3A4x9IY0Tf0WnVtQuUBjIx5+VBvA8BaZ8hThz2wLpguI6p5P3pUlB6KP6mtbTj0H8
	NGIaV5Fg==;
Received: from ip6-localhost ([::1]:36692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPRno-006kNC-Gh; Thu, 25 Mar 2021 15:21:40 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:33519) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPRnc-006kN4-5r
 for samba-technical@lists.samba.org; Thu, 25 Mar 2021 15:21:36 +0000
Received: by mail-lf1-x12b.google.com with SMTP id o126so3146182lfa.0
 for <samba-technical@lists.samba.org>; Thu, 25 Mar 2021 08:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DWdXrxswFdWMzj92Kr/qs8gPd/Sy1C2PZmeLqGsaT0g=;
 b=JD88zvybm4xyFniHi1xZGqHj46f2jKSKyv3nO53GvqYvOJhjmA2Lj9kAXYVrbN2Pv/
 n8IB5e9GtuizoQu3vYcWhMfdlZ2ssXfi4NbO4/ERozh8EJIsRMq7L0TMDs0URckQAsNZ
 5+zZxvVSMMMn8JXoc3r6a32aIxQt23zlelsqJh3dD9caCez3mdeMAxirZYZ7E3IfWlC1
 KUZHhvCrRvlSaqp65U5N+IdXIsP0NdShEwX2ek6t0d7I/PgBhvl6ei989QxI5YfQTG74
 JaA/QrKYvfdX4ipXKDcLa+6FBqhUrilien0HIOOk6JaHBy8zfq887j100E/f2VFFLoMQ
 zDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWdXrxswFdWMzj92Kr/qs8gPd/Sy1C2PZmeLqGsaT0g=;
 b=ppCLX4UaqG8co2M8zzjTTJgsM9e5wxjRjk/rIJ0tuDPGo5bRpGDWILIMWcuyQ4EwGJ
 1zR1QiI2xvtzqGxgpQdEKY3Wki52X3Odlof01h7C4HSMWh0YijJp+mFS0ZDeAJiZkPZC
 QWxwiQvTCIiGOfg4b/+ldJX5hF2e4zbzonkLkGcSnsEhc/YHSmieSscoRKvophR0HnPx
 uqPCwDuAodoGIEBJ6fIPc2cz7ZWxFNN1SnubwXWXZtLHhb9cx7QbMLpXphSfv6dCVAZp
 X/i0ZQ4q3BKfbF3Q3bHPHnGSXdeHvnZ1ifClLBqiE2kX4DMWzTLXHv2j5S+3rv8VPPg/
 EN6A==
X-Gm-Message-State: AOAM5307QghctSI2PHyTsr38oRqLNsPn0WFe65bNwY2FJcC70W2VbgTp
 A2lDU0HMiMBHpV4nF+xYI669+/JYPg3msmDqaOs=
X-Google-Smtp-Source: ABdhPJz8Jk01Oa9yQeykNwQUixDOSgogUkQOfoY+YTQEVaXTvbSeJRS3xejE5ZUVCAaKKtMrNQGRfvZWiMi1Ru5d3z0=
X-Received: by 2002:a19:8c0a:: with SMTP id o10mr5538032lfd.175.1616685686587; 
 Thu, 25 Mar 2021 08:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210319135711.11802-1-vincent.whitchurch@axis.com>
 <4ebdf34a-bd01-68ad-6d27-b1c02d21aebe@talpey.com>
In-Reply-To: <4ebdf34a-bd01-68ad-6d27-b1c02d21aebe@talpey.com>
Date: Thu, 25 Mar 2021 10:21:15 -0500
Message-ID: <CAH2r5msWO8s9zfYOAnRhMj0uP+_phZu8=M3SKQYYi=j-KT5dxA@mail.gmail.com>
Subject: Re: [PATCH v3] cifs: Silently ignore unknown oplock break handle
To: Tom Talpey <tom@talpey.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 kernel <kernel@axis.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Mar 19, 2021 at 9:06 AM Tom Talpey via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> LGTM feel free to add
>
> Reviewed-By: Tom Talpey <tom@talpey.com>
>
> On 3/19/2021 9:57 AM, Vincent Whitchurch wrote:
> > Make SMB2 not print out an error when an oplock break is received for an
> > unknown handle, similar to SMB1.  The debug message which is printed for
> > these unknown handles may also be misleading, so fix that too.
> >
> > The SMB2 lease break path is not affected by this patch.
> >
> > Without this, a program which writes to a file from one thread, and
> > opens, reads, and writes the same file from another thread triggers the
> > below errors several times a minute when run against a Samba server
> > configured with "smb2 leases = no".
> >
> >   CIFS: VFS: \\192.168.0.1 No task to wake, unknown frame received! NumMids 2
> >   00000000: 424d53fe 00000040 00000000 00000012  .SMB@...........
> >   00000010: 00000001 00000000 ffffffff ffffffff  ................
> >   00000020: 00000000 00000000 00000000 00000000  ................
> >   00000030: 00000000 00000000 00000000 00000000  ................
> >
> > Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> > ---
> >
> > Notes:
> >      v3:
> >      - Change debug print to Tom Talpey's suggestion
> >
> >      v2:
> >      - Drop change to lease break
> >      - Rewrite commit message
> >
> >   fs/cifs/smb2misc.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
> > index 60d4bd1eae2b..76cd05b8d53b 100644
> > --- a/fs/cifs/smb2misc.c
> > +++ b/fs/cifs/smb2misc.c
> > @@ -754,8 +754,8 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
> >               }
> >       }
> >       spin_unlock(&cifs_tcp_ses_lock);
> > -     cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
> > -     return false;
> > +     cifs_dbg(FYI, "No file id matched, oplock break ignored\n");
> > +     return true;
> >   }
> >
> >   void
> >
>


-- 
Thanks,

Steve

