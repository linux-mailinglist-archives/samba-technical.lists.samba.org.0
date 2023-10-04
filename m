Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A07B83F9
	for <lists+samba-technical@lfdr.de>; Wed,  4 Oct 2023 17:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=n6fgb2RMvliaVSodPyJtJYH1uPbFVcaqdW9j3Vxlkec=; b=r56+uXXYboHjWe2laSVBgHSv0M
	85/3VjmS2ojWFQyqYs1FLreUKroauz98W8HSh1mwnLKy3tzwvDf0SY1jWIzcuQY3joC5tdGZynNNt
	XI9xP+9ukWbzSu0W4gNW5LU9JH2HHzfuQhXTPJ9Qu3oy7JZsHJ4q5Hre6G3OHNGf9oEyu1OaOlGdB
	t3H2X7INyQDhXJeav0wmpx77WF2pwAAxKG+J5gCiYwh5hcwm0EweAQVkHuAZHxp4gl2IeZiUIKRjf
	2qDMH4CKqBBbN7rdVoAZNehgDqNM+dIlMOMpu1+BwYUw6pTkahCiR5y9s/SgPyoMAkQRIl7lvayFB
	phL+Iyow==;
Received: from ip6-localhost ([::1]:18466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qo43G-000MAZ-Tn; Wed, 04 Oct 2023 15:44:41 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:50034) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qo438-000MAR-AZ
 for samba-technical@lists.samba.org; Wed, 04 Oct 2023 15:44:37 +0000
Message-ID: <9062eefc4114f9c9162a19f98a1b820c.pc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1696434263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6fgb2RMvliaVSodPyJtJYH1uPbFVcaqdW9j3Vxlkec=;
 b=oEpWru7GGeILHTXTJehZt7ZBpRbRxHYtdw1S3hOnIc+msfgOtX8E8m3yjgT+wNIhSgestx
 kTcVvwKC8ovn86QuzMNV4UNA9gXtzzfp+Wbd8zqKwL7ujcQrzvsgLpMG+hF1oblVTP7YJo
 9TgwXTP8C8P2m7blpLiuFiECuwUkKYcjpOteyPclpL9nQWmjSee/zvDO/QbKxV7a7IRCTB
 u1T/vRbrT/hw2/hDK1gJb8+SG9rZGQumS1/rhfj3EcLNWXao2aqt7E/SWs2uF7suowHFjI
 fIvJV14FO1WFTOtznCEICZZwYGTUB4OlL9CIIqpvS6xvvm3nK2bZjlkkUUWVvg==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1696434263; a=rsa-sha256; cv=none;
 b=r2t6q73eS7si+yynyGzDwlYPlWscm7oBlzB3MInbodXEDnjY5uU41VT2Gjwh9BrKVVL7F9
 Z9pc+wbbQ0awp9TgQ/mplfGHkzhqe175JCKo1NmWH+5TcMDNGf6ZVjfKPWqWh/hnRC3KnI
 +GuxQyLd0yCWmdid7T21xRxYCJcnq5h6A1vYngwQnrdFvcCa/KyRA8YjwIZzRkWSu6AzLy
 AV9ZaV/DFjteV9iMk59TxLy6GlCqa+0Jve906wObehCHSTn/Yi16gxiLi6ZiD4n3bOZki6
 FcAOdrQxMDAVHPK7BI7GcLN/hMjjcR4kPyq4UKwaD6uR7dLffkzFdfTwQNAYbA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1696434263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6fgb2RMvliaVSodPyJtJYH1uPbFVcaqdW9j3Vxlkec=;
 b=rHYrLG642VQyHL7NbYE7JobixAQUE1ML/L6urT8Hjb6UnAK/MvaK6pA1P4+v30ctDr+akI
 w6frp+wVjxTjOzBTFhlYNvHYSU3mTazEz6sa8HQOMLVJXCtMYXqTANiWdCSoFf9DBZ0x+l
 Cn3ixqXmxxSvcjWU5kkO+IQa/Bqp/YGwugZSXDaW7WbCTjg01NV7i4ba8S1sqiq5niqGWn
 JzWyXgVxajfLIqEecdBoh05SD5+LLVMEpRdTSVzgoemx8boKxICy0WbeIC2KVkr+IPMdk8
 78GEBBk7FPFX5ouYwTPZCAR6I1TpPUUZwi9ii8ZilQVsXil4dG85TSGCsh4XYg==
To: Jordan Rife <jrife@google.com>, sfrench@samba.org, lsahlber@redhat.com,
 sprasad@microsoft.com, tom@talpey.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org
Subject: Re: [PATCH] smb: use kernel_connect() and kernel_bind()
In-Reply-To: <20231004011303.979995-1-jrife@google.com>
References: <20231004011303.979995-1-jrife@google.com>
Date: Wed, 04 Oct 2023 12:44:17 -0300
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
Cc: stable@vger.kernel.org, Jordan Rife <jrife@google.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Jordan Rife <jrife@google.com> writes:

> Recent changes to kernel_connect() and kernel_bind() ensure that
> callers are insulated from changes to the address parameter made by BPF
> SOCK_ADDR hooks. This patch wraps direct calls to ops->connect() and
> ops->bind() with kernel_connect() and kernel_bind() to ensure that SMB
> mounts do not see their mount address overwritten in such cases.
>
> Link: https://lore.kernel.org/netdev/9944248dba1bce861375fcce9de663934d933ba9.camel@redhat.com/
> Cc: <stable@vger.kernel.org> # 6.x.y
> Signed-off-by: Jordan Rife <jrife@google.com>
> ---
>  fs/smb/client/connect.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Paulo Alcantara (SUSE) <pc@manguebit.com>

