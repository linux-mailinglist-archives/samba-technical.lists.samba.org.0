Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0F60D2D9
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 19:57:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZovwSwyu6Q2oA76F/ZVDm7nir7d37O+iBiSH05w5zSo=; b=vNRKIS7QL3Z0hZyxJ9JUUp1boP
	/WXzOcLqCJpHcAy/V+TAgZRjslRC9zfjZxUuRnDxyR36Znjkv7xcsfPw+xigJs2EIywd4ZcMQd9MZ
	m2uIqbuLNJlZCtmw6joYwDBeFi3ufClBf9DXIUHkP8AHH25l/RBBlPEMykAl+Md3ImuCtM2xLtzYO
	FF9VLj2VLQ8uVcSNYjIbvocq9WYlpXC+4CUW/J1yHNkDdtJLYYwT7EP7FuALmSO3elEckgjMlFij2
	/h6j+ubulo7MurRCYQGQMBvtko8ls3W6V5vyzi7LYcFl4GVXq1QxvzBSppohberWHMlkjcb5AStEF
	QogiwbVA==;
Received: from ip6-localhost ([::1]:54808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onOB2-0062f5-IC; Tue, 25 Oct 2022 17:57:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28888) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onOAy-0062ev-2s
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 17:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ZovwSwyu6Q2oA76F/ZVDm7nir7d37O+iBiSH05w5zSo=; b=FmKsQ2SDoMCpSCyCXN14K1au7s
 /cO4SB3ntSddPDlW54Q2KpX2rqEaUzzBs099Wf1tCZNiW9u9UKHoyf4dfcBPvqSmUSYeiyqYibv8r
 PKo3qa7a4b9NV9i9rKecjVAswNJcclTiWsODq3a7kXzetKkZlF2uLEAa69Q2d8ozTcQTz80/39bbp
 spmr9uB66cWwiQC9iTOCaYCx87WTI+BUgyN8VdfkkaozqBbV2Pe9VO4RGAAi7/Xu8bYvrsykvIoB3
 M5V2AKQ3eJbvBxn6AVM25otbb8aXkBVwnB2nU0v5SH3pha7pI5TCV3UVPUnG4a+rULQfNeDQxGCQt
 /xmC0cxlcuV2S34ssEwnxrMk/aKE9ckmJV1s6tbC+FDw2BXI6DyutDmhHoEYAXHpUM62SI5IFTUfy
 JXFWxwOb2eTi2wVjXGzc/4BD5MO8j1w6h2CXqLWLtT3DDgn44lXBn+fcIaILOcioZ4F2fCLCGJ9fk
 YYmPvxgnxYMKJYlfX2mi5cwH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onOAx-005lqr-9S
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 17:57:19 +0000
Message-ID: <91404b18-9bfd-a9c8-dc5a-f18672933b6a@samba.org>
Date: Tue, 25 Oct 2022 18:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: smbclient --max-protocol=NT1: why it requres setting MIN protocol
 too?
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
In-Reply-To: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 25/10/2022 16:45, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> When trying to use current smbclient to connect to, say, a windowsXP 
> machine
> (which implements only NT1 protocol), smbclient has to be told to use lower
> protocol version than it's default - this is intended.
> 
> But the thing is that it doesn't work:
> 
>    $ smbclient --max-protocol=NT1 //testhost/share
>    Unable to initialize messaging context
>    protocol negotiation failed: NT_STATUS_INVALID_PARAMETER_MIX
> 
> Using -m/--max-protocol=NT1 *also* requires setting another option:
> 
>    $ smbclient --max-protocol=NT1 --option='client min protocol = CORE' 
> //testhost/share
> 
> This way it actually works.
> 
> Can't smbclient either warn about this situation, or better yet,
> lower its min protocol automatically if it is greater than
> the requested max protocol?
> 
> Thanks,
> 
> /mjt
> 

I am just trying to understand this, from what I thought I knew. SMB is 
a negotiating protocol, so shouldn't smbclient negotiate the best 
version of SMB to use ? i.e. You shouldn't have to tell it what version 
to use.

Rowland


