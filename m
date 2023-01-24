Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 403A4679822
	for <lists+samba-technical@lfdr.de>; Tue, 24 Jan 2023 13:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=VUvKc4qgvos/AW63Pn+D8+wPcOwMiycIo9rMmeryRSQ=; b=mWEzmwSPMsaSbl4M/fir8MBETM
	Nt8fjIgdwR28CqincSJEoNVVdzEZMYn+3QroaSSo57aJOnTJAeEYPqjElqyV0tQ3Si+3XZfyZ/VnW
	is2bX6Xpjp4Svz2rLif6EjGjbR+j7SsqeF6Z7YAEf4icT1x6Tj3LGdzZq0HKaLWEMAEH8KArKp/ez
	2U5dJM8RNZfT3NuM4lbuKJW0ujtISFr1tFiuwQGYBP3hm67TL0WtMGVHFquqEpyet20Lz2gW7i4xO
	DnduuWkZgAFTwPcrvhxFxkh84EJIR+uOrP5vcUk6SV9gm5G0Yey4hQTyxcXiaq6gAfROjFLzct8Gm
	NgnyIubw==;
Received: from ip6-localhost ([::1]:27464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pKIT6-0026XC-5A; Tue, 24 Jan 2023 12:32:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pKIT1-0026Ww-7z; Tue, 24 Jan 2023 12:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=VUvKc4qgvos/AW63Pn+D8+wPcOwMiycIo9rMmeryRSQ=; b=rHn+PXprGHdEWrWR0unNnVJwSh
 6EXk5y0dgakEdo63c17ySkEL7wncHAJkRzmY4OtvXNHTCMvajhGyH4zma4P7Kzzs32z8Z8ib9RwjS
 I9q/R9WACBESrmKGkdouegPr2jeyZNcJN4frkknjNtJek56nwl3zoN/xQBANs420nwaqP4St2xcOa
 WTtGw7C0cCRL1BotLZxyCAp8bR+TNMujmKzkgHX/8nsLRSqihhnB82sartvHCy/yf+wjAyWbrMHjV
 LBnTEY9pK5I1wHb7dKylYlFGqsK6rjFWufLL5cIxbZulRUy0ahL6drnl0kb96IW/4iZVBjfPdUSg3
 VfTNocvVlllzAObkvlisy8VJB9CuIvd+19K/e0LWUTObtTKdk1n+XrKvXWhV6fzFZ7SK302SFUDaU
 pE+6Hj/QnH+nPKdb6D6b740S3byIip6uoVYCDRPrAPnKf5JALpOyxh5HvL0Wc34z9emFDHzMUGI9L
 6Ua+8rFFfS0JgaSVKHQR6bpb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pKIT0-00A5j9-9V; Tue, 24 Jan 2023 12:31:58 +0000
Message-ID: <c08b0b3f-8ef5-1063-5412-18e96a1809e9@samba.org>
Date: Tue, 24 Jan 2023 13:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [SCM] Samba Shared Repository - branch master updated
To: samba-technical@lists.samba.org, samba-cvs@lists.samba.org
References: <E1pKFPN-006HUv-Jj@hrx0.samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <E1pKFPN-006HUv-Jj@hrx0.samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 24.01.23 um 10:16 schrieb Volker Lendecke:
> The branch, master has been updated
>         via  f7b50bc059d smbd: Use smbXsrv_open_global_parse_record() in .._verify_record()
>         via  132b83d0659 smbd: Simplify smbXsrv_open_global_parse_record()
>         via  2f6776741dc smbd: Move smbXsrv_open_global_parse_record() up in smbXsrv_open.c
>         via  3c779de8cf9 smbd: Simplify smbXsrv_open_global_verify_record()
>         via  f1a66267bcf smbd: Save a few lines in smb2srv_open_lookup_replay_cache()
>         via  35a32171b50 smbd: Fix a typo
>        from  253891032ee python: Don't use deprecated escape sequences
> 
> https://git.samba.org/?p=samba.git;a=shortlog;h=master
> 
> 
> - Log -----------------------------------------------------------------
> commit f7b50bc059d1b5c7e40cdc4e88ef5ee16f7db670
> Author: Volker Lendecke <vl@samba.org>
> Date:   Thu Jan 19 12:29:20 2023 +0100
> 
>      smbd: Use smbXsrv_open_global_parse_record() in .._verify_record()
>      
>      Signed-off-by: Volker Lendecke <vl@samba.org>
>      
>      Autobuild-User(master): Volker Lendecke <vl@samba.org>
>      Autobuild-Date(master): Tue Jan 24 09:15:26 UTC 2023 on atb-devel-224
> 
> commit 132b83d0659ddc25a96327edc1c7dd23b17a56fd
> Author: Volker Lendecke <vl@samba.org>
> Date:   Thu Jan 19 12:25:21 2023 +0100
> 
>      smbd: Simplify smbXsrv_open_global_parse_record()
>      
>      It does not need a db_record.
>      
>      Signed-off-by: Volker Lendecke <vl@samba.org>
> 
> commit 2f6776741dc6469d78b94da22d75f26cccca5fc9
> Author: Volker Lendecke <vl@samba.org>
> Date:   Thu Jan 19 12:22:33 2023 +0100
> 
>      smbd: Move smbXsrv_open_global_parse_record() up in smbXsrv_open.c
>      
>      Avoid a prototype in the next patches
>      
>      Signed-off-by: Volker Lendecke <vl@samba.org>
> 
> commit 3c779de8cf99d0936956a12484fd726d5be46c7e
> Author: Volker Lendecke <vl@samba.org>
> Date:   Fri Jan 6 16:25:03 2023 +0100
> 
>      smbd: Simplify smbXsrv_open_global_verify_record()
>      
>      Don't depend on the record to be passed in, return NTSTATUS. The two
>      flags were a bit confusing to me, now NT_STATUS_OK means "found a
>      valid record with a live process", and NT_STATUS_FATAL_APP_EXIT means
>      we found a stale record from a crashed smbd
>      
>      Signed-off-by: Volker Lendecke <vl@samba.org>
> 
> commit f1a66267bcfcd48f3c7ca2ada3f62d40209163e3
> Author: Volker Lendecke <vl@samba.org>
> Date:   Wed Jan 11 11:44:29 2023 +0100
> 
>      smbd: Save a few lines in smb2srv_open_lookup_replay_cache()
>      
>      Directly initialize variables, don't leave dangling pointers in TDB_DATA
>      
>      Signed-off-by: Volker Lendecke <vl@samba.org>
> 
> commit 35a32171b5067d5b80acffc99f8d43cdc7f5f9a7
> Author: Volker Lendecke <vl@samba.org>
> Date:   Wed Jan 11 08:18:35 2023 +0100
> 
>      smbd: Fix a typo
>      
>      Signed-off-by: Volker Lendecke <vl@samba.org>
>      Reviewed-by: Stefan Metzmacher <metze@samba.org>

These were all reviewd by me...

metze


