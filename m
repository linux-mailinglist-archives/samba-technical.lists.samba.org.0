Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3FA7763
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 01:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tpxNAEZbBezwq3krS/EPGkxMHdh8CnRju4ktRcIZ7Zk=; b=neRweRvOmE+WRkEPupD7ozdst8
	JmBsc5T5OmgTgJaPp7SuDQvE88Mkg0dQ948NB1q0uyLn1Q2xz61aNIbmb4MqPwV7OmpeWN9RoqZby
	76jXMHXzwnQconMqC4IZmeBy8Zz9/SPgqG8XryUR+qsvh/FHHroAsNduTNvG9HOJHcGwh4QyFSjf9
	jDalrR2jz6C6ktE7Wys/90Gz3trdsD6hNhACpCf/nSihb5gBbLimQuMl70WAyLL3rpU1g7z0e3DKx
	r1fNyh6gRlrBHy6jYdQzN8095vZG2JUtVXMqkLSR8qKmF7VhX72idMM09yXBvFD8D+Udwq63HRbCR
	zkXPF6mw==;
Received: from localhost ([::1]:29124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5HnB-003I0e-Sr; Tue, 03 Sep 2019 23:00:53 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:46104) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Hn7-003I0X-7Q
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 23:00:51 +0000
Received: by mail-io1-xd43.google.com with SMTP id x4so39740903iog.13
 for <samba-technical@lists.samba.org>; Tue, 03 Sep 2019 16:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tpxNAEZbBezwq3krS/EPGkxMHdh8CnRju4ktRcIZ7Zk=;
 b=uBVTXNDGAu2CZ3gfw1R8LXJIkTM7cRM1AKrXvM6VeJhI3/oxjkXgiFGfG+dU/6EXx4
 J5qofNI8wMt78KduWlVBJn7MVxUKmT4XjZ8LfUeHm/DCbRuRtJ9ZcKQ+pv7f5UgXgg5O
 CtwFNhyeyiK5L8eTToQ4g5R2i+XZ/bw3n36qRWHI93hMNkC/M9vHriIsEztNrpFFsDGL
 FoDWTQtPQDGqsIge2R7sm5PjuuevR9DEg5hoebpOpH7kqxFwYTbcFtPCq+NkL3JDL3/C
 G/Fxx3mHYbYFYkp4NgOvmhmY+QUvm6Ccu+B+pjyzvZi7iynzy30Kwabl2lhpxG02/23u
 49ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tpxNAEZbBezwq3krS/EPGkxMHdh8CnRju4ktRcIZ7Zk=;
 b=N3wAR+R3MWpy+9BhIytBttVdJKm95IkOasr2CaJUlgy3S7H5QZIrZU4jaWAuqFkTUl
 cRK1BlZOiUrmQGvwXHU344FRZNX81StdZFLHAzCK3i4A+20qZHDcX8AZM476yUH7bssJ
 WLrNHnSN4igk48D9fAqp+LGQntmp1uY36AsMlbuew5gusCoiURHw6jA23igR+pudDbCt
 yHBJ/cA2BGdDazVUioSGLd9y2NKVvMLQThyuS+CHjeW6gGQuTkvhYbYylsevr6m5ey+r
 9bOd8dr7Yb0ueV4EGsqXPEMO648EkSjbArr1mCqtJ9DTNXM9cWBjhy0k5occoplh3/ka
 Id0Q==
X-Gm-Message-State: APjAAAWDaJq2jrS0CXfm4NqUyepvRlgCvigCwF3659allzAlaJZvtsoT
 d+tLEskQMeQu9OlD/ntXbHeWV6gXJzx9HZJyEwU=
X-Google-Smtp-Source: APXvYqxsOkNd+mfBG98uFsA7r0+q+sM6MuQE6T9/FQt4kuwwmZcu5yVUsRyxEhkBbMuljLlPUe2OD8dgoD6iYadwyDc=
X-Received: by 2002:a5e:d70b:: with SMTP id v11mr3421263iom.252.1567551645380; 
 Tue, 03 Sep 2019 16:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtzztgoW91TvG_wTYju10dNJ+=r8Ncx3f3bebstMZiCpA@mail.gmail.com>
In-Reply-To: <CAH2r5mtzztgoW91TvG_wTYju10dNJ+=r8Ncx3f3bebstMZiCpA@mail.gmail.com>
Date: Wed, 4 Sep 2019 09:00:33 +1000
Message-ID: <CAN05THSp4vOHiZ7jqdVfLSbN2HD8nzEkq5aU_NSGVFFM2_4wTg@mail.gmail.com>
Subject: Re: [PATCH] smb3: log warning if CSC policy conflicts with linux
 kernel client cache mount option
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Reviewed-by: Ronnie Sahlberg <lsahlber@redhat.com>


On Wed, Sep 4, 2019 at 8:54 AM Steve French <smfrench@gmail.com> wrote:
>
> If the server config (e.g. Samba smb.conf "csc policy = disable)
> for the share indicates that the share should not be cached, log
> a warning message in the Linux kernel client if forced client side
> caching ("cache=ro" or "cache=singleclient") was requested on mount.
>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> ---
>  fs/cifs/connect.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index d9a995588c74..85f8d943a05a 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3478,6 +3478,14 @@ cifs_get_tcon(struct cifs_ses *ses, struct
> smb_vol *volume_info)
>          tcon->use_resilient = true;
>      }
>
> +    /* If the user really knows what they are doing they can override */
> +    if (tcon->share_flags & SMB2_SHAREFLAG_NO_CACHING) {
> +        if (volume_info->cache_ro)
> +            cifs_dbg(VFS, "cache=ro requested on mount but NO_CACHING
> flag set on share\n");
> +        else if (volume_info->cache_rw)
> +            cifs_dbg(VFS, "cache=singleclient requested on mount but
> NO_CACHING flag set on share\n");
> +    }
> +
>      /*
>       * We can have only one retry value for a connection to a share so for
>       * resources mounted more than once to the same server share the last
>
> --
> Thanks,
>
> Steve

