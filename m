Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C502F39C6
	for <lists+samba-technical@lfdr.de>; Tue, 12 Jan 2021 20:14:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7sQqPeeAcZfpeQ/UgZTgzA/DJ2oc6zELeundLq1soks=; b=yzK7aZgN2yOQ8okaXQrAVicSgp
	krCUJWHg+H6Jt/0xpMv+qUJZS6fPqSKQgABwO/go1dHI3rfZIHtjmMtMTxFZz05kU97nU8kUG/Ppg
	JkjorbK+yge8ZV5sSakpQ4LQwhXogmN6OHXaaAFaQt0qB1HzG7Ec32dOSW987kv2qiiL9UiKgshbu
	ZcKRI+ovJveDlkPKLtG1mm7cLSEbhZuSzufErUAuH+czuuYu90hV4waNC0BI5goI1HPgVhcbtIJOf
	k8tk7TXufWzdJwU3GHZYi2C28gnVu2+5MZWgmf8JpPHjBa6/70f2nHjQfawvdYnhLYQK1aGrnW8VD
	1XNQ7+CA==;
Received: from ip6-localhost ([::1]:41650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kzP7B-005SnV-OU; Tue, 12 Jan 2021 19:14:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35880) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzP70-005SnM-Te
 for samba-technical@lists.samba.org; Tue, 12 Jan 2021 19:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=7sQqPeeAcZfpeQ/UgZTgzA/DJ2oc6zELeundLq1soks=; b=3E84j/uwc0WDh6TQ84n+clRiTv
 LcXwXKIKgcEg19a8UrlqFfy9yK5Dku+Hr2DHHFADjmRZ1UKM2IA0vc4uy808fXaWOkBo6o8vpdjTq
 VP1nZjs6PQWyVPHmySdwFXSFXgiOdNUv+jNzh8pSPM89e2FeicSEY+2E4lwf01om+nkLxw1GHtFnW
 2KWorKonr/Whecuvh68r3HzTCduZPhwuVJvXCQ0fu1Uh5NvBMJbQDccOpCr8k/ZHPC7xB4wp4mhv5
 KEybRbUy3cavz7yzjG+6SEqIQv+SGxCq/9sulD9zbNYkR2yln5pvKhs1O25AAGHwOFWZU1uW975dU
 KR/il/E3CHl2jX3/D2s8FqJhD3Y/pMVbSuuRz3J52E4R2UOTjNMglLkwLRom07f8xkgrMJReGEgDd
 rmz4GbG1KUs/VXecf3D4JUf5tiXtRieh0XS4EYLF9L6il45OimQlAsxJlelAzpseVL76lsC+Q3YYO
 orqjTCeYfAsC6cLEUkl16rN2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzP6h-0006A0-7x; Tue, 12 Jan 2021 19:13:31 +0000
Date: Tue, 12 Jan 2021 11:13:28 -0800
To: Shilpa K <shilpa.krishnareddy@gmail.com>
Subject: Re: Initializing case based parameters during share switch in
 create_conn_struct_tos_cwd()
Message-ID: <20210112191328.GC1316956@jeremy-acer>
References: <CAHbM3qgJv3he3LSokE-V1yPUttueT1esXF0vNQqHSnRPDtqz9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHbM3qgJv3he3LSokE-V1yPUttueT1esXF0vNQqHSnRPDtqz9A@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 08, 2021 at 03:27:20PM +0530, Shilpa K via samba-technical wrote:
>Hello,
>
>We are creating DFS referrals when a folder is created under the share
>root. In one instance, an user was trying to create a folder with the name
>"FOLDER~1" (with exactly 8 chars in the folder name) from Windows. So, we
>created the DFS referral with the name ending "FOLDER~1" and returned the
>error STATUS_PATH_NOT_COVERED to the client. Then,the client had sent
>DFS_GET_REFERRALS request. While  processing this request, when
>unix_convert() is called as part of returning the referral, it was
>normalizing the name to lowercase because the name is a mangled name and
>the below parameters were null:
>
>conn->case sensitive = 0
>conn->share_case_preserve = 0
>and default case is lower
>
>The case_sensitive and short_case_preserve were null because we were not
>initializing these values in conn struct to the share configuration that we
>were switching to. We are using below settings for the share:
>
>case sensitive = no
>preserve case = yes
>short preserve case = yes
>default case = lower
>
>I used the code changes that are in the below patch and now we return the
>folder name in the referral as is. Could you please review this patch and
>let me know if it is fine?
>
>Thanks,
>Shilpa

Thanks Shilpa, this does look correct. It sets up the
dfs share in the same way as the case options are created
in source3/smbd/service.c:make_connection_snum().

I think the best fix here would be to factor this code
out into a function called by both make_connection_snum()
and create_conn_struct_as_root() so we know they are
setting things up identically.

I'll set up a gitlab-MR for this. Thanks for your
help !

>  diff --git a/source3/smbd/msdfs.c b/source3/smbd/msdfs.c
>index 50014e1832..d39d7ee859 100644
>--- a/source3/smbd/msdfs.c
>+++ b/source3/smbd/msdfs.c
>@@ -427,6 +427,17 @@ static NTSTATUS create_conn_struct_as_root(TALLOC_CTX
>*ctx,
>        }
>
>        conn->fs_capabilities = SMB_VFS_FS_CAPABILITIES(conn,
>&conn->ts_res);
>+
>+  /* Case options for the share. */
>+  if (lp_case_sensitive(snum) == Auto) {
>+    conn->case_sensitive = False;
>+  } else {
>+    conn->case_sensitive = lp_case_sensitive(snum) == 1;
>+  }
>+
>+  conn->case_preserve = lp_preserve_case(snum);
>+  conn->short_case_preserve = lp_short_preserve_case(snum);
>+
>        *pconn = conn;
>
>        return NT_STATUS_OK;

