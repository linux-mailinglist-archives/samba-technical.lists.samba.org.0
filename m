Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 196CF60D304
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 20:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3CdNK97QYH9gghnfgXEibSp8Jhe89DJfV6x7Fo1CmcA=; b=EpVtgLMbOET05TeOIn0URQ3nor
	uGbvwrcjLg2M84CvpGbwRBvimvwZ8zMaDaAxv79JyWH3I0JJdnRuTirHXmQCRHB4d1/Z4J8DgeoW9
	mjXKUA5H6oUx2QtbeiuED6XNmS+BfA+V8JgKS27JwXfUZtlkx+JZvHizR51yp1is5IPn+hBzWylxW
	kMh9inkkBZdZ8DEwuMs4+/Ukp38pH1d/+JGEIZAs8q+IB70sPVIcvNEHN/92XYOdIQdgkxV21yaVS
	j3ZE0yIbyYQEmAjCQIM1O9urNPN9OFI0Gxb6EmThAHNV4cKVu6OhqlyD1PrMOU5sinGGrYpTg8Qf9
	4H/pXy4w==;
Received: from ip6-localhost ([::1]:40122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onOKz-0063FM-Kj; Tue, 25 Oct 2022 18:07:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24434) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onOKv-0063FD-87
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 18:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=3CdNK97QYH9gghnfgXEibSp8Jhe89DJfV6x7Fo1CmcA=; b=kAPrIQkyZ6iUY6LzvS+hdUSf6y
 IVbJkfHVOO4CrkAqmuF6Qccr5oaWWS2sh0Ugnj4w8stzsgKezbRB8RhYP4+fA2Yq90OLi5L9ksbbw
 IDpjPLA84LBfvaIKZLUzDmfEb/hqirdIAbUyWqFfxchhj2Ayz5M8NAGCKNaAJUQNC5vCe05DVh2Q7
 kI8I3aPKgXT4CeLt4btHGq30OcgGXo4OS4XtCvFUkExPzvvCOAtlZK9D5uNtucyJFV2W9NXjnhawX
 UXrysux8cEBlwUT1R8QfB1Zs3CtL0Qe6MpPQekxOi5CNbfDwYFI8nWLwCg6Nkv2iL3j+vHmphmgVU
 bK1zkipxoO+I4ziwlkBqRwccfQ+b9NTVkDymyLXfkMiQtasSG6gPCODTcPWSYUgIXmfhadVNWDICb
 mjIEBciE1tYzHmVMVf5vobmiHyUuGUXEUcSWq9pusT3XobuTawYBeV1CtTwLUuORS+BBFCl6qGCkQ
 6srAoacM1Utr4sN5VBhrF1iG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onOKu-005ly0-N8
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 18:07:36 +0000
Message-ID: <e3b25688-93d1-ae69-47be-0d2db7020723@samba.org>
Date: Tue, 25 Oct 2022 19:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: smbclient --max-protocol=NT1: why it requres setting MIN protocol
 too?
Content-Language: en-GB
References: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
 <91404b18-9bfd-a9c8-dc5a-f18672933b6a@samba.org>
 <2040ec08-ecb3-9181-c46e-e8f9d5e3691f@msgid.tls.msk.ru>
To: samba-technical@lists.samba.org
In-Reply-To: <2040ec08-ecb3-9181-c46e-e8f9d5e3691f@msgid.tls.msk.ru>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 25/10/2022 19:00, Michael Tokarev wrote:
> 25.10.2022 20:57, Rowland Penny via samba-technical wrote
> ..
>> I am just trying to understand this, from what I thought I knew. SMB 
>> is a negotiating protocol, so shouldn't smbclient negotiate the best 
>> version of SMB to use ? i.e. You shouldn't have to tell it what 
>> version to use.
> 
> Well, it does the right thing. NT1 or CORE are insecure protocols,
> this is why they've been disabled. A bad m-i-m can force a negotiation
> to be agreed upon an insecure protocol. So you have to explicitly
> tell smbclient to use known-bad one.
> 
> /mjt

While you are technically correct, surely SMBv1 should only be used by 
smbclient if the server is set up to use SMBv1 and will only be used if 
none of the SMBv3 or SMBv2 versions are available on the server.

Or am I misunderstanding something ?

Rowland

