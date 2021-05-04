Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A9372BCA
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 16:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZmJ5I+1Rzh+1ETdshh+H96MHb0GU0TZshgd5tQa/Wfw=; b=Cql9WgDPw/qdCGWx2sG9iaAQg8
	X1SlRibDCTyZ3RahNVPWegHFm/a2v2RKwOrFZJLw7Nn95MN/znCJtIqMdmcR7Nhyou166gK3jrcOj
	LFpiE5X13U3NRn2lQ6A869+uaH5/eDEraVw4E5ald4PGDmtAUWNC3WUhCqv5AN6xSi0+pwRWvjwIq
	6TsyOm82G3fIt5k7GGM1vaSAxhEqviBPSNVqeGSruae/+/Vt1V7QZ6A1skcqRKXq2vgCWIoMgVd3G
	tIQkNgly7THD4gmmcrzCcVirKdg4ayKJbWdHitZuLp1WXWPGPN6uqzvtnYpEPOqAZivvzEVfxYuIg
	+sZofOuA==;
Received: from ip6-localhost ([::1]:56496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldvoz-00FRDS-OR; Tue, 04 May 2021 14:14:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42946) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldvou-00FRDL-4h
 for samba-technical@lists.samba.org; Tue, 04 May 2021 14:14:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so1442921wmv.1
 for <samba-technical@lists.samba.org>; Tue, 04 May 2021 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZmJ5I+1Rzh+1ETdshh+H96MHb0GU0TZshgd5tQa/Wfw=;
 b=bEDZwFiutKnibseve94T0+UEHpmneNa7QhdP115DLEBWQ9tkL77SfMJtQbimFMiu6T
 45yr2byj9jeXPSEFFJXZgoeoHodC+m/XBRD0O36p3xHknp0LzfcL2deMTfh/Xk4wC+ga
 58zBJ/6t3EuszXvrvM3O/8CGJOwmlSNBJ99LL3HBExaq+Ub5HX7RLSC1uhwLvmLGHeYT
 rbobHJCOg5bvfQ7ViAtAamiia7aLZaCjDFSjdciFhmXfTMXbUZCIjimw9SXxbzLE+4jj
 CKQy3i1LuoK+9kknLhM/3F7e5WCjSSsSWv3seZwkZO8AgAcLWRiMxBDmofjzoaDRFQmf
 Vq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZmJ5I+1Rzh+1ETdshh+H96MHb0GU0TZshgd5tQa/Wfw=;
 b=dW/n7yRYOhbS+EpHd7ERwBOUCI+SaUx7H7H1vM18gkpGRI0KxxDGUAgg8dDiUneHvW
 pNItVdGXl40koBwaeLAFg9mGnkz/cTk9teNgobBf+WszwmkC0kmKXL3EB0ODVWufOq5r
 IVwcMw8S0ljqIHGvPQV9h3agky74BxuT6vGyIxyB2YdR6uJEsvVCNrplwwTmE//NlqdN
 9IMIP5awUAtfo3RDXu905ClqKt+91IcqUMqLmfmTz8eM1jOmv5CcPaq1l9ZsPUL5ukoM
 oQjDr8Lk0CJwEPUAjn7aiJDEO2Jk+Lcx2MRfmqLZ3iwvEjENxWv34oGhQfSzye0v+bgf
 liAA==
X-Gm-Message-State: AOAM532bMOhi/kw8rfALTC7pjBKvy3zf+2svbqQd0nW8NfPiBQy01e2P
 xXmKCSYl0D427kERwEytoXc=
X-Google-Smtp-Source: ABdhPJzzgZ7svv6P8SbOu4kzJFzL/JMdB14X1fYh2f6sZsS2R06Wrp7f/5po0KFRMPyz59p5I+coiA==
X-Received: by 2002:a1c:b002:: with SMTP id z2mr27620989wme.26.1620137678989; 
 Tue, 04 May 2021 07:14:38 -0700 (PDT)
Received: from ard0534 ([197.2.237.199])
 by smtp.gmail.com with ESMTPSA id x8sm16428403wrs.25.2021.05.04.07.14.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 May 2021 07:14:38 -0700 (PDT)
Date: Tue, 4 May 2021 15:14:35 +0100
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH-next] fs/cifs: Fix resource leak
Message-ID: <20210504141435.GA24514@ard0534>
References: <20210504124343.22611-1-khaledromdhani216@gmail.com>
 <20210504134244.GW1981@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504134244.GW1981@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Khaled Romdhani via samba-technical <samba-technical@lists.samba.org>
Reply-To: Khaled Romdhani <khaledromdhani216@gmail.com>
Cc: sfrench@samba.org, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 04, 2021 at 04:44:45PM +0300, Dan Carpenter wrote:
> On Tue, May 04, 2021 at 01:43:43PM +0100, Khaled ROMDHANI wrote:
> > The -EIO error return path is leaking memory allocated
> > to page. Fix this by invoking the free_dentry_path before
> > the return.
> > 
> > Addresses-Coverity: ("Resource leak")
> > Signed-off-by: Khaled ROMDHANI <khaledromdhani216@gmail.com>
> 
> Add a Fixes tag.
> 
> Fixes: 583248493f78 ("cifs: add shutdown support")
>

Yes, I will add a Fixes tag.

> > ---
> >  fs/cifs/link.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/cifs/link.c b/fs/cifs/link.c
> > index 1cbe7ec73728..1485c6095ba1 100644
> > --- a/fs/cifs/link.c
> > +++ b/fs/cifs/link.c
> > @@ -686,8 +686,10 @@ cifs_symlink(struct user_namespace *mnt_userns, struct inode *inode,
> >  	void *page = alloc_dentry_path();
> >  	struct inode *newinode = NULL;
> >  
> > -	if (unlikely(cifs_forced_shutdown(cifs_sb)))
> > +	if (unlikely(cifs_forced_shutdown(cifs_sb))) {
> > +		free_dentry_path(page);
> >  		return -EIO;
> > +	}
> 
> Better to move the allocation here.  Avoid calling functions which can
> fail in the declaration block.  Better to test for NULL directly instead
> of hiding the test inside the build_path_from_dentry() function.
> 
> 	page = alloc_dentry_path();
> 	if (!page)
> 		return -ENOMEM;
> 
> The error handling in this function is slightly unweildy...
> 
> regards,
> dan carpenter
>

Yes, it would be better to move the allocation...
I will send a V2.

Thanks.

