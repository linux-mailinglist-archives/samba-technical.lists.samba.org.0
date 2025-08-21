Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B4B307D3
	for <lists+samba-technical@lfdr.de>; Thu, 21 Aug 2025 23:04:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BqFDRZEHd3foG9Sj4qHXSiyNL6eVksh4rYIrvyc67lo=; b=eUOlSsz8wWJQw82Jw1q0d0C463
	wHknWGZtq/KC3bhstmDQOcpOms7PmQzui8NmKgJMrvZ9EWsqIL8L0Pwglcl8IZ8ECthk3YRm9gRuO
	uDeSa2xXNOAOX3FNBpa1Z6TiCCCjeHfud+54nfPLRLbUf4rVXdoDNr2zegMHoTIYJ50Flb9L6x23b
	3IJaSrFGAYuOcWRAdeS5fsb1dc405uwrn5o+JiyvS5NhG2WoPG0W0VbpUod848LzBiPTIchsg37d/
	ACiAiiRaBKHHtdDUyUgIclTYg/t9OrG01dttdAKyF0Mha0BV7fBSzX0TpIv0oKcgNqwYPmRA4w3JS
	EqrYa7Pg==;
Received: from ip6-localhost ([::1]:59348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1upCSY-0005Mu-DK; Thu, 21 Aug 2025 21:04:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43076) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upCSU-0005Mn-Nm
 for samba-technical@lists.samba.org; Thu, 21 Aug 2025 21:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=BqFDRZEHd3foG9Sj4qHXSiyNL6eVksh4rYIrvyc67lo=; b=SHwCt9vNEjPbqbLaPSRmjkwHHh
 on5NMj2iVRZfj/FA7IMl3GqB+C62zQPuqQYzKv3dC67mhbnUHNhMcYJI5yA4QnT9rTorhzYUQFypp
 VO4xaLn0UTZfdFXoC3wprX2vKsH4BHdn9/Tl/LeYE9fgMLstOVSM+jchkHbjRSZS9vE+YoN0/SpJA
 r2G0YH8UpixXoEz/ZL8C02RxSdRAEWw7qjpjNusBPNrtok8E/MPL6UR0pq6AUqmJPNPLMqUG7Bpiz
 D8yDr8U4MaF/NUq0weUu53EeH/vqkx2SnXVbbVcKMsH+1W92G/I3OeH0jVMm2QQjCHMgL9fDxuNoV
 UrbbwJx4t6yHa1modBQhch4py/kY6HgVNEUw5/6xJB6jFkJmFypO8eUFdAyhK+YOKFfhbbwt/pA9d
 8XwZ0GzCujtsf7t7thsyz5abs95/hGQI8RAEttw7flN8wKiZstHnifvucXt2CKHPbGyeh4lbCw+T4
 BBkibRuy8qRWEegWGrlLfaIE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upCSU-0009of-03; Thu, 21 Aug 2025 21:04:30 +0000
Message-ID: <8c6027ac-09dc-4ee6-ba82-4afd897dabf6@samba.org>
Date: Thu, 21 Aug 2025 23:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: struct rdma_conn_param uses u8 for responder_resources,
 initiator_depth and private_data_len
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
Cc: Tom Talpey <tom@talpey.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this mail is triggered by the discussion in this thread on
linux-cifs:
https://lore.kernel.org/linux-cifs/f551bf7f-697a-4298-a62c-74da18992204@samba.org/T/#t

In include/rdma/rdma_cm.h we have this:

struct rdma_conn_param {
         const void *private_data;
         u8 private_data_len;
         u8 responder_resources;
         u8 initiator_depth;
         u8 flow_control;
         u8 retry_count;         /* ignored when accepting */
         u8 rnr_retry_count;
         /* Fields below ignored if a QP is created on the rdma_cm_id. */
         u8 srq;
         u32 qp_num;
         u32 qkey;
};

The iwarp MPA v2 negotiation can handle values up to
0x3fff for responder_resources and initiator_depth.
And private_data_len can be 0xffff for MPA v1 and
0xffff - 4 for MPA v2.

I just found that ROCE only supports u8 in the CM ConnectRequest
(and I guess it's ROCE v1 and v2 as well as Infiniband,
but I've only every seen ROCE v2 captures).

BTW: does ROCE also support private data and if how much?

So is it desired to limit iwarp to u8 values too?

Thanks!
metze

