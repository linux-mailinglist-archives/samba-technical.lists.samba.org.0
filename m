Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E2B4878D
	for <lists+samba-technical@lfdr.de>; Mon,  8 Sep 2025 10:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=p2MXBGccQsNucSFWw520nsPaNqkRcggFQoELEgtx0ks=; b=hLCsbuIQCob1NQUXQV087NVKoQ
	aHSPKvC2LGE5k6ZquqS65Ra66/1UERMeAHHskQ8sC7R5aaFG7VuC27jZd+ZZUfmNw0kfj9AqSKxUs
	w6X69GQ4PXl5A85VNKgod6a86uWUUSyadqHzc8e/6XPLe9vwIfX2BpMAvH4PV8Ol8u4G55SSLKnrj
	BvML36o4mO5hvCUbzQqqpAhqVXTpu4xuwXu2WqFUQR2tUX1g6oj1RimFYPFvNfBKL4HKdj1Pe3HY/
	2vRNuIIOWEg0OFwCfm1d5Vp3DPUs7h70q/BZsIvYcewJqWGbtdVPQpw43OxSsScfQk6pNlXfgET/F
	L5TK3Wfw==;
Received: from ip6-localhost ([::1]:27306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uvXZc-003IVj-Ep; Mon, 08 Sep 2025 08:50:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54926) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvXZZ-003IVa-6o
 for samba-technical@lists.samba.org; Mon, 08 Sep 2025 08:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=p2MXBGccQsNucSFWw520nsPaNqkRcggFQoELEgtx0ks=; b=fsrTCofNwtPQaLCSHJ4kEPatRH
 hi7yH44NIdIHr+Uuxsn3b8pd7Su6eaLSQPGXXW4dfgjFS9lFQu94tPn4P2BDfLSice6j7FDtTslYs
 HRSiiDFVM8xAUdAM/u9S2moA/2qJzgDKJow4h/JT/z7HcmdWX+c0F/G4kpPcgx3AekdZigxbMRi5c
 8XUx/Nv9MswPNF2+eV/NsIWle5RxWOI3fwMekCsdPS8Bdy1kg8UGnqogCHoJQc4ikcJwqsBpCx+Lj
 JkQJhKqMkwqhz831OiHeOgFhEMlSElK5OEIlOpoyanlcyeuGi8hyBaOBNXusVtWHnlDc40jnZBbrR
 t3QPYO0Bg//q4+yaHbARfTi6X05zZnG7SdXCD/iBhmrAGYywI01aOsTgyRL0mCtXA67ygJeAuXl17
 nIsysya0VA/aBiZjyrRY3FQsOT9cu5lCP3M5kmovX1mdme7DLynUuLNXvGAoO7EfGong0kuaRHRRX
 Gf+g+ont2WOESFWVtohLcwRt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvXZY-0030F4-0j; Mon, 08 Sep 2025 08:50:00 +0000
Message-ID: <8aaf1c25-1778-4853-a23b-20ecc902f1ce@samba.org>
Date: Mon, 8 Sep 2025 10:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 004/142] smb: smbdirect: introduce
 smbdirect_socket.send_io.pending.{count, wait_queue}
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
References: <cover.1756139607.git.metze@samba.org>
 <2512d1dd03eec49674f317f9b78fc0bee60c2e60.1756139607.git.metze@samba.org>
Content-Language: en-US
In-Reply-To: <2512d1dd03eec49674f317f9b78fc0bee60c2e60.1756139607.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 25.08.25 um 22:39 schrieb Stefan Metzmacher via samba-technical:
> This will be shared between client and server soon.
> 
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Long Li <longli@microsoft.com>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>   fs/smb/common/smbdirect/smbdirect_socket.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
> index 79eb99ba984e..bfae68177e50 100644
> --- a/fs/smb/common/smbdirect/smbdirect_socket.h
> +++ b/fs/smb/common/smbdirect/smbdirect_socket.h
> @@ -54,6 +54,14 @@ struct smbdirect_socket {
>   			struct kmem_cache	*cache;
>   			mempool_t		*pool;
>   		} mem;
> +
> +		/*
> +		 * The state about posted/pending sends
> +		 */
> +		struct {
> +			atomic_t count;
> +			wait_queue_head_t wait_queue;

While doing the rebase on "smb: server: let smb_direct_writev() respect SMB_DIRECT_MAX_SEND_SGES"
I'll change 'pending.wait_queue' into 'pending.zero_wait_queue' to indicate it's woken
when count reached 0. And I'll add a 'pending.dec_wait_queue' in addition that is woken
when count is decremented. I realized that this in needed for the client changes in order
to avoid changing the logic for now.

metze





