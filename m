Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0580B69B7F3
	for <lists+samba-technical@lfdr.de>; Sat, 18 Feb 2023 04:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9WOQ7wLPF4Z7CzyOfCF9ZC1FvtnO+vEz6EThqvgi+9k=; b=BPrajIqIFT+2hEEWavasSIXnmQ
	GVWWdq5AZb4PojHj19Lqaa86dVQO07ll8v5asKGbETPXZ0VcJqzlx3/FGQQduptfxIBQr6SLU6pVJ
	IVgHedL+ryr0nK12cJkecAmpAgU2I5JVA18B85TNAe5gUDdo1nNyT1Qy7mq6RsQ4nj+fDj8TeecN0
	Jq6QeRIv5B40TVgClhI8ts373fbcG1RHxBLv6kNCowzIRyKzn3wv9apyhRzqIjAJXl39O8k4jNBFa
	Z1H7/nQmZfI8lhSywdDzeyWlpetRpRpbdbQbvpDOAnKlHImXql1yrf8la95XidCe1/vqQO1we8JS5
	03KI6WEQ==;
Received: from ip6-localhost ([::1]:56526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pTE3h-00D8Ux-3E; Sat, 18 Feb 2023 03:38:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:52074) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pTE3c-00D8Uo-Ay
 for samba-technical@lists.samba.org; Sat, 18 Feb 2023 03:38:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AE65B82F30
 for <samba-technical@lists.samba.org>; Sat, 18 Feb 2023 03:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB455C433EF
 for <samba-technical@lists.samba.org>; Sat, 18 Feb 2023 03:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676690555;
 bh=NvM8rMX7vszmzZ13cFwLKAQaASG65dDWzi5/WCQTomE=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=CE0rrKuOS3SuJ9R0TWg2MNjvLadgNh+Bt1n2s2WGloPLG3gCtCJiTGQ/EkrGjiFuw
 xFaGyZz2yyYe+Oh3P5OwRmAOgOIhD4ounADO0VxgTm25NAzzOlllt3Bo9YEYUH/fXJ
 TPnCiNNygf0Rb+6p1VAffEXzontneXzsvHUWUbzULI595U8KaUvlNLeA6synTIitNA
 BjfOkC+Lv7tvfg9gsTLrEMN1sL0pqwxPxaZmu7t6NbinQYJtksa/EDZEpJGyHitbK3
 Bju0+w1Weke/G9vRxVpTR2COAdzB/xHUMxXbUT1X5IzT0LrUr1rtANingaqJ5z63Yp
 YOlIIJrniQ8eA==
Received: by mail-oi1-f169.google.com with SMTP id o11so2463985oik.7
 for <samba-technical@lists.samba.org>; Fri, 17 Feb 2023 19:22:35 -0800 (PST)
X-Gm-Message-State: AO0yUKVDSack5GMtWxUvOjp5dK2Ks3WMeuspoVGrxkr7SSTNlEcresgg
 a9oOJHFGQsuzxVw1gqoBNsOmjHj4Kbz0nSWTs/c=
X-Google-Smtp-Source: AK7set/XiooE4fdic8DHDR2MO1lKg50DpTkthOAR8RCDo+fI51RFAecJ7GKfs86cRk4RchcreGuAjfy61GhJ8UyaBkY=
X-Received: by 2002:a05:6808:20aa:b0:37f:8c73:4218 with SMTP id
 s42-20020a05680820aa00b0037f8c734218mr916992oiw.253.1676690554761; Fri, 17
 Feb 2023 19:22:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:78d8:0:b0:49f:f8ae:2ce5 with HTTP; Fri, 17 Feb 2023
 19:22:34 -0800 (PST)
In-Reply-To: <20230218002436.give.204-kees@kernel.org>
References: <20230218002436.give.204-kees@kernel.org>
Date: Sat, 18 Feb 2023 12:22:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Y+wCbAy3a_W55fgb2Sy7M9UQUhR+XujaTKZ255YCjGg@mail.gmail.com>
Message-ID: <CAKYAXd9Y+wCbAy3a_W55fgb2Sy7M9UQUhR+XujaTKZ255YCjGg@mail.gmail.com>
Subject: Re: [PATCH v3] smb3: Replace smb2pdu 1-element arrays with flex-arrays
To: Kees Cook <keescook@chromium.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2023-02-18 9:24 GMT+09:00, Kees Cook <keescook@chromium.org>:
> The kernel is globally removing the ambiguous 0-length and 1-element
> arrays in favor of flexible arrays, so that we can gain both compile-time
> and run-time array bounds checking[1].
>
> Replace the trailing 1-element array with a flexible array in the
> following structures:
>
> 	struct smb2_err_rsp
> 	struct smb2_tree_connect_req
> 	struct smb2_negotiate_rsp
> 	struct smb2_sess_setup_req
> 	struct smb2_sess_setup_rsp
> 	struct smb2_read_req
> 	struct smb2_read_rsp
> 	struct smb2_write_req
> 	struct smb2_write_rsp
> 	struct smb2_query_directory_req
> 	struct smb2_query_directory_rsp
> 	struct smb2_set_info_req
> 	struct smb2_change_notify_rsp
> 	struct smb2_create_rsp
> 	struct smb2_query_info_req
> 	struct smb2_query_info_rsp
>
> Replace the trailing 1-element array with a flexible array, but leave
> the existing structure padding:
>
> 	struct smb2_file_all_info
> 	struct smb2_lock_req
>
> Adjust all related size calculations to match the changes to sizeof().
>
> No machine code output or .data section differences are produced after
> these changes.
>
> [1] For lots of details, see both:
>
> https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
>     https://people.kernel.org/kees/bounded-flexible-arrays-in-c
>
> Cc: Steve French <sfrench@samba.org>
> Cc: Paulo Alcantara <pc@cjr.nz>
> Cc: Ronnie Sahlberg <lsahlber@redhat.com>
> Cc: Shyam Prasad N <sprasad@microsoft.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks!

