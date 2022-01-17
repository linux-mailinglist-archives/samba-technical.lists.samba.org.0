Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 384BB490C9E
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jan 2022 17:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1ZC3x25LBMtNsv2xbDb5RHvTPDIaa+Hqsj6VcuV33T0=; b=0mJJ0Y2dQ3+5nZ5VpX3qH3ketI
	62N+j2ynxPMJN6w4Mvea7fmBGhm5jDhVZRBCGQVi4jTZHC051BKjffLtE050PByvSqBKJjNccXsLg
	vkWFeJnGjLrp+k7LpiHScOTCBmv+hC5lHmhsHdRJ1se054xigRLfKZycjq9s2GcStkQS/0oxOXRUL
	qWAHbbnnK9S8mjG6tbLCNO99s8LmUn15WNRE5ncp1f7hoENg5IodWOnRDqeTUFGeJzSd5z01350If
	bK7eMpEHqVmAo/8x7P7qJzfOkN/uN8QMGRhw6nagL6wSaAU6+GgE/O5ESZltELth2OGWgLD+h8lYa
	2waPeh7g==;
Received: from ip6-localhost ([::1]:55724 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n9V3p-009DB8-Dp; Mon, 17 Jan 2022 16:40:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55076) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n9V3j-009DAz-K3
 for samba-technical@lists.samba.org; Mon, 17 Jan 2022 16:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=1ZC3x25LBMtNsv2xbDb5RHvTPDIaa+Hqsj6VcuV33T0=; b=VqcoiQYWX7bQxWsIx9oUYj2w1i
 fHP5ofkJL8/qdMmEvuIKXv5h0GgPm3ZVZ61+3xjWFXmGn8BTDnAMUZIvk/pwYRYk3a5GoGwv2JO4Y
 tlD/ra/wZzrr5dF7asNVhCGteStkL2ed6efRzYP13/6MXW6AJHd5iGLmyUxV1oCbX5/Popn7zhzwL
 6/OfZNKuPhzOvVa8DC4a+deyDDFo4+/S3YRQIOturMDuJp3hMlrigP1UP6WxxelbwTutec7Pn+UJp
 2PQ9TMDdWjEZUyImWcUtqFV3i0nrDu2Otx5ctglh5/rJKRoirHMcwvRIZyM/4Sjv4KbV/L1aQG1Sm
 UzUaBXCF5zqEDUzFRsQUrkVf/6KMorl+1CqLJsDGu+PTbTgSrQPd4yb+dKpXe3ghpfyjdFfBupP+Q
 eaFc2qxMLgk9WrEfr1cf+vFz/K1s2gf2+zM6vVT+GjZWzd9njJublgcFHH1awe/Tm/R7ZGuTJbh0A
 DZj4A0vN31w1rzwnhnowNFvj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1n9V3h-007h84-VK; Mon, 17 Jan 2022 16:40:42 +0000
Date: Mon, 17 Jan 2022 17:40:39 +0100
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Message-ID: <20220117174039.5854dc89@samba.org>
In-Reply-To: <06661a89-4284-9bbe-ac6d-59e21d813b10@samba.org>
References: <E1n9RtZ-001bnc-LI@hrx0.samba.org>
 <06661a89-4284-9bbe-ac6d-59e21d813b10@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Metze,

On Mon, 17 Jan 2022 16:03:55 +0100, Stefan Metzmacher wrote:

> Hi David,
> 
> where's the related merge request for this push?

I pushed directly to autobuild following Andreas' rb+. Looks like I need
to refamiliarise myself with Samba's Gitlab MR workflow. I'll make sure
I go through the proper process next time around, sorry.

Cheers, David

