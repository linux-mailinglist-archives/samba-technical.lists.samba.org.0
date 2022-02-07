Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2694AC6F8
	for <lists+samba-technical@lfdr.de>; Mon,  7 Feb 2022 18:17:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=lwo2mMNm3XWzPJarpKd0C57mn1DiHXXKENy3Qx8Wvek=; b=KyLy4jWRWykTbbM12DZPF1UnxV
	fuhsOOHJXLg/ZHVBfwymcKq6Cke5j1S6nuIGAOW9mmyXpZ6QPTHcVEkybZsaIgD4zjA1D96SM+qHD
	w5BnxUn7x2KYGM+2wUeeoPhw9EISyMcjin4p7RpCVY9Tww9nieaSVrQYPBZUfjXZCzfGP/ipl926A
	MLAzvjFCait39KoOeTLaQv6+K7JWYJtchzAS2TRPeZPUcaFnC/LCH3tf5GvfbxjWQujCfLXp4ntuK
	8LREEVk5pBX9dY03+PpvLtIXcWX9bM/7c1FdsL3dWemae3Krnw79e6F8BIjpEYCxRE4+hZipmNLWC
	w0xcAHlA==;
Received: from ip6-localhost ([::1]:39218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nH7dm-005QwD-2n; Mon, 07 Feb 2022 17:17:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48726) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nH7dg-005Qvz-WB; Mon, 07 Feb 2022 17:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=lwo2mMNm3XWzPJarpKd0C57mn1DiHXXKENy3Qx8Wvek=; b=l3ynt+fl8DiDJyjxK4ixCC/Aqn
 WFb/pN60nAFoWSVENaMD0c5emv/yGydeOFujC0K2eUq5/13MZcym3z251Jg0WGUEWwcXyFkk8Didv
 oCRov7++g0WKUZtBl4tf2Hs8FI7Pq+kTJg90PMtBafL7ZavU9iAA8eB9vQRo6ghltHeUw+TM/an8i
 7rimM9oaNqdWko8UVBcAdpY+WkiThNRpGND7N88AX+VU1Vz8o5OUwrl+M9SC2Nv+Is7tZBpCL8qEo
 x6X/N0Ciz1eK2VjUXS7JtLaUfz+LR4XNZ6R8VOJNL2RfRVfcN6m0io5qtvfx5yDCKg68R6uVErw1V
 BO4qfaAKJoDRZqWg68weXsE2oqyVjzwnm+NhEZRAbMtbe4YXy9/MjoTp0snbUStPHs1qp3rZBCp2Z
 FKWhfGzK9fV60QxSgWmIPLizOaKJWDcptAwT4t7EUQpzvB4J/bEXPQx7WaZ7pOji3vIsE7vmM1dad
 okQ5SUHzmajeQ/6w58+R83ow;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nH7df-002ZbM-Ez; Mon, 07 Feb 2022 17:17:19 +0000
Date: Mon, 7 Feb 2022 09:17:16 -0800
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 samba@lists.samba.org
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
Message-ID: <YgFUHGD0Rit9bL/n@jeremy-acer>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <20220126115058.GA936420@sernet.de> <YfF8+OMLV0UkzicQ@jeremy-acer>
 <9df52f1eb4b6dbda5bc6c63718c28793124c7c98.camel@samba.org>
 <20220207170634.GC1203621@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220207170634.GC1203621@sernet.de>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Feb 07, 2022 at 06:06:34PM +0100, Björn JACKE wrote:
>On 2022-01-27 at 07:00 +1300 Andrew Bartlett via samba-technical sent off:
>> No, you got my meaning perfectly.  Even for Win9X there is, from
>> memory, some strange update to make it do 'raw NTLMv2', instead of LM.
>>
>> I really think we should be able to ditch this, ideally across the
>> codebase but certainly in the AD DC, in 2022.
>
>okay, with the AD DC I agree, I think we can remove it there.
>
>For local SAM's users I would vote to keep LM hashes supported until we ditch
>SMB1 anyway in the not so far future. There are really still people relying on
>this.

Only if this is easy to do in refactoring. If it's going to
be hard to keep them, I vote to remove them and ask such
users to go to guest authentication.

At this point there's no difference in security between
LM hashes and guest authentication.

