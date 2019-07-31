Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 398BB7B982
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 08:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HuyQm5wsMf6SUTZzGl1+o89lPh+2iTZDjCZQ0VnsfEc=; b=VivVbNT/SUOlFL5NHhkBBXAPOO
	GKqy8baZVcdefunhfOMAW+BXSR2EvXZMFlIPxiI9rbb9RXtHrXME9gF5vgrKNt6KHqURWkBgF6VAV
	0f4pyxq9p4QJHa7I1Ldk+Y3kcoK1/J1zgL/LtWhAmQFK9Y4SWTyrExV/ibmUh2sQ/hU1aGTD+8r7P
	O5dFQ/8ghAbho+OJnXiWxjjXUIdvP6wVLxP1cUwUFbCu5D4yrTfJE2JVlsLU/E67LWSnbwLv/0tqz
	wkaXm3ZKVpgwJGHQjx2O3Fq+rg8ul2VO8aVfSocLzIEPRvoQeFd10Qkmbag3eizKHxVC6s6EB1iq1
	o1rU6H9A==;
Received: from localhost ([::1]:65018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hshof-0018Is-UJ; Wed, 31 Jul 2019 06:10:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191]:2297 helo=huawei.com) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hshoZ-0018Il-Ph
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 06:10:22 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3F9AAA095F01FBBB10AA;
 Wed, 31 Jul 2019 13:54:01 +0800 (CST)
Received: from [127.0.0.1] (10.184.225.177) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 31 Jul 2019 13:53:51 +0800
Subject: Re: [PATCH] mount.cifs.c: fix memory leaks in main func
To: <pshilov@microsoft.com>, <lsahlber@redhat.com>, <ab@samba.org>,
 <aaptel@suse.com>, <kdsouza@redhat.com>, <palcantara@suse.de>,
 <lsahlber@redhat.com>, <smfrench@gmail.com>, <liujiawen10@huawei.com>
References: <1c5a44a0-f08c-67f8-227f-957cd161781b@huawei.com>
 <2560210f-739a-1045-4f4d-339d79961175@huawei.com>
Message-ID: <498a2fcb-b703-3386-d252-29494f6a0443@huawei.com>
Date: Wed, 31 Jul 2019 13:53:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <2560210f-739a-1045-4f4d-339d79961175@huawei.com>
Content-Type: text/plain; charset="gb18030"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.184.225.177]
X-CFilter-Loop: Reflected
X-Warn: EHLO/HELO not verified: Remote host 45.249.212.191
 (szxga05-in.huawei.com) incorrectly presented itself as huawei.com
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
From: Zhiqiang Liu via samba-technical <samba-technical@lists.samba.org>
Reply-To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Cc: zhangsaisai <zhangsaisai@huawei.com>, Mingfangsen <mingfangsen@huawei.com>,
 dujin1@huawei.com, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Friendly ping ...

On 2019/7/25 14:55, Zhiqiang Liu wrote:
> From: Jiawen Liu <liujiawen10@huawei.com>
> 
> In mount.cifs module, orgoptions and mountpoint in the main func
> point to the memory allocated by func realpath and strndup respectively.
> However, they are not freed before the main func returns so that the
> memory leaks occurred.
> 
> The memory leak problem is reported by LeakSanitizer tool.
> LeakSanitizer url: "https://github.com/google/sanitizers"
> 
> Here I free the pointers orgoptions and mountpoint before main
> func returns.
> 
> Fixes£º7549ad5e7126 ("memory leaks: caused by func realpath and strndup")
> Signed-off-by: Jiawen Liu <liujiawen10@huawei.com>
> Reported-by: Jin Du <dujin1@huawei.com>
> Reviewed-by: Saisai Zhang <zhangsaisai@huawei.com>
> ---
>  mount.cifs.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mount.cifs.c b/mount.cifs.c
> index ae7a899..029f01a 100644
> --- a/mount.cifs.c
> +++ b/mount.cifs.c
> @@ -1830,6 +1830,7 @@ assemble_mountinfo(struct parsed_mount_info *parsed_info,
>  	}
> 
>  assemble_exit:
> +	free(orgoptions);
>  	return rc;
>  }
> 
> @@ -1994,8 +1995,11 @@ int main(int argc, char **argv)
> 
>  	/* chdir into mountpoint as soon as possible */
>  	rc = acquire_mountpoint(&mountpoint);
> -	if (rc)
> +	if (rc) {
> +		free(mountpoint);
> +		free(orgoptions);
>  		return rc;
> +	}
> 
>  	/*
>  	 * mount.cifs does privilege separation. Most of the code to handle
> @@ -2014,6 +2018,7 @@ int main(int argc, char **argv)
>  		/* child */
>  		rc = assemble_mountinfo(parsed_info, thisprogram, mountpoint,
>  					orig_dev, orgoptions);
> +		free(mountpoint);
>  		return rc;
>  	} else {
>  		/* parent */
> @@ -2149,5 +2154,6 @@ mount_exit:
>  	}
>  	free(options);
>  	free(orgoptions);
> +	free(mountpoint);
>  	return rc;
>  }
> 


