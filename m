Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C5BE46B
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 20:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=L51Gj7qxrZKYKITMdQ57h3VpoG8VeQSdvD/p4GH1+bA=; b=UNDojpgfRcNvaYmIlaVTQujZwX
	kFE1RhXLvE3nG+NbWg4KavpPcjFDsBLnKaIS8SPj8K0xe15owS6w4p7GloV1DQD9BalyU46Q2Ide0
	d273vbdHeXYtm8suzOYAIutkkVFZH5Vm+D71+tHO1s8e03BnaF+IrbSJDC/KPxraqL/SXerw2x8Xd
	AzJSgHz6VfhNYag9z7YmirD/8xDUS2Cs2BztjNwgRTbv58JiXwnU3gADBod23KctI+lIqzjVrySrP
	p5i+g1XZWntOLN9MTlt0fJLo42jo/YFiitsI9MoE4Qt89Nf9hir6D/+krUr9O60d37W/zdXB1Ylyh
	vY1Xd1Bw==;
Received: from localhost ([::1]:58010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDBnw-008bep-CJ; Wed, 25 Sep 2019 18:14:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43240) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDBnr-008bei-Ob
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 18:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=L51Gj7qxrZKYKITMdQ57h3VpoG8VeQSdvD/p4GH1+bA=; b=RoDs1fDIvRhfQHGaCfoM00Ow8q
 /zEUaBve72FmVAcER9DDHmFcjBRLDw6sajO34oKcs3TeGY1k5bVsvIHhuFXIWGXxmxgYo9l2TH96/
 1TliLoqttVf+36epF7XJYhicihJSAZ9vkwLpzydDU1twFXC1IZ+Vg5ybAdShDQNk6ZRQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDBnq-0002vC-GN; Wed, 25 Sep 2019 18:14:14 +0000
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
To: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
 <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
Message-ID: <a361812a-cc20-40a3-1499-75e381ef1ef2@samba.org>
Date: Wed, 25 Sep 2019 21:14:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/24/19 12:45 AM, Stefan Metzmacher via samba-technical wrote:
> Hi Rowland,
> 
> No, it did with 4.5 and that's how it's supposed to be.
> That's exactly what ID_TYPE_BOTH is all about.
> 
> metze
> 

Hi metze,

Can you elaborate on that sentence, and what is the use case for 
generating passwd for a group? Is it related to a file being owned by a 
group SID (administrators)?

I'm not sure I ever understood this ID_TYPE_BOTH thing - I seem to 
remember that my understanding has been that it simplifies the code - 
that some rid backends don't know and don't care if a SID is a group or 
a user, but they sure can convert it to a unix ID, hence the "both", but 
that explanation doesn't mandate ability to generate passwd for a group, 
so hearing that this is actually what ID_TYPE_BOTH is all about was 
surprising to me.

Thanks,
Uri.

