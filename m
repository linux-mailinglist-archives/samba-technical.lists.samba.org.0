Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE436D6DA4
	for <lists+samba-technical@lfdr.de>; Tue,  4 Apr 2023 22:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=v9ESVu/8kRfvmc8wUOQJg8h4NJ1ZrS7khNXqATBQNT4=; b=uyYjC3rsbcoYhYOwA+M06axNYY
	78FrZAafm0jlbVRdmUX7pWwVDCfhEtIZw3FgNri1t3PgNpA/XHyLo8lzEs7kjQ6i0BWRfs/glndGD
	PH94vArFe/KbF4ZLgqIITpXDe+Ly02SS5ykfVVJaWjM7DAprCamfindY4Sq9snGTveoenDnsn9sA+
	7tj5Spv54utJwqJUbGS0em0kZpTOSRxpd4j2wjuyYVaHH/UdZJ5JxbrT019ipsjDUrDJoC0txILRj
	pUuPnS2mZae6f7DIaELeLfzsxLBIBTSSv44Uyw4qhb8TD2N2aKqvy+OOFgr64lVemfxkNwpEnsJ3X
	0QImG6oQ==;
Received: from ip6-localhost ([::1]:21952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pjmzd-009Jqk-EQ; Tue, 04 Apr 2023 20:11:01 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:33354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pjmzX-009JqU-2b
 for samba-technical@lists.samba.org; Tue, 04 Apr 2023 20:10:57 +0000
Message-ID: <c4e73fa0c44827c31bdec7c22f4e05df.pc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1680638105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v9ESVu/8kRfvmc8wUOQJg8h4NJ1ZrS7khNXqATBQNT4=;
 b=Pjhlak54qwxKBP2HtY2HQLLC3ei5OuYh1zmFZ/psPiOcElfmPiBKc4LYRc/4B67G+b4c9G
 viS5E/kCUa3zacdjFMi1r0ngnHB/q9OENxGmoSAYGLn1rNBlvzPOYPhR6ZZQ+BZiL4cGpj
 pkcwJPPQeiayhUWV/8eZZN2gXn9aJ5J7nFExwV0Nfkpah2kcPm8xa0D3xiQJO/HBy3YoS+
 rCW5/G+oJYZUxIXrF0ZAO1cVmzym3MAxASc9+AMrQkXPNM1oGrOg63sZwmF7I9Zr130Ts3
 zyHZFAIJGoKUttr4ntPN7nF3EPlkkm4vu8GUmeU6IXIKgMBr1vqZfq1bEDAqEA==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1680638105; a=rsa-sha256; cv=none;
 b=J0U6rrVEff8upoOjuLHz1dnPNKk6qzpnm9VuDlyHQEbgwsXQbZWkV+3RRtcivrkn/DBFVS
 iE/FbVdv3a/d1uFQnsPH9h/877lf6esMQki+GAxOUzZqzxWdGzxMat0k+EIIIOHsLHrmjE
 o5x98rwH+WD4Qd+uG+FRYp52N+k939pvNob2YQHKXBeGEY6EyLOun8RdsgFZ5Gpzs3/wyu
 VXZsua14OJdvhbvMfN1VGyIY5mycyCqRFBRQWkBknQQxmavqJa6YqEHcB6pFyGxTAMKqB1
 yIaDGCBUGbjMK/DdiGldiuh5L7dgtEHINZGeCJnFAa721exjO4OnzDyUVYcGvg==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1680638105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v9ESVu/8kRfvmc8wUOQJg8h4NJ1ZrS7khNXqATBQNT4=;
 b=BIUD2MPJ8bgs0WrvJOIjtOMlwa8/keMxeUsgAxpRJ6deqlq9tW3eE9p3daXq1zaIPdeXOJ
 8AslDjRzD8wF4tBkzBnG2YSyivqo1UhK5yT13W8bCTEs9OG+UzeQNc7lI9CLbLPQZEJK0f
 lnlrQiZ+vuNyuq1n19jsV2qsy6mYq9ltvg7nHzdKd/HCLjwYH9IGmybNzIrN1Mh0F2WVvu
 rMBQcCYEBfWCTKW+8wq7C4qc7iDT7VzztEPSIwAxwC25P0sBNoFqCAzKB/q2le3e2W2oxh
 +16XDgPPCl3X08Rbi11RgCS65c6syMWvoG7Va487BiMUdDSqzbksbdSnQAQVSg==
To: Thiago Becker <tbecker@redhat.com>, sfrench@samba.org,
 linux-cifs@vger.kernel.org
Subject: Re: [PATCH] cifs: sanitize paths in cifs_update_super_prepath.
In-Reply-To: <20230404185908.993738-1-tbecker@redhat.com>
References: <20230404185908.993738-1-tbecker@redhat.com>
Date: Tue, 04 Apr 2023 16:54:55 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: sprasad@microsoft.com, trbecker@gmail.com, samba-technical@lists.samba.org,
 lsahlber@redhat.com, tom@talpey.com, Thiago Becker <tbecker@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thiago Becker <tbecker@redhat.com> writes:

> After a server reboot, clients are failing to move files with ENOENT.
> This is caused by DFS referrals containing multiple separators, which
> the server move call doesn't recognize.
>
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2182472
> Fixes: a31080899d5f ("cifs: sanitize multiple delimiters in prepath")
> Actually-Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> Signed-off-by: Thiago Rafael Becker <tbecker@redhat.com>
> ---
>  fs/cifs/fs_context.c | 6 +++---
>  fs/cifs/misc.c       | 4 +++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> index 6d13f8207e96a..c4d9139b89d29 100644
> --- a/fs/cifs/fs_context.c
> +++ b/fs/cifs/fs_context.c
> @@ -445,7 +445,7 @@ int smb3_parse_opt(const char *options, const char *key, char **val)
>   * cleaning up the original.
>   */
>  #define IS_DELIM(c) ((c) == '/' || (c) == '\\')
> -static char *sanitize_path(char *path)
> +char *sanitize_path(char *path, gfp_t gfp)

Could you please add a {cifs,smb3}_ prefix to it?

>  {
>  	char *cursor1 = path, *cursor2 = path;
>  
> @@ -469,7 +469,7 @@ static char *sanitize_path(char *path)
>  		cursor2--;
>  
>  	*(cursor2) = '\0';
> -	return kstrdup(path, GFP_KERNEL);
> +	return kstrdup(path, gfp);
>  }
>  
>  /*
> @@ -531,7 +531,7 @@ smb3_parse_devname(const char *devname, struct smb3_fs_context *ctx)
>  	if (!*pos)
>  		return 0;
>  
> -	ctx->prepath = sanitize_path(pos);
> +	ctx->prepath = sanitize_path(pos, GFP_KERNEL);
>  	if (!ctx->prepath)
>  		return -ENOMEM;
>  
> diff --git a/fs/cifs/misc.c b/fs/cifs/misc.c
> index b44fb51968bfb..e6f208110de83 100644
> --- a/fs/cifs/misc.c
> +++ b/fs/cifs/misc.c
> @@ -1190,12 +1190,14 @@ int match_target_ip(struct TCP_Server_Info *server,
>  	return 0;
>  }
>  
> +extern char *sanitize_path(char *path, gfp_t gfp);

Please do the above in fs/cifs/fs_context.h.

Otherwise, looks good to me.

Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>

