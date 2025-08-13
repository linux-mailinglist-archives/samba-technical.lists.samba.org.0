Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9B0B24148
	for <lists+samba-technical@lfdr.de>; Wed, 13 Aug 2025 08:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=TRStFU0iG8B6s9qs4xh8W9VpCXMpgzKi6Yokp8SG6go=; b=Np0GbVRgJcKFWEGq/2Kd72MDw1
	fpcvTYJmVNFi2XD64PaCz2AVI6EbWyS2g/MODOyeb7cWN4DTdNntPd2fl9VnRCmpROKWx/rkutfXJ
	bvlzmwrNRoCwbwSpovoXIPCy5wPvfrBB3IfJKvLIPJowzys7agQXRU7Aec8QlhX6EE69sq6JnTY+1
	ncV0n8SlO1x/uyyzOeZl0WiPHbpLFyp/IXDEMIeWtYdFMzXcSeNIBcb+uXb3T0CNOfM0v/r4X7HNE
	ck8RV86tP5y5rmto6IiQqhrAhe1oKMP/Cfmp1shgIf0t9wAZ21pxoVSkGDx0BPTlhbxmLdzhgp/Zr
	bucD6w9g==;
Received: from ip6-localhost ([::1]:55844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1um4oC-00EwZg-V9; Wed, 13 Aug 2025 06:18:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46920) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1um4o7-00EwZZ-V4
 for samba-technical@lists.samba.org; Wed, 13 Aug 2025 06:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=TRStFU0iG8B6s9qs4xh8W9VpCXMpgzKi6Yokp8SG6go=; b=ArM9DLB3p21I7BnUdHUg0OEQFG
 g2WV7snw7UkP9elqIXS1/WhOIZqJmDFaVXi75cV6TPWQUaShQWKrbPNUtIaPG9ylYmXhO5jFEtdAo
 ze2ksXfOr6RIa1N7I6kcJ5IER35MftQBd8v78+3E9mJkBnnOjsf3WCQj1Ao7p1WvfAQ9Pj09IWuEh
 33AgAFz2LrHVvUtKSvxRUZ0VQ9GS+dRQXq/rFWFw84gQUiHL7aI7FxczmfXgaU2tAIEe0/39OMqxW
 sMeeS1FyevfgDyTD1WPWAEkmCdc3ePHbrvJgENgBGlunYBasW2mEKgHf9FfOtAWVinW+pWSA0Ryzq
 KXbOS0EF9xXP9j9Eo09ObW1+haZC0Ln4kVarUCwbqkIl/fsHvS0GatGYBtQQjG65zGiE4TFHQwZ/K
 kIZdieX+1HbVtLFtaBBx+PJR7MGiyKVat3wmoTcqL/OD6ap6bi4DgoiWHkGypxOBy3pBljx3rL9N7
 H1kJG3ExLY6k3Cw3ni6/oyEP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1um4o6-002YpX-27; Wed, 13 Aug 2025 06:17:54 +0000
Message-ID: <527dc1db-762e-4aa0-82a2-f147a76f8133@samba.org>
Date: Wed, 13 Aug 2025 08:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.16 563/627] smb: client: let send_done() cleanup before
 calling smbd_disconnect_rdma_connection()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
References: <20250812173419.303046420@linuxfoundation.org>
 <20250812173453.306156678@linuxfoundation.org>
Content-Language: en-US
In-Reply-To: <20250812173453.306156678@linuxfoundation.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, patches@lists.linux.dev,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Greg,

Am 12.08.25 um 19:34 schrieb Greg Kroah-Hartman:
> 6.16-stable review patch.  If anyone has any objections, please let me know.
> 
> ------------------
> 
> From: Stefan Metzmacher <metze@samba.org>
> 
> [ Upstream commit 5349ae5e05fa37409fd48a1eb483b199c32c889b ]

This needs this patch
https://lore.kernel.org/linux-cifs/20250812164506.29170-1-metze@samba.org/T/#u
as follow up fix that is not yet upstream.

The same applies to all other branches (6.15, 6.12, 6.6, ...)

metze


