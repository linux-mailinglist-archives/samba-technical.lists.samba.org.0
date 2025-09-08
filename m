Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BFBB4879B
	for <lists+samba-technical@lfdr.de>; Mon,  8 Sep 2025 10:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=v1fYxg3XlYOY3lKTyQIPhBZVMVTl+PB8qiL1nCc61pw=; b=t0y0z6+O4iX6NXwfBmcaD2R1d5
	aiBJIUO0K4lcFAL2nTvjy+PiIBXSss4erSuOMtCZjjW0ZHh3TzPZKPwTDFub5JYOPDkhOO2qMdTMl
	ayfN53VOv1OrTyIH05G21OWcUHXXggUmj7gOd90rQ0yATVqH2ZDFayG16vmCTK1er+YghTKA5hCY8
	wJzA20KPzDelIamv8PSEh1yz1v1Q29zTpNrZeRIQpy0sbmtr4L2WRtmIV69fjYx/f3vrkNV7dnQ/X
	7m51fTGFmt3aPRPRCHWmOkpaCVax5nbdx1bws54JzecNe5MDtC7YqCz/Gi2gMNIKS1NwTE9+YvXij
	zEckShUw==;
Received: from ip6-localhost ([::1]:60062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uvXdS-003Iay-JR; Mon, 08 Sep 2025 08:54:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34176) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvXdO-003Iaq-7b
 for samba-technical@lists.samba.org; Mon, 08 Sep 2025 08:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=v1fYxg3XlYOY3lKTyQIPhBZVMVTl+PB8qiL1nCc61pw=; b=Yy1D05raRLhcHPbkbgzwSGZ/9S
 2lzVqKrzyOtXxyVcO+QfjNPjJ4WkK2IuoPlooMGsvTESRxkGhNRJBdRPR/BiYKThMSEOdEH6N+TzI
 e93nqsljO62kZ+iWyPfE9yw2fmFJcem6B9TwZApzMftEd9YuFZhMEMj1O3gNsUFN/TrbonU9XnGlt
 NTNKxd/0xfC1VU2Z260PJG/lHtcpeH0V6i+YLkuOgV3ZJBf4b08JDZCbdkt9c9m56sbzfc3le4OtF
 KgNod2qvbOpE8xCe+z1w+dlOMl9KU70dKZ0cnpaLerfTJeJsn0/36ih6lCWI1vAbNKxwv3vIGWwOD
 go9IfyGhbUcGjRAfgNbwW4N4A0d03JeSyvYdLmidJSwh+SSUgzwnnaRbhm/bWcPVRcbBqwXHxXnOb
 F2YxzFWoxy2Gg7vCBJqpjXM1P5U5tgrFxo+xJ1X7uQ5/8l9UL0WURs5HbFk3j/U9a0viMQiJP1cJY
 E9034Hqj/qFUEz0H6l/bzTs4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvXdN-0030Is-2o; Mon, 08 Sep 2025 08:53:57 +0000
Message-ID: <552c9115-1b7a-4108-9e0f-7a1fee29ac68@samba.org>
Date: Mon, 8 Sep 2025 10:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 026/142] smb: client: make use of
 smbdirect_socket.send_io.pending.{count,wait_queue}
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
References: <cover.1756139607.git.metze@samba.org>
 <91e2aff5324573c3c99590a28fb3a66c525a0bfa.1756139607.git.metze@samba.org>
Content-Language: en-US
In-Reply-To: <91e2aff5324573c3c99590a28fb3a66c525a0bfa.1756139607.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 25.08.25 um 22:39 schrieb Stefan Metzmacher:
> This will be used by the server too and will allow to create
> common helper functions.
> 
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Long Li <longli@microsoft.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>   fs/smb/client/cifs_debug.c |  2 +-
>   fs/smb/client/smbdirect.c  | 25 +++++++++++--------------
>   fs/smb/client/smbdirect.h  |  2 --
>   3 files changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
> index beb4f18f05ef..7df82aa49e48 100644
> --- a/fs/smb/client/cifs_debug.c
> +++ b/fs/smb/client/cifs_debug.c
> @@ -480,7 +480,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
>   			atomic_read(&server->smbd_conn->receive_credits),
>   			server->smbd_conn->receive_credit_target);
>   		seq_printf(m, "\nPending send_pending: %x ",
> -			atomic_read(&server->smbd_conn->send_pending));
> +			atomic_read(&sc->send_io.pending.count));
>   		seq_printf(m, "\nReceive buffers count_receive_queue: %x ",
>   			server->smbd_conn->count_receive_queue);
>   		seq_printf(m, "\nMR responder_resources: %x "
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 58db3e7d4de3..dd0e1d27e3aa 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -391,8 +391,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
>   		return;
>   	}
>   
> -	if (atomic_dec_and_test(&info->send_pending))
> -		wake_up(&info->wait_send_pending);
> +	if (atomic_dec_and_test(&sc->send_io.pending.count))
> +		wake_up(&sc->send_io.pending.wait_queue);
>   
>   	wake_up(&info->wait_post_send);


In the rebase on "smb: server: let smb_direct_writev() respect SMB_DIRECT_MAX_SEND_SGES"
I'll change wait_send_pending to become 'pending.zero_wait_queue' that is woken when
'pending.count' reaches 0 and change wait_post_send to 'pending.dec_wait_queue'
that is woken on any decrement.


