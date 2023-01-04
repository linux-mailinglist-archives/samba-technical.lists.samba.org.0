Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CA065D01B
	for <lists+samba-technical@lfdr.de>; Wed,  4 Jan 2023 11:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GDytqpRp9ghBCgMhibhLR0A/nu1ehwhlCVi4gMWG26U=; b=CljtgVs6d2Vj5UrOjy94U4KNpg
	nBo37Gb8SBoYtbDkMPJKZLcVsosLTYMS0zVkIcxMZ0P7ddHoBh8RuIxlXANqH0ybmOvJAIMoimlXR
	YhSZAAtu3Z+jTv8VxzxMFcirtcrGi/W4h37rdfxxD5l1AZ9wHgT7wQNI8oqM4O7NISEgH5trG6huv
	BatGdJC7i23tUBVkDiHGxnWK6u+ygZuQs2VgEoBKSj+foL2anxImIKWOoxh6x1jkHoKCbCn2KO25l
	Zy46hoBnlkg7l/CeZ8NXnjJqCGNYSHZn/GWH+p/pwucoIIbcgsSpl1e72nHwoIdK01MjoQEmLFH6W
	zb/7L6Zw==;
Received: from ip6-localhost ([::1]:51870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pD0cg-00EXS7-PJ; Wed, 04 Jan 2023 10:03:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54316) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pD0cc-00EXRy-5L
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 10:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=GDytqpRp9ghBCgMhibhLR0A/nu1ehwhlCVi4gMWG26U=; b=PdUgbpUh83OZOm4nFICM1SsB9l
 jQ9a8InNCwlfHP/YL/4Kv6knFewrBOt2tGq0A0AN8ZftQkBl1qcODxDIV6W+chAC8LeQ8t1JjUNAa
 8brKUi34WJRTbFM5d0muSXD+h4SzudgkCV/qp6SR48KrhSQ8DVxm3Wt/kl0SJwfjhzW+Kgvd2ygx1
 3c/UMuTvJm5knPSreKugMx+9fX9xMVt/Ui/simNco5bFVN5OKtWL2GuE+rQ/F4Mj7sd8B+8IQmy19
 eJ2QubmuPdpqHERppZg2JVlUgniiDRFDJ9W20kuOFwfHVTa6crxwUM6iOqCUbe6azMnm7K2OIjMHs
 PCYPVzyn5fukkCGGm0BxAGMNqTlDsMrdD6guevbIqIksW5BEe9numW51J0Mlok9J5qnPTGEY2DU1P
 Sbqwhw+UyGZqiFoIZn40TP67WLdVr6SqHoC2bshVk3M1Q22381lrXS2ScW8ovYL5sYTDKclqnTIVb
 sIJOjM4X0YjboGjKlvtyEqnA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pD0cb-006hWT-Sb
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 10:03:45 +0000
Message-ID: <a4c3c03e-7857-afea-36d9-ba4141f8b9f0@samba.org>
Date: Wed, 4 Jan 2023 10:03:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Wiki: 64 bit printer drivers
References: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
 <87089e51-9b9b-6539-8c1b-0063d37c180e@samba.org>
 <01c42bcc-e066-b14b-9258-0378d74618df@samba.org>
Content-Language: en-GB
To: samba-technical@lists.samba.org
In-Reply-To: <01c42bcc-e066-b14b-9258-0378d74618df@samba.org>
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



On 04/01/2023 10:02, Ralph Boehme wrote:
> Hi Rowland,
> 
> On 1/4/23 10:46, Rowland Penny via samba-technical wrote:
>> I reverted it because there are still 32bit systems out there and, 
>> after checking, I couldn't find anything that said that printing was 
>> now 64bit only.
> 
> Please look closely: just the *default* changed, this has nothing to do 
> with being 64-bit *only*.
> 
> Thanks!
> -slow
> 

OK, so just the default changed, but where is this documented ?

Rowland

