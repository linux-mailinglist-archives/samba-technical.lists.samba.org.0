Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B855ECF73
	for <lists+samba-technical@lfdr.de>; Tue, 27 Sep 2022 23:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=HxqzLhr9sRnfGFW7Fbp8BMn9HJlIIiuY+Qal/x5i3Zk=; b=tQubrYsZq3yNO+p8hNCg9dH0i1
	P6e93q/E8JNYLYIEOcidzQ2uiLIFcKgiSnQlI+qDRgRG0LEhmde/zLJMl5WR65nic9NZwCTP2T/fb
	y6jJHI7ly07Acv/sOUuZQFQOjBE2Yz8IzCsjSQ669tAEQGs5s4gNcrX23jjnQqvb9aDkqEEe8B6FA
	3x4koA5MoPzW4b8fi4Ftjr/kMeqw7LZa3ajtpMCj1bF+suGkVbxCh11TZQHnHHzxU6smCoq6OY9mi
	G5asy+jcMoP0CursUlyv8WliI1RwIXWEV3cKqmenj3l2l1oiSpt1bfLC9G/L1E0oQpunDxuzWDJtM
	bH9LtsWg==;
Received: from ip6-localhost ([::1]:32730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odIOP-004ThQ-Gk; Tue, 27 Sep 2022 21:45:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26288) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odIOD-004ThH-8Y
 for samba-technical@lists.samba.org; Tue, 27 Sep 2022 21:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=HxqzLhr9sRnfGFW7Fbp8BMn9HJlIIiuY+Qal/x5i3Zk=; b=wnjFYTT7rImDkMP8YFy1u8k3Wq
 en95FaCHdZL5clDrnVM41fskvcKbaZeYuvMYAtwjJB4mtt4A60ts6h1O1XTaspXa9QgC++VtkI+Pa
 RyUmcFCEpR6rQtgVVS8eNh2I21HTSOt+MAIWw+rAvw2GoulHyUltwLeNdYbVv0Qk1zsBYQ++WLGye
 HCFh5aynwJeA2yXdaqIKugCDv/u3qe+4AqGBlhlYJ8PEyMFa33RDw4QgN2bqQcOE7bKJ36LdedrhI
 OUCLmuIKphdgs8RT2xY9OoCKK2FUdyyBFLjiwmlWwq2pVfd2DaRlDEqoc1mMs1Sz/BoNJnWEBau9t
 PNndgePJn/0V9quJ9aF1y9bGNvlqlKVwHG/ndUiqtFAhbIYDaof+0UNwbunBIUYBQGiZ2R0Xs6/qS
 YGxsTIQbNEnM2RUGrBOlR/RFVUQb3ogxh2McHwI0FyFN4toUTB8lcGgTnhXta1YiqzxtcoQXzd2Gr
 Ngd/Z6Z12MOdvqU5GdF8NkAG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1odIO8-00293D-RB; Tue, 27 Sep 2022 21:45:14 +0000
Date: Tue, 27 Sep 2022 14:45:07 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Message-ID: <YzNu47xX9+j0BLKH@jeremy-acer>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <d1cd76d317998a3dd4456e7877b3950901019c14.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d1cd76d317998a3dd4456e7877b3950901019c14.camel@samba.org>
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
Cc: Daniel Kobras <kobras@puzzle-itc.de>,
 Michael Weiser <michael.weiser@atos.net>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 28, 2022 at 10:37:41AM +1300, Andrew Bartlett via samba-technical wrote:
>I honestly can't think of a way out of this that doesn't break
>something.

What would it break ?

>Mapping the EAs from multiple namespaces by stripping the prefix really
>seems to be a bad idea - if only because information is lost.

See below. I don't think incoming EA's from SMB3 clients have
a namespace - just make the always user.

>Also, I just don't see what business a windows client would have in
>reading the non-user EAs, and if a client should read them they should
>be read in their own namespace.

As EA's from Windows clients don't have a namespace prefix
by default, they are always (or should be) mapped to the
user. namespace on UNIX.

What am I missing ? Under what circumstances would an
SMB3 client get or set a non-user namespace EA ?

