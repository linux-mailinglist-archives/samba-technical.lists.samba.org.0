Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0BB44554
	for <lists+samba-technical@lfdr.de>; Thu,  4 Sep 2025 20:27:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oZU94zf4qOJWw3Y2ZIiCNprOQcuL1l2VPK5OelIsrbE=; b=tHJWTE1/6G1QMFPm+6iIdixWEc
	o5o9LPk2wtEAoexZb6kVllP7SM+0uwBJEjP+g0OrmFwMGL9r7IBTLwUA7km8Fdv9I/GO73FdAEwIh
	JZdSclOynB8u43N0vr8bH98f7ojP509z0m6bSU26v4EIReG1VDA+6Dl/lPm1k3wv32g7J3w7oQQWO
	RWhfsTagsVjTtCtvTDPo5X7x9qEZVlJke8lbfii1N3n1aExRswysf7m/j+b46eKJyr7orKxDwdylx
	iXrkr1rNNvnIY3LIfwAKBp7d1xsFWlbYW1+Y0nx3O5NYP4M9vX8Hatq8kc0u6P+RlLY4ssw2IrodR
	9/8Fu7LQ==;
Received: from ip6-localhost ([::1]:42000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uuEfz-003497-TG; Thu, 04 Sep 2025 18:27:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42654) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uuEfu-00348z-Ka
 for samba-technical@lists.samba.org; Thu, 04 Sep 2025 18:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=oZU94zf4qOJWw3Y2ZIiCNprOQcuL1l2VPK5OelIsrbE=; b=NjjbSXCAQtBGV5wQLLT7IUmjFO
 /jNi0fedqCva+rqPsXLMO0CSGqxRUt035VdnCkdp5Y5LXQh/6CjwYlFDJ3goM0QMp/m8jDT6JCCvw
 vIzxUOm8xhmIP8jYYX9rN2Fo7aYs2414FUxkT6LKH4KZp+NxeZEYyPVUtwytbX774y2qNbU4pxFrb
 X3ENp4iyL2Js+GdBbQ5CskYw10fk7lsATkBkce87LQO40KzOOlAhbplNDGtYnS90OTNc9X1KKIrfB
 hdC2fihRhu3qJsdA/f3xh0hl6B/U1DZVUbiIZii9p/Wgocavq8jCgFHWHsDxuHhJbrqdBHOqS2Hoe
 9mcA4k/6hegR6do3sVlOCkUTr/1UbcJ/7yknVUkHpLoAKD+sjlQ7f0nzNqU4OdulQL6DCw7vATRR5
 EA7320Xi0X40YhY8LMwk2XAzu4Uz+BuComAyr9sMRHyhPUGD7fwCC1Msppe+QCX7a6ZmD+0SjXNX8
 oW/kPPu/kwBQksz7SzNqUGHt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uuEft-002S3j-2a; Thu, 04 Sep 2025 18:27:09 +0000
Message-ID: <f88d11c2-f716-4f5d-ab37-fec73f2f5d97@samba.org>
Date: Thu, 4 Sep 2025 20:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: server: let smb_direct_writev() respect
 SMB_DIRECT_MAX_SEND_SGES
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
References: <20250904181059.1594876-1-metze@samba.org>
Content-Language: en-US
In-Reply-To: <20250904181059.1594876-1-metze@samba.org>
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
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 linux-rdma@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

this is intended for 6.17 as it fixes a deadlock I was
hitting when I run generic/011. I don't know why it only
happened starting last Friday. I first thought it was a regression
introduced by the patches I was working on on Friday, but
after days of debugging using bpfstrace I noticed siw_post_send()
was called twice with the same qp->sq_get/set values while still
returning 0, as a result smb_direct_writev() was waiting forever
for a completion and st->send_pending becoming 0.

         wait_event(st->wait_send_pending,
                    atomic_read(&st->send_pending) == 0);

This requires the patches in for-next-next to be rebased on top
and this will generate some complicts I need to resolve.
Should I post a v5 of the patches or should I provide a branch
that can replace for-next-next?

With this fix the siw.ko patch is optional for ksmbd a usecase,
but it can be found here if someone is looking for it:
https://lore.kernel.org/linux-rdma/20250904173608.1590444-1-metze@samba.org/

Thanks!
metze

Am 04.09.25 um 20:10 schrieb Stefan Metzmacher:
> We should not use more sges for ib_post_send() than we told the rdma
> device in rdma_create_qp()!
> 
> Otherwise ib_post_send() will return -EINVAL, so we disconnect the
> connection. Or with the current siw.ko we'll get 0 from ib_post_send(),
> but will never ever get a completion for the request. I've already sent a
> fix for siw.ko...
> 
> So we need to make sure smb_direct_writev() limits the number of vectors
> we pass to individual smb_direct_post_send_data() calls, so that we
> don't go over the queue pair limits.
> 
> Commit 621433b7e25d ("ksmbd: smbd: relax the count of sges required")
> was very strange and I guess only needed because
> SMB_DIRECT_MAX_SEND_SGES was 8 at that time. It basically removed the
> check that the rdma device is able to handle the number of sges we try
> to use.
> 
> While the real problem was added by commit ddbdc861e37c ("ksmbd: smbd:
> introduce read/write credits for RDMA read/write") as it used the
> minumun of device->attrs.max_send_sge and device->attrs.max_sge_rd, with
> the problem that device->attrs.max_sge_rd is always 1 for iWarp. And
> that limitation should only apply to RDMA Read operations. For now we
> keep that limitation for RDMA Write operations too, fixing that is a
> task for another day as it's not really required a bug fix.
> 
> Commit 2b4eeeaa9061 ("ksmbd: decrease the number of SMB3 smbdirect
> server SGEs") lowered SMB_DIRECT_MAX_SEND_SGES to 6, which is also used
> by our client code. And that client code enforces
> device->attrs.max_send_sge >= 6 since commit d2e81f92e5b7 ("Decrease the
> number of SMB3 smbdirect client SGEs") and (briefly looking) only the
> i40w driver provides only 3, see I40IW_MAX_WQ_FRAGMENT_COUNT. But
> currently we'd require 4 anyway, so that would not work anyway, but now
> it fails early.
> 
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Cc: linux-rdma@vger.kernel.org
> Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
> Fixes: ddbdc861e37c ("ksmbd: smbd: introduce read/write credits for RDMA read/write")
> Fixes: 621433b7e25d ("ksmbd: smbd: relax the count of sges required")
> Fixes: 2b4eeeaa9061 ("ksmbd: decrease the number of SMB3 smbdirect server SGEs")
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>   fs/smb/server/transport_rdma.c | 157 ++++++++++++++++++++++-----------
>   1 file changed, 107 insertions(+), 50 deletions(-)
> 
> diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
> index 6cfca9a00060..3fb1b797a080 100644
> --- a/fs/smb/server/transport_rdma.c
> +++ b/fs/smb/server/transport_rdma.c
> @@ -1219,78 +1219,130 @@ static int smb_direct_writev(struct ksmbd_transport *t,
>   			     bool need_invalidate, unsigned int remote_key)
>   {
>   	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
> -	int remaining_data_length;
> -	int start, i, j;
> -	int max_iov_size = st->max_send_size -
> +	size_t remaining_data_length;
> +	size_t iov_idx;
> +	size_t iov_ofs;
> +	size_t max_iov_size = st->max_send_size -
>   			sizeof(struct smb_direct_data_transfer);
>   	int ret;
> -	struct kvec vec;
>   	struct smb_direct_send_ctx send_ctx;
> +	int error = 0;
>   
>   	if (st->status != SMB_DIRECT_CS_CONNECTED)
>   		return -ENOTCONN;
>   
>   	//FIXME: skip RFC1002 header..
> +	if (WARN_ON_ONCE(niovs <= 1 || iov[0].iov_len != 4))
> +		return -EINVAL;
>   	buflen -= 4;
> +	iov_idx = 1;
> +	iov_ofs = 0;
>   
>   	remaining_data_length = buflen;
>   	ksmbd_debug(RDMA, "Sending smb (RDMA): smb_len=%u\n", buflen);
>   
>   	smb_direct_send_ctx_init(st, &send_ctx, need_invalidate, remote_key);
> -	start = i = 1;
> -	buflen = 0;
> -	while (true) {
> -		buflen += iov[i].iov_len;
> -		if (buflen > max_iov_size) {
> -			if (i > start) {
> -				remaining_data_length -=
> -					(buflen - iov[i].iov_len);
> -				ret = smb_direct_post_send_data(st, &send_ctx,
> -								&iov[start], i - start,
> -								remaining_data_length);
> -				if (ret)
> +	while (remaining_data_length) {
> +		struct kvec vecs[SMB_DIRECT_MAX_SEND_SGES - 1]; /* minus smbdirect hdr */
> +		size_t possible_bytes = max_iov_size;
> +		size_t possible_vecs;
> +		size_t bytes = 0;
> +		size_t nvecs = 0;
> +
> +		/*
> +		 * For the last message remaining_data_length should be
> +		 * have been 0 already!
> +		 */
> +		if (WARN_ON_ONCE(iov_idx >= niovs)) {
> +			error = -EINVAL;
> +			goto done;
> +		}
> +
> +		/*
> +		 * We have 2 factors which limit the arguments we pass
> +		 * to smb_direct_post_send_data():
> +		 *
> +		 * 1. The number of supported sges for the send,
> +		 *    while one is reserved for the smbdirect header.
> +		 *    And we currently need one SGE per page.
> +		 * 2. The number of negotiated payload bytes per send.
> +		 */
> +		possible_vecs = min_t(size_t, ARRAY_SIZE(vecs), niovs - iov_idx);
> +
> +		while (iov_idx < niovs && possible_vecs && possible_bytes) {
> +			struct kvec *v = &vecs[nvecs];
> +			int page_count;
> +
> +			v->iov_base = ((u8 *)iov[iov_idx].iov_base) + iov_ofs;
> +			v->iov_len = min_t(size_t,
> +					   iov[iov_idx].iov_len - iov_ofs,
> +					   possible_bytes);
> +			page_count = get_buf_page_count(v->iov_base, v->iov_len);
> +			if (page_count > possible_vecs) {
> +				/*
> +				 * If the number of pages in the buffer
> +				 * is to much (because we currently require
> +				 * one SGE per page), we need to limit the
> +				 * length.
> +				 *
> +				 * We know possible_vecs is at least 1,
> +				 * so we always keep the first page.
> +				 *
> +				 * We need to calculate the number extra
> +				 * pages (epages) we can also keep.
> +				 *
> +				 * We calculate the number of bytes in the
> +				 * first page (fplen), this should never be
> +				 * larger than v->iov_len because page_count is
> +				 * at least 2, but adding a limitation feels
> +				 * better.
> +				 *
> +				 * Then we calculate the number of bytes (elen)
> +				 * we can keep for the extra pages.
> +				 */
> +				size_t epages = possible_vecs - 1;
> +				size_t fpofs = offset_in_page(v->iov_base);
> +				size_t fplen = min_t(size_t, PAGE_SIZE - fpofs, v->iov_len);
> +				size_t elen = min_t(size_t, v->iov_len - fplen, epages*PAGE_SIZE);
> +
> +				v->iov_len = fplen + elen;
> +				page_count = get_buf_page_count(v->iov_base, v->iov_len);
> +				if (WARN_ON_ONCE(page_count > possible_vecs)) {
> +					/*
> +					 * Something went wrong in the above
> +					 * logic...
> +					 */
> +					error = -EINVAL;
>   					goto done;
> -			} else {
> -				/* iov[start] is too big, break it */
> -				int nvec  = (buflen + max_iov_size - 1) /
> -						max_iov_size;
> -
> -				for (j = 0; j < nvec; j++) {
> -					vec.iov_base =
> -						(char *)iov[start].iov_base +
> -						j * max_iov_size;
> -					vec.iov_len =
> -						min_t(int, max_iov_size,
> -						      buflen - max_iov_size * j);
> -					remaining_data_length -= vec.iov_len;
> -					ret = smb_direct_post_send_data(st, &send_ctx, &vec, 1,
> -									remaining_data_length);
> -					if (ret)
> -						goto done;
>   				}
> -				i++;
> -				if (i == niovs)
> -					break;
>   			}
> -			start = i;
> -			buflen = 0;
> -		} else {
> -			i++;
> -			if (i == niovs) {
> -				/* send out all remaining vecs */
> -				remaining_data_length -= buflen;
> -				ret = smb_direct_post_send_data(st, &send_ctx,
> -								&iov[start], i - start,
> -								remaining_data_length);
> -				if (ret)
> -					goto done;
> -				break;
> +			possible_vecs -= page_count;
> +			nvecs += 1;
> +			possible_bytes -= v->iov_len;
> +			bytes += v->iov_len;
> +
> +			iov_ofs += v->iov_len;
> +			if (iov_ofs >= iov[iov_idx].iov_len) {
> +				iov_idx += 1;
> +				iov_ofs = 0;
>   			}
>   		}
> +
> +		remaining_data_length -= bytes;
> +
> +		ret = smb_direct_post_send_data(st, &send_ctx,
> +						vecs, nvecs,
> +						remaining_data_length);
> +		if (unlikely(ret)) {
> +			error = ret;
> +			goto done;
> +		}
>   	}
>   
>   done:
>   	ret = smb_direct_flush_send_list(st, &send_ctx, true);
> +	if (unlikely(!ret && error))
> +		ret = error;
>   
>   	/*
>   	 * As an optimization, we don't wait for individual I/O to finish
> @@ -1757,6 +1809,11 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
>   		return -EINVAL;
>   	}
>   
> +	if (device->attrs.max_send_sge < SMB_DIRECT_MAX_SEND_SGES) {
> +		pr_err("warning: device max_send_sge = %d too small\n",
> +		       device->attrs.max_send_sge);
> +		return -EINVAL;
> +	}
>   	if (device->attrs.max_recv_sge < SMB_DIRECT_MAX_RECV_SGES) {
>   		pr_err("warning: device max_recv_sge = %d too small\n",
>   		       device->attrs.max_recv_sge);
> @@ -1780,7 +1837,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
>   
>   	cap->max_send_wr = max_send_wrs;
>   	cap->max_recv_wr = t->recv_credit_max;
> -	cap->max_send_sge = max_sge_per_wr;
> +	cap->max_send_sge = SMB_DIRECT_MAX_SEND_SGES;
>   	cap->max_recv_sge = SMB_DIRECT_MAX_RECV_SGES;
>   	cap->max_inline_data = 0;
>   	cap->max_rdma_ctxs = t->max_rw_credits;


