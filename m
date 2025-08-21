Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF04B3080E
	for <lists+samba-technical@lfdr.de>; Thu, 21 Aug 2025 23:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tqU0oHf+rGk3eaMDsAPhNeDW/ojF2ZT8hSdz45ahNO4=; b=hzvUQp+/MDDhnrWuwzmDd8rqYh
	fC7h8rYw7dhX3xbUZOnFWIyZNNgn4NS4QZ6ZpT8av2626su4PmqYYKdU85uLb3UekPFdvJRUMS6GN
	ylWTqMkkKIxz1fjbc5cQnNUgUr6NLR758YKChFvG0fL2aTfiluT9hXpnEKFNgZhht0NMccOnG6TjE
	I3x/SMkUGaldTA/TPghrIiAe7InzFMF6No+Z7vTZmaDhkvFPjifQ8/5lfAiEKHogGfGZk320xHODy
	aaa5HB+IITzzx6c720SeVtiIsg5Kb48po/9pouYgDvmYMwTggyAuIuCac/OC4VIWhqIi907MjUe9O
	i7vxg0Lw==;
Received: from ip6-localhost ([::1]:53250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1upCZ2-0005SG-KA; Thu, 21 Aug 2025 21:11:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28750) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upCYx-0005S8-Ol
 for samba-technical@lists.samba.org; Thu, 21 Aug 2025 21:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=tqU0oHf+rGk3eaMDsAPhNeDW/ojF2ZT8hSdz45ahNO4=; b=ubtSe231K9sYmEaFEvk8mQdHJa
 FNWtlo2OeKenV3fdi/wCAsl0DacPrfUiINbL+qhDiodEJoM1uhDcnKmHgroetrVumK2ka4OgJIhlQ
 wOL5bmk8wJyWElK1DNj133TJVgMkFPK1Hxk+huUbzn6BxTJ12Q+nCJtD2tuvYF/3VLC9ov5S0dbyA
 HHqR9vHfks86jZnd1fZdJPcb+3SmBD/pnSZiH5HNjH36IuZxq7C76Ehobp7Z1ZQU9NReokkQkQgTQ
 1pHsXkcaDBsDKffIuEEenytVdOYtC5tZ3NvvRjPYTBoUGfyR45hBbDX4ldEQFYL4h7+tPlvQtIeU1
 Zrgy97oZ+EyTzni556BIAXVMaJwU82+gVffRZdvUFxxXM43vp60h+1tytGw6xInpXIkFWgEKQCfm5
 Od9QTrcVUcgavQQEWXCcQdPpT8S4y7ZvSJnzt/ISqbjAOj6T6QaRjYduYztdvx2eJEjHiO1MDiW43
 s5ll3XyVQ86BQIw2RAuQRN8f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upCYx-0009tU-09; Thu, 21 Aug 2025 21:11:11 +0000
Message-ID: <425ee0dd-328c-484b-bd05-3e043def463b@samba.org>
Date: Thu, 21 Aug 2025 23:11:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct rdma_conn_param uses u8 for responder_resources,
 initiator_depth and private_data_len
To: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <8c6027ac-09dc-4ee6-ba82-4afd897dabf6@samba.org>
Content-Language: en-US
In-Reply-To: <8c6027ac-09dc-4ee6-ba82-4afd897dabf6@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 21.08.25 um 23:04 schrieb Stefan Metzmacher via samba-technical:
> Hi,
> 
> this mail is triggered by the discussion in this thread on
> linux-cifs:
> https://lore.kernel.org/linux-cifs/f551bf7f-697a-4298-a62c-74da18992204@samba.org/T/#t
> 
> In include/rdma/rdma_cm.h we have this:
> 
> struct rdma_conn_param {
>          const void *private_data;
>          u8 private_data_len;
>          u8 responder_resources;
>          u8 initiator_depth;
>          u8 flow_control;
>          u8 retry_count;         /* ignored when accepting */
>          u8 rnr_retry_count;
>          /* Fields below ignored if a QP is created on the rdma_cm_id. */
>          u8 srq;
>          u32 qp_num;
>          u32 qkey;
> };

struct iw_cm_event {
         enum iw_cm_event_type event;
         int                      status;
         struct sockaddr_storage local_addr;
         struct sockaddr_storage remote_addr;
         void *private_data;
         void *provider_data;
         u8 private_data_len;
         u8 ord;
         u8 ird;
};

Also has them as u8...

> The iwarp MPA v2 negotiation can handle values up to
> 0x3fff for responder_resources and initiator_depth.
> And private_data_len can be 0xffff for MPA v1 and
> 0xffff - 4 for MPA v2.
> 
> I just found that ROCE only supports u8 in the CM ConnectRequest
> (and I guess it's ROCE v1 and v2 as well as Infiniband,
> but I've only every seen ROCE v2 captures).
> 
> BTW: does ROCE also support private data and if how much?
> 
> So is it desired to limit iwarp to u8 values too?
> 
> Thanks!
> metze
> 


