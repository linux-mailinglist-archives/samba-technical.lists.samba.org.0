Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9FF372D76
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 18:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qax4kFS52O+5Ogi0OjJfY41ys+uMhtGCBa/bfkovZF4=; b=S4zRESQetyaXtGn3l9oH865n8p
	t+RHF82G4FQwhT5IhwO8Af57i8jWjJd4Y8KS8R/t9c2baxd/r6ML7799UDrf6Sdy0zGRj/d7NPxSf
	4xQqEuPGF8ThL7Yq+UwwWALvYzvvv6huD2uSdwdUN7VzNfL8bMBmw1hhKp3AE5nwoBIq487MdevMg
	JPI21GlfX/QJedisx9Zp8JOOKHv046SspkTK7cNgVHHZjb3+Re0C+uKpUcTvXL7zjoQLWrTLRe10z
	E4+jZxSy7Knd0MVVwfn49VvKFMtIGMEc/wu99etXEgXmYUqeEFJI5PX6nyMenc+M2jXXsuygLo8Bc
	3XL9dSoQ==;
Received: from ip6-localhost ([::1]:59274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldxTJ-00FRhe-AK; Tue, 04 May 2021 16:00:29 +0000
Received: from aserp2130.oracle.com ([141.146.126.79]:56916) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ldxT6-00FRhV-Tb
 for samba-technical@lists.samba.org; Tue, 04 May 2021 16:00:21 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 144DdSbh170143;
 Tue, 4 May 2021 13:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=qax4kFS52O+5Ogi0OjJfY41ys+uMhtGCBa/bfkovZF4=;
 b=PhJWRyf6JdXXXkAPbiO6tzH7k5sDToxDnZQC9XBGvzjMFXGoaO53vyKIuOLK+zpiXujb
 UgoTOGmc1bHSyt1+30Hq5+BCvwMhy4/eclR3GUHaMK29mZLZqCVv86jwzHMaZ5PkN/Gg
 TS7i9Xy3rLiiwZDyBhdKoxRbn6aRBJ7bO+Fpik76mHEnkuoXb6kQh/JgpD/2AI/n3ATt
 Xca3LvLl7LV/WtLcO7mhd7jVV94b7rKxQl8K+92+mKuc2K3HxU6ZsQcxtR64FhiLpLZZ
 WqGkIMQ02V6strBKSPhL74mSARl1M0z+P97bZFJQOwCJTs0rPQifSt6Ke3JwtZ07zden +w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 388vgbq3bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 May 2021 13:46:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 144DjOMr022173;
 Tue, 4 May 2021 13:46:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 388w1e2mtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 May 2021 13:46:21 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 144DkK7C027415;
 Tue, 4 May 2021 13:46:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 388w1e2mta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 May 2021 13:46:20 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 144DkGYn024650;
 Tue, 4 May 2021 13:46:16 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 04 May 2021 13:46:16 +0000
Date: Tue, 4 May 2021 16:44:45 +0300
To: Khaled ROMDHANI <khaledromdhani216@gmail.com>
Subject: Re: [PATCH-next] fs/cifs: Fix resource leak
Message-ID: <20210504134244.GW1981@kadam>
References: <20210504124343.22611-1-khaledromdhani216@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504124343.22611-1-khaledromdhani216@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: IR7c1IK6ySKxeSh7-qqEaUn_7D9ONOVD
X-Proofpoint-ORIG-GUID: IR7c1IK6ySKxeSh7-qqEaUn_7D9ONOVD
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
From: Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: sfrench@samba.org, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 04, 2021 at 01:43:43PM +0100, Khaled ROMDHANI wrote:
> The -EIO error return path is leaking memory allocated
> to page. Fix this by invoking the free_dentry_path before
> the return.
> 
> Addresses-Coverity: ("Resource leak")
> Signed-off-by: Khaled ROMDHANI <khaledromdhani216@gmail.com>

Add a Fixes tag.

Fixes: 583248493f78 ("cifs: add shutdown support")

> ---
>  fs/cifs/link.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/cifs/link.c b/fs/cifs/link.c
> index 1cbe7ec73728..1485c6095ba1 100644
> --- a/fs/cifs/link.c
> +++ b/fs/cifs/link.c
> @@ -686,8 +686,10 @@ cifs_symlink(struct user_namespace *mnt_userns, struct inode *inode,
>  	void *page = alloc_dentry_path();
>  	struct inode *newinode = NULL;
>  
> -	if (unlikely(cifs_forced_shutdown(cifs_sb)))
> +	if (unlikely(cifs_forced_shutdown(cifs_sb))) {
> +		free_dentry_path(page);
>  		return -EIO;
> +	}

Better to move the allocation here.  Avoid calling functions which can
fail in the declaration block.  Better to test for NULL directly instead
of hiding the test inside the build_path_from_dentry() function.

	page = alloc_dentry_path();
	if (!page)
		return -ENOMEM;

The error handling in this function is slightly unweildy...

regards,
dan carpenter


