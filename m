Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81549530C87
	for <lists+samba-technical@lfdr.de>; Mon, 23 May 2022 12:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mBuqr4Xysnbts/387iae8Z7cheTZBoyBd5m7Gq72ZU8=; b=XpvMNjQJeESG1hLZyQwvJZ22xg
	2LsPwCK0e0AdXWdpHEN6l0lJC4OwOP217U/cYxns4fM5Y1PmHlvkNyqOt/1eV+DF71pTe10pdesM8
	NwCE/onuJ5smMTAU0zNHGRHqQ2BNoIkYi+O/kfXXPj/kF/gb8HHFieaHK1aK5zwNlVAVwjNJNmtb0
	fN2HF1IGzKtOYD0B4I2nVI/w7FC+UFrAVZ3u3BHkm9DTrdELP3Xj/+IjkcbKPrfR0nUw+W2xOFh5E
	MYMBuTf2gwF8wze64QUyOnGYNNI5wdpTeKwIuc6gleEo1uaVAEV2xou/w5SBOG7EEacbqAFPc45do
	GA9cj+mw==;
Received: from ip6-localhost ([::1]:45434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nt54T-002T5N-KU; Mon, 23 May 2022 10:13:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61744) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nt54P-002T5E-I3
 for samba-technical@lists.samba.org; Mon, 23 May 2022 10:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mBuqr4Xysnbts/387iae8Z7cheTZBoyBd5m7Gq72ZU8=; b=N32MaajTAgBZ9DLrXoDHzrLT+V
 Mm4RiSqqAVC1aPSCUflg0URC8guVgNAx1jN3FPmO7MxdiCW8qgtehJY/MG/S3gDmU9b94BwUkBGa4
 VRWS2sYLiKz5oJo/rFY7DWUk2E2VYJ7Uc+Gy1sdSB9dQANYLkH8ID4GJNP+iNloCIuOk3NL05mO9R
 /mQbg7cAp/R0snv4Mg8rXQgMelf6pnrlkCBpJqhpeSEg8Sg4OV2dVciwrzANPbcHeg/d27Xj+h83S
 Gbdx03YHNFPyw+pjEYnH31KBOccBNa77RbqIwuebdJ4MdTQ7Ch2Q64MgnLlpqehnjfXjahjDj3GRt
 gcncL2i6/oXmenp5j0oZwBIwLh/VVpjqj1brem5EoEaMAYLG46EL2UhGJsHxYUDmLM/jeQ4uT/Kj6
 e57b2z3H6HtbnwLA8nTmTlw4+uuBdpiYqFR4txTm9BKXTqaayqCVXkNTM9alq+QUq3WqHXNCj4Gol
 Mvy6OJv9mg+ORWlB9+/EOwu4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nt54O-0027bs-DS; Mon, 23 May 2022 10:13:48 +0000
Date: Mon, 23 May 2022 12:13:47 +0200
To: Steve French via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH][SMB3] Add defines for various newer FSCTLs
Message-ID: <20220523121347.46d2b764@samba.org>
In-Reply-To: <CAH2r5mveWTtio_Aei3VEht6KaxU6quSgwgopvXbFfMtE40q0YQ@mail.gmail.com>
References: <CAH2r5muiMW76Xt2zRNJWTcQVuewEj3Qs3p4oc8tvEyw5f6528g@mail.gmail.com>
 <CAH2r5mveWTtio_Aei3VEht6KaxU6quSgwgopvXbFfMtE40q0YQ@mail.gmail.com>
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
Cc: Steve French <smfrench@gmail.com>,
 Samba Technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Patch looks fine to me:
Reviewed-by: David Disseldorp <ddiss@suse.de>

On Sun, 22 May 2022 19:09:34 -0500, Steve French via samba-technical wrote:

>  #define FSCTL_DUPLICATE_EXTENTS_TO_FILE 0x00098344
> +#define FSCTL_DUPLICATE_EXTENTS_TO_FILE_EX 0x000983E8

This one looks interesting - I wonder what kind of client use it gets.
FICLONERANGE / BTRFS_IOC_CLONE_RANGE is atomic, so it should be possible
to extend Samba's current dup-extents support to handle the new flag
(DUPLICATE_EXTENTS_DATA_EX_SOURCE_ATOMIC) without needing any lower
level changes.

Cheers, David

