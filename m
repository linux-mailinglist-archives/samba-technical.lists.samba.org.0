Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACEFC406F8
	for <lists+samba-technical@lfdr.de>; Fri, 07 Nov 2025 15:52:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fp3+7qnkGj3SD8ZunpmtK+vZqqmCCDW44o0W2oGVpHE=; b=jCRyrY9iJHsv9imdfBakc3yq02
	8EUulvxQvvkWl8Ex1wSEldJhjhWe1NrKqOXhihqoVpqM4yX8reg1AwtGMgSaeXKImLlz5pCwAa8yp
	M8/yrCi+XRCYDtfc4WF23KGqHKzWqiNDADcaA9vA07oFAukNVUd4je3IhqC8/Z58fZK4zGH/Vjiig
	1RJtBMV+iZZTY0MwJaAVQplwUI2YWVyPUU77zFF3tJgIqKmfQQWxw7qhYg573laf7l8sylC18rqjP
	xtbrMw6wbE5+bedn0qD703fdRzQmbHcZkVnIdIVqnTqMz0iRWRQVDfe6hVC4buluDKZ5ZRIQjC9U2
	+m5MksDQ==;
Received: from ip6-localhost ([::1]:38496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vHNoo-00BjTu-TP; Fri, 07 Nov 2025 14:52:02 +0000
Received: from mx1.manguebit.org ([143.255.12.172]:57628) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vHNok-00BjTm-Fs
 for samba-technical@lists.samba.org; Fri, 07 Nov 2025 14:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=manguebit.org; s=dkim; h=Content-Type:MIME-Version:Date:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fp3+7qnkGj3SD8ZunpmtK+vZqqmCCDW44o0W2oGVpHE=; b=Mw2jgJ49ez8biiAxasIexEy7W6
 WRKyIjpx2ReCRc3Me0y1Dqif2VAtrank49xgfqoqF8WQ6WQuNzH0G47MPvBgFZpHDz1kJVgoZ+YaN
 54FacZhD8utA2W4E+KqTjLxljGw4cejmGgT2Nr7mER92KyrUCD9U0AEC2HZJv9CYNM8gcb9kzunKI
 tCGXQRPP8WaT+StEENw5TOfpuM/YImF/KRP3+6eUUZFKJieljmC0mf29lnUFeHMqr1cvpdfkE1l35
 CGUjttw9XumO8eFYGygXwlT8MTjFIYVLrNORp5Jsj/4nWM/+sx93UU0mkNk/VtA2EApCmZBBEkd+a
 WjOEgfOQ==;
Received: from pc by mx1.manguebit.org with local (Exim 4.98.2)
 id 1vHNUE-0000000151N-1j2X; Fri, 07 Nov 2025 11:30:46 -0300
Message-ID: <f25e47415998a9d9360ac87eca7292a2@manguebit.org>
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+72afd4c236e6bc3f4bac@syzkaller.appspotmail.com
Subject: Re: [PATCH] cifs: client: fix memory leak in
 smb3_fs_context_parse_param
In-Reply-To: <tencent_5D8667DBC6ECD2FF464349ADEEFD2EE84C06@qq.com>
References: <690da014.a70a0220.22f260.0026.GAE@google.com>
 <tencent_5D8667DBC6ECD2FF464349ADEEFD2EE84C06@qq.com>
Date: Fri, 07 Nov 2025 11:30:46 -0300
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
Reply-To: Paulo Alcantara <pc@manguebit.org>
Cc: linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 syzkaller-bugs@googlegroups.com, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com,
 tom@talpey.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Edward Adam Davis <eadavis@qq.com> writes:

> The user calls fsconfig twice, but when the program exits, free() only
> frees ctx->source for the second fsconfig, not the first.
> Regarding fc->source, there is no code in the fs context related to its
> memory reclamation.
>
> To fix this memory leak, release the source memory corresponding to ctx
> or fc before each parsing.
>
> syzbot reported:
> BUG: memory leak
> unreferenced object 0xffff888128afa360 (size 96):
>   backtrace (crc 79c9c7ba):
>     kstrdup+0x3c/0x80 mm/util.c:84
>     smb3_fs_context_parse_param+0x229b/0x36c0 fs/smb/client/fs_context.c:1444
>
> BUG: memory leak
> unreferenced object 0xffff888112c7d900 (size 96):
>   backtrace (crc 79c9c7ba):
>     smb3_fs_context_fullpath+0x70/0x1b0 fs/smb/client/fs_context.c:629
>     smb3_fs_context_parse_param+0x2266/0x36c0 fs/smb/client/fs_context.c:1438
>
> Reported-by: syzbot+72afd4c236e6bc3f4bac@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=72afd4c236e6bc3f4bac
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>  fs/smb/client/fs_context.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Paulo Alcantara (Red Hat) <pc@manguebit.org>

