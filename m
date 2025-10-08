Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82BBC622E
	for <lists+samba-technical@lfdr.de>; Wed, 08 Oct 2025 19:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7pyuxM1qJujrcTe93h+cZ4UxFH6Em2UfoKr73Xc2DaU=; b=d2s6HSNUONEJqmJjvwzxF/rNOm
	lwxXSLMZR/BqZZY6zQl7UuvpOqRhmEalLMTyfvEPg5yBI57xeFMa63J5m/l1UpML2bf6i2yJc1O34
	bhX66v9Pgb/IL7Bhnd6NFHV4+Ad78qDbdeSYgWZLkCuHZjoBBeWCWXq7J2Xxlh/lvbMxjngCIGhvJ
	AM+zIMPaXrp0O/CRM3AySrgS5WvSt7BstoQpkTTOhuaW7MCsY/oVH8By0FuRay2F/a0+HUjjisCMj
	GFawsx+xsOK0cKqBnMhfLWaNRpwCFI565MD8ikZkRAK7H+ZfI6xbfBVTq7BU0AytCpVX6IFP7fRbO
	1DHbw02Q==;
Received: from ip6-localhost ([::1]:38054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6XpH-007JSg-Mp; Wed, 08 Oct 2025 17:19:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:59551) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6XpC-007JSZ-11
 for samba-technical@lists.samba.org; Wed, 08 Oct 2025 17:19:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so85621f8f.2
 for <samba-technical@lists.samba.org>; Wed, 08 Oct 2025 10:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1759943977; x=1760548777; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7pyuxM1qJujrcTe93h+cZ4UxFH6Em2UfoKr73Xc2DaU=;
 b=ZAw9U++nEeHUvXRdkG5LHRQDpyFF4kdLXxnvOSWN2W5y+M4xChkV8WF5//kp2Dat4c
 ujaLdgVL+AxZTfnTWYOU+xaODVlrIaYKv74a9Da46P5OXULH6Bp81+io0KhDnsT/tFAr
 WJgSOpkpLxmgHxo4vJfm1M2yGzQLsh/IxxAEzeatSu553H9tTJRp/+0xjlRDKgLjk9j1
 DYwshcMThTo60S9QuMuXK43XX1nCYrZ5x+hnWMJVGrtPxS9Obt04qL7qfi9aVdC2WYZ2
 D1sLwYRE/c12ukPxaQoTdZvY4nvBLwKSiN3pT73iqbSg3KKdjjbSNdkJUenSjVOGzVDb
 MUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759943977; x=1760548777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7pyuxM1qJujrcTe93h+cZ4UxFH6Em2UfoKr73Xc2DaU=;
 b=U74e1qiKgNnO+b/bRMCm2cIIJd+XoPVdQM+h3UqQGbXVY0sEHZEHdK1eQBaMYxnWVe
 /2JYYmck5iBSL0nkK9xO8GP7WSxI3HpwmIDgICRBLjly539A+zBvZ3In3nyOJgAFNTjQ
 e6yRtGz6b8zBfeBfOQyooyDbt3pJn1EW6zz5AaWIj7CftMuK8+UuS7H6HXQj1yPJLn1P
 Ey+0Ku+RN586dndX4XtOYU4dJQshMQKQuHpLFUiyW/a3jv7YaB/O3R6/3XfToaiAfLnr
 ktPIlYiXy3jS6SO9EbjxF1TIfLmCm4qu4sz64q3jdRJ/ZoC4+1E8oDxAITLByE58VzU7
 AATw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq+U0tLCK3ehjK4nmJuWlBsKegpw+BWMi0GJ+N0ULFryvkJfdW72x9IPH35mG2hSaPdJYEy8jm+9/B2ZueXLw=@lists.samba.org
X-Gm-Message-State: AOJu0Yy/a4yktU6SDYDeHIEykQh0mjS4Kk4vB+R4iRtcjvx4spobWOQk
 paT8OgRbB5nIA6oqWPXoQJDMD4Qu9NKOmexzl3kYgbaaz6mO3/UFGxZuYy3HU2NUt9k=
X-Gm-Gg: ASbGncukbx5MgA1yDXwbDtLnpNPdzJW4XFBzu49ZO+RzbXiG+etP78pJBzb92BxicsF
 /g4LC/DacznVXXTECjdzVNQ/EtgW/uckp5AGUu0GtXIguY2hAgdKl5Yofo3KLcX5yAIHewRK2sa
 VZClcYVn/8N+tYVWReAKqjildugJeHlMuGKjkS1eXTnLG8T80Ewz7TWjlLqXxMRywZbiDSW3p8M
 pm7XOguj1ojYhqe7KSxDmP/AIHhStLAWXmg3lnpoWY201j3hQ36YKMex2q2Fgqn+7fwMGgtdEMo
 ejVq5Q1zICVSh+cSYffr1nUW9WUke+XofOANNQTZLZA4gk5114MVOzCW57N6WoVNfS/AUPpXfrO
 Uc2t6XGFDRzFqMMea8tWNNWkTTPGNvdOTcmZxGatPbjB5+bBrzca8aa4Op9yyrAufLxtBNlytmj
 5kCO2kQdG3rJe+gBJ2eAwgwQQ7BtoGu4oD9aBNEQ==
X-Google-Smtp-Source: AGHT+IGwV2IWGY48tJXj7XfE/oEPofnleR/8SAfmD8lIPiCmMhG9ARmAgggLfTSsGqYs0jA4TvwNxg==
X-Received: by 2002:a05:6000:40ca:b0:3f1:2671:6d9e with SMTP id
 ffacd0b85a97d-42666ac61a1mr2539280f8f.1.1759943976607; 
 Wed, 08 Oct 2025 10:19:36 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bc01:231a:9f96:9bda:3734:ea43?
 ([2804:7f0:bc01:231a:9f96:9bda:3734:ea43])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e1cc8bsm2913235ad.38.2025.10.08.10.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 10:19:36 -0700 (PDT)
Message-ID: <5bd37df6-1743-4b9c-a83a-a811e221489b@suse.com>
Date: Wed, 8 Oct 2025 14:17:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: client: Move an error code assignment in
 smb3_init_transform_rq()
To: Markus Elfring <Markus.Elfring@web.de>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Bharath SM <bharathsm@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, Pavel Shilovsky <pshilov@microsoft.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Steve French <sfrench@samba.org>,
 Tom Talpey <tom@talpey.com>
References: <02627021-da2f-41f8-9ea7-fd2da96e0503@web.de>
Content-Language: en-US
In-Reply-To: <02627021-da2f-41f8-9ea7-fd2da96e0503@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
From: Henrique Carvalho via samba-technical <samba-technical@lists.samba.org>
Reply-To: Henrique Carvalho <henrique.carvalho@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Markus,

On 10/8/25 2:04 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Oct 2025 18:48:28 +0200
> 
> Convert an initialisation for the variable “rc” into an error code
> assignment at the end of this function implementation.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2ops.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 7c3e96260fd4..2513270ac596 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -4596,7 +4596,7 @@ smb3_init_transform_rq(struct TCP_Server_Info *server, int num_rqst,
>  {
>  	struct smb2_transform_hdr *tr_hdr = new_rq[0].rq_iov[0].iov_base;
>  	unsigned int orig_len = 0;
> -	int rc = -ENOMEM;
> +	int rc;
>  
>  	for (int i = 1; i < num_rqst; i++) {
>  		struct smb_rqst *old = &old_rq[i - 1];
> @@ -4611,7 +4611,7 @@ smb3_init_transform_rq(struct TCP_Server_Info *server, int num_rqst,
>  		if (size > 0) {
>  			buffer = cifs_alloc_folioq_buffer(size);
>  			if (!buffer)
> -				goto err_free;
> +				goto e_nomem;
>  
>  			new->rq_buffer = buffer;
>  			iov_iter_folio_queue(&new->rq_iter, ITER_SOURCE,
> @@ -4634,6 +4634,8 @@ smb3_init_transform_rq(struct TCP_Server_Info *server, int num_rqst,
>  
>  	return rc;
>  
> +e_nomem:
> +	rc = -ENOMEM;
>  err_free:
>  	smb3_free_compound_rqst(num_rqst - 1, &new_rq[1]);
>  	return rc;

I don't think this change improves readability.

I understand that making the assignment explicit is good, but why not
simply set rc to -ENOMEM if !buffer and then goto err_free?

Also, I think its a bit confusing having inconsistent naming styles `e_`
`err_`...

-- 
Henrique
SUSE Labs

