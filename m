Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A19572EB8D0
	for <lists+samba-technical@lfdr.de>; Wed,  6 Jan 2021 05:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BhqmsY59ya3fHfoXcrewe93ktRT6SVmBebPAVLSKui4=; b=1d1tC8m1RoiHH4tAeLgEMA0OlW
	i2yYtLXuXsBCdrc/m2UHIQXj4Kh05UnyrhCAF2ERhbRogynk1qz/f0OCGprCRjKvvLDrb2e58FxJC
	CYRK6kQWdEXI/bIT6aGglWrD3QDYcSsGC9uXmcooKHHrDfO+WeXBu8bxhLaJ4Vh+2jMHM99L2HRcm
	ZdDzofupD2z/djnSQsZRtb/79syyeM0fntmY/n5rom/hAmiAUyZgWXhAKRYSWKXno69WATTqKRZry
	U6iCxSPxaLzlHnfGCUQTwWCqWcT29bJp0H5f+QCpWujsihS86eLDz2Korz0biQb9sfrINZjMH1JPA
	kZcYiDcA==;
Received: from ip6-localhost ([::1]:21184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kx0B5-004w7L-Jr; Wed, 06 Jan 2021 04:12:07 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:38321) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kx0Ax-004w7D-AD
 for samba-technical@lists.samba.org; Wed, 06 Jan 2021 04:12:03 +0000
Received: by mail-lf1-x131.google.com with SMTP id h205so3690273lfd.5
 for <samba-technical@lists.samba.org>; Tue, 05 Jan 2021 20:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BhqmsY59ya3fHfoXcrewe93ktRT6SVmBebPAVLSKui4=;
 b=PoCO6p8GHpU7vS2aZkjww+AV3ipfyrlCb1BpTiBImi4DU+rWrJq/Vk8KAi9c5FDXQh
 mFAJ7DraVTYj3lKzK2vDh7WDgy5NZuSaYjAwBZGaRE3LBZyKysFRlpueBSYFjuA8vw9M
 2sLUgZwEPuLFas6XDvNrUtGkBCE6oNzTWRPrzUWB+X+b8l/OszYXJLyV3h5T7QCGt99b
 PMQ0H6/QsFWGmZ+yxnqEP5vs3b6PpF1pNQlWWA08wUNrdp89ovM4JOiy3c7ncr1yXWAq
 IZDACcAm6fxwT6wKJc8jH+WGRQiAzm6re1QqAGv4kJellgo+1bCVqud60acWO7BPKOha
 9sAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BhqmsY59ya3fHfoXcrewe93ktRT6SVmBebPAVLSKui4=;
 b=JEeePjw+It0fxsWnJVf3ZE9NySOQQcdDh0LeG/wNsulTGwEIf+8qic7NsGzOfv2CBD
 qUurCiWbk6vK4jSafkGp6YAZXkgvpDYs+cB0E2oYMYZ0a+BK6otOQpzEFL5KfYoFbmaJ
 lWQpI2N1B9U2iS7Itz0uwBw0UntsOvpVDtIH3LX53zBdQ39+EddMHkwH/zAof8ifnXNL
 em66TN6p62LM6793MuJdREgeA4SWziUkBQ5pkzJ0kJzYHcXqGKEsG8Zn8DSX1LjFomm6
 Uk+YHVCe8Un4SJhANBma9gr6oye/irRFTtwaQJpZw8bEvATnwHOGyvxX2shvj11KG7Yd
 leKw==
X-Gm-Message-State: AOAM5318q0H+849EMdOrogBIH8qUFWq2zN62Tp/hSxp4g8Z3r7Mf8mHz
 i9zz1AFJ6YXZO0WsHk4jMRcUxTuXJ78/vcVjqKU=
X-Google-Smtp-Source: ABdhPJxV6bCJB+k4Ckmm5h2MhpYAhKhpy3K0U3zTSrqtm6MtY5+nLgHRmkeU2eDzFYwDZNMEdhSOATXCK0WBcWpRpq8=
X-Received: by 2002:ac2:5547:: with SMTP id l7mr1064627lfk.313.1609906313402; 
 Tue, 05 Jan 2021 20:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20210105202126.2879650-1-trix@redhat.com>
 <20210105222559.GA4118247@ubuntu-m3-large-x86>
In-Reply-To: <20210105222559.GA4118247@ubuntu-m3-large-x86>
Date: Tue, 5 Jan 2021 22:11:41 -0600
Message-ID: <CAH2r5mu-C3v-Tuz5E8nAFepSiCyypvw0g4ctTt2fjx1vEb9a_A@mail.gmail.com>
Subject: Re: [PATCH] cifs: check pointer before freeing
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: Paulo Alcantara <palcantara@suse.de>, CIFS <linux-cifs@vger.kernel.org>,
 trix@redhat.com, Nick Desaulniers <ndesaulniers@google.com>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 clang-built-linux@googlegroups.com,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next and added cc:stable

On Tue, Jan 5, 2021 at 5:08 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Jan 05, 2021 at 12:21:26PM -0800, trix@redhat.com wrote:
> > From: Tom Rix <trix@redhat.com>
> >
> > clang static analysis reports this problem
> >
> > dfs_cache.c:591:2: warning: Argument to kfree() is a constant address
> >   (18446744073709551614), which is not memory allocated by malloc()
> >         kfree(vi);
> >         ^~~~~~~~~
> >
> > In dfs_cache_del_vol() the volume info pointer 'vi' being freed
> > is the return of a call to find_vol().  The large constant address
> > is find_vol() returning an error.
> >
> > Add an error check to dfs_cache_del_vol() similar to the one done
> > in dfs_cache_update_vol().
> >
> > Fixes: 54be1f6c1c37 ("cifs: Add DFS cache routines")
> > Signed-off-by: Tom Rix <trix@redhat.com>
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>
> > ---
> >  fs/cifs/dfs_cache.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/cifs/dfs_cache.c b/fs/cifs/dfs_cache.c
> > index 6ad6ba5f6ebe..0fdb0de7ff86 100644
> > --- a/fs/cifs/dfs_cache.c
> > +++ b/fs/cifs/dfs_cache.c
> > @@ -1260,7 +1260,8 @@ void dfs_cache_del_vol(const char *fullpath)
> >       vi = find_vol(fullpath);
> >       spin_unlock(&vol_list_lock);
> >
> > -     kref_put(&vi->refcnt, vol_release);
> > +     if (!IS_ERR(vi))
> > +             kref_put(&vi->refcnt, vol_release);
> >  }
> >
> >  /**
> > --
> > 2.27.0
> >



-- 
Thanks,

Steve

