Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31542E80
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 20:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EsNSz+aJW3zLlDN9irD3Djr1oPOiMxVrQc2z+fuVvkc=; b=z9rqc53nu3oue1F6R7+5dQLEjW
	HUBpO/bY6mRHmC3/6kQ0xkFREjUwXJyfyQpHwJZEGJ2y26reNzU1zdG/pbXVwKKILupbX4o0qyWgC
	jxJOw1uG1nVqlZ4qAm5xwR6K5AgVhQky2lGvvRBW/59NSGUDWYFa12tWeSh71/f1A6yGRCU6GouKY
	PNKH6UpZhhopP/RyT0C4S4zynw+3lYHjcV2rYHJ7fKQNbBYI8ZnPun/3lszPxP1xxvIBoFu8ZgTmm
	+GVZALys6GI7Nq98mR3EsiYFY5OiMGbh0ozpsx+3qra7HulpP9lsraeoOKMRKo+3cUmm8UslR7i6A
	SjZ8pl7w==;
Received: from localhost ([::1]:41378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hb7tK-001K4m-8L; Wed, 12 Jun 2019 18:22:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13826) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hb7tG-001K4f-AD
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 18:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=EsNSz+aJW3zLlDN9irD3Djr1oPOiMxVrQc2z+fuVvkc=; b=qDzaQPAWrIJ66jaSVL2NoCzYl/
 bME9x9uCaYBT4A/9IUQ6mKJ73q0nFsv2HlyxuthHug2eJAHCPMXV6CrZ58d94JfjXuzreCEoRcC9e
 OtGBOBmlnLN/58heaVaAhqFHgXcRu6duzNIW69fq/fNsDDFbgs/4MDkJwhgA5fMHWwhc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hb7tA-00014y-Ow; Wed, 12 Jun 2019 18:22:25 +0000
Date: Wed, 12 Jun 2019 11:22:22 -0700
To: Stefan Behrens <samba-technical@giantdisaster.de>
Subject: Re: [PATCH] lib/util: Fixup tcopy_passwd() to also copy the
 pw_comment, field
Message-ID: <20190612182222.GA91664@jra4>
References: <cac16911-80da-a27d-deb1-3ce3929cb6a2@giantdisaster.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cac16911-80da-a27d-deb1-3ce3929cb6a2@giantdisaster.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 31, 2019 at 03:33:48PM +0200, Stefan Behrens via samba-technical wrote:
> All fields of the passwd structure are copied except for pw_comment, and
> I needed pw_comment to be copied and here is the commit for the change.
> 
> Bug 13975
> 
> Review appreciated.

Set this to 5 on initialization:

 +     unsigned int num_subobjs;

i.e.

 +     unsigned int num_subobjs = 5;

This then removes the "else" from:

 +     if (from->pw_comment != NULL) {
 +             len += strlen(from->pw_comment)+1;
 +             num_subobjs = 6;
 +     } else {
 +             num_subobjs = 5;
 +     }

Cleaner code IMHO  :-).

Can you fix that and repost and then I'll +1 from me.

Cheers,

	Jeremy.

> From c8c6829e0b167c85fc804b2559a643232a36f9fa Mon Sep 17 00:00:00 2001
> From: Stefan Behrens <sbehrens@giantdisaster.de>
> Date: Wed, 27 Mar 2019 11:26:09 +0100
> Subject: [PATCH] lib/util: Fixup tcopy_passwd() to also copy the pw_comment
>  field
> 
> This change isn't needed by the Samba code itself but by a passdb
> module of mine. This module makes use of the comment field and
> requires that the copy of a passwd structure includes the pw_comment
> field. And I see no reason why all fields of the passwd structure
> are copied except for pw_comment.
> 
> Signed-off-by: Stefan Behrens <sbehrens@giantdisaster.de>
> ---
>  lib/util/util_pw.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/util/util_pw.c b/lib/util/util_pw.c
> index 8035de4392c3..62e6e1e36a64 100644
> --- a/lib/util/util_pw.c
> +++ b/lib/util/util_pw.c
> @@ -34,14 +34,21 @@ struct passwd *tcopy_passwd(TALLOC_CTX *mem_ctx,
>  {
>  	struct passwd *ret;
>  	size_t len = 0;
> +	unsigned int num_subobjs;
>  
>  	len += strlen(from->pw_name)+1;
>  	len += strlen(from->pw_passwd)+1;
>  	len += strlen(from->pw_gecos)+1;
>  	len += strlen(from->pw_dir)+1;
>  	len += strlen(from->pw_shell)+1;
> +	if (from->pw_comment != NULL) {
> +		len += strlen(from->pw_comment)+1;
> +		num_subobjs = 6;
> +	} else {
> +		num_subobjs = 5;
> +	}
>  
> -	ret = talloc_pooled_object(mem_ctx, struct passwd, 5, len);
> +	ret = talloc_pooled_object(mem_ctx, struct passwd, num_subobjs, len);
>  
>  	if (ret == NULL) {
>  		return NULL;
> @@ -54,6 +61,9 @@ struct passwd *tcopy_passwd(TALLOC_CTX *mem_ctx,
>  	ret->pw_gecos = talloc_strdup(ret, from->pw_gecos);
>  	ret->pw_dir = talloc_strdup(ret, from->pw_dir);
>  	ret->pw_shell = talloc_strdup(ret, from->pw_shell);
> +	if (from->pw_comment != NULL) {
> +		ret->pw_comment = talloc_strdup(ret, from->pw_comment);
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.19.2
> 


