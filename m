Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33099BCC0
	for <lists+samba-technical@lfdr.de>; Mon, 14 Oct 2024 01:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xnmYzeB894O1I7wq6gb79zWO5asIhKMqt5RcG1BEJ+4=; b=amDJW4XjOOPZoNQygJM8VOM9ze
	Xc6uqetMf2wlrFRwmHBhuXHPQsZ8CDY8U2cDCJuUP6cZY7df2tDnYqobfkzF3NEImg+JyXJs6QHgY
	q563+Y54mEXLpurqw4U7SdsnyMamr6WnW8L5+JJ6VKGsSgrExg6G+9h7u4b1d+zQgPMtQ6o7is+Ia
	B7BNOXT6eCaFEWAkRuHr8YVSiSJvs2Jx/b/CIlB5h7S1Ne+6O1aJWTtC7n4G/zFYTN9JJ3BxGdtHj
	ms2MVpRvyLFDvi06ZAq6NWa1V3wN10SlWeL8LAry+PraH9rNUT2hkbNu00zuOCm8jrkzHxDYk0St5
	S61iFHjA==;
Received: from ip6-localhost ([::1]:30264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t086A-003pNx-JG; Sun, 13 Oct 2024 23:34:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11414) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0866-003pNq-4h
 for samba-technical@lists.samba.org; Sun, 13 Oct 2024 23:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=xnmYzeB894O1I7wq6gb79zWO5asIhKMqt5RcG1BEJ+4=; b=Dv9hKQObCuM7STd4lKHUeom9tV
 iAGA2hWCUWltvAHOEiMRxzzNuCk0B5CpyNqoAghmNFi+mhh5P33id2QMB6exuv2QVdKEE5rxjE67c
 lTO3hMwhmVkwDJn37lukhTVQ+NBINjk6iJOZJbVP2tBQSJk8zCuGOGVKq3R2XL8aw1sNVoTqzNKuZ
 qzaQGknEExhagW4LdXF+4U1KQtWE4LXXkpZ+wBhqTH+DEBEjh8ZKLciRuGvYQW/vxDF9rloBgci6o
 lzjERLe+NINydBriOAubbKyM9uareg6+B+bx0QN4zeHACF4aC/sHoGB6M8eqlguu0Yces3jp6zOaV
 7wdDvTiQ7GvwdR6y1y7Rcgqq0QAuIll9Rsmey+lmBN8FAa2fsqVU8vva9gNx8Ua2LrQnkJkzNPFA9
 bZbOJCyTaonsquEYe7AEPaxojYPmjK80W7tr6AcmoKwm0fPV1F7Ix9qpO1mLft7JbJvf6jP2aCiNK
 K0eKGXnhSOK2MOLgEbyEHD/E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0865-004fal-0T for samba-technical@lists.samba.org;
 Sun, 13 Oct 2024 23:34:01 +0000
Message-ID: <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
Date: Mon, 14 Oct 2024 12:33:53 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
Content-Language: en-GB
In-Reply-To: <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
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
From: Jennifer Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jennifer Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 13/10/24 5:59 am, Stefan Kania via samba-technical wrote:
> Am 12.10.24 um 02:53 schrieb Jennifer Sutton via samba-technical:
>> The recommended way to set the SDDL is like so:
>>
>> samba-tool domain auth policy modify --name win11 
>> --computer-allowed-to-authenticate-to=SDDL
> So we need two new options for samba-tool (--deny) and (--allow) to make 
> it usable.

I’m afraid samba-tool doesn’t have an easy interface for this yet. But 
the following command should get you what you want:

samba-tool domain auth policy modify --name win11 
--computer-allowed-to-authenticate-to=O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.example://ext/AuthenticationSilo 
!= \"winclient-silo\"))"

You’ll probably need first to delete the existing 
msDS-ComputerAllowedToAuthenticateTo attribute with a tool like ldbmodify.

>> Does Windows cope with an SDDL string in the 
>> msDS-ComputerAllowedToAuthenticateTo attribute?
> That's what I can't tell you. Windows is setting "deny" or "allow" via a 
> gui.

What I meant was, if you use ldbmodify to set 
msDS-ComputerAllowedToAuthenticateTo to an SDDL string, samba-tool will 
crash if you try to view the policy. But how does Windows behave in the 
same situation? Does it display the SDDL correctly in the GUI? And is 
the policy correctly enforced when you authenticate?

Cheers,
Jennifer (she/her)

