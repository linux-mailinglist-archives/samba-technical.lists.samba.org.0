Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F1758F5E0
	for <lists+samba-technical@lfdr.de>; Thu, 11 Aug 2022 04:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VJM36uWLDxfeJQlAFkEV/QezYqkubDOj56Ng+gg+/7E=; b=YjE8hepPzkcEr//I6boV01Tb+M
	hcRvidodMA+MS+3pb6HsDFnVrrao6dAhEwdHfl2z9i/AV0GSuYvNGG/mCf5JSVombdtmK+wpHaGw3
	Q6yBptbb9ewxbPeDJb0l8REA1n/MhxWrsllP9gi2mIGrmKnlb3DSgskmEtwFvLRB8AFkPr7QdS1Rh
	liuHfXwn71oXJTHPEgOLkrklZxBiQs5Y2weko5TC62g31pLkyaCUcxLHu+/swy/TrOdnckK7MT8X/
	DhXLAKUM1KsFT6g/uiH7TnI/WWix5ja6Y3QTG7aI1Kw/z7GFK4R0vXgXISlFpZnnDH+OXffA7q41L
	KkdP76aQ==;
Received: from ip6-localhost ([::1]:46990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oLxuo-006pg4-7z; Thu, 11 Aug 2022 02:27:18 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:40529) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oLxuk-006pfv-13
 for samba-technical@lists.samba.org; Thu, 11 Aug 2022 02:27:16 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id q190so17035442vsb.7
 for <samba-technical@lists.samba.org>; Wed, 10 Aug 2022 19:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=VJM36uWLDxfeJQlAFkEV/QezYqkubDOj56Ng+gg+/7E=;
 b=Ej9pFI8Q7kvV+CFv37XGsy/NEn86Qcpx0Xv7otEUvny412pfSUyQLt6QwEemb6ohKT
 gEhShEl6cVmN0KBYH5L9xLPajyTkKF74oFnEGOigX3kA/etAbo9mBUUiEp1hVRD8lZfj
 0LaSFMbj3PZXhK4VwCIEPhqpO2OxATZQ8/2DeqJKRLVjzk/Sdrny8+YJ3EghO6hjAioA
 NaMGbRwvxcl0Losi2omS9ClpLT8qkEG396YP3d4LXWibELjNgYVU7rBjcwBMvEipJxdo
 UQOj/BlYI6m2ueYLgQ5c8TGzKoBLlN3jWoYwqZsSHVOLH8PbMl5ySuPXVlB7MUHxvBwL
 /nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=VJM36uWLDxfeJQlAFkEV/QezYqkubDOj56Ng+gg+/7E=;
 b=Y/dHEl0hmWTetZi3ZclwyJLgJbP77btkUvIjwfyGBk4GhEpHxgp9xvOQcrzdf7IpNA
 fzvtLAH0FmZZQdZLFUZChLqQh/56kCLNUVWENqkDQMMzGgIsu+DELZJZ5tt75p4QwHbT
 YVy3eozbnWz+olafUz4GYBOD0EgvLhAQh+2BT8Q7SSvF0UU5boRGeQLsnyD1MbvHYBcy
 OsVKzq/0ABrZbIzMpsJ5pOu+sJ7ksQpeHzanDj4UZed8A49ckOu3ekvRbJAVyjtEAt4v
 G9JygDc0QjMImrvBXVEyBw3xUuf1CPunxer2esynhUv2vjJJimhshVqiVFWPYowRfXfK
 BdtQ==
X-Gm-Message-State: ACgBeo3sma+0tEcsIAIvmCkCVZ4gZ66Kshx7uHiFq0ULavNQzqy69qy7
 1ACtFOJLe/+95D2AZdeNYMHa4PF8F7bYfT6aK+I=
X-Google-Smtp-Source: AA6agR6ydFsGzmNajdFj2oPokfsZ87P0NQSCiy1h2s6ZTRZ6d5WPYinPuMD4H76wcmQfpSvGcKNJwFsM3Pw1+r24Y4s=
X-Received: by 2002:a67:b24b:0:b0:357:31a6:1767 with SMTP id
 s11-20020a67b24b000000b0035731a61767mr12620416vsh.29.1660184831703; Wed, 10
 Aug 2022 19:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <165996923111.209242.10532553567023183407.stgit@warthog.procyon.org.uk>
 <c4e26f69d38c4294038430487bf10e88fa980e0b.camel@kernel.org>
In-Reply-To: <c4e26f69d38c4294038430487bf10e88fa980e0b.camel@kernel.org>
Date: Wed, 10 Aug 2022 21:27:00 -0500
Message-ID: <CAH2r5mubvk83SkDmiw0YUW2W6g0o7-Q3hr1KKtOC1DRRP6yOcQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Remove {cifs,nfs}_fscache_release_page()
To: Jeff Layton <jlayton@kernel.org>
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
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 David Howells <dhowells@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Aug 8, 2022 at 9:51 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Mon, 2022-08-08 at 15:33 +0100, David Howells wrote:
> > Remove {cifs,nfs}_fscache_release_page() from fs/cifs/fscache.h.  This
> > functionality got built directly into cifs_release_folio() and will
> > hopefully be replaced with netfs_release_folio() at some point.
> >
> > The "nfs_" version is a copy and paste error and should've been altered to
> > read "cifs_".  That can also be removed.
> >
> > Reported-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: David Howells <dhowells@redhat.com>
> > cc: Jeff Layton <jlayton@redhat.com>
> > cc: Steve French <smfrench@gmail.com>
> > cc: linux-cifs@vger.kernel.org
> > cc: samba-technical@lists.samba.org
> > cc: linux-fsdevel@vger.kernel.org
> > ---
> >
> >  fs/cifs/fscache.h |   16 ----------------
> >  1 file changed, 16 deletions(-)
> >
> > diff --git a/fs/cifs/fscache.h b/fs/cifs/fscache.h
> > index aa3b941a5555..67b601041f0a 100644
> > --- a/fs/cifs/fscache.h
> > +++ b/fs/cifs/fscache.h
> > @@ -108,17 +108,6 @@ static inline void cifs_readpage_to_fscache(struct inode *inode,
> >               __cifs_readpage_to_fscache(inode, page);
> >  }
> >
> > -static inline int cifs_fscache_release_page(struct page *page, gfp_t gfp)
> > -{
> > -     if (PageFsCache(page)) {
> > -             if (current_is_kswapd() || !(gfp & __GFP_FS))
> > -                     return false;
> > -             wait_on_page_fscache(page);
> > -             fscache_note_page_release(cifs_inode_cookie(page->mapping->host));
> > -     }
> > -     return true;
> > -}
> > -
> >  #else /* CONFIG_CIFS_FSCACHE */
> >  static inline
> >  void cifs_fscache_fill_coherency(struct inode *inode,
> > @@ -154,11 +143,6 @@ cifs_readpage_from_fscache(struct inode *inode, struct page *page)
> >  static inline
> >  void cifs_readpage_to_fscache(struct inode *inode, struct page *page) {}
> >
> > -static inline int nfs_fscache_release_page(struct page *page, gfp_t gfp)
> > -{
> > -     return true; /* May release page */
> > -}
> > -
> >  #endif /* CONFIG_CIFS_FSCACHE */
> >
> >  #endif /* _CIFS_FSCACHE_H */
> >
> >
>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>



-- 
Thanks,

Steve

